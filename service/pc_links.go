package service

import (
	"encoding/json"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"go_vip_video/dto/pc"
	"go_vip_video/utils"
	"io/ioutil"
	log "log"
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
	fmt.Println(doc.Html())
	//TODO 综艺未处理
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
