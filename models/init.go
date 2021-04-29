package models

import (
	beego "github.com/beego/beego/v2/adapter"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

var GlobalORMDB *gorm.DB

func init() {
	db, err := gorm.Open("mysql", beego.AppConfig.String("db"))
	if err != nil {
		panic("failed to connect database")
	}
	GlobalORMDB = db
}
