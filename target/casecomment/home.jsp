<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=jqgrid;layer" />
    <link href="${ctx_assets}/css/home.css" rel="stylesheet" />
    <script src="${ctx_assets}/js/home.js"></script>
</head>
<body style="overflow: hidden" class="">
<div class="form_item wb50 fl fullbox no-margins no-padding">
    <div class="form_item wb100 no-margins" style="height: 175px; padding: 10px !important; ">
        <div class="bmbox_layout clearfix" style="overflow: hidden">
            <div class="bmbox_title">
                <h5>待办任务</h5>
                <div class="bmbox_tool">
                </div>
            </div>
            <div class="bmbox_content fullbox clearfix" style="padding-bottom: 60px">
                <div class="form_item wb50 fl">
                    <div class="ibox m10" id="countbox1">
                        <div class="ibox-content bg1">
                            <h5 style="text-align: center">待评查的案件数</h5>
                            <h1 class="no-margins"><a style="color:#fff;" href="javascript:;" onclick="top.$('#menu_badge_ajpc_pc').trigger('click')"><span id="label_count_1">5</span></a></h1>
                        </div>
                    </div>
                </div>
                <div class="form_item wb50 fl">
                    <div class="ibox m10" id="countbox2">
                        <div class="ibox-content bg1"> <h5 style="text-align: center">待评选三精案件数</h5>
                            <h1 class="no-margins"><a style="color:#fff;" href="javascript:;" onclick="top.$('#menu_badge_sjpx_px').trigger('click')"><span id="label_count_2">6</span></a></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form_item wb100 no-margins " style="height: 100%;padding: 0px 10px 185px 10px !important; ">
        <div class="bmbox_layout clearfix" style="overflow: hidden">
            <div class="bmbox_title">
                <h5>未读的系统信息</h5>
                <div class="bmbox_tool">
                    <a onclick="top.$('#menu_badge_xxgk_dwck').trigger('click')" class="collapse-link"><i class="fa fa-ellipsis-h"> 更多 </i> </a>
                </div>
            </div>
            <div class="bmbox_content fullbox clearfix" style="padding-bottom: 60px">
                <table id="table1"></table>
                <div id="pager1"></div>
            </div>
        </div>
    </div>
</div>
<div class="form_item wb50 fl fullbox no-margins no-padding">
    <div class="form_item wb100 no-margins " style="padding:10px 10px 10px 0px;height: 50%;">
        <div class="bmbox_layout clearfix" style="overflow: hidden">
            <div class="bmbox_title">
                <h5>未读的案件评查公告</h5>
                <div class="bmbox_tool">
                    <a class="collapse-link" onclick="top.$('#menu_badge_ajpc_gg').trigger('click')" ><i class="fa fa-ellipsis-h"> 更多 </i> </a>
                </div>
            </div>
            <div class="bmbox_content fullbox clearfix" style="padding-bottom: 60px">
                <table id="table2"></table>
                <div id="pager2"></div>
            </div>
        </div>
    </div>
    <div class="form_item wb100 no-margins" style="padding:0px 10px 10px 0px;height: 50%;">
        <div class="bmbox_layout clearfix" style="overflow: hidden">
            <div class="bmbox_title">
                <h5>未读的三精评选公告</h5>
                <div class="bmbox_tool">
                    <a class="collapse-link" onclick="top.$('#menu_badge_sjpx_gg').trigger('click')" ><i class="fa fa-ellipsis-h"> 更多 </i> </a>
                </div>
            </div>
            <div class="bmbox_content fullbox clearfix" style="padding-bottom: 60px">
                <table id="table3"></table>
                <div id="pager3"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>