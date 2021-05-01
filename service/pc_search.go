package service

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto"
	"go_vip_video/utils"
	"strings"
)

//http://m.360kan.com/search/index?kw=%E8%B5%98%E5%A9%BF

type pcSearchDocument struct {
	Key string
	Doc *goquery.Document
}

func NewPcSearchDocument(key string) (*pcSearchDocument, error) {
	url := fmt.Sprintf("https://so.360kan.com/index.php?kw=%s&from=index_channel", key)
	resp, err := utils.HttpGet(url)
	if err != nil {
		return nil, err
	}
	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		return nil, err
	}
	return &pcSearchDocument{Key: key, Doc: doc}, nil
}

func (s *pcSearchDocument) SearchResult() []*dto.VideoItem {
	videoItems := make([]*dto.VideoItem, 0)

	//search-item-info
	s.Doc.Find("#js-longvideo .g-clear").Each(func(i int, s *goquery.Selection) {
		//if noresource, _ := s.Find(".noresource").Html(); noresource == "暂无播放源" {
		//	return
		//}
		href, _ := s.Find(".m-mainpic a").Attr("href")
		title := s.Find(".cont .title a").Eq(0).Text()
		cover, _ := s.Find(".m-mainpic a img").Attr("src")
		if href != "" {
			href = strings.ReplaceAll(href, "http://www.360kan.com", "")
			tmp := &dto.VideoItem{
				Href:  href,
				Cover: cover,
				Title: strings.ReplaceAll(strings.ReplaceAll(title, "\n", ""), "\r", ""),
			}
			videoItems = append(videoItems, tmp)
		}

	})
	return videoItems
}
