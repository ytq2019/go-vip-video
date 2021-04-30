{{template "layout/header.tpl"}}
{{template "top.tpl"}}
<script type="text/javascript">
    $('#text').keyup(function () {
        var keywords = $(this).val();
        if (keywords == '') {
            $('#word').hide();
            return
        }
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
            {{if eq .Rank "rankhot"}}
                <a class="on" href="/list?cat={{.Cat}}&rank=rankhot">最近热映</a>
            {{else}}
                <a href="/list?cat={{.Cat}}&rank=rankhot">最近热映</a>
            {{end}}
            {{if eq .Rank "rankpoint"}}
                <a class="on" href="/list?cat={{.Cat}}&rank=rankpoint">最受好评</a>
            {{else}}
                <a href="/list?cat={{.Cat}}&rank=rankpoint">最受好评</a>
            {{end}}

        </div>
        <div class="fr shaixuan_2">
            <a href="javascript:;" id="shaixuan">条件筛选 <em class="shaixuan_icon">
                    <img src="/static/img/icon_y4_03.jpg"></em>
            </a>
        </div>

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
                    url: '/listData?cat={{.Cat}}&rank={{.Rank}}',
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
                    url: '/listData?cat={{.Cat}}&rank={{.Rank}}',
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
{{template "layout/copyright.tpl"}}
{{template "layout/footer.tpl"}}
