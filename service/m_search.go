package service

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto"
	"go_vip_video/utils"
	"strings"
)

//http://m.360kan.com/search/index?kw=%E8%B5%98%E5%A9%BF

type searchDocument struct {
	Key string
	Doc *goquery.Document
}

func NewSearchDocument(key string) (*searchDocument, error) {
	url := fmt.Sprintf("http://m.360kan.com/search/index?kw=%s", key)
	resp, err := utils.HttpGet(url)
	if err != nil {
		return nil, err
	}
	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		return nil, err
	}
	return &searchDocument{Key: key, Doc: doc}, nil
}

func (s *searchDocument) SearchResult() []*dto.VideoItem {
	videoItems := make([]*dto.VideoItem, 0)

	//search-item-info
	s.Doc.Find(".box").Each(func(i int, s *goquery.Selection) {
		if noresource, _ := s.Find(".noresource").Html(); noresource == "暂无播放源" {
			return
		}
		href, _ := s.Find("h3 a").Attr("href")
		title := s.Find("h3").Text()
		cover, _ := s.Find(".img img").Attr("src")
		tmp := &dto.VideoItem{
			Href:  href,
			Cover: cover,
			Title: strings.ReplaceAll(strings.ReplaceAll(title, "\n", ""), "\r", ""),
		}
		videoItems = append(videoItems, tmp)
	})
	return videoItems
}
