<!DOCTYPE html>
<!-- saved from url=(0064)http://wx.qiandao.name/app/index.php?i=7&c=entry&eid=55&op=index -->
<html style="font-size: 64.6875px;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="referrer" content="no-referrer">
    <link rel="stylesheet" href="/static/css/weuix.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="/static/css/li.css">
    <link rel="stylesheet" href="/static/css/swiper.min.css">
    <title>天天影院丨开启免费观影新时代！</title>
    <!--JQ库-->
    <script src="/static/js/hm.js"></script>
    <script src="/static/js/zepto.min.js"></script>
    <script src="/static/js/li.js"></script>
    <script src="/static/js/swiper.min.js"></script>
    <script>
        $(document).ready(function () {
            lazyload(); //首屏
            document.addEventListener("scroll", lazyload);
        });
        //获取可是区域的高度
        var viewHeight = document.documentElement.clientHeight;

        function lazyload() {
            var eles = document.querySelectorAll("img[data-original][lazyload]");
            Array.prototype.forEach.call(eles, function (item, index) {
                if (item.dataset.original == "")
                    return;
                var rect = item.getBoundingClientRect(); //这个元素相对于左上角的位置

                if (rect.bottom >= 0 && rect.top < viewHeight) {
                    //当元素顶部小于可视高度时，请求图片资源
                    !function () {
                        var img = new Image();
                        img.src = item.dataset.original;
                        img.onload = function () {
                            item.src = img.src;
                        }
                        item.removeAttribute('data-original');
                        item.removeAttribute('lazyload');
                    }()
                }
            })
        }


    </script>
    <style type="text/css">
        .leimu_zui {
            width: auto
        }

        .weui-navigator-list li {
            font-weight: 500
        }

        .weui-navigator-list li.weui-state-hover, .weui-navigator-list li.weui-state-active a:after {
            background-color: none
        }
    </style>
    <input type="hidden" id="_w_tusk">
    <script type="text/javascript"
            src="chrome-extension://dbjbempljhcmhlfpfacalomonjpalpko/scripts/inspector.js"></script>
    <style class="mpa-style-fix ImageGatherer">.FotorFrame {
            position: fixed !important
        }</style>
    <style class="mpa-style-fix SideFunctionPanel">.weui-desktop-online-faq__wrp {
            top: 304px !important;
            bottom: unset !important
        }

        .weui-desktop-online-faq__wrp .weui-desktop-online-faq__switch {
            width: 38px !important
        }</style>
</head>
<body style="margin:0 auto" mpa-version="7.16.9" mpa-extension-id="ibefaeehajgcpooopoegkifhgecigeeg">
<section class="logo_box clearfix">
    <div class="fl"><a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=index"><img
                    class="logo_img" src="/static/img/O4422o9131EZHHCGO1mCmq46Ot96T4.png"></a></div>
    <div class="sosuo_box fl">
        <form action="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=56" method="post" role="form">
            <input class="btn_com btn_sosuo" id="text" type="text" placeholder="请输入影视、电视剧关键词、支持拼音" name="key" value="">
        </form>
    </div>
    <div class="fr"><a class="tanchu" href="javascript:void(0)"><em class="jilu"></em></a></div>
</section>
<div id="word"></div>


<section class="gonggao_box clearfix">
    <div class="swiper-container swiper-container-horizontal">
        <div class="swiper-wrapper" style="transform: translate3d(-804px, 0px, 0px); transition-duration: 0ms;">
            <div class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev"
                 data-swiper-slide-index="0" style="width: 402px;">
                <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;do=detail&amp;op=index&amp;url=">
                    <img src="/static/img/St8Y04b0Qn3Qq457n77BB47p0q0B58.jpg" style="height:178px;width:100%">
                </a>
            </div>
            <div class="swiper-slide swiper-slide-duplicate-active swiper-slide-prev swiper-slide-duplicate-next"
                 data-swiper-slide-index="0" style="width: 402px;">
                <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;do=detail&amp;op=index&amp;url=">
                    <img src="/static/img/St8Y04b0Qn3Qq457n77BB47p0q0B58.jpg" style="height:178px;width:100%">
                </a>
            </div>

            <div class="swiper-slide swiper-slide-duplicate swiper-slide-active swiper-slide-duplicate-prev"
                 data-swiper-slide-index="0" style="width: 402px;">
                <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;do=detail&amp;op=index&amp;url=">
                    <img src="/static/img/St8Y04b0Qn3Qq457n77BB47p0q0B58.jpg" style="height:178px;width:100%">
                </a>
            </div>
        </div>
    </div>
