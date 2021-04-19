package service

import (
	"encoding/json"
	"fmt"
	"go_vip_video/dto"
	"io/ioutil"
	"net/http"
)

/**
获取剧集信息
*/
type GetLink struct {
	id   string
	cat  int
	site string
	url  string
}

func NewGetLink(id string, cat int, site string) (*GetLink, error) {
	links := &GetLink{id: id, cat: cat, site: site}
	if err := links.initUrl(); err != nil {
		return nil, err
	}
	return links, nil
}

func (l *GetLink) initUrl() error {
	switch l.cat {
	case 2:
		l.url = fmt.Sprintf("http://m.360kan.com/coverpage/getDianshiLinksBySite?id=%s&cat=%d&site=%s", l.id, l.cat, l.site)
	case 3:
		l.url = fmt.Sprintf("http://m.360kan.com/coverpage/getZongyiLinksBySite?id=%s&cat=%d&site=%s", l.id, l.cat, l.site)
	case 4:
		l.url = fmt.Sprintf("http://m.360kan.com/coverpage/getDongmanLinksBySite?id=%s&cat=%d&site=%s", l.id, l.cat, l.site)
	default:
		return fmt.Errorf("未知的cat:%d", l.cat)
	}
	return nil
}

func (c *GetLink) Do() (*dto.Links, error) {
	response, err := http.Get(c.url)
	if err != nil {
		return nil, err
	}
	defer response.Body.Close()
	//检出结果集
	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return nil, err
	}
	links := &dto.Links{}
	if err := json.Unmarshal(body, &links); err != nil {
		return nil, err
	}
	return links, nil
}
