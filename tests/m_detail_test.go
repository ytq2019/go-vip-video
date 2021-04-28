package test

import (
	"fmt"
	"go_vip_video/service"
	"testing"
)

func TestNewDetailDocument(t *testing.T) {

	got, err := service.NewDetailDocument("tv", "RbhvcH7lSmHrMH")
	if err != nil {
		t.Fail()

	}
	mDetail := got.GetMDetail()
	sites := got.GetSites()
	links := got.DianYingLinks()

	fmt.Println(got, mDetail, sites, links)

}
