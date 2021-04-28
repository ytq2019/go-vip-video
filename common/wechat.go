package common

import (
	"github.com/silenceper/wechat/v2"
	"github.com/silenceper/wechat/v2/cache"
	"github.com/silenceper/wechat/v2/officialaccount"
	offConfig "github.com/silenceper/wechat/v2/officialaccount/config"
)

var WechatAccount *officialaccount.OfficialAccount

func initWechat() {
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
	WechatAccount = wc.GetOfficialAccount(cfg)

}
