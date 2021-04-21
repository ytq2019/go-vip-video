package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/jinzhu/gorm"
	"go_vip_video/common"
	"go_vip_video/models"
	"log"
	"time"
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
	//创建账户
	user := &models.User{}
	if err = user.LoadByOpenId(models.GlobalORMDB); err != nil {
		if gorm.IsRecordNotFoundError(err) {
			user = &models.User{
				Nickname:    info.Nickname,
				OpenId:      info.OpenID,
				HeadImgURL:  info.HeadImgURL,
				Sex:         info.Sex,
				City:        info.City,
				Province:    info.Province,
				Unionid:     info.Unionid,
				CreatedTime: time.Now().Unix(),
				UpdatedTime: time.Now().Unix(),
			}
			if err := models.GlobalORMDB.Create(user).Error; err != nil {
				log.Fatal(err)
			}
		} else {
			log.Fatal(err)
		}
	}

	if err = sess.Set("uid", user.ID); err != nil {
		panic(err)
	}
	c.Ctx.Redirect(301, "/user")
}

//用户中心
func (c *UserController) UserCenter() {
	sess, _ := common.GlobalSessions.SessionStart(c.Ctx.ResponseWriter, c.Ctx.Request)
	uid := sess.Get("uid").(int64)

	//根据uid 查找用户信息
	user := &models.User{ID: uid}
	if err := user.LoadById(models.GlobalORMDB); err != nil {
		panic(err)
	}
	c.Data["UserInfo"] = user

	c.TplName = "user.tpl"
}
