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
    <script src="view_bypxid.js"></script>
</head>
<body>
<div id="left" class="bmbox_layout wb35 clearfix fl">
    <div class="bmbox_title">
        <h5>专家组分配</h5>
        <div class="bmbox_tool">
            <button id="btn_clear" class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-refresh"></i> 清空选择</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">
        <table id="table2" class="table table-striped"></table>
        <div id="pager2"></div>
    </div>
</div>
<div id="right" class="bmbox_layout wb65 clearfix fl">
    <div class="bmbox_title">
        <h5>案件列表</h5>
        <div class="bmbox_tool">
        </div>
    </div>
    <div class="bmbox_content  clearfix ">
        <div class="form_center clearfix" style="padding: 10px 0px;">

            <div class="form_item wb40 fl">
                <select class="form-control xselect" id="form_sel_gsfy">
                    <option value="">归属法院</option>
                </select>
            </div>

            <div class="form_item wb40 fl">
                <select class="form-control xselect" id="form_sel_xz">
                    <option value="">案件性质</option>
                </select>
            </div>

        </div>
        <table id="table1" class="table table-striped"></table>
        <div id="pager1"></div>
    </div>
</div>
</body>
</html>