package common

import (
	"github.com/patrickmn/go-cache"
	"time"
)

var GoCache *cache.Cache

func initGoCache() {
	GoCache = cache.New(60*time.Minute, 5*time.Minute)
}
