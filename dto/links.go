package dto

type Links struct {
	Error    int    `json:"error"`
	Msg      string `json:"msg"`
	Upinfo   string `json:"upinfo"`
	Finished int    `json:"finished"`
	Data     string `json:"data"`
}

type Link struct {
	Url string
	Num string
}

type Site struct {
	Code string
	Name string
}
