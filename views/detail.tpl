{{template "layout/header.tpl"}}
<body mpa-version="7.16.9" mpa-extension-id="ibefaeehajgcpooopoegkifhgecigeeg">
<div id="allmap"></div>
{{template "top.tpl"}}

<section class="shiping_box">
    <iframe allowFullscreen="true" src="https://z1.m1907.cn/?jx={{.Link}}" width="100%" height="210px" allowTransparency="true" frameborder="0" scrolling="no"></iframe>
</section>

<style type="text/css">
    #gongao {
        width: 100%;
        overflow: hidden;
    }

    #gongao #scroll_begin, #gongao #scroll_end {
        display: inline
    }
</style>

{{template "gonggao.tpl"}}
<section class="gonggao_box clearfix">
    <div class="gonggao_box2 clearfix">
        <style type="text/css">
            .m3 {
                margin-right: 3px
            }
        </style>
        <span class="gonggao fl">来源</span>
        <div class="weui-flex">

            {{range .Sites}}
                <div class="weui-flex__item m3">
                    <a href="/detail/{{$.Detail.Cat}}/{{$.Detail.ID}}?site={{.Code}}">{{.Name}}</a>
                </div>
            {{end}}
        </div>
    </div>
</section>
<section class="gonggao_box clearfix">
    <div class="gonggao_box2 clearfix">
        <style type="text/css">
            .m3 {
                margin-right: 3px
            }
        </style>
        <span class="gonggao fl">线路</span>
        <div class="weui-flex">
            <div class="weui-flex__item m3"><a
                        href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;mov=detail&amp;op=dianying&amp;url=%2Fm%2FgafiYxH4S0P7TB.html&amp;api=1">线路1</a>
            </div>
            <div class="weui-flex__item m3"><a
                        href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;mov=detail&amp;op=dianying&amp;url=%2Fm%2FgafiYxH4S0P7TB.html&amp;api=2">线路2</a>
            </div>

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
            <p> {{.Detail.Year}}  {{.Detail.Area}}   {{.Detail.Director}}  </p>
            <p> 播放量：11 <span><a href="javascript:;" id="sd3">评论：0条</a></span></p>

        </div>

        <div class="fr lianjie_box_y9"><a href="javascript:;"
                                          onclick="$(&#39;.weui-share&#39;).show().addClass(&#39;fadeIn&#39;);"><em
                        class="icon icon-3" style="margin-right: 10px"></em></a> <a href="javascript:;"
                                                                                    id="shoucang"><em
                        class="icon icon-48" id="shoucangicon" style="font-size: 19px;"></em></a></div>
    </div>
</section>
<div class="weui-share" onclick="$(this).fadeOut();$(this).removeClass(&#39;fadeOut&#39;)">
    <div class="weui-share-box">
        点击右上角发给朋友<i></i>
    </div>
</div>
<span id="title" class="title"></span>

<section class="jishi_box_y9 p_r">
    <div class="jishi_box2">
        <ul class="clearfix">
            {{range .Links}}
            <li class="on">
                <a href="/detail/{{$.Detail.Cat}}/{{$.Detail.ID}}?site={{$.Site}}&num={{.Num}}" style="position: relative;">{{.Num}}</a>
            </li>
            {{end}}
        </ul>
    </div>
</section>
<section class="jianjie_y9 bgfff clearfix">
    <p class="jianjie_y9_p all">{{.Detail.Desc}}</p>
    <!--<a class="zhankai fr change down" href="javascript:;"><em class="zhankai_icon"></em>展开详情</a>-->
</section>

<section class="banner clearfix">
    <!--   Swiper -->
    <div class="swiper-container swiper-container-horizontal swiper-container-android">
        <div class="swiper-wrapper">
        </div>
        <!--    Add Pagination -->
        <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span
                    class="swiper-pagination-bullet swiper-pagination-bullet-active"></span></div>
    </div>
</section>

<div class="swiper-container swiper-container-horizontal">
    <section class="heifeng_p bgfff" style="margin-top: 5px;margin-right: 8px;margin-left: 8px;">
        免责声明:本站所有视频均来自互联网收集而来，版权归原创者所有，如果侵犯了你的权益，请联系邮箱157776596@qq.com，我们会及时删除侵权内容，谢谢合作。
    </section>
    <a href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;mov=detail&amp;op=dianying&amp;d_id=%2Fm%2FgafiYxH4S0P7TB.html&amp;url=%2Fm%2FgafiYxH4S0P7TB.html"><img
                src="./沉默的证人_files/kefu2.png" width="100%"></a>
