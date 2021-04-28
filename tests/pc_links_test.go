package test

import (
	"fmt"
	"go_vip_video/service"
	"testing"
)

func TestGetPCLinks(t *testing.T) {
	////https://www.360kan.com/cover/switchsitev2?site=qiyi&id=PbVqan7lSmHsNX&category=2
	links, err := service.GetPCLinks("qiyi", "PbVqan7lSmHsNX", "2")
	if err != nil {
		t.Fail()
	}
	fmt.Println(links)
}
