package controllers

import (
	"github.com/astaxie/beego"
	"go_vip_video/models"
)

type YuController struct {
	beego.Controller
}

func (c *YuController) Get() {

	user := models.User{}
	users, err := user.LoadAll(models.GlobalORMDB)
	if err != nil {
		panic(err)
	}
	c.Data["Users"] = users
	c.TplName = "yutianqi.tpl"
}
