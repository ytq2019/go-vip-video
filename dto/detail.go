package dto

type Detail struct {
	Error int    `json:"error"`
	Msg   string `json:"msg"`
	Data  struct {
		Cat           int           `json:"cat"`
		ID            string        `json:"id"`
		Title         string        `json:"title"`
		Exclusivesite string        `json:"exclusiveSite"`
		Cover         string        `json:"cover"`
		Word          string        `json:"word"`
		Score         string        `json:"score"`
		Doubancomment []interface{} `json:"doubanComment"`
		Duration      int           `json:"duration"`
		Sites         []struct {
			Name            string `json:"name"`
			Site            string `json:"site"`
			Upinfo          interface{} `json:"upinfo"`
			Defaultplaylink string `json:"defaultPlaylink"`
			Xstm            string `json:"xstm"`
			Header          struct {
				Referer   string `json:"Referer"`
				UserAgent string `json:"User-Agent"`
			} `json:"header"`
			Wheshow       int           `json:"wheshow"`
			Cloudcontrol  interface{}   `json:"cloudControl"`
			Isbestvad     int           `json:"isbestvAd"`
			Adduration    int           `json:"adDuration"`
			Picduration   int           `json:"picDuration"`
			Startskiptime string        `json:"startSkiptime"`
			Endskiptime   string        `json:"endSkiptime"`
			Lost          []interface{} `json:"lost"`
			Quality       []struct {
				Key     string `json:"key"`
				Name    string `json:"name"`
				Default int    `json:"default,omitempty"`
			} `json:"quality"`
			Websiteicon string `json:"webSiteIcon"`
		} `json:"sites"`
		Download struct {
			Xstm            string        `json:"xstm"`
			Site            string        `json:"site"`
			Name            string        `json:"name"`
			Upinfo          interface{}        `json:"upinfo"`
			Defaultplaylink string        `json:"defaultPlaylink"`
			Lost            []interface{} `json:"lost"`
			Quality         []struct {
				Key     string `json:"key"`
				Name    string `json:"name"`
				Default int    `json:"default,omitempty"`
			} `json:"quality"`
			Websiteicon   string `json:"webSiteIcon"`
			Startskiptime string `json:"startSkiptime"`
			Endskiptime   string `json:"endSkiptime"`
		} `json:"download"`
		Actor     []string `json:"actor"`
		Director  []string `json:"director"`
		Moviecat  []string `json:"moviecat"`
		Area      []string `json:"area"`
		Year      string   `json:"year"`
		Vip       string   `json:"vip"`
		Sharedata struct {
			Title       string `json:"title"`
			Imageurl    string `json:"imageurl"`
			Weburl      string `json:"weburl"`
			Description string `json:"description"`
		} `json:"shareData"`
		StatQuery struct {
			Query1  string `json:"query1"`
			Query2  string `json:"query2"`
			Query3  string `json:"query3"`
			Query4  string `json:"query4"`
			Query5  string `json:"query5"`
			Query6  string `json:"query6"`
			Query8  string `json:"query8"`
			Query9  string `json:"query9"`
			Query10 string `json:"query10"`
		} `json:"stat_query"`
		Desc          string `json:"desc"`
		Downloadsites []struct {
			Site    string        `json:"site"`
			Name    string        `json:"name"`
			Upinfo  string        `json:"upinfo"`
			Lost    []interface{} `json:"lost"`
			Quality []struct {
				Key     string `json:"key"`
				Name    string `json:"name"`
				Default int    `json:"default,omitempty"`
			} `json:"quality"`
			Websiteicon string `json:"webSiteIcon"`
		} `json:"downloadSites"`
		Series []struct {
			ID        string `json:"id"`
			SeriesTag string `json:"series_tag"`
			Cat       int    `json:"cat"`
			Sites     []struct {
				Site string `json:"site"`
			} `json:"sites"`
			Rpt struct {
				VideoID                string `json:"video_id"`
				VideoCategory          string `json:"video_category"`
				PageName               string `json:"page_name"`
				Group                  string `json:"group"`
				ContentType            string `json:"content_type"`
				ItemDetailpageVideoID  string `json:"item_detailpage_video_id"`
				ItemDetailpageCategory string `json:"item_detailpage_category"`
			} `json:"rpt"`
		} `json:"series"`
		Rpt struct {
			VideoID       string `json:"video_id"`
			VideoCategory string `json:"video_category"`
			PageName      string `json:"page_name"`
			Group         string `json:"group"`
		} `json:"rpt"`
	} `json:"data"`
}
