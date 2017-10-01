<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=icheck;layer;summernote" />
    <script src="main.js"></script>
</head>
<body>

<div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
        <div class="bmbox_tool">
            <button id="btn_submit" style="display: none" class="btn btn-primary  btn-smx" type="button"><i class="fa fa-check"></i> 提交</button>
            <button id="btn_pass" style="display: none;" class="btn btn-primary btn-smx" type="button"><i class="fa fa-check"></i> 同意</button>
            <button id="btn_reject" style="display: none;" class="btn btn-danger btn-smx" type="button"><i class="fa fa-close"></i> 不同意</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">
        <div class="form_center clearfix" style="padding: 15px 0;">
            <div class="form_item wb100 fl">
                <label>三精评选公告标题</label>
                <input type="text" class="form-control" placeholder="请输入三精评选公告的标题"/>
            </div>
            <div class="form_item wb28 fl">
                <label>标题颜色</label>
                <div class="i-checkslayout">
                    <div class="radio i-checks">
                        <label class="default_radio">
                            <input type="radio" value="1" name="types" checked style="position: absolute; opacity: 0;"> <i></i> 黑色（普通）
                        </label>
                        <label>
                            <input type="radio" value="2" name="types" style="position: absolute; opacity: 0;"> <i></i> 红色（重要）
                        </label>
                    </div>
                </div>
            </div>
            <div class="form_item wb20 fl">
                <label>案例填报截止日期</label>
                <input type="text" class="form-control" placeholder=""/>
            </div>
            <div class="form_item wb50 fl">
                <label>三精评选类型</label>
                <div class="i-checkslayout">
                    <div class="radio i-checks">
                        <label class="default_radio">
                            <input type="radio" value="1" name="lx" checked style="position: absolute; opacity: 0;"> <i></i> 案件评选
                        </label>
                        <label>
                            <input type="radio" value="2" name="lx" style="position: absolute; opacity: 0;"> <i></i> 庭审影像评选
                        </label>
                        <label>
                            <input type="radio" value="2" name="lx" style="position: absolute; opacity: 0;"> <i></i> 裁判文书评选
                        </label>
                    </div>
                </div>
            </div>
            <div class="form_item wb100 fl">
                <label>短信提醒</label>
                <div class="input-group">
                    <input type="hidden" id="user_id" />
                    <input type="text" class="form-control" readonly id="user_name">
                    <span class="input-group-btn">
          <button type="button" id="selectuser" class="btn btn-primary">添加通知人员</button>
        </span>
                </div>
            </div>
            <div class="form_item wb100 fl">
                <label>公告内容</label>
                <div class="summernote" style="">

                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>