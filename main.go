package main

import (
	"github.com/astaxie/beego"
	_ "github.com/astaxie/beego/session/redis"
	"go_vip_video/common"
	_ "go_vip_video/routers"
)

func main() {
	common.InitWechat()
	common.InitGoCache()
	beego.Run()
}
