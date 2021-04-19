{{template "layout/header.tpl"}}
{{template "top.tpl"}}

<section class="gonggao_box clearfix">
    <div class="swiper-container swiper-container-horizontal">
        <div class="swiper-wrapper">

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
{{template "gonggao.tpl"}}
{{template "layout/bar.tpl"}}
<section class="tuijian_box">
    <div class="bgfff shaixuan clearfix">
        <div class="fl leimu_zui">
            <a class="on"
               href="/">最近热映</a>


            <a href="/">最受好评</a>

        </div>
        <div class="fr shaixuan_2"><a href="javascript:;" id="shaixuan">条件筛选 <em class="shaixuan_icon"><img
                            src="/static/img/icon_y4_03.jpg"></em></a></div>

    </div>

    <div class="lebiao_box bgfff shaixuan" style="display: none">
        <div class="biao_li leibiao clearfix">
            <dt><h2 class="leixing"><a
                            href="/">全部</a>
                </h2></dt>
            <div style="width: 90%;float: right">
            </div>
        </div>


    </div>

    <div class="dianying_box bgfff clearfix content">
        <ul class="clearfix">

        </ul>
{{/*        <div class="dropload-down">*/}}
{{/*            <div class="dropload-refresh">↑上拉加载更多</div>*/}}
{{/*        </div>*/}}
    </div>
</section>
<script src="/static/js/dropload.min.js"></script>

<script>
    $(function () {
        var page = 0;
        $('.content').dropload({
            scrollArea: window,
            domUp: {
                domClass: 'dropload-up',
                domRefresh: '<div class="dropload-refresh">↓下拉刷新</div>',
                domUpdate: '<div class="dropload-update">↑释放更新</div>',
                domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>'
            },
            domDown: {
                domClass: 'dropload-down',
                domRefresh: '<div class="dropload-refresh">↑上拉加载更多</div>',
                domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
                domNoData: '<div class="dropload-noData">暂无数据</div>'
            },

            loadUpFn: function (me) {
                page++;
                // 拼接HTML
                $.ajax({
                    type: 'GET',
                    url: '/listData?cat={{.Cat}}',
                    data: {num: page},
                    dataType: 'html',
                    success: function (data) {
                        if (data) {
                            $(".content ul").html(data);
                            // 如果没有数据
                        } else {
                            // 锁定
                            me.lock();
                            // 无数据
                            me.noData();
                        }
                        // 为了测试，延迟1秒加载
                        setTimeout(function () {
                            // 插入数据到页面，放到最后面
                            // 每次数据插入，必须重置
                            me.resetload();
                        }, 10);
                    },
                    error: function (xhr, type) {
                        alert('加载失败，请重新刷新页面');
                        // 即使加载出错，也得重置
                        me.resetload();
                    }
                });
            },
            loadDownFn: function (me) {
                page++;
                // 拼接HTML
                $.ajax({
                    type: 'GET',
                    url: '/listData?cat={{.Cat}}',
                    data: {num: page},
                    dataType: 'html',
                    success: function (data) {
                        if (data) {
                            $(".content ul").append(data);
                            // 如果没有数据
                        } else {
                            // 锁定
                            me.lock();
                            // 无数据
                            me.noData();
                        }
                        // 为了测试，延迟1秒加载
                        setTimeout(function () {
                            // 插入数据到页面，放到最后面
                            // 每次数据插入，必须重置
                            me.resetload();
                        }, 1000);
                    },
                    error: function (xhr, type) {
                        alert('加载失败，请重新刷新页面');
                        // 即使加载出错，也得重置
                        me.resetload();
                    }
                });
            },
            threshold: 150
        });
    });
</script>
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
            <img src="./list_files/Y020Bz13IBp35AK0YhkJ5ka5P55B2b.jpg" width="100%">
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
{{template "layout/copyright.tpl"}}
{{template "layout/footer.tpl"}}
<script src="/static/js/jweixin-1.3.2.js"></script>
<script type="text/javascript">
    window.sysinfo = window.sysinfo || {
        "uniacid": 7,
        "acid": "7",
        "siteroot": "http:\/\/wx.qiandao.name\/",
        "siteurl": "http:\/\/wx.qiandao.name\/app\/index.php?i=7&c=entry&eid=55&op=dianying",
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
</body>
</html>
