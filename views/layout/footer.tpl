<footer class="qsc-bar bar-fixed " style="max-width: 6.4rem;margin:0 auto;">
    <a href="/rank" style="text-decoration: none"
       class="bar-item  "><i class="icon bar-home "></i>排行</a>

    <a href="/" style="text-decoration: none"
       class="bar-item  "><i class="icon bar-publish"></i>电视</a>

    <a href="/" style="text-decoration: none"
       class="bar-item  active"><i class="new-bar-publish"></i>影院</a>

    <a href="/" style="text-decoration: none"
       class="bar-item  "><i class="icon bar-message"></i>求片</a>

    <a href="/user" style="text-decoration: none"
       class="bar-item  "><i class="icon bar-user"></i>我的</a>

</footer>

<script>
    var mySwiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        // autoHeight: true,
        loop: true,
        autoplay: 2500,
    })
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
</script>

</body>
</html>
