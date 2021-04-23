{{template "layout/header.tpl"}}
<section class="touxiang_box">
    <a href="/">
        <div class="touxiang">
            <img src="{{.UserInfo.HeadImgURL}}">
        </div>
        <p class="mingcheng_y8">{{.UserInfo.Nickname}}</p>
    </a>
    <div class="jilu_y8">
        <ul class="clearfix">
            <li><a href="/"><em class="guankan_icon"></em><span>观看记录</span></a></li>
            <li><a href="/"><em class="xufei_icon"></em><span>会员开通</span></a></li>
            <li><a href="/"><em class="dingdan_icon"></em><span>订单管理</span></a></li>
        </ul>
    </div>
</section>

<section class="wode_box bgfff">
    <ul>
        <li>
            <div class="huiyuan jifen">
                <p class="clearfix">我的积分：<span class="fr">0.00<a href=""><em class="zhuandao2"></em></a></span></p>
            </div>
        </li>
        <li>
            <div class="huiyuan jifen"
                 style="background: url(http://wx.qiandao.name/addons/super_mov/style/images/shoucang.png) no-repeat 0.33rem center;background-size: 0.31rem 0.29rem">
                <a href="/"><p class="clearfix">我的收藏：<span class="fr"><em class="zhuandao2"></em></span></p></a>
            </div>
        </li>
        <li>
            <div class="huiyuan jifen"
                 style="background: url(http://wx.qiandao.name/addons/super_mov/style/images/bangding.png) no-repeat 0.33rem center;background-size: 0.31rem 0.29rem">
                <a href="/"><p class="clearfix">绑定手机号：<span class="fr"><em class="zhuandao2"></em></span></p></a>
            </div>
        </li>
        <!--  -->
    </ul>
</section>

{{template "layout/copyright.tpl"}}
{{template "layout/footer.tpl"}}
