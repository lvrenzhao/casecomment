<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=" />
    <script type="text/javascript" src="comment.js"></script>
</head>
<body>
<div class="bmbox_layout clearfix" style="height:380px;">
    <div class="bmbox_title">
        <h5>评分</h5>
        <div class="bmbox_tool">
        </div>
    </div>
    <div class="bmbox_content clearfix" >

    </div>
</div>
<div class="bmbox_layout clearfix" style="height:200px">
    <div class="bmbox_title">
        <h5>点评</h5>
        <div class="bmbox_tool">
            <button class="btn btn-primary btn-sm btn-smx" type="button" id="btn_submit" style="display: none;"><i class="fa fa-check"></i> 提交</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">
        <div class="form_item wb100 fl">
            <label>简要点评</label>
            <textarea class="form-control" style="height:120px" placeholder="请输入您的简要点评..."></textarea>
        </div>
        <div class="form_item wb33 fl">
            <label>点评人</label>
            <span></span>
        </div>
        <div class="form_item wb33 fl">
            <label>点评人部门</label>
            <span></span>
        </div>
        <div class="form_item wb33 fl">
            <label>点评时间</label>
            <span></span>
        </div>
    </div>
</div>
</body>
</html>