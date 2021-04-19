{{template "layout/header.tpl"}}
{{template "top.tpl"}}
{{template "gonggao.tpl"}}
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
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
{{template "layout/bar.tpl"}}
<style type="text/css">
    .search-item {
        background: #fff;
        margin-bottom: 6px;
    }

    .search-item .box {
        padding: 12px 10px 12px 10px;
        position: relative;
        display: -webkit-box;
        display: flex;
        overflow: hidden;
    }

    .search-item .img {
        position: relative;
        display: inline-block;
        width: 106px;
        height: 145px;
    }

    .search-item .img img {
        width: 100%;
        height: 100%;
    }

    .search-item-info {
        -webkit-box-flex: 1;
        flex: 1;
        overflow: hidden;
        margin-left: 10px;
        font-size: 14px;
        position: relative;
    }

    .search-item-info .btns {
        text-align: right;
        width: 100%;
        margin-top: 5px
    }

</style>

{{range .VData}}

<div class="search-item dyitem">
    <div class="box g-clear">
        <a href="./search_files/dy_e6c8f73666295503e43d103bc66a1a83.jpg" class="img">
            <img src="{{.Cover}}">
        </a>
        <div class="search-item-info">
            <h3>
                {{.Title}}
            </h3>
            <p> 更新{{.Total}}集</p>
            <p> {{.Area}}|{{.Year}}年</p>
            <p></p>
            <p></p>
            <p></p>
            <div class="btns">

                <a class="weui_btn weui_btn_primary weui_btn_inline"
                   href="/detail/{{.Cat}}/{{.ID}}">
                    立即播放
                </a>

            </div>

        </div>
    </div>
</div>
{{end}}

{{template "layout/copyright.tpl"}}
{{template "layout/footer.tpl"}}
<script src="./search_files/jweixin-1.3.2.js"></script>
<script type="text/javascript">
    window.sysinfo = window.sysinfo || {
        "uniacid": 7,
        "acid": "7",
        "siteroot": "http:\/\/wx.qiandao.name\/",
        "siteurl": "http:\/\/wx.qiandao.name\/app\/index.php?i=7&c=entry&eid=56",
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
            <img src="./search_files/Y020Bz13IBp35AK0YhkJ5ka5P55B2b.jpg" width="100%">
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
</body>
</html>
