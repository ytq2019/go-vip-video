package models

import (
	"github.com/astaxie/beego"
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
