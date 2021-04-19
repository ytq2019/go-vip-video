package dto

type ChannelDataResp struct {
	Error int    `json:"error"`
	Msg   string `json:"msg"`
	Data  struct {
		Total int `json:"total"`
		Tid   int `json:"tid"`
		Datas []struct {
			ID       string      `json:"id"`
			Cat      int         `json:"cat"`
			Title    string      `json:"title"`
			Cover    string      `json:"cover"`
			Year     string      `json:"year"`
			Score    string      `json:"score"`
			Upinfo   interface{} `json:"upinfo"`
			Finish   int         `json:"finish"`
			Epiname  string      `json:"epiname"`
			Word     string      `json:"word"`
			Area     []string    `json:"area"`
			Actor    []string    `json:"actor"`
			Moviecat []string    `json:"moviecat"`
			Render   int         `json:"render"`
		} `json:"datas"`
	} `json:"data"`
}
