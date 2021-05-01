package controllers

import (
	"fmt"
	beego "github.com/beego/beego/v2/adapter"
	"github.com/prometheus/common/log"
	"github.com/silenceper/wechat/v2/officialaccount/message"
	"go_vip_video/common"
	"go_vip_video/service"
	"strings"
)

type WechatController struct {
	beego.Controller
}

func (c *WechatController) ServeWechat() {
	officialAccount := common.WechatAccount
	// 传入request和responseWriter
	server := officialAccount.GetServer(c.Ctx.Request, c.Ctx.ResponseWriter)
	//设置接收消息的处理方法
	server.SetMessageHandler(func(msg message.MixMessage) *message.Reply {
		var text *message.Text
		if msg.MsgType == "text" {
			log.Infof("文本消息")
			if strings.HasPrefix(msg.Content, "搜") {
				vUrls, err := searchVideo(string([]rune(msg.Content)[1:]))
				if err != nil {
					log.Error(err)
				}
				text = message.NewText(vUrls)
			} else {
				text = message.NewText("如需搜片,请回复搜+影片名称,例如 搜赘婿")
			}
		}
		return &message.Reply{MsgType: message.MsgTypeText, MsgData: text}
	})

	//处理消息接收以及回复
	err := server.Serve()
	if err != nil {
		c.Ctx.WriteString(err.Error())
		return
	}
	//发送回复的消息
	server.Send()

}

//搜片
func searchVideo(msg string) (string, error) {
	var res string
	document, err := service.NewPcSearchDocument(msg)
	if err != nil {
		return res, err
	}
	vData := document.SearchResult()
	domain := beego.AppConfig.String("domain")
	for i, v := range vData {
		res += fmt.Sprintf(`👉 <a href="%s/detail%s">%s</a>`, domain, v.Href, v.Title)
		res += "\r\n"
		if i > 6 {
			break
		}
	}
	if res == "" {
		res = fmt.Sprintf(`未找到该影片,有片源会在第一时间添加至<a href="%s">在线影院</a>哦~~`, domain)
	} else {
		res += "更多视频请在网页内搜索\r\n"
		res += "请关注我们公众号：YSZY669"
	}

	return res, nil
}
