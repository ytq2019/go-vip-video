{{template "layout/header.tpl"}}
{{template "top.tpl"}}
<div>
    <img src="/static/img/v76YqY65AFA5m9nIQsKnRpayIoJOJE.jpg" style="width: 100%;">
</div>
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
                        <span style="font-size: 13px">{{.Top}}</span>
                        <span>{{.Title}}</span>
                        <span style="float: right;font-size: 14px">
                        <label class="label f-red b-red">{{.Pv}}</label>
                        </span>
                    </h4>
                    <p class="weui-media-box__desc">刘涛李光洁带娃决战起跑线全44集</p>
                </div>
            </a>
        {{end}}

    </div>
</div>


<!-- 轮播 效果 JS文件   -->
<section class="guanyin_box guanyin_box2">
    <div class="meiyou_box">
        <p class="zhanshi_p">最近十条观影记录</p>

        <div class="jilu_box">
            <ul class="clearfix">

            </ul>
        </div>
    </div>
    <div class="fanhui_box2 fanhui_box3">
        <p class="fanhui2_p" style="padding-bottom: 15px"><a class="fanhui_dianji" href="javascript:void(0)" id="clean"
                                                             style="color: #fff">清空记录</a></p>
        <a class="fanhui_dianji" href="javascript:void(0)"><em class="close_2"></em></a>
    </div>
</section>
{{template "layout/copyright.tpl"}}
{{template "layout/footer.tpl" .}}

</body>
</html>
