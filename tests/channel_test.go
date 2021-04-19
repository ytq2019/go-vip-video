package test

import (
	"fmt"
	"go_vip_video/service"
	"testing"
)

func TestNewGetChannelDatas(t *testing.T) {
	dataService := service.ChannelDataService(3, 10, 0)
	exec, err := dataService.Do()
	if err != nil {

	}
	fmt.Println(exec)
}
