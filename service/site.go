package service

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto"
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
	cat int
	url string
}

func NewSite(id string, cat int) (*Site, error) {
	links := &Site{id: id, cat: cat}
	if err := links.initUrl(); err != nil {
		return nil, err
	}
	return links, nil
}

func (l *Site) initUrl() error {
	switch l.cat {
	case 1:
		l.url = fmt.Sprintf("http://m.360kan.com/m/%s.html", l.id)
	case 2:
		l.url = fmt.Sprintf("http://m.360kan.com/tv/%s.html", l.id)
	case 3:
		l.url = fmt.Sprintf("http://m.360kan.com/va/%s.html", l.id)
	case 4:
		l.url = fmt.Sprintf("http://m.360kan.com/ct/%s.html", l.id)
	default:
		return fmt.Errorf("未知的cat:%d", l.cat)
	}
	return nil
}

func (l *Site) Do() ([]*dto.Site, error) {
	response, err := http.Get(l.url)
	if err != nil {
		return nil, err
	}
	defer response.Body.Close()

	doc, err := goquery.NewDocumentFromReader(response.Body)
	if err != nil {
		return nil, err
	}

	sites := make([]*dto.Site, 0)
	// Find the review items
	doc.Find(".cp-sitebar-main option").Each(func(i int, s *goquery.Selection) {
		site, _ := s.Attr("data-site")
		text := s.Text()
		tmp := &dto.Site{
			Code: site,
			Name: text,
		}

		sites = append(sites, tmp)
	})
	//针对一个播放源的情况
	if len(sites) == 0 {
		attr, _ := doc.Find(".g-site").Attr("class")
		text := doc.Find(".g-site").Text()
		attr = strings.ReplaceAll(attr, "g-site g-site-", "")
		tmp := &dto.Site{
			Code: attr,
			Name: text,
		}
		sites = append(sites, tmp)
	}

	return sites, nil
}
