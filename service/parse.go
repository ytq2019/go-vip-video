package service

import (
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto"
	"strings"
)

func Parse(html string, cat string) ([]*dto.Link, error) {

	doc, err := goquery.NewDocumentFromReader(strings.NewReader(html))
	if err != nil {
		return nil, err
	}
	links := make([]*dto.Link, 0)
	// Find the review items
	if cat != "va" {
		doc.Find("li a").Each(func(i int, s *goquery.Selection) {
			href, _ := s.Attr("href")
			text := s.Text()
			tmp := &dto.Link{
				Url: href,
				Num: text,
			}
			links = append(links, tmp)
		})

	} else {
		doc.Find(".single-series").Each(func(i int, s *goquery.Selection) {
			href, _ := s.Attr("href")
			text := s.Find(".zydate").Text()
			tmp := &dto.Link{
				Url: href,
				Num: text,
			}
			links = append(links, tmp)
		})
	}
	//翻转数组
	length := len(links)
	for i := 0; i < length/2; i++ {
		links[i], links[length-1-i] = links[length-1-i], links[i]
	}

	return links, nil
}
