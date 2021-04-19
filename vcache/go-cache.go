package vcache

import (
	"github.com/patrickmn/go-cache"
	"time"
)

var GoCache *cache.Cache

func init() {
	GoCache = cache.New(30*time.Minute, 5*time.Minute)
}
