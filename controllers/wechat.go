package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/prometheus/common/log"
	"github.com/silenceper/wechat/v2"
	"github.com/silenceper/wechat/v2/cache"
	offConfig "github.com/silenceper/wechat/v2/officialaccount/config"
	"github.com/silenceper/wechat/v2/officialaccount/message"
	"go_vip_video/service"
)

type WechatController struct {
	beego.Controller
}

func (c *WechatController) ServeWechat() {
	wc := wechat.NewWechat()
	//这里本地内存保存access_token，也可选择redis，memcache或者自定cache
	memory := cache.NewMemory()
	cfg := &offConfig.Config{
		AppID:          "wxcb331d5bde931fd0",
		AppSecret:      "804d0a9aad76760f5cb54a78970e0dd0",
		Token:          "xk968Z86P6K8D6y4Z95ZbP6b69qdDb84",
		EncodingAESKey: "RUjmqAUWm5nh4tj9NJtNK9jTtQ3RSB33Zjss5sArGHR",
		Cache:          memory,
	}
	officialAccount := wc.GetOfficialAccount(cfg)

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
	for _, v := range vData[:6] {
		res += fmt.Sprintf(`👉 <a href="http://new.qiandao.name/detail%s">%s</a>`, v.Href, v.Title)
		res += "\r\n"
	}
	if res == "" {
		res = `未找到该影片,有片源会在第一时间添加至<a href="http://new.qiandao.name">在线影院</a>哦~~`
	} else {
		res += "更多视频请在网页内搜索\r\n"
		res += "请关注我们公众号：YSZY669"
	}

	return res, nil
}
