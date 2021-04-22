package service

import (
	"fmt"
	"testing"
)

func TestGetPCRank(t *testing.T) {

	got, err := GetPCRank()
	if err != nil {
		t.Fail()
	}
	fmt.Println(got)

}
