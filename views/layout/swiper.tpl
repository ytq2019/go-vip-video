
<section class="gonggao_box clearfix">
    <div class="swiper-container swiper-container-horizontal">
        <div class="swiper-wrapper" style="transform: translate3d(-804px, 0px, 0px); transition-duration: 0ms;">
            <div class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev"
                 data-swiper-slide-index="0" style="width: 402px;">
                <a href="/">
                    <img src="/static/img/St8Y04b0Qn3Qq457n77BB47p0q0B58.jpg" style="height:178px;width:100%">
                </a>
            </div>
            <div class="swiper-slide swiper-slide-duplicate-active swiper-slide-prev swiper-slide-duplicate-next"
                 data-swiper-slide-index="0" style="width: 402px;">
                <a href="/">
                    <img src="/static/img/St8Y04b0Qn3Qq457n77BB47p0q0B58.jpg" style="height:178px;width:100%">
                </a>
            </div>

            <div class="swiper-slide swiper-slide-duplicate swiper-slide-active swiper-slide-duplicate-prev"
                 data-swiper-slide-index="0" style="width: 402px;">
                <a href="/">
                    <img src="/static/img/St8Y04b0Qn3Qq457n77BB47p0q0B58.jpg" style="height:178px;width:100%">
                </a>
            </div>
        </div>
    </div>
</section>

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
