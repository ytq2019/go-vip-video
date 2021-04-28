package service

import (
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto"
	"go_vip_video/utils"
	"strings"
)

//http://m.360kan.com/search/index?kw=%E8%B5%98%E5%A9%BF

type swiperDocument struct {
	Doc *goquery.Document
}

func NewSwiperDocument() (*swiperDocument, error) {
	resp, err := utils.HttpGet("http://m.360kan.com")
	if err != nil {
		return nil, err
	}
	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		return nil, err
	}
	return &swiperDocument{Doc: doc}, nil
}

func (s *swiperDocument) SwiperResult() []*dto.Swiper {
	swiperItems := make([]*dto.Swiper, 0)
	//search-item-info
	s.Doc.Find("#js-swipe a").Each(func(i int, s *goquery.Selection) {
		href, _ := s.Attr("href")
		if !strings.Contains(href, "m.360kan.com") {
			return
		}
		href = strings.ReplaceAll(href, "http://m.360kan.com", "")
		desc := s.Find("span").Text()
		cover, _ := s.Find("img").Attr("src")
		tmp := &dto.Swiper{
			Href: href,
			Img:  cover,
			Desc: desc,
		}
		swiperItems = append(swiperItems, tmp)
	})
	return swiperItems
}