</section>
<style type="text/css">
    #gongao {
        width: 100%;
        overflow: hidden;
    }

    #gongao #scroll_begin, #gongao #scroll_end {
        display: inline
    }

    #word {
        position: absolute;
        z-index: 99;
        width: 100%;
        height: auto;
        background-color: white;
        border: black solid 1px;
        display: none;
        box-sizing: border-box;
        padding: 15px
    }

    #word a {
        color: #444
    }

    .click_work {
        padding-bottom: 8px;
        font-weight: lighter;
        font-size: 13px;
        cursor: pointer; /*鼠标放上变成小手*/
        color: #444
    }

    .click_work:hover {
        color: orange;
        background-color: gray;
    }

    .error {
        color: gray;
        cursor: pointer; /*鼠标放上变成小手*/
    }
</style>
<script type="text/javascript">

    $('#text').keyup(function () {
        var keywords = $(this).val();
        if (keywords == '') {
            $('#word').hide();
            return
        }
        ;
        $.ajax({
            url: 'http://wx.qiandao.name/app/index.php?i=7&c=entry&eid=56&op=json&kw=' + keywords,
            dataType: 'json',
            beforeSend: function () {
                $('#word').append('<div>正在加载。。。</div>');
            },
            success: function (data) {

                $('#word').empty().show();
                if (data == '') {
                    $('#word').append('<div class="error">没找到  "' + keywords + '"</div>');
                }
                $.each(data, function (index, item) {
                    console.log(item)
                    $('#word').append('<a style="color:#444" href="http://wx.qiandao.name/app/index.php?i=7&c=entry&eid=56&key=' + item.word + '"><div class="click_work" style="color:#444">' + item.word + '</div></a>');
                })
            },
            error: function () {
                $('#word').empty().show();
                $('#word').append('<div class="click_work">没找到 "' + keywords + '"</div>');
            }
        })
    })
    //点击搜索数据复制给搜索框
    $(document).on('click', '.click_work', function () {
        var word = $(this).text();
        $('#text').val(word);
        $('#word').hide();
        // $('#texe').trigger('click');触发搜索事件
    })

    function ScrollImgLeft() {
        var speed = 25;
        var scroll_begin = document.getElementById("scroll_begin");
        var scroll_end = document.getElementById("scroll_end");
        var scroll_div = document.getElementById("scroll_div");
        scroll_end.innerHTML = scroll_begin.innerHTML;

        function Marquee() {
            if (scroll_end.offsetWidth - scroll_div.scrollLeft <= 0)
                scroll_div.scrollLeft -= scroll_begin.offsetWidth;
            else
                scroll_div.scrollLeft++;
        }

        var MyMar = setInterval(Marquee, speed);
        scroll_div.onmouseover = function () {
            clearInterval(MyMar);
        }
        scroll_div.onmouseout = function () {
            MyMar = setInterval(Marquee, speed);
        }
    }
</script>
<section class="gonggao_box clearfix">
    <div class="gonggao_box2 clearfix"><span class="gonggao fl">公告</span>

        <div id="gongao" class="fl xianshi" style="width: 82%;height: 27px">
            <div style="width:100%;height:27px;margin:0 auto;white-space: nowrap;overflow:hidden;" id="scroll_div"
                 class="scroll_div">
                <div id="scroll_begin">
                    <a class="guanzhu"
                       href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=index"
                       style="background: none;color: #000">影片需要加载时间，请耐心等待，播放失败请切换来源</a>
                </div>
                <div id="scroll_end">
                    <a class="guanzhu"
                       href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=index"
                       style="background: none;color: #000">影片需要加载时间，请耐心等待，播放失败请切换来源</a>
                </div>
            </div>
            <script type="text/javascript">ScrollImgLeft();</script>
        </div>

    </div>
