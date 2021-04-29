package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
	"github.com/patrickmn/go-cache"
	"go_vip_video/common"
	"go_vip_video/service"
)

type RankController struct {
	beego.Controller
}

func (c *RankController) Get() {
	ca := common.GoCache
	rank, found := ca.Get("index::rank")
	if !found {
		var err error
		if rank, err = service.GetPCRank(); err != nil {
			panic(err)
		}
		ca.Set("index::rank", rank, cache.DefaultExpiration)
	}
	c.Data["Rank"] = rank
	c.TplName = "rank.tpl"
}
