package service

import (
	"encoding/json"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto/pc"
	"go_vip_video/utils"
	"io/ioutil"
	"strings"
)

//https://www.360kan.com/cover/switchsitev2?site=qiyi&id=PbVqan7lSmHsNX&category=2

type KanLinkResp struct {
	Data  string `json:"data"`
	Error int    `json:"error"`
	Msg   string `json:"msg"`
}

func GetPCLinks(site, id string, cat string) ([]*pc.VideoLink, error) {
	var url string
	if cat == "3" {
		url = fmt.Sprintf("https://www.360kan.com/cover/zongyilistv2?id=%s&site=%s&do=switchsite&isByTime=true", id, site)
	} else {
		url = fmt.Sprintf("https://www.360kan.com/cover/switchsitev2?site=%s&id=%s&category=%s", site, id, cat)
	}
	resp, err := utils.HttpGet(url)
	if err != nil {
		return nil, err
	}
	kb, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	k := &KanLinkResp{}
	if err = json.Unmarshal(kb, k); err != nil {
		return nil, err
	}

	doc, err := goquery.NewDocumentFromReader(strings.NewReader(k.Data))
	if err != nil {
		return nil, err
	}

	var (
		vLinksMap  = map[string]*pc.VideoLink{}
		videoLinks = make([]*pc.VideoLink, 0)
	)

	doc.Find("a").Each(func(i int, s *goquery.Selection) {
		num, exists := s.Attr("data-num")
		if !exists {
			num = s.Find(".w-newfigure-hint").Text()
		}
		href, _ := s.Attr("href")
		num = strings.ReplaceAll(strings.ReplaceAll(num, `\"`, ""), `\`, "")
		href = strings.ReplaceAll(strings.ReplaceAll(href, `\"`, ""), `\`, "")
		tmp := &pc.VideoLink{
			Href: href,
			Num:  num,
		}
		if num != "" {
			_, ok := vLinksMap[num]
			if !ok {
				vLinksMap[num] = tmp
				videoLinks = append(videoLinks, tmp)
			}
		}
	})

	if len(videoLinks) == 0 {
		return nil, fmt.Errorf("get video link error!")
	}

	return videoLinks, nil
}
