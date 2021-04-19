<script>
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
                       href="/"
                       style="background: none;color: #000">影片需要加载时间，请耐心等待，播放失败请切换来源</a>
                </div>
                <div id="scroll_end">
                    <a class="guanzhu"
                       href="/"
                       style="background: none;color: #000">影片需要加载时间，请耐心等待，播放失败请切换来源</a>
                </div>
            </div>
            <script type="text/javascript">ScrollImgLeft();</script>
        </div>

    </div>
</section>
