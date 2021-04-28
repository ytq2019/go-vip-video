package test

import (
	"fmt"
	"go_vip_video/service"
	"testing"
)

func TestNewSwiperDocument(t *testing.T) {

	got, err := service.NewSwiperDocument()
	if err != nil {
		t.Fail()

	}
	result := got.SwiperResult()
	fmt.Println(result)
}
