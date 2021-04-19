package controllers

import (
	"github.com/astaxie/beego"
	"go_vip_video/dto"
	"go_vip_video/service"
	"strconv"
)

type DetailController struct {
	beego.Controller
}

func (c *DetailController) Get() {
	id := c.Ctx.Input.Param(":id")
	catStr := c.Ctx.Input.Param(":cat")
	cat, _ := strconv.Atoi(catStr)

	//获取详情
	detail, err := service.NewDetail(cat, id).Do()
	if err != nil {
		panic(err)
	}
	//获取全部站点信息
	sites := getSites(id, cat)
	site := c.GetString("site")
	//设置默认站点
	if site == ""{
		site = sites[0].Code
	}
	//获取视频链接列表
	link := c.GetString("link")
	links := getLinks(detail, cat, site)
	//设置默认播放链接
	if link == "" && len(links) > 0 {
		link = links[0].Url
	}

	c.Data["Detail"] = detail.Data
	c.Data["Id"] = id
	c.Data["Cat"] = cat
	c.Data["Link"] = link
	c.Data["Links"] = links
	c.Data["Site"] = site
	c.Data["Sites"] = sites
	c.TplName = "detail.tpl"
}

//获取站点信息
func getSites(id string,cat int) []*dto.Site {
	var sites []*dto.Site
	bySite, err := service.NewSite(id, cat)
	if err != nil {
		panic(err)
	}
	sites, err = bySite.Do()
	if err != nil {
		panic(err)
	}
	return sites
}

//获取剧集信息
func getLinks(detail *dto.Detail, cat int, site string) []*dto.Link {
	var links []*dto.Link
	if cat != 1{
		getLink, err := service.NewGetLink(detail.Data.Rpt.VideoID, cat, site)
		if err != nil {
			panic(err)
		}
		do, err := getLink.Do()
		if err != nil {
			panic(err)
		}
		linkHtml := do.Data
		links, err = service.Parse(linkHtml,cat)
		if err != nil {
			panic(err)
		}
	}else{
		for _, v := range detail.Data.Sites {
			tmp := &dto.Link{
				Url: v.Defaultplaylink,
				Num: v.Name,
			}
			links = append(links,tmp)
		}
	}

	return links
}
