package controllers

import (
	"github.com/astaxie/beego"
	"github.com/patrickmn/go-cache"
	"go_vip_video/dto"
	"go_vip_video/service"
	"go_vip_video/vcache"
	"log"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {

	var err error

	ca := vcache.GoCache
	dianying, found := ca.Get("index::dianying")
	if !found {
		dianying, err = service.ChannelDataService(22, 21, 0, 4).Do()
		if err != nil {
			panic(err)
		}
		ca.Set("index::dianying", dianying, cache.DefaultExpiration)
		log.Println("首页电影数据初始化")
	}

	dianshi, found := ca.Get("index::dianshi")
	if !found {
		dianshi, err = service.ChannelDataService(3, 21, 0, 3).Do()
		if err != nil {
			panic(err)
		}
		ca.Set("index::dianshi", dianshi, cache.DefaultExpiration)
		log.Println("首页电视数据初始化")
	}

	zongyi, found := ca.Get("index::zongyi")
	if !found {
		zongyi, err = service.ChannelDataService(414, 21, 0, 5).Do()
		if err != nil {
			panic(err)
		}
		ca.Set("index::zongyi", zongyi, cache.DefaultExpiration)
		log.Println("首页综艺数据初始化")
	}

	dongman, found := ca.Get("index::dongman")
	if !found {
		dongman, err = service.ChannelDataService(18, 21, 0, 6).Do()
		if err != nil {
			panic(err)
		}
		ca.Set("index::dongman", dongman, cache.DefaultExpiration)
		log.Println("首页动漫数据初始化")
	}

	c.Data["dianying"] = dianying.(*dto.ChannelDataResp).Data.Datas
	c.Data["dianshi"] = dianshi.(*dto.ChannelDataResp).Data.Datas
	c.Data["zongyi"] = zongyi.(*dto.ChannelDataResp).Data.Datas
	c.Data["dongman"] = dongman.(*dto.ChannelDataResp).Data.Datas
	c.TplName = "index.tpl"
}
