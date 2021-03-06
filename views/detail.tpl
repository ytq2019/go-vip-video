{{template "layout/header.tpl"}}
{{template "top.tpl"}}

<section class="shiping_box">
    <iframe allowFullscreen="true" src="{{.JxUrl}}{{.Link}}" width="100%" height="210px" allowTransparency="true"
            frameborder="0" scrolling="no"></iframe>
</section>

{{template "gonggao.tpl"}}
{{if ne .Cat "m"}}
<section class="gonggao_box clearfix">
    <div class="gonggao_box2 clearfix">
        <span class="gonggao fl">来源</span>
        <div class="weui-flex">
            {{range .Sites}}
                <div>
                    {{if eq $.Site .Name}}
                        <a style="color:red"
                           href="/detail/{{$.Cat}}/{{$.Id}}.html?site={{.Code}}&num={{$.Num}}&jxId={{$.JxID}}">{{.Name}}</a>
                    {{else}}
                        <a href="/detail/{{$.Cat}}/{{$.Id}}.html?site={{.Code}}&num={{$.Num}}&jxId={{$.JxID}}">{{.Name}}</a>
                    {{end}}
                </div>&nbsp;
            {{end}}
        </div>
    </div>
</section>
{{end}}
<section class="gonggao_box clearfix">
    <div class="gonggao_box2 clearfix">
        <span class="gonggao fl">线路</span>
        <div class="weui-flex">
            {{range $index, $elem := .JxLines}}
                <div>
                    {{if eq $index $.JxID}}
                        <a style="color:red"
                           href="/detail/{{$.Cat}}/{{$.Id}}.html?site={{$.Site}}&num={{$.Num}}&jxId={{$index}}">{{$elem.Name}}</a>
                    {{else}}
                        <a href="/detail/{{$.Cat}}/{{$.Id}}.html?site={{$.Site}}&num={{$.Num}}&jxId={{$index}}">{{$elem.Name}}</a>
                    {{end}}
                </div>&nbsp;
            {{end}}

        </div>
    </div>
</section>

<section class="sanguo_box bgfff">

    <h2 class="sanguo_h2" style="line-height: 0.49rem">
        <span class="pingfen_y9 fr" style="margin-top: 0px">{{.Detail.Score}}分</span>
        {{/*        <a href="javascript:;" class="fr weui-btn weui-btn_mini weui-btn_default" style="color:#18b4ed"*/}}
        {{/*           id="baocuo"><span class="icon icon-40">报错</span></a>*/}}
        {{.Detail.Title}} </h2>
    <div class="clearfix">
        <div class="fl xiangqing_box_y9" style="width: 83%">
            <p>  {{.Detail.Area}}   {{.Detail.Director}}  </p>
            <p> 播放量：11 <span><a href="javascript:;" id="sd3">评论：0条</a></span></p>

        </div>

        <div class="fr lianjie_box_y9"><a href="javascript:;"
                                          onclick="$(&#39;.weui-share&#39;).show().addClass(&#39;fadeIn&#39;);"><em
                        class="icon icon-3" style="margin-right: 10px"></em></a> <a href="javascript:;"
                                                                                    id="shoucang"><em
                        class="icon icon-48" id="shoucangicon" style="font-size: 19px;"></em></a></div>
    </div>
</section>
<span id="title" class="title"></span>

<section class="jishi_box_y9 p_r">
    {{if eq $.Cat "va"}}
    <div class="jishi_box3">
        {{else}}
        <div class="jishi_box2">
            {{end}}

            <ul class="clearfix">
                {{range .Links}}
                    {{if eq .Num $.Num}}
                        {{if eq $.Cat "va"}}
                            <li class="on" style="width:30%">
                        {{else}}
                            <li class="on">
                        {{end}}
                    {{else}}
                        {{if eq $.Cat "va"}}
                            <li style="width:30%">
                        {{else}}
                            <li>
                        {{end}}
                    {{end}}
                    <a href="/detail/{{$.Cat}}/{{$.Id}}?site={{$.Site}}&num={{.Num}}&jxId={{$.JxID}}"
                       style="position: relative;">{{.Num}}</a>
                    </li>
                {{end}}
            </ul>
        </div>
