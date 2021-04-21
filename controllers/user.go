package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/silenceper/wechat/v2/officialaccount/oauth"
	"go_vip_video/common"
	"log"
)

type UserController struct {
	beego.Controller
}

func (c *UserController) Oauth() {
	redirectUrl := `https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxcb331d5bde931fd0&redirect_uri=http://new.qiandao.name/login&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect`
	c.Ctx.Redirect(301, redirectUrl)
}

func (c *UserController) Login() {
	sess, _ := common.GlobalSessions.SessionStart(c.Ctx.ResponseWriter, c.Ctx.Request)
	defer sess.SessionRelease(c.Ctx.ResponseWriter)

	code := c.GetString("code")

	wa := common.WechatAccount
	oa := wa.GetOauth()

	resAccessToken, err := oa.GetUserAccessToken(code)
	if err != nil {
		panic(err)
	}
	log.Println(fmt.Sprintf("获取到的授权数据: %v", resAccessToken))
	info, err := oa.GetUserInfo(resAccessToken.AccessToken, resAccessToken.OpenID, "")
	if err != nil {
		panic(err)
	}

	if err = sess.Set("userinfo", info); err != nil {
		panic(err)
	}
	c.Ctx.Redirect(301, "/user")
}

//用户中心
func (c *UserController) UserCenter() {
	sess, _ := common.GlobalSessions.SessionStart(c.Ctx.ResponseWriter, c.Ctx.Request)
	c.Data["UserInfo"] = sess.Get("userinfo").(oauth.UserInfo)
	c.TplName = "user.tpl"
}
