package test

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"log"
	"net/http"
	"testing"
)

type item struct {
	href,
	cover,
	title string
}

func Test(t *testing.T) {

	client := &http.Client{}
	req, err := http.NewRequest("GET", "https://www.360kan.com/dongman/list?from=index_channel%7Cdianshi_channel%7Cdianshi_list%7Cdianshi_list%7Cdianying_list%7Czongyi_list", nil)
	if err != nil {
		log.Fatal(err)
	}
	req.Header.Set("authority", "www.360kan.com")
	req.Header.Set("upgrade-insecure-requests", "1")
	req.Header.Set("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1")
	req.Header.Set("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9")
	req.Header.Set("sec-fetch-site", "same-origin")
	req.Header.Set("sec-fetch-mode", "navigate")
	req.Header.Set("sec-fetch-user", "?1")
	req.Header.Set("sec-fetch-dest", "document")
	req.Header.Set("referer", "https://www.360kan.com/dianshi/list.php?from=index_channel%7Cdianshi_channel")
	req.Header.Set("accept-language", "zh-CN,zh;q=0.9,en;q=0.8")
	resp, err := client.Do(req)
	if err != nil {
		log.Fatal(err)
	}

	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		log.Fatal(err)
	}
	items := make([]*item, 0)
	doc.Find(".s-tab-main ul li a").Each(func(i int, s *goquery.Selection) {
		href, _ := s.Attr("href")
		cover, _ := s.Find(".cover img").Attr("src")
		title := s.Find(".detail p .s1").Text()
		tmp := &item{
			href:  href,
			cover: cover,
			title: title,
		}
		items = append(items, tmp)
		log.Println(fmt.Sprintf("%s --> http://m.360kan.com%s", tmp.title, tmp.href))
	})

}