</section>
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
<div class="aui-head-layout" style="margin-top:10px">
    <div class="aui-palace">
        <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=index" class="aui-palace-grid">
            <div class="aui-palace-grid-icon">
                <img src="/static/img/N7Ee0XFaQc0EE3iVMm6fxNI1enXn6E.jpg" alt="">
            </div>
            <div class="aui-palace-grid-text">
                <h2>首页</h2>
            </div>
        </a>
        <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=dianying"
           class="aui-palace-grid">
            <div class="aui-palace-grid-icon">
                <img src="/static/img/c7yxHrphliH19pRr7D99y8Y9Hhrl3D.jpg" alt="">
            </div>
            <div class="aui-palace-grid-text">
                <h2>电影</h2>
            </div>
        </a>
        <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=dianshi"
           class="aui-palace-grid">
            <div class="aui-palace-grid-icon">
                <img src="/static/img/e4jXU1nj3o831u3eEv4U884QHJ8J3S.jpg" alt="">
            </div>
            <div class="aui-palace-grid-text">
                <h2>剧集</h2>
            </div>
        </a>
        <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=zongyi" class="aui-palace-grid">
            <div class="aui-palace-grid-icon">
                <img src="/static/img/mM42727Q287mMkvz5P4P2135zCMcC5.jpg" alt="">
            </div>
            <div class="aui-palace-grid-text">
                <h2>综艺</h2>
            </div>
        </a>
        <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=dongman"
           class="aui-palace-grid">
            <div class="aui-palace-grid-icon">
                <img src="/static/img/UH5uFsp2Kt4OU4Ptu2kkTkksfDUXFX.jpg" alt="">
            </div>
            <div class="aui-palace-grid-text">
                <h2>动漫</h2>
            </div>
        </a>
    </div>
</div>


<section class="tuijian_box">
    <h2 class="clearfix tuijian bgfff"><em class="dianyin"></em>电影推荐
        <a class="fr more" href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=dianying">更多<em
                    class="more_icon"></em></a>

    </h2>
    <div class="dianying_box  bgfff clearfix">
        <ul class="clearfix">
            {{range .dianying}}
            <li>
                <a href="/detail/{{.Cat}}/{{.ID}}"><img
                            lazyload="true"
                            data-original="{{.Cover}}"></a>
                <a href="/detail/{{.Cat}}/{{.ID}}"><span
                            class="biaoti">{{.Title}}</span></a></li>
            {{end}}

        </ul>
    </div>

</section>

<section class="tuijian_box">
    <h2 class="clearfix tuijian bgfff"><em class="dianshiju"></em>电视剧推荐
        <a class="fr more" href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=dianshi">更多<em
                    class="more_icon"></em></a>
    </h2>
    <div class="dianying_box  bgfff clearfix">
        <ul class="clearfix">


            {{range .dianshi}}
                <li>
                    <a href="/detail/{{.Cat}}/{{.ID}}"><img
                                lazyload="true"
                                data-original="{{.Cover}}"></a>
                    <a href="/detail/{{.Cat}}/{{.ID}}"><span
                                class="biaoti">{{.Title}}</span></a></li>
            {{end}}

        </ul>
    </div>

</section>

<section class="tuijian_box">
    <h2 class="clearfix tuijian bgfff"><em class="zongyi"></em>综艺推荐
        <a class="fr more" href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=zongyi">更多<em
                    class="more_icon"></em></a>
    </h2>
    <div class="dianying_box clearfix bgfff">
        <ul class="clearfix">

            {{range .zongyi}}
                <li>
                    <a href="/detail/{{.Cat}}/{{.ID}}"><img
                                lazyload="true"
                                data-original="{{.Cover}}"></a>
                    <a href="/detail/{{.Cat}}/{{.ID}}"><span
                                class="biaoti">{{.Title}}</span></a></li>
            {{end}}


        </ul>
    </div>

</section>
<section class="tuijian_box">
    <h2 class="clearfix tuijian bgfff"><em class="dongman"></em>动漫推荐
        <a class="fr more" href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=dongman">更多<em
                    class="more_icon"></em></a>
    </h2>
    <div class="dianying_box clearfix bgfff">
        <ul class="clearfix">

            {{range .dongman}}
                <li>
                    <a href="/detail/{{.Cat}}/{{.ID}}"><img
                                lazyload="true"
                                data-original="{{.Cover}}"></a>
                    <a href="/detail/{{.Cat}}/{{.ID}}"><span
                                class="biaoti">{{.Title}}</span></a></li>
            {{end}}

        </ul>
    </div>

</section>

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
<section class="guanyin_box index_guanzhu" id="guanzhu" style="display: none">
    <div class="meiyou_box">
        <p class="zhanshi_p">长按二维码识别</p>
        <div class="dianying_box dianying_box2 clearfix" style="padding: 10%">
            <img src="/static/img/Y020Bz13IBp35AK0YhkJ5ka5P55B2b.jpg" width="100%">
        </div>
        <div class="jilu_box">

        </div>
    </div>
    <div class="fanhui_box2 fanhui_box3">
        <a class="fanhui_dianji" href="javascript:void(0)"><em class="close_3"></em></a>
    </div>
