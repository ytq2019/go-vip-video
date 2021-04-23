{{template "layout/header.tpl"}}
{{template "top.tpl"}}
<img src="/static/img/v76YqY65AFA5m9nIQsKnRpayIoJOJE.jpg" style="width: 100%;" alt="img">
<div class="weui-panel weui-panel_access rank_box">
    <div class="weui-panel__bd" style="background: #ffffff">
        {{range .Rank}}
            <a href="/detail{{.Href}}"
               class="weui-media-box weui-media-box_appmsg" style="padding: 10px;!important;">
                <div class="weui-media-box__hd" style="width: 90px!important;">
                    <img class="weui-media-box__thumb" alt="" src="{{.Cover}}">
                </div>
                <div class="weui-media-box__bd">
                    <h4 class="weui-media-box__title">
                        <span class="f15">{{.Top}}</span>
                        <span class="f15">{{.Title}}</span>
                        <span style="float: right;font-size: 14px">
                        <label class="label f-red b-red">{{.Pv}}</label>
                        </span>
                    </h4>
                    <p class="weui-media-box__desc">{{.Desc}}</p>
                </div>
            </a>
        {{end}}
    </div>
</div>
{{template "layout/copyright.tpl"}}
{{template "layout/footer.tpl" .}}
