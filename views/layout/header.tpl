<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="referrer" content="no-referrer">
    <link rel="stylesheet" href="/static/css/weuix.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="/static/css/li.css">
    <link rel="stylesheet" href="/static/css/swiper.min.css">
    <link rel="stylesheet" href="/static/css/weui.css">
    <link rel="stylesheet" href="/static/css/qscui.css">
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
        var viewHeight = document.documentElement.clientHeight + 300;

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
</head>

<body style="margin:0 auto">

