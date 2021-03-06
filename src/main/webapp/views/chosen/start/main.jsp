<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=icheck;layer;summernote;laydate" />
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
                <label>三精评选公告标题<span>*</span></label>
                <input type="text" id="form_inp_bt" class="form-control" placeholder="请输入三精评选公告的标题"/>
            </div>
            <div class="form_item wb28 fl">
                <label>标题颜色<span>*</span></label>
                <div class="i-checkslayout">
                    <div class="radio i-checks">
                        <label class="default_radio">
                            <input id="btys1" type="radio" value="1" name="types" checked style="position: absolute; opacity: 0;"> <i></i> 黑色（普通）
                        </label>
                        <label>
                            <input id="btys2" type="radio" value="2" name="types" style="position: absolute; opacity: 0;"> <i></i> 红色（重要）
                        </label>
                    </div>
                </div>
            </div>
            <div class="form_item wb15 fl">
                <label>案例填报截止日期<span>*</span></label>
                <input id="form_inp_jzsj" type="text" class="form-control" placeholder="" onclick="laydate({istime: true,format: 'YYYY/MM/DD'})"/>
            </div>
            <div class="form_item wb37 fl">
                <label>三精评选类型<span>*</span></label>
                <div class="i-checkslayout">
                    <div class="radio i-checks">
                        <label class="default_radio">
                            <input id="type1" type="radio" value="1" name="lx" checked style="position: absolute; opacity: 0;"> <i></i> 案件评选
                        </label>
                        <label>
                            <input id="type2" type="radio" value="2" name="lx" style="position: absolute; opacity: 0;"> <i></i> 庭审影像评选
                        </label>
                        <label>
                            <input id="type3" type="radio" value="2" name="lx" style="position: absolute; opacity: 0;"> <i></i> 裁判文书评选
                        </label>
                    </div>
                </div>
            </div>
            <div class="form_item wb20 fl">
                <label>选择评分表<span>*</span>
                    <a id="viewTable" style="display: none;">查看</a> </label>
                <select class="form-control" id="form_sel_pfb" style="width: 85%;float: left;">
                    <option value="">--请选择--</option>
                </select>
                <a href="javascript:;" id="a_refresh_pfb" style="display: block;float: left;padding-top:10px;color:#369 !important;">&nbsp;<span class="fa fa-refresh"></span></a>
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
                <label>公告内容<span>*</span></label>
                <div class="summernote bmrequire" id="xxnr" name="xxnr" style="">

                </div>

            </div>
        </div>
    </div>
</div>

<div id="div_reject" style="display: none;">
    <div class="form_item wb100 fl">
        <label>&nbsp;</label>
        <textarea id="form_inp_shyj" class="form-control" placeholder="请输入审核意见" style="height: 100px;"></textarea>
    </div>
    <div class="form_item wb100 fl" style="text-align: center;padding-top: 10px;">
        <button id="btn_reject_confirm" class="btn btn-primary" type="button" >确定</button>
    </div>
</div>
</body>
</html>