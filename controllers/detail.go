package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/patrickmn/go-cache"
	"github.com/prometheus/common/log"
	"go_vip_video/dto"
	"go_vip_video/models"
	"go_vip_video/service"
	"go_vip_video/vcache"
	"strconv"
	"strings"
	"time"
)

type DetailController struct {
	beego.Controller
	vId  string //视频id
	cat  int    //视频分类
	site string //选中站点
	num  string //选中剧集
	jxID int    //解析id

	detail *dto.Detail  //详情
	sites  []*dto.Site  //站点
	links  []*dto.Link  //剧集
	link   string       //当前播放url
	jxApis []*dto.Lines //解析接口

	remoteAddr string //请求ip
}

//id+cat+站点+剧集  可以定位到具体url
func (c *DetailController) init() {
	c.jxApis = parseJxApi(beego.AppConfig.String("jxapi"))
	//请求参数
	c.vId = c.Ctx.Input.Param(":id")
	cat, _ := strconv.Atoi(c.Ctx.Input.Param(":cat"))
	c.cat = cat

	//获取详情
	c.detail = c.getDetail().(*dto.Detail)

	//获取全部站点信息
	sites := c.getSites()
	c.sites = sites
	c.site = c.GetString("site")
	//设置默认站点
	if c.site == "" {
		c.site = sites[0].Code
	}
	//获取视频链接列表
	if c.cat != 1 {
		c.links = c.getLinks().([]*dto.Link)
	}
	c.num = c.GetString("num", c.links[0].Num)

	//获取解析id
	c.jxID, _ = c.GetInt("jxId", 0)
	//当前播放地址
	c.link = c.getLinkBySite()
	c.remoteAddr = c.Ctx.Request.RemoteAddr
}
func (c *DetailController) Get() {
	c.init()
	c.insert()
	c.Data["Detail"] = c.detail.Data
	c.Data["Id"] = c.vId
	c.Data["Cat"] = c.cat
	c.Data["Link"] = c.link
	c.Data["Site"] = c.site
	c.Data["Links"] = c.links
	c.Data["Sites"] = c.sites
	c.Data["Num"] = c.num
	//线路
	c.Data["JxLines"] = c.jxApis
	c.Data["JxID"] = c.jxID
	c.Data["JxUrl"] = c.jxApis[c.jxID].Url
	c.TplName = "detail.tpl"
}

//获取站点信息
func (c *DetailController) getSites() []*dto.Site {
	var sites []*dto.Site

	bySite, err := service.NewSite(c.vId, c.cat)
	if err != nil {
		panic(err)
	}
	sites, c.links, err = bySite.Do()
	if err != nil {
		panic(err)
	}
	return sites
}

//获取剧集信息
func (c *DetailController) getLinks() interface{} {
	links, found := vcache.GoCache.Get(fmt.Sprintf("links::cat:%d::site:%s::vid:%s", c.cat, c.site, c.detail.Data.Rpt.VideoID))
	if !found {

		getLink, err := service.NewGetLink(c.detail.Data.Rpt.VideoID, c.cat, c.site)
		if err != nil {
			panic(err)
		}
		do, err := getLink.Do()
		if err != nil {
			panic(err)
		}
		linkHtml := do.Data
		links, err = service.Parse(linkHtml, c.cat)
		if err != nil {
			panic(err)
		}
		vcache.GoCache.Set(fmt.Sprintf("links::cat:%d::site:%s::vid:%s", c.cat, c.site, c.detail.Data.Rpt.VideoID), links, cache.DefaultExpiration)

	}
	return links
}

func (c *DetailController) getLinkBySite() string {
	for _, link := range c.links {
		if c.num == "" {
			return link.Url
		}
		if c.num == link.Num {
			return link.Url
		}
	}
	return ""
}

func (c *DetailController) getDetail() interface{} {
	var err error
	detail, found := vcache.GoCache.Get(fmt.Sprintf("detail::cat:%d::vid:%s", c.cat, c.vId))
	if !found {
		detail, err = service.NewDetail(c.cat, c.vId).Do()
		if err != nil {
			panic(err)
		}
		vcache.GoCache.Set(fmt.Sprintf("detail::cat:%d::vid:%s", c.cat, c.vId), detail, cache.DefaultExpiration)
	}

	return detail
}

func parseJxApi(jxapi string) []*dto.Lines {
	jxApis := make([]*dto.Lines, 0)
	for _, v := range strings.Split(jxapi, "$$$") {
		info := strings.Split(v, "$$")
		tmp := &dto.Lines{
			Name: info[0],
			Url:  info[1],
		}
		jxApis = append(jxApis, tmp)
	}
	return jxApis
}

func (c *DetailController) insert() {
	vpr := &models.VideoPlaybackRecord{
		Uniacid:   0,
		Title:     c.detail.Data.Title,
		Time:      time.Now().Unix(),
		VideoUrl:  c.link,
		Share:     0,
		YvideoUrl: "",
		Type:      c.cat,
		Index:     0,
		VideoId:   0,
		Cat:       c.cat,
		Site:      c.site,
		Ip:        c.remoteAddr,
	}
	if err := models.GlobalORMDB.Create(vpr).Error; err != nil {
		log.Error("数据入库失败%v", err)
	}
}
