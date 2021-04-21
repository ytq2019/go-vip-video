package common

import "github.com/astaxie/beego/session"

var GlobalSessions *session.Manager

func InitSession() {
	sessionConfig := &session.ManagerConfig{
		CookieName:      "gosessionid",
		EnableSetCookie: true,
		Gclifetime:      3600 * 24,
		Maxlifetime:     3600 * 24,
		Secure:          false,
		CookieLifeTime:  3600 * 24,
		ProviderConfig:  "./tmp",
	}
	GlobalSessions, _ = session.NewManager("memory", sessionConfig)
	go GlobalSessions.GC()
}
