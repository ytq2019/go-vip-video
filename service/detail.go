package service

import (
	"encoding/json"
	"fmt"
	"go_vip_video/dto"
	"io/ioutil"
	"net/http"
)

type detail struct {
	cat int
	id  string
	url string
}

func NewDetail(cat int, id string) *detail {
	return &detail{cat: cat, id: id, url: fmt.Sprintf("https://ios.api.360kan.com/iphone/detail/baseinfov2?cat=%d&id=%s", cat, id)}
}

func (c *detail) Do() (*dto.Detail, error) {
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
	detail := &dto.Detail{}
	body = body[32:]
	if err := json.Unmarshal(body, &detail); err != nil {
		return nil, err
	}
	return detail, nil
}
