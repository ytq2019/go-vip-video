package models

import (
	beego "github.com/beego/beego/v2/server/web"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

var GlobalORMDB *gorm.DB

func init() {
	dbs, err := beego.AppConfig.String("db")
	db, err := gorm.Open("mysql", dbs)
	if err != nil {
		panic("failed to connect database")
	}
	GlobalORMDB = db
}
