package service

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto"
	"go_vip_video/dto/pc"
	"net/http"
	"strings"
)

//电视 http://m.360kan.com/coverpage/getDianshiLinksBySite?id=239516&cat=1&site=qiyi
//综艺 http://m.360kan.com/coverpage/getZongyiLinksBySite?id=11740&cat=3&site=pptv
//动漫 http://m.360kan.com/coverpage/getDongmanLinksBySite?id=12681&cat=4&site=sohu
/**
获取站点信息
*/
type Site struct {
	id  string
	cat string
	url string
}

func NewSite(id string, cat string) (*Site, error) {
	links := &Site{id: id, cat: cat}
	if err := links.initUrl(); err != nil {
		return nil, err
	}
	return links, nil
}

func (l *Site) initUrl() error {
	switch l.cat {
	case "m":
		l.url = fmt.Sprintf("http://m.360kan.com/m/%s.html", l.id)
	case "tv":
		l.url = fmt.Sprintf("http://m.360kan.com/tv/%s.html", l.id)
	case "va":
		l.url = fmt.Sprintf("http://m.360kan.com/va/%s.html", l.id)
	case "ct":
		l.url = fmt.Sprintf("http://m.360kan.com/ct/%s.html", l.id)
	default:
		return fmt.Errorf("未知的cat:%s", l.cat)
	}
	return nil
}

func (l *Site) Do() ([]*dto.Site, []*pc.VideoLink, error) {
	response, err := http.Get(l.url)
	if err != nil {
		return nil, nil, err
	}
	defer response.Body.Close()

	doc, err := goquery.NewDocumentFromReader(response.Body)
	if err != nil {
		return nil, nil, err
	}

	sites := make([]*dto.Site, 0)
	// Find the review items
	doc.Find(".cp-sitebar-main option").Each(func(i int, s *goquery.Selection) {
		site, _ := s.Attr("data-site")
		tmp := &dto.Site{
			Code: site,
			Name: site,
		}

		sites = append(sites, tmp)
	})
	//针对一个播放源的情况
	if len(sites) == 0 {
		attr, _ := doc.Find(".g-site").Attr("class")
		attr = strings.ReplaceAll(attr, "g-site g-site-", "")
		tmp := &dto.Site{
			Code: attr,
			Name: attr,
		}
		sites = append(sites, tmp)
	}
	links := DianYingLinks(doc)
	siteRouter(links)
	return sites, links, nil
}

func siteRouter(sites []*pc.VideoLink) {
	for k, v := range sites {
		//首位为风行 排到最后
		if k == 0 && v.Num == "funshion" {
			sites[0], sites[len(sites)-1] = sites[len(sites)-1], sites[0]
		}
	}
}

//获取电影播放地址
func DianYingLinks(doc *goquery.Document) []*pc.VideoLink {
	links := make([]*pc.VideoLink, 0)
	//多播放源
	doc.Find("#js-sitebar .wrap select option").Each(func(i int, s *goquery.Selection) {
		url, _ := s.Attr("data-url")
		site, _ := s.Attr("data-site")
		tmp := &pc.VideoLink{
			Href: url,
			Num:  site,
		}
		links = append(links, tmp)
	})
	if len(links) == 0 {
		class, _ := doc.Find("#js-sitebar .wrap .g-site").Attr("class")
		num := strings.ReplaceAll(class, "g-site g-site-", "")
		href, _ := doc.Find(".p-dianying-wrap a").Attr("href")
		tmp := &pc.VideoLink{
			Href: href,
			Num:  num,
		}
		links = append(links, tmp)
	}
	return links
}
