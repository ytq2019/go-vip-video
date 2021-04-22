package pc

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
