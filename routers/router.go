package routers

import (
	"github.com/astaxie/beego"
	"go_vip_video/controllers"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/listData", &controllers.ListController{}, "get:ListData")
	beego.Router("/list", &controllers.ListController{}, "get:List")
	beego.Router("/detail/:cat/:id", &controllers.DetailController{})
}
