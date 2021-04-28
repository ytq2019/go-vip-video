package dto

type MDetail struct {
	Score,
	Title,
	Year,
	Area,
	Desc,
	Director string
}

type Swiper struct {
	Href,
	Desc,
	Img string
}

type Site struct {
	Code string
	Name string
}

type Lines struct {
	Name string
	Url  string
}

type VideoItem struct {
	Href,
	Cover,
	Title string
}
type VideoLink struct {
	Href,
	Num string
}

//视频排行
type RankVideo struct {
	VideoItem
	Update string //更新至
	Desc   string //描述
	Pv     string
	Top    string //排名
}
