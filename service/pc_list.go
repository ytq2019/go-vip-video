package service

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto"
	"go_vip_video/utils"
	log "log"
)

//rankhot createtime
func GetPCList(cat string, rank string, pageNo int) ([]*dto.VideoItem, error) {
	url := fmt.Sprintf("https://www.360kan.com/%s/list?cat=all&year=all&area=all&rank=%s&pageno=%d", cat, rank, pageNo)
	resp, err := utils.HttpGet(url)
	if err != nil {
		return nil, err
	}
	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		return nil, err
	}
	videoItems := make([]*dto.VideoItem, 0)
	doc.Find(".s-tab-main ul li a").Each(func(i int, s *goquery.Selection) {
		href, _ := s.Attr("href")
		cover, _ := s.Find(".cover img").Attr("src")
		title := s.Find(".detail p .s1").Text()
		tmp := &dto.VideoItem{
			Href:  href,
			Cover: cover,
			Title: title,
		}
		videoItems = append(videoItems, tmp)
		log.Println(fmt.Sprintf("%s --> http://m.360kan.com%s", tmp.Title, tmp.Href))
	})

	if len(videoItems) == 0 {
		return nil, fmt.Errorf("get video list error!")
	}

	return videoItems, nil
}
