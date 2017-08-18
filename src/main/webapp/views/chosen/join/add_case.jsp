<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=" />
    <script src="add_case.js"></script>
</head>
<body>
<div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
        <h5>填报三精案列 ( * 为必填项 )</h5>
        <div class="bmbox_tool">
            <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-check"></i> 提交</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">
        <div class="form_center clearfix" style="padding: 15px 0;">
            <div class="form_item wb50 fl">
                <label>案号<span>*</span></label>
                <input type="text" class="form-control" placeholder="请输入案号"/>
            </div>
            <div class="form_item wb100 fl">
                <label>推荐理由<span>*</span></label>
                <textarea style="height:200px;" placeholder="请输入推荐理由" class="form-control"></textarea>
            </div>
        </div>
    </div>
</div>
</body>
</html>