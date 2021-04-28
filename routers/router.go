package routers

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
	"go_vip_video/controllers"
)

func init() {
	beego.InsertFilter("/user/*", beego.BeforeRouter, filterFunc)
	//beego.InsertFilter("/detail/*", beego.BeforeRouter, filterFunc)

	beego.Router("/", &controllers.MainController{})
	beego.Router("/listData", &controllers.ListController{}, "get:ListData")
	beego.Router("/list", &controllers.ListController{}, "get:List")

	beego.Router("/detail/:cat/:id", &controllers.DetailController{})
	beego.Router("/search", &controllers.SearchController{}, "post:Search")

	beego.Router("/rank", &controllers.RankController{})

	//微信授权
	beego.Router("/oauth", &controllers.UserController{}, "get:Oauth")
	//登录
	beego.Router("/login", &controllers.UserController{}, "get:Login")
	//用户中心
	beego.Router("/user", &controllers.UserController{}, "get:UserCenter")

	//微信公众号
	beego.Router("/api", &controllers.WechatController{}, "post:ServeWechat")
	beego.Router("/MP_verify_ewf7R67O1ItR5AVX.txt", &controllers.OauthController{})

	beego.Router("/yutianqi", &controllers.YuController{})

}

/* 定义过滤函数 */
func filterFunc(c *context.Context) {
	// 过滤校验
	if uid := c.Input.Session("uid"); uid == nil {
		c.Redirect(302, fmt.Sprintf("/oauth?toUrl=%s", c.Request.URL))
	}

}
