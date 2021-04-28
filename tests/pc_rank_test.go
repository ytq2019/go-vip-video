package test

import (
	"fmt"
	"go_vip_video/service"
	"testing"
)

func TestGetPCRank(t *testing.T) {

	got, err := service.GetPCRank()
	if err != nil {
		t.Fail()
	}
	fmt.Println(got)

}