</div>
{{template "layout/footer.tpl"}}
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
</div><!-- 轮播 效果 JS文件   -->
<section class="guanyin_box guanyin_box2">
    <div class="meiyou_box">
        <p class="zhanshi_p">最近十条观影记录</p>

        <div class="jilu_box">
            <ul class="clearfix">
                <li class="clearfix"><span class="fr">

      <a class="jishu_guankan"
         href="http://wx.qiandao.name/app/index.php?i=7&amp;c=entry&amp;eid=55&amp;mov=detail&amp;op=dianying&amp;d_id=%2Fm%2FgqPrYxH4Rnr4UR.html&amp;url=%2Fm%2FgqPrYxH4Rnr4UR.html">继续观看<em
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
<section class="guanyin_box index_guanzhu" id="guanzhu" style="display: none">
    <div class="meiyou_box">
        <p class="zhanshi_p">长按二维码识别</p>
        <div class="dianying_box dianying_box2 clearfix" style="padding: 10%">
            <img src="./沉默的证人_files/Y020Bz13IBp35AK0YhkJ5ka5P55B2b.jpg" width="100%">
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

</script>
<style type="text/css">
    #timer {
        background: rgba(0, 0, 0, 0.59);
        padding: 5px;
        text-align: center;
        width: 30px;
        position: absolute;
        top: 22%;
        right: 10px;
        color: #fff;
        font-size: 16px;
        border-radius: 50%;
        height: 30px;
        line-height: 30px
    }
</style>
<script>
    $(".tiyan").click(function () {
        $(".dh").hide();
        $(".index_ct").show();
    });
    $(".change").click(function () {
        if ($(this).hasClass("down")) {
            $(this).removeClass("down").addClass("up");
            $(".all").show();
            $(".part").hide();
            $(".up").text('收起详情');
        } else {
            $(this).removeClass("up").addClass("down");
            $(".part").show();
            $(".all").hide();
            $(".down").text('展开详情');
        }
    });
    $("#shang").click(function () {
        var dashang = $("#dashang").html();
        $.modal({
            title: '',
            text: dashang,
            buttons: [
                {
                    text: "打赏", onClick: function () {
                        var shang_fee = $(".shuru:eq(1)").val();
                        if (!shang_fee) {
                            var shang_fee = $(".shang_fee:eq(1)").text();
                        }
                        var url = "http://wx.qiandao.name/app/index.php?i=7&c=entry&eid=59&op=pay&type=shang&fee=" + shang_fee;
                        window.location.href = url;
                    }
                },
                // { text: "微信支付", onClick: function(){ $.alert("你选择了微信支付"); } },
                {text: "取消", className: "default"},
            ]
        });
    });
    $("#shoucang").click(function () {
        $.get("http://wx.qiandao.name/app/index.php?i=7&c=entry&eid=55&mov=detail&type=shoucang&video_id=http%3A%2F%2Fwx.qiandao.name%2Fapp%2Findex.php%3Fi%3D7%26c%3Dentry%26eid%3D55%26mov%3Ddetail%26op%3Ddianying%26d_id%3D%252Fm%252FgafiYxH4S0P7TB.html%26url%3D%252Fm%252FgafiYxH4S0P7TB.html&title=%E6%B2%89%E9%BB%98%E7%9A%84%E8%AF%81%E4%BA%BA", function (data, status) {
            if (data.indexOf("取消") != -1) {
                $("#shoucangicon").css('color', '');
            } else {
                $("#shoucangicon").css('color', '#f31919');
            }
            $.toast(data);

        });
    });
    $(document).on("click", "#sd3", function () {
        var message = $("#textarea").val();
        $.modal({
            title: "请输入评论内容",
            text: '<textarea id="textarea" class="weui_textarea" placeholder="点击这里输入评论内容" rows="3" style="background:#fafafc;height:100px"></textarea>',
            buttons: [
                {
                    text: "提交", onClick: function () {
                        if (!$("#textarea").val()) {
                            $.toast("请输入您的评论内容", "forbidden");
                            return false;
                        }

                        $.post("http://wx.qiandao.name/app/index.php?i=7&c=entry&eid=55&mov=detail&type=comment&video_id=%2Fm%2FgafiYxH4S0P7TB.html&title=%E6%B2%89%E9%BB%98%E7%9A%84%E8%AF%81%E4%BA%BA&content=" + $("#textarea").val(), function (data, status) {
                            $.toast("留言成功");
                            var data = JSON.parse(data);

                        });
                    }
                },
                {text: "取消", className: "default"},
            ]
        });
    });

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

    $("#baocuo").click(function () {
        $.confirm("部分影片苹果手机播放失败,请您更换安卓手机重试,恶意报错会被拉黑,您确定该片有问题并通知管理员吗?", "提示", function () {

            $.get("http://wx.qiandao.name/app/index.php?i=7&c=entry&eid=55&mov=detail&type=baocuo&link=http%3A%2F%2Fwww.fun.tv%2Fvplay%2Fg-335679.v-1472783%2F&agent=Mozilla%2F5.0+%28iPhone%3B+CPU+iPhone+OS+13_2_3+like+Mac+OS+X%29+AppleWebKit%2F605.1.15+%28KHTML%2C+like+Gecko%29+Version%2F13.0.3+Mobile%2F15E148+Safari%2F604.1&title=%E6%B2%89%E9%BB%98%E7%9A%84%E8%AF%81%E4%BA%BA", function (data, status) {
                $.toast(data);
                $("#baocuo").hide();
            })
        }, function () {
            //取消操作
        });
    });


</script>
<script>;</script>
<script type="text/javascript" src="./沉默的证人_files/index.php"></script>

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
