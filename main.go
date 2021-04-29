package main

import (
	beego "github.com/beego/beego/v2/adapter"
	_ "github.com/beego/beego/v2/adapter/session/redis"
	_ "go_vip_video/common"
	_ "go_vip_video/routers"
)

func main() {
	beego.Run()
}
