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
