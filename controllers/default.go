package controllers

import (
	"github.com/astaxie/beego"
	"github.com/patrickmn/go-cache"
	"go_vip_video/dto/pc"
	"go_vip_video/service"
	"go_vip_video/vcache"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {

	var err error

	ca := vcache.GoCache
	dianying, found := ca.Get("index::dianying")
	if !found {
		dianying, err = service.GetPCList("dianying")
		if err != nil {

		}
		ca.Set("index::dianying", dianying, cache.DefaultExpiration)
	}

	dianshi, found := ca.Get("index::dianshi")
	if !found {
		dianshi, err = service.GetPCList("dianshi")
		if err != nil {

		}
		ca.Set("index::dianshi", dianshi, cache.DefaultExpiration)
	}

	zongyi, found := ca.Get("index::zongyi")
	if !found {
		zongyi, err = service.GetPCList("zongyi")
		if err != nil {

		}
		ca.Set("index::zongyi", zongyi, cache.DefaultExpiration)
	}
	dongman, found := ca.Get("index::dongman")
	if !found {
		dongman, err = service.GetPCList("dongman")
		if err != nil {

		}
		ca.Set("index::dongman", dongman, cache.DefaultExpiration)
	}
	c.Data["dianying"] = dianying.([]*pc.VideoItem)[:21]
	c.Data["dianshi"] = dianshi.([]*pc.VideoItem)[:21]
	c.Data["zongyi"] = zongyi.([]*pc.VideoItem)[:21]
	c.Data["dongman"] = dongman.([]*pc.VideoItem)[:21]
	c.TplName = "index.tpl"
}
