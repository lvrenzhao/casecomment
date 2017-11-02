<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=layer" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/thirdparty/webuploader/webuploader.css">
    <script type="text/javascript" src="${ctx}/assets/thirdparty/webuploader/webuploader.nolog.js"></script>
    <script src="add_case.js"></script>
</head>
<body>
<div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
        <h5>填报三精案列 ( * 为必填项 )</h5>
        <div class="bmbox_tool">
            <button id="btn_submit" disabled class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-check"></i> 提交</button>
        </div>
    </div>
    <div class="bmbox_content clearfix " style="padding: 10px;">
        <div class="bmbox_layout clearfix" style="width:60%;float: left;margin-top: 40px;border: none !important;">
            <div class="bmbox_title">
                <h5>填报案件</h5>
            </div>
            <div class="bmbox_content clearfix">
                <div class="form_center clearfix" style="padding: 15px 0;">
                <div class="form_item wb100 fl">
                <label>案号<span>* </span></label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button type="button" id="btn_nf" class="btn btn-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">(2016)</button>
                            <ul class="dropdown-menu">
                                <li><a href="#">(2016)</a></li>
                                <li><a href="#">(2017)</a></li>
                                <li><a href="#">(2018)</a></li>
                                <li><a href="#">(2019)</a></li>
                                <li><a href="#">(2020)</a></li>
                            </ul>
                        </div><!-- /btn-group -->
                        <input id="form_inp_ah" type="text" placeholder="案件管理系统中的标准案号（年份不用再次输入）" class="form-control" />
                    </div>
                <%--<input id="form_inp_ah" type="text" class="form-control" placeholder="请输入案号"/>--%>
                </div>
                <div class="form_item wb100 fl">
                <label>推荐理由<span>*</span></label>
                <textarea id="form_inp_tjly" style="height:150px;" placeholder="请输入推荐理由" class="form-control"></textarea>
                </div>
                </div>
            </div>
        </div>
        <div class="bmbox_layout clearfix" style="width:38%;float: right;margin-top: 40px;border: none !important;">
            <div class="bmbox_title">
                <h5>附件上传<span style="color:darkred">&nbsp;&nbsp;&nbsp;系统仅支持上传PDF格式的文件</span></h5>
            </div>
            <div class="bmbox_content clearfix" style="padding: 10px;">
                <div id="uploader" class="wu-example">
                    <!--用来存放文件信息-->
                    <div id="thelist" class="uploader-list"></div>
                    <div class="btns">
                        <div id="picker">选择文件</div>
                        <%--<button id="ctlBtn" class="btn btn-primary">开始上传</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>