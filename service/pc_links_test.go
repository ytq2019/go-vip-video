package service

import (
	"fmt"
	"testing"
)

func TestGetPCLinks(t *testing.T) {
	////https://www.360kan.com/cover/switchsitev2?site=qiyi&id=PbVqan7lSmHsNX&category=2
	links, err := GetPCLinks("qiyi", "PbVqan7lSmHsNX", "2")
	if err != nil {
		t.Fail()
	}
	fmt.Println(links)
}
