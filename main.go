package main

import (
	beego "github.com/beego/beego/v2/server/web"
	_ "go_vip_video/routers"
)

func main() {
	beego.Run()
}
