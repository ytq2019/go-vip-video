{{template "layout/header.tpl"}}
{{template "top.tpl"}}
{{template "gonggao.tpl"}}
{{template "layout/bar.tpl"}}

{{range .VData}}
    <div class="search-item dyitem">
        <div class="box g-clear">
            <a href="/detail{{.Href}}" class="img">
                <img src="{{.Cover}}" alt="{{.Cover}}">
            </a>
            <div class="search-item-info">
                <h3>
                    {{.Title}}
                </h3>
                <p></p>
                <p></p>
                <p></p>
                <div class="btns">

                    <a class="weui_btn weui_btn_primary weui_btn_inline"
                   href="/detail{{.Href}}">
                    立即播放
                </a>

            </div>

        </div>
    </div>
</div>
{{end}}

{{template "layout/copyright.tpl"}}
{{template "layout/footer.tpl"}}
