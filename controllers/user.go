package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"go_vip_video/common"
)

type UserController struct {
	beego.Controller
}

func (c *UserController) Get() {
	oa := common.WechatAccount
	token, err := oa.GetAccessToken()
	if err != nil {
		panic(err)
	}
	oauth := oa.GetOauth()

	fmt.Println(oauth)
	c.Data["AccessToken"] = token
	c.TplName = "user.tpl"
}
