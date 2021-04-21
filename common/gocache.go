package common

import (
	"github.com/patrickmn/go-cache"
	"time"
)

var GoCache *cache.Cache

func InitGoCache() {
	GoCache = cache.New(30*time.Minute, 5*time.Minute)
}
