package service

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto/pc"
	"go_vip_video/utils"
	log "log"
	"strings"
)

//https://www.360kan.com/cover/switchsitev2?site=qiyi&id=PbVqan7lSmHsNX&category=2

func GetPCLinks(site, id string, cat string) ([]*pc.VideoLink, error) {
	url := fmt.Sprintf("https://www.360kan.com/cover/switchsitev2?site=%s&id=%s&category=%s", site, id, cat)
	resp, err := utils.HttpGet(url)
	if err != nil {
		return nil, err
	}

	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		return nil, err
	}
	fmt.Println(doc.Html())
	videoLinks := make([]*pc.VideoLink, 0)
	doc.Find("a").Each(func(i int, s *goquery.Selection) {
		num, _ := s.Attr("data-num")
		href, _ := s.Attr("href")
		tmp := &pc.VideoLink{
			Href: strings.ReplaceAll(strings.ReplaceAll(href, `\"`, ""), `\`, ""),
			Num:  strings.ReplaceAll(strings.ReplaceAll(num, `\"`, ""), `\`, ""),
		}
		videoLinks = append(videoLinks, tmp)
		log.Println(fmt.Sprintf("num:%s href:%s", tmp.Num, tmp.Href))
	})

	if len(videoLinks) == 0 {
		return nil, fmt.Errorf("get video link error!")
	}

	return videoLinks, nil
}
