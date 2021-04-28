package service

import (
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto"
	"go_vip_video/utils"
	"strings"
)

//https://www.360kan.com/rank/general?from=index_channel%7Crank_index
func GetPCRank() ([]*dto.RankVideo, error) {
	url := "https://www.360kan.com/rank/general?from=index_channel%7Crank_index"
	resp, err := utils.HttpGet(url)
	if err != nil {
		return nil, err
	}

	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		return nil, err
	}

	videos := make([]*dto.RankVideo, 0)
	doc.Find(".m-contentwrap .m-content").Each(func(i int, s *goquery.Selection) {
		cover, _ := s.Find(".m-item-img a img ").Attr("data-src")
		href, _ := s.Find(".m-item-img a").Attr("href")
		href = strings.ReplaceAll(href, "https://www.360kan.com", "")
		title, _ := s.Find(".m-title a").Attr("title")
		desc, _ := s.Find(".m-desc").Eq(0).Attr("title")
		update := s.Find(".m-desc").Eq(1).Text()
		top := s.Find(".m-rank").Text()
		pv := s.Find(".m-pv").Text()

		tmp := &dto.RankVideo{
			VideoItem: dto.VideoItem{
				Href:  href,
				Cover: cover,
				Title: title,
			},
			Update: update,
			Desc:   desc,
			Pv:     pv,
			Top:    top,
		}
		videos = append(videos, tmp)
	})

	return videos, nil
}
