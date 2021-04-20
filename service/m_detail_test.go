package service

import (
	"fmt"
	"testing"
)

func TestNewDetailDocument(t *testing.T) {

	got, err := NewDetailDocument("tv", "RbhvcH7lSmHrMH")
	if err != nil {
		t.Fail()

	}
	mDetail, _ := got.GetMDetail()
	sites := got.GetSites()
	links := got.DianYingLinks()

	fmt.Println(got, mDetail, sites, links)

}
