package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
	"go_vip_video/common"
	"go_vip_video/controllers"
)

func init() {
	beego.InsertFilter("/user/*", beego.BeforeRouter, filterFunc)

	beego.Router("/", &controllers.MainController{})
	beego.Router("/listData", &controllers.ListController{}, "get:ListData")
	beego.Router("/list", &controllers.ListController{}, "get:List")
	beego.Router("/detail/:cat/:id", &controllers.DetailController{})
	beego.Router("/search", &controllers.SearchController{}, "post:Search")

	//微信公众号
	beego.Router("/api", &controllers.WechatController{}, "post:ServeWechat")
	//微信授权
	beego.Router("/oauth", &controllers.UserController{}, "get:Oauth")
	//登录
	beego.Router("/login", &controllers.UserController{}, "get:Login")
	//用户中心
	beego.Router("/user", &controllers.UserController{}, "get:UserCenter")

	//oauth
	beego.Router("/MP_verify_ewf7R67O1ItR5AVX.txt", &controllers.OauthController{})

}

/* 定义过滤函数 */
func filterFunc(c *context.Context) {
	// 过滤校验
	sess, _ := common.GlobalSessions.SessionStart(c.ResponseWriter, c.Request)
	if userinfo := sess.Get("uid"); userinfo == nil {
		c.Redirect(301, "/oauth")
	}

}