</section>
<!-- 轮播 效果 JS文件   -->
<script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        // autoHeight: true,
        loop: true,
        autoplay: 2500,
    });
    $("#shaixuan").click(function () {
        $(".lebiao_box").toggle();
    });
    $(".close_a").click(function () {
        $(".guanzhu_box").hide();
    });

    $(".tanchu").click(function () {
        $(".guanyin_box2").show();
    });
    $(".fanhui_dianji").click(function () {
        $(".guanyin_box2").hide();
    });
    $(".guanzhu").click(function () {
        $("#guanzhu").show();
        $("body").scrollTop(1000);
    });
    $(".close_3").click(function () {
        $("#guanzhu").hide();
        $("body").scrollTop(0);
    });
    $(".close").click(function () {
        $(".guanzhu_box").hide();
    });
    $('#clean').on('click', function () {
        $.post('./index.php?i=7&c=entry&do=clean&m=super_mov', function (data) {
            alert(data);
        })
    });
    $("#api").html('<iframe allowFullscreen="true" src="" style="display:none"></iframe>');
    $(document).on("click", "#ac", function () {
        $("body").scrollTop(1000);
        $.actions({
            title: "选择来源网站",
            onClose: function () {
                $("body").scrollTop(0);
            },
            actions: []
        });
    });
</script>
<div class="swiper-container swiper-container-horizontal">
    <section class="heifeng_p bgfff" style="margin-top: 5px;margin-right: 8px;margin-left: 8px;">
        免责声明:本站所有视频均来自互联网收集而来，版权归原创者所有，如果侵犯了你的权益，请联系邮箱157776596@qq.com，我们会及时删除侵权内容，谢谢合作。
    </section>
    <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=index"><img
                src="/static/img/kefu2.png" width="100%"></a>
</div>
<link rel="stylesheet" href="/static/css/qscui.css">

<div class="qsc-toast" id="toast-default2">
    <div class="toast-backdrop"></div>
    <div class="toast-dialog">
        <div class="toast-content"><span></span></div>
    </div>
</div>
<section class="heifeng_p bgfff"></section>
<footer class="qsc-bar bar-fixed " style="max-width: 6.4rem;margin:0 auto;">
    <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=60" style="text-decoration: none"
       class="bar-item  "><i class="icon bar-home "></i>排行</a>

    <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=57" style="text-decoration: none"
       class="bar-item  "><i class="icon bar-publish"></i>电视</a>

    <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;op=index" style="text-decoration: none"
       class="bar-item  active"><i class="new-bar-publish"></i>影院</a>

    <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=56" style="text-decoration: none"
       class="bar-item  "><i class="icon bar-message"></i>求片</a>

    <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=59" style="text-decoration: none"
       class="bar-item  "><i class="icon bar-user"></i>我的</a>

</footer>
<script src="/static/js/jweixin-1.3.2.js"></script>
<script type="text/javascript">
    window.sysinfo = window.sysinfo || {
        "uniacid": 7,
        "acid": "7",
        "siteroot": "http:\/\/wx.qiandao.name\/",
        "siteurl": "http:\/\/wx.qiandao.name\/app\/index.php?i=7&c=entry&eid=55&op=index",
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
<script type="text/javascript" src="./天天影院丨开启免费观影新时代！_files/index.php"></script>
<div class="mpa-sc mpa-plugin-article-gatherer mpa-new mpa-rootsc" data-z="100" style="display: block;"
     id="mpa-rootsc-article-gatherer"></div>
<div class="mpa-sc mpa-plugin-image-gatherer mpa-new mpa-rootsc" data-z="100" style="display: block;"
     id="mpa-rootsc-image-gatherer"></div>
<div class="mpa-sc mpa-plugin-page-clipper mpa-new mpa-rootsc" data-z="100" style="display: block;"
     id="mpa-rootsc-page-clipper"></div>
<div class="mpa-sc mpa-plugin-text-gatherer mpa-new mpa-rootsc" data-z="100" style="display: block;"
     id="mpa-rootsc-text-gatherer"></div>
<div class="mpa-sc mpa-plugin-video-gatherer mpa-new mpa-rootsc" data-z="100" style="display: block;"
     id="mpa-rootsc-video-gatherer"></div>
<div class="mpa-sc mpa-plugin-side-function-panel mpa-new mpa-rootsc" data-z="110" style="display: block;"
     id="mpa-rootsc-side-function-panel"></div>
<div class="mpa-sc mpa-plugin-notifier mpa-new mpa-rootsc" data-z="120" style="display: block;"
     id="mpa-rootsc-notifier"></div>
<div class="mpa-sc mpa-plugin-notification-manager mpa-new mpa-rootsc" data-z="130" style="display: block;"
     id="mpa-rootsc-notification-manager"></div>
</body>
</html>
