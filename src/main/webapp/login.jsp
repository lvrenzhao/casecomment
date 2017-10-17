<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录到双评工作平台</title>
    <!-- library list = blueimp;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=" />

    <link href="${ctx_assets}/css/login.css" rel="stylesheet">

</head>
<body style=" min-height: 600px; overflow: hidden;">
<div class="loginHeader">
    <div>
        <img src="${ctx_assets}/img/logo.png" style="width:40px;height: 40px;display:inline-block;margin-top: -5px;" /><span style="font-size: 19px;margin-left: 10px;display:inline-block;">安徽省法院案件质量网上双评工作平台</span>
        <a class="menuitem pull-right code-layout" href="${ctx}/files/360se9.1.0.356.exe" data-index="0"><i class="fa fa-download mr5"></i> 下载360安全浏览器</a>

        <%--<a class="menuitem pull-right code-layout" href="javascript:void(0)" data-index="0">--%>
            <%--<i class="fa fa-apple mr5"></i> 安卓客户端--%>
            <%--<div class="code-box">--%>
                <%--<img src="${ctx_assets}/img/code_az.png">--%>
                <%--<p><span style="color: green;">微信</span>扫一扫，立即安装!</p>--%>
            <%--</div>--%>
        <%--</a>--%>
        <%--<a class="menuitem pull-right code-layout" href="javascript:void(0)" data-index="0">--%>
            <%--<i class="fa fa-android mr5"></i> 苹果客户端--%>
            <%--<div class="code-box">--%>
                <%--<img src="${ctx_assets}/img/code_pg.png">--%>
                <%--<p><span style="color: green;">微信</span>扫一扫，立即安装!</p>--%>
            <%--</div>--%>
        <%--</a>--%>
    </div>
</div>
<div class="loginBody bm-desktop">

    <div class="cur_animation" style="width:1024px;margin-left:auto;margin-right:auto; height: 100%; position: relative;">
        <div class="animation_layout" style="top: 35%;">
            <div class="bm2_img">
                <img src="${ctx_assets}/img/bg_slogan.png" alt="">
            </div>
            <div class="bm2_01 bm2_txt">
                案件评查
                <br />常规评查，重点评查，专项评查，高效协同。
            </div>
            <div class="bm2_02 bm2_txt">
                三精评选
                <br />树立精品案列，激励办案人员。
            </div>
            <div class="bm2_03 bm2_txt">
                信息公开
                <br />信息推送，结果公示，更加透明化。
            </div>
            <div class="bm2_04 bm2_txt">
                统计分析
                <br />
                数据让执法，管理和服务更加优秀。
            </div>
            <div class="bm2_05 bm2_txt">
                通用权限<br />
                强大的通用权限管理，系统灵活可用。
            </div>
            <div class="bm2_06 bm2_txt">
                移动客户端
                <br />移动办公，支持苹果，安卓手机。
            </div>
            <div class="bm2_07 bm2_txt">
                工作流引擎
                <br />让协同办公轻而易举。
            </div>
        </div>
    </div>

    <div style="width:1024px; height: 100%; position: absolute; top: 0; left: 50%; margin-left: -512px; ">
        <div class="sitebar">
            <div class="signinpanel">
                <form id="loginform" method="post" action="${ctx}/checklogin.do">
                    <h4 class="no-margins" style="color: #fff;">登录到双评工作平台：</h4>
                    <span>&nbsp;</span>
                    <input id="username" name="username" type="text" class="form-control uname" placeholder="用户名" value="${username}" />
                    <input name="password" type="password" class="form-control pword m-b" placeholder="密码" />
                    <span style="display:inline-block;margin-top:10px;color: #e0e0e0;">${msg }</span>
                    <button class="btn btn-primary btn-block" style="background-color: #0071ce" type="submit" id="btn_submit">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="loginFooter">
    <div class="footer_msg">* 推荐使用<a href="${ctx}/files/360se9.1.0.356.exe" target="_blank" style="">360安全浏览器</a>极速模式</div>
</div>

<script>
    $(function () {
        $(".code-layout").hover(function(){
            $(this).find(".code-box").toggle();
        });
    });
</script>
</body>
</html>