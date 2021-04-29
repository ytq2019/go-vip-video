package controllers

import (
	"fmt"
	beego "github.com/beego/beego/v2/adapter"
	"github.com/patrickmn/go-cache"
	"github.com/prometheus/common/log"
	"go_vip_video/common"
	"go_vip_video/dto"
	"go_vip_video/models"
	"go_vip_video/service"
	"go_vip_video/utils"
	"strings"
	"time"
)

type DetailController struct {
	beego.Controller
	vId    string //视频id
	cat    string //视频分类
	site   string //选中站点
	num    string //选中剧集
	jxID   int    //解析id
	openId string //微信openID
	uid    int64  //客户ID

	detail *dto.MDetail     //详情
	sites  []*dto.Site      //站点
	links  []*dto.VideoLink //剧集
	link   string           //当前播放url
	jxApis []*dto.Lines     //解析接口

	remoteAddr string //请求ip
}

//id+cat+站点+剧集  可以定位到具体url
func (c *DetailController) init() {
	//获取用户openid
	uid := c.GetSession("uid").(int64)
	log.Infof("获取到的uid为:%d", uid)
	user := models.User{ID: uid}
	if err := user.LoadById(models.GlobalORMDB); err != nil {
		panic(err)
	}
	c.openId = user.OpenId
	c.uid = user.ID

	c.jxApis = parseJxApi(beego.AppConfig.String("jxapi"))
	//请求参数
	c.vId = strings.ReplaceAll(c.Ctx.Input.Param(":id"), ".html", "")
	c.cat = c.Ctx.Input.Param(":cat")

	//获取详情
	document, err := service.NewDetailDocument(c.cat, c.vId)
	if err != nil {
		panic(err)
	}
	c.detail = document.GetMDetail()

	//获取全部站点信息
	c.sites = document.GetSites()

	c.site = c.GetString("site")
	//设置默认站点
	if c.site == "" {
		c.site = c.sites[0].Code
	}
	//获取视频链接列表
	if c.cat != "m" {
		c.links = c.getLinks().([]*dto.VideoLink)
	} else {
		c.links = document.DianYingLinks()
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
	c.Data["Detail"] = c.detail
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

//获取剧集信息
func (c *DetailController) getLinks() interface{} {
	links, found := common.GoCache.Get(fmt.Sprintf("links::cat:%s::site:%s::vid:%s", c.cat, c.site, c.vId))
	if !found {
		cat := utils.StrCat2IntCat(c.cat)
		var err error
		links, err = service.GetPCLinks(c.site, c.vId, cat)
		if err != nil {
			panic(err)
		}
		common.GoCache.Set(fmt.Sprintf("links::cat:%s::site:%s::vid:%s", c.cat, c.site, c.vId), links, cache.DefaultExpiration)
	}
	return links
}

func (c *DetailController) getLinkBySite() string {
	for _, link := range c.links {
		if c.num == "" {
			return link.Href
		}
		if c.num == link.Num {
			return link.Href
		}
	}
	return ""
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
		Title:     strings.ReplaceAll(c.detail.Title, "\n", ""),
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
		Openid:    c.openId,
		Uid:       c.uid,
	}
	if err := models.GlobalORMDB.Create(vpr).Error; err != nil {
		log.Error("数据入库失败%v", err)
	}
}
