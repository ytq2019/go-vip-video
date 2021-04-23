package service

import (
	"fmt"
	"testing"
)

func TestNewSwiperDocument(t *testing.T) {

	got, err := NewSwiperDocument()
	if err != nil {
		t.Fail()

	}
	result := got.SwiperResult()
	fmt.Println(result)
}
