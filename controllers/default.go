package controllers

import (
	"github.com/astaxie/beego"
	"go_vip_video/service"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	dianying, err := service.ChannelDataService(22, 15, 0,4).Do()
	if err != nil {
		panic(err)
	}
	dianshi, err := service.ChannelDataService(3, 15, 0,3).Do()
	if err != nil {
		panic(err)
	}
	zongyi, _ := service.ChannelDataService(414, 15, 0,5).Do()
	if err != nil {
		panic(err)
	}
	dongman, _ := service.ChannelDataService(18, 15, 0,6).Do()
	if err != nil {
		panic(err)
	}

	c.Data["dianying"] = dianying.Data.Datas
	c.Data["dianshi"] = dianshi.Data.Datas
	c.Data["zongyi"] = zongyi.Data.Datas
	c.Data["dongman"] = dongman.Data.Datas
	c.TplName = "index.tpl"
}
