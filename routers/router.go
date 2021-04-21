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
	beego.Router("/search", &controllers.SearchController{}, "post:Search")

	//微信公众号
	beego.Router("/api", &controllers.WechatController{}, "post:ServeWechat")
	beego.Router("/user", &controllers.UserController{})

	//oauth
	beego.Router("/mp/MP_verify_ewf7R67O1ItR5AVX.txt", &controllers.OauthController{})

}
