package controllers

import (
	"github.com/astaxie/beego"
	"go_vip_video/service"
)

type SearchController struct {
	beego.Controller
}

func (c *SearchController) Search() {
	key := c.GetString("key")
	if key == "" {
		panic("key not empty!")
	}
	vData, err := service.Search(key)
	if err != nil {
		panic(err)
	}
	c.Data["VData"] = vData
	c.TplName = "search.tpl"
}
