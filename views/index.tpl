{{template "layout/header.tpl" .}}
<body style="margin:0 auto" mpa-version="7.16.9" mpa-extension-id="ibefaeehajgcpooopoegkifhgecigeeg">

{{template "top.tpl"}}
{{template "layout/swiper.tpl"}}
{{template "gonggao.tpl"}}
{{template "layout/bar.tpl" .}}

<section class="tuijian_box">
    <h2 class="clearfix tuijian bgfff"><em class="dianyin"></em>电影推荐
        <a class="fr more" href="/list?cat=1">更多<em
                    class="more_icon"></em></a>

    </h2>
    <div class="dianying_box  bgfff clearfix">
        <ul class="clearfix">
            {{range .dianying}}
            <li>
                <a href="/detail{{.Href}}"><img
                            lazyload="true"
                            data-original="{{.Cover}}"></a>
                <a href="/detail{{.Href}}"><span
                            class="biaoti">{{.Title}}</span></a></li>
            {{end}}

        </ul>
    </div>

</section>

<section class="tuijian_box">
    <h2 class="clearfix tuijian bgfff"><em class="dianshiju"></em>电视剧推荐
        <a class="fr more" href="/list?cat=2">更多<em
                    class="more_icon"></em></a>
    </h2>
    <div class="dianying_box  bgfff clearfix">
        <ul class="clearfix">


            {{range .dianshi}}
                <li>
                    <a href="/detail{{.Href}}"><img
                                lazyload="true"
                                data-original="{{.Cover}}"></a>
                    <a href="/detail{{.Href}}"><span
                                class="biaoti">{{.Title}}</span></a></li>
            {{end}}

        </ul>
    </div>

</section>

<section class="tuijian_box">
    <h2 class="clearfix tuijian bgfff"><em class="zongyi"></em>综艺推荐
        <a class="fr more" href="/list?cat=3">更多<em
                    class="more_icon"></em></a>
    </h2>
    <div class="dianying_box clearfix bgfff">
        <ul class="clearfix">

            {{range .zongyi}}
                <li>
                    <a href="/detail{{.Href}}"><img
                                lazyload="true"
                                data-original="{{.Cover}}"></a>
                    <a href="/detail{{.Href}}"><span
                                class="biaoti">{{.Title}}</span></a></li>
            {{end}}


        </ul>
    </div>

</section>
<section class="tuijian_box">
    <h2 class="clearfix tuijian bgfff"><em class="dongman"></em>动漫推荐
        <a class="fr more" href="/list?cat=4">更多<em
                    class="more_icon"></em></a>
    </h2>
    <div class="dianying_box clearfix bgfff">
        <ul class="clearfix">

            {{range .dongman}}
                <li>
                    <a href="/detail{{.Href}}"><img
                                lazyload="true"
                                data-original="{{.Cover}}"></a>
                    <a href="/detail{{.Href}}"><span
                                class="biaoti">{{.Title}}</span></a></li>
            {{end}}

        </ul>
    </div>

</section>

{{template "layout/copyright.tpl"}}
{{template "layout/footer.tpl" .}}


</body>
</html>
