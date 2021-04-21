{{template "layout/header.tpl"}}
<body>
<section class="touxiang_box">
    <a href="/">
        <div class="touxiang"><img
                    src="{{.UserInfo.HeadImgURL}}">
        </div>
        <p class="mingcheng_y8">{{.UserInfo.Nickname}}</p>
    </a>
    <div class="jilu_y8">
        <ul class="clearfix">
            <li><a href="/"><em class="guankan_icon"></em><span>观看记录</span></a></li>
            <li><a href="/"><em class="xufei_icon"></em><span>会员开通</span></a></li>
            <li><a href="/"><em class="dingdan_icon"></em><span>订单管理</span></a></li>
        </ul>
    </div>
</section>

<section class="wode_box bgfff">
    <ul>
        <li>
            <div class="huiyuan jifen">
                <p class="clearfix">我的积分：<span class="fr">0.00<a href=""><em class="zhuandao2"></em></a></span></p>
            </div>
        </li>
        <li>
            <div class="huiyuan jifen"
                 style="background: url(http://wx.qiandao.name/addons/super_mov/style/images/shoucang.png) no-repeat 0.33rem center;background-size: 0.31rem 0.29rem">
                <a href="/"><p class="clearfix">我的收藏：<span class="fr"><em class="zhuandao2"></em></span></p></a>
            </div>
        </li>
        <li>
            <div class="huiyuan jifen"
                 style="background: url(http://wx.qiandao.name/addons/super_mov/style/images/bangding.png) no-repeat 0.33rem center;background-size: 0.31rem 0.29rem">
                <a href="/"><p class="clearfix">绑定手机号：<span class="fr"><em class="zhuandao2"></em></span></p></a>
            </div>
        </li>
        <!--  -->
    </ul>
</section>

<section class="wode_box bgfff">
    <ul>


    </ul>
</section>

{{template "layout/copyright.tpl"}}

{{template "layout/footer.tpl"}}
<script src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
<script type="text/javascript">
    window.sysinfo = window.sysinfo || {
        "uniacid": 7,
        "acid": "7",
        "siteroot": "http:\/\/wx.qiandao.name\/",
        "siteurl": "http:\/\/wx.qiandao.name\/app\/index.php?i=7&c=entry&eid=59",
        "attachurl": "http:\/\/wx.qiandao.name\/attachment\/",
        "cookie": {"pre": "15cc_"},
        "openid": "o2IrD598mrLw2dJuo7TmwnrBax74",
        "MODULE_URL": "http:\/\/wx.qiandao.name\/addons\/super_mov\/"
    } || {};

    // jssdk config 对象
    jssdkconfig = {
        "appId": "wxcb331d5bde931fd0",
        "nonceStr": "SxZ8zeiV0z6Vg600",
        "timestamp": "1619006443",
        "signature": "70b96fd8b5228631778a26a9e26f824fa654699e"
    } || {};

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
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?0f5971b1e035e3e5ee01a6816f9db20f";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<div style="display: none">
</div>
<script>;</script>
<script type="text/javascript"
        src="http://wx.qiandao.name/app/index.php?i=7&amp;c=utility&amp;a=visit&amp;do=showjs&amp;m=super_mov"></script>

</body>
