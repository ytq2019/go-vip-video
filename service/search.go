package service

import (
	"encoding/json"
	"fmt"
	"go_vip_video/dto"
	"io/ioutil"
	"net/http"
)

//https://ios.api.360kan.com/iphone/search/general?count=20&gfw=0&kw=赘婿&ss=0&st=1&start=0&vr=3.1.4

func Search(key string) (dto.VData, error) {
	url := fmt.Sprintf("https://ios.api.360kan.com/iphone/search/general?count=20&gfw=0&kw=%s&ss=0&st=1&start=0&vr=3.1.4", key)
	search, err := do(url)
	if err != nil {
		panic(err)
	}
	return search.Data.Data[:search.Data.Total], err
}

func do(url string) (*dto.Search, error) {
	response, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer response.Body.Close()
	//检出结果集
	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return nil, err
	}
	search := &dto.Search{}
	body = body[32:]
	if err := json.Unmarshal(body, &search); err != nil {
		return nil, err
	}
	return search, nil
}