</section>
<section class="jianjie_y9 bgfff clearfix">
    <p class="jianjie_y9_p all">{{.Detail.Desc}}</p>
    <!--<a class="zhankai fr change down" href="javascript:;"><em class="zhankai_icon"></em>展开详情</a>-->
</section>

{{template "layout/copyright.tpl"}}

<script src="/static/js/jweixin-1.3.2.js"></script>

<script type="text/javascript">
    window.sysinfo = window.sysinfo || {
        "uniacid": 7,
        "acid": "7",
        "siteroot": "http:\/\/wx.qiandao.name\/",
        "siteurl": "http:\/\/wx.qiandao.name\/app\/index.php?i=7&c=entry&eid=55&mov=detail&op=dianying&d_id=%2Fm%2FgafiYxH4S0P7TB.html&url=%2Fm%2FgafiYxH4S0P7TB.html",
        "attachurl": "http:\/\/wx.qiandao.name\/attachment\/",
        "cookie": {"pre": "15cc_"},
        "MODULE_URL": "http:\/\/wx.qiandao.name\/addons\/super_mov\/"
    } || {};

    // jssdk config 对象
    jssdkconfig = null || {};

    // 是否启用调试
    jssdkconfig.debug = false;

    jssdkconfig.jsApiList = [
        'checkJsApi',
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo',
        'hideMenuItems',
        'showMenuItems',
        'hideAllNonBaseMenuItem',
        'showAllNonBaseMenuItem',
        'translateVoice',
        'startRecord',
        'stopRecord',
        'onRecordEnd',
        'playVoice',
        'pauseVoice',
        'stopVoice',
        'uploadVoice',
        'downloadVoice',
        'chooseImage',
        'previewImage',
        'uploadImage',
        'downloadImage',
        'getNetworkType',
        'openLocation',
        'getLocation',
        'hideOptionMenu',
        'showOptionMenu',
        'closeWindow',
        'scanQRCode',
        'chooseWXPay',
        'openProductSpecificView',
        'addCard',
        'chooseCard',
        'openCard'
    ];

    wx.config(jssdkconfig);

</script>
<script type="text/javascript">
    wx.ready(function () {
        sharedata = {
            title: '天天影院丨开启免费观影新时代！',
            desc: '你还在花钱开各大视频网站VIP？有了这个就够了！',
            imgUrl: 'http://wx.qiandao.name/attachment/images/7/2020/08/j0RTrgP8P1he80rpGOMk0m8G3Kr88Z.jpg',
            link: '',
            success: function () {
            },
            cancel: function () {
            }


        };
        wx.onMenuShareAppMessage(sharedata);
        wx.onMenuShareTimeline(sharedata);
        wx.onMenuShareQQ(sharedata);
        wx.onMenuShareWeibo(sharedata);

    });
</script>
<section class="guanyin_box guanyin_box2">
    <div class="meiyou_box">
        <p class="zhanshi_p">最近十条观影记录</p>

        <div class="jilu_box">
            <ul class="clearfix">
                <li class="clearfix"><span class="fr">

      <a class="jishu_guankan"
         href="/">继续观看<em
                  class="zhuandao"></em></a></span></li>


            </ul>
        </div>
    </div>
    <div class="fanhui_box2 fanhui_box3">
        <p class="fanhui2_p" style="padding-bottom: 15px"><a class="fanhui_dianji" href="javascript:void(0)" id="clean"
                                                             style="color: #fff">清空记录</a></p>
        <a class="fanhui_dianji" href="javascript:void(0)"><em class="close_2"></em></a>
    </div>
</section>

<script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });

    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
        return currentdate;
    }
</script>
{{template "layout/footer.tpl"}}
