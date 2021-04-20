package dto

type Search struct {
	Error int    `json:"error"`
	Msg   string `json:"msg"`
	Data  struct {
		Kw    string `json:"kw"`
		Total int    `json:"total"`
		Data  VData  `json:"data"`
	} `json:"data"`
}
type VData []struct {
	Cat      interface{} `json:"cat"`
	Title    string      `json:"title"`
	Cover    string      `json:"cover"`
	ID       string      `json:"id,omitempty"`
	Year     string      `json:"year,omitempty"`
	Score    string      `json:"score,omitempty"`
	Upinfo   interface{} `json:"upinfo,omitempty"`
	Finish   bool        `json:"finish,omitempty"`
	Epiname  string      `json:"epiname,omitempty"`
	Word     string      `json:"word,omitempty"`
	Moviecat []string    `json:"moviecat,omitempty"`
	Area     []string    `json:"area,omitempty"`
	Actor    []string    `json:"actor,omitempty"`
	Director []string    `json:"director,omitempty"`
	Total    int         `json:"total,omitempty"`
	Render   int         `json:"render"`
	Type     string      `json:"type,omitempty"`
	Sites    []struct {
		Name            string        `json:"name"`
		Site            string        `json:"site"`
		Upinfo          interface{}   `json:"upinfo"`
		DefaultPlaylink string        `json:"defaultPlaylink"`
		Xstm            string        `json:"xstm"`
		Wheshow         int           `json:"wheshow"`
		CloudControl    interface{}   `json:"cloudControl"`
		IsbestvAd       int           `json:"isbestvAd"`
		AdDuration      int           `json:"adDuration"`
		PicDuration     int           `json:"picDuration"`
		StartSkiptime   int           `json:"startSkiptime"`
		EndSkiptime     int           `json:"endSkiptime"`
		Lost            []interface{} `json:"lost"`
		Quality         []struct {
			Key     string `json:"key"`
			Name    string `json:"name"`
			Default int    `json:"default,omitempty"`
		} `json:"quality"`
		WebSiteIcon string `json:"webSiteIcon"`
	} `json:"sites,omitempty"`
	Download struct {
		Xstm            string        `json:"xstm"`
		Site            string        `json:"site"`
		Name            string        `json:"name"`
		Upinfo          interface{}   `json:"upinfo"`
		DefaultPlaylink string        `json:"defaultPlaylink"`
		Lost            []interface{} `json:"lost"`
		Quality         []struct {
			Key     string `json:"key"`
			Name    string `json:"name"`
			Default int    `json:"default,omitempty"`
		} `json:"quality"`
		WebSiteIcon   string `json:"webSiteIcon"`
		StartSkiptime string `json:"startSkiptime"`
		EndSkiptime   string `json:"endSkiptime"`
	} `json:"download,omitempty"`
	CloudControl  interface{}   `json:"cloudControl,omitempty"`
	DownloadSites []interface{} `json:"downloadSites,omitempty"`
	URI           string        `json:"uri"`
	Duration      string        `json:"duration,omitempty"`
	URL           string        `json:"url,omitempty"`
	Xstm          string        `json:"xstm,omitempty"`
	Site          string        `json:"site,omitempty"`
	Adapt         int           `json:"adapt,omitempty"`
}
