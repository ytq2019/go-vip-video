package models

import "github.com/jinzhu/gorm"

type User struct {
	ID          int64  `gorm:"column:id" json:"id" form:"id"`
	Nickname    string `gorm:"column:nickname" json:"nickname" form:"nickname"`
	HeadImgURL  string `gorm:"column:head_img_url" json:"head_img_url" form:"head_img_url"`
	OpenId      string `gorm:"column:open_id" json:"open_id" form:"open_id"`
	Sex         int32  `gorm:"column:sex" json:"sex" form:"sex"`
	City        string `gorm:"column:city" json:"city" form:"city"`
	Province    string `gorm:"column:province" json:"province" form:"province"`
	Unionid     string `gorm:"column:unionid" json:"unionid" form:"unionid"`
	Status      int64  `gorm:"column:status" json:"status" form:"status"`
	CreatedTime int64  `gorm:"column:created_time" json:"created_time" form:"created_time"`
	UpdatedTime int64  `gorm:"column:updated_time" json:"updated_time" form:"updated_time"`
}

func (u *User) TableName() string {
	return "users"
}

func (u *User) Updates(tx *gorm.DB, ups map[string]interface{}) error {
	return tx.Model(u).Updates(ups).Error
}

func (u *User) LoadByOpenId(tx *gorm.DB) error {
	return tx.Model(u).Where("open_id = ?", u.OpenId).Scan(u).Error
}

func (u *User) LoadById(tx *gorm.DB) error {
	return tx.Model(u).Where("id = ?", u.ID).Scan(u).Error
}

func (u *User) FirstOrCreateByOpenId(tx *gorm.DB) error {
	return tx.Where("open_id = ?", u.OpenId).Attrs(u).FirstOrCreate(u).Error
}
