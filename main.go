package main

import (
	"github.com/astaxie/beego"
	"go_vip_video/common"
	_ "go_vip_video/routers"
)

func main() {
	common.InitSession()
	common.InitWechat()
	common.InitGoCache()
	beego.Run()
}
