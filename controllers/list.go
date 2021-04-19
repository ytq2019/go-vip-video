package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"go_vip_video/dto"
	"go_vip_video/service"
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
		vl       *dto.ChannelDataResp
		err      error
		pageSize = 21
	)
	t := c.GetString("cat", "1")
	num, err := c.GetInt("num", 1)
	if err != nil {
		panic(err)
	}
	start := (num - 1) * pageSize

	switch t {
	case "1":
		vl, err = service.ChannelDataService(22, pageSize, start, 4).Do()
		if err != nil {
			panic(err)
		}
	case "2":
		vl, err = service.ChannelDataService(3, pageSize, start, 3).Do()
		if err != nil {
			panic(err)
		}
	case "3":
		vl, err = service.ChannelDataService(414, pageSize, start, 5).Do()
		if err != nil {
			panic(err)
		}
	case "4":
		vl, err = service.ChannelDataService(18, pageSize, start, 6).Do()
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

func (c *ListController) toHtml(data *dto.ChannelDataResp) string {
	var res string
	for _, v := range data.Data.Datas {
		res += c.template(v.ID, v.Cat, v.Cover, v.Title)
	}
	return res
}

func (c *ListController) template(vId string, cat int, src, text string) string {
	///detail/{{.Cat}}/{{.ID}}
	return fmt.Sprintf("<li><a href=\"/detail/%d/%s\"><img src=\"%s\"><span class=\"biaoti\">%s</span></a></li>", cat, vId, src, text)

}
