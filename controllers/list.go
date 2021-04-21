package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"go_vip_video/dto/pc"
	"go_vip_video/service"
	"strings"
)

type ListController struct {
	beego.Controller
}

//<li>
//<a href="http://wx.qiandao.name/app/index.php?i=7&c=entry&eid=55&mov=detail&d_id=%2Fm%2FgaPoZRH4S0P7SR.html&op=dianying&url=%2Fm%2FgaPoZRH4S0P7SR.html">
//<img src="http://img3.doubanio.com/view/photo/s_ratio_poster/public/p2512523506.jpg">
//<span class="biaoti">摩天营救</span>
//</a>
//</li>
//cat 1 电影 2 电视 3综艺 4动漫
func (c *ListController) ListData() {
	var (
		vl  []*pc.VideoItem
		err error
	)
	t := c.GetString("cat", "1")
	num, err := c.GetInt("num", 1)
	if err != nil {
		panic(err)
	}

	switch t {
	case "1":
		vl, err = service.GetPCList("dianying", "rankhot", num)
		if err != nil {
			panic(err)
		}
	case "2":
		vl, err = service.GetPCList("dianshi", "rankhot", num)
		if err != nil {
			panic(err)
		}
	case "3":
		vl, err = service.GetPCList("zongyi", "rankhot", num)
		if err != nil {
			panic(err)
		}
	case "4":
		vl, err = service.GetPCList("dongman", "rankhot", num)
		if err != nil {
			panic(err)
		}
	}
	c.Ctx.WriteString(c.toHtml(vl))
}

func (c *ListController) List() {
	cat := c.GetString("cat", "1")

	c.Data["Cat"] = cat
	c.TplName = "list.tpl"
}

func (c *ListController) toHtml(data []*pc.VideoItem) string {
	var res string
	for _, v := range data {
		arr := strings.Split(v.Href, "/")
		res += c.template(arr[2], arr[1], v.Cover, v.Title)
	}
	return res
}

func (c *ListController) template(vId string, cat string, src, text string) string {
	return fmt.Sprintf("<li><a href=\"/detail/%s/%s\"><img src=\"%s\"><span class=\"biaoti\">%s</span></a></li>", cat, vId, src, text)

}
