package main

import (
	"github.com/astaxie/beego"
	_ "github.com/astaxie/beego/session/redis"
	_ "go_vip_video/common"
	_ "go_vip_video/routers"
)

func main() {
	beego.Run()
}
