package models

import "github.com/jinzhu/gorm"

type VideoPlaybackRecord struct {
	ID        int64  `gorm:"column:id" json:"id" form:"id"`
	Uniacid   int64  `gorm:"column:uniacid" json:"uniacid" form:"uniacid"`
	Cat       int    `gorm:"column:cat" json:"cat" form:"cat"`
	Site      string `gorm:"column:site" json:"site" form:"site"`
	Title     string `gorm:"column:title" json:"title" form:"title"`
	Uid       string `gorm:"column:uid" json:"uid" form:"uid"`
	Openid    string `gorm:"column:openid" json:"openid" form:"openid"`
	Time      int64  `gorm:"column:time" json:"time" form:"time"`
	VideoUrl  string `gorm:"column:video_url" json:"video_url" form:"video_url"`
	Share     int64  `gorm:"column:share" json:"share" form:"share"`
	YvideoUrl string `gorm:"column:yvideo_url" json:"yvideo_url" form:"yvideo_url"`
	Type      int    `gorm:"column:type" json:"type" form:"type"`
	Index     int64  `gorm:"column:index" json:"index" form:"index"`
	VideoId   int64  `gorm:"column:video_id" json:"video_id" form:"video_id"`
	Ip        string `gorm:"column:ip" json:"ip" form:"ip"`
}

func (v *VideoPlaybackRecord) TableName() string {
	return "video_playback_record"
}

func (v *VideoPlaybackRecord) Updates(tx *gorm.DB, ups map[string]interface{}) error {
	return tx.Model(v).Updates(ups).Error
}
