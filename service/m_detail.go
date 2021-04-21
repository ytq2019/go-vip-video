package service

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"github.com/patrickmn/go-cache"
	"go_vip_video/dto"
	"go_vip_video/dto/m360k"
	"go_vip_video/dto/pc"
	"go_vip_video/utils"
	"go_vip_video/vcache"
	"strings"
)

type detailDocument struct {
	Cat, Id string
	Doc     *goquery.Document
}

//http://m.360kan.com/tv/RbhvcH7lSmHrMH.html
func NewDetailDocument(cat, id string) (*detailDocument, error) {
	//缓存doc
	url := fmt.Sprintf("http://m.360kan.com/%s/%s.html", cat, id)
	ca := vcache.GoCache
	dc, found := ca.Get(url)
	var doc *goquery.Document
	if !found {
		resp, err := utils.HttpGet(url)
		if err != nil {
			return nil, err
		}
		doc, err = goquery.NewDocumentFromReader(resp.Body)
		if err != nil {
			return nil, err
		}
		ca.Set(url, doc, cache.DefaultExpiration)
	} else {
		doc = dc.(*goquery.Document)
	}
	return &detailDocument{
		Doc: doc,
		Cat: cat,
		Id:  id,
	}, nil
}

func (d *detailDocument) GetMDetail() *m360k.MDetail {
	mDetail := &m360k.MDetail{}
	d.Doc.Find(".cp-info-main").Each(func(i int, s *goquery.Selection) {
		title := s.Find("h3").Text()
		year := s.Find("p").Eq(3).Text()
		area := s.Find("p").Eq(2).Text()
		director := s.Find("p").Eq(4).Text()

		mDetail.Title = strings.ReplaceAll(strings.ReplaceAll(title, " ", ""), "\\n", "")
		mDetail.Year = strings.ReplaceAll(strings.ReplaceAll(year, " ", ""), "\\n", "")
		mDetail.Area = strings.ReplaceAll(strings.ReplaceAll(area, " ", ""), "\\n", "")
		mDetail.Director = strings.ReplaceAll(strings.ReplaceAll(director, " ", ""), "\\n", "")
	})
	desc := d.Doc.Find(".cp-describe").Text()
	mDetail.Desc = strings.ReplaceAll(strings.ReplaceAll(desc, " ", ""), "\\n", "")

	return mDetail
}

func (d *detailDocument) GetSites() []*dto.Site {
	sites := make([]*dto.Site, 0)
	// Find the review items
	d.Doc.Find(".cp-sitebar-main option").Each(func(i int, s *goquery.Selection) {
		site, _ := s.Attr("data-site")
		tmp := &dto.Site{
			Code: site,
			Name: site,
		}

		sites = append(sites, tmp)
	})
	//针对一个播放源的情况
	if len(sites) == 0 {
		attr, _ := d.Doc.Find(".g-site").Attr("class")
		attr = strings.ReplaceAll(attr, "g-site g-site-", "")
		tmp := &dto.Site{
			Code: attr,
			Name: attr,
		}
		sites = append(sites, tmp)
	}
	for k, v := range sites {
		if v.Code == "funshion" {
			sites[k], sites[len(sites)-1] = sites[len(sites)-1], sites[k]
		}
	}
	return sites
}

//获取电影播放地址
func (d *detailDocument) DianYingLinks() []*pc.VideoLink {
	// 只获取电影播放地址
	if d.Cat != "m" {
		return make([]*pc.VideoLink, 0)
	}
	links := make([]*pc.VideoLink, 0)
	//多播放源
	d.Doc.Find("#js-sitebar .wrap select option").Each(func(i int, s *goquery.Selection) {
		url, _ := s.Attr("data-url")
		site, _ := s.Attr("data-site")
		tmp := &pc.VideoLink{
			Href: url,
			Num:  site,
		}
		links = append(links, tmp)
	})
	if len(links) == 0 {
		class, _ := d.Doc.Find("#js-sitebar .wrap .g-site").Attr("class")
		num := strings.ReplaceAll(class, "g-site g-site-", "")
		href, _ := d.Doc.Find(".p-dianying-wrap a").Attr("href")
		tmp := &pc.VideoLink{
			Href: href,
			Num:  num,
		}
		links = append(links, tmp)
	}
	return links
}

func (d *detailDocument) sortSites(sites []*pc.VideoLink) {
	for k, v := range sites {
		//首位为风行 排到最后
		if k == 0 && v.Num == "funshion" {
			sites[0], sites[len(sites)-1] = sites[len(sites)-1], sites[0]
		}
	}
}
