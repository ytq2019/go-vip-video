<div class="swiper-container">
    <div class="swiper-wrapper">
        {{range .Swiper}}
            <div class="swiper-slide">
                <a href="/detail{{.Href}}">
                    <img src="{{.Img}}" style="height:178px;width:100%">
                </a>
            </div>
        {{end}}

    </div>
</div>
<script>
    var mySwiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        // autoHeight: true,
        loop: true,
        autoplay: 2500,
    })
</script>
