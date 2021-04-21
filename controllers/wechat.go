package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/prometheus/common/log"
	"github.com/silenceper/wechat/v2/officialaccount/message"
	"go_vip_video/common"
	"go_vip_video/service"
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
		//回复消息：演示回复用户发送的消息
		vUrls, err := searchVideo(msg.Content)
		if err != nil {
			log.Error(err)
		}
		text := message.NewText(vUrls)
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
	document, err := service.NewSearchDocument(msg)
	if err != nil {
		return res, err
	}
	vData := document.SearchResult()
	for i, v := range vData {
		res += fmt.Sprintf(`👉 <a href="http://new.qiandao.name/detail%s">%s</a>`, v.Href, v.Title)
		res += "\r\n"
		if i > 6 {
			break
		}
	}
	if res == "" {
		res = `未找到该影片,有片源会在第一时间添加至<a href="http://new.qiandao.name">在线影院</a>哦~~`
	} else {
		res += "更多视频请在网页内搜索\r\n"
		res += "请关注我们公众号：YSZY669"
	}

	return res, nil
}
