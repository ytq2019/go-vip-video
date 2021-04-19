package routers

import (
	"go_vip_video/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    beego.Router("/detail/:cat/:id", &controllers.DetailController{})
}
