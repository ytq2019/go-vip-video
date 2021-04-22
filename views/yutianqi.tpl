{{template "layout/header.tpl"}}

<div class="weui-cells">
    {{range .Users}}
        <div class="weui-cell  weui-cell_example">
            <div class="weui-cell__hd"><img src="{{.HeadImgURL}}" alt=""
                                            style="width: 20px; margin-right: 16px; display: block;"></div>
            <div class="weui-cell__bd">
                <p>{{.Nickname}}</p>
            </div>
            <div class="weui-cell__ft">{{.ID}}</div>
        </div>
    {{end}}
</div>

</body>
</html>
