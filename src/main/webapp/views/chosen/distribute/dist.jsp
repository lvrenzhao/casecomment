<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=jqgrid;layer;chosen" />
    <script src="dist.js"></script>
    <style>
        .chosen-container{width:100% !important;}
    </style>
</head>
<body style="overflow: hidden">
<div class="bmbox_layout  clearfix">
    <div class="bmbox_title">
        <h5></h5>
        <div class="bmbox_tool">
            <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-check"></i> 提交</button>
        </div>
    </div>
    <div class="bmbox_content clearfix pd10">
        <div class="wb50 fullbox fl">
            <div class="bmbox_layout clearfix">
                <div class="bmbox_title">
                    <h5>待分配案件</h5>
                    <div class="bmbox_tool">
                    </div>
                </div>
                <div class="bmbox_content clearfix">
                    <%--<div class="alert alert-warning" role="alert">带有 <i class="fa fa-warning"></i> 图表的案件则表示系统检测到有资料缺失（点击案号查看卷宗），请联系案件负责人务必在评查前通过【案件管理系统】补齐资料以免影响评查分数。</div>--%>
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

                        <div class="form_item wb20 fl" style="text-align: right">
                            <button class="btn btn-white" type="button" id="btn_chooseTo"><i class="fa fa-long-arrow-right"></i> 分配</button>
                        </div>

                    </div>
                    <table id="table2" class="table table-striped"></table>
                    <div id="pager2"></div>
                </div>
            </div>
        </div>
        <div class="bmboxexchange wb5 fullbox fl" style="text-align: center;padding-top:22%">
            <i class="iexchange fa fa-exchange" style="font-size: 20px;color: #336699;"></i>
        </div>
        <div class="wb45 fullbox fl">
            <div class="bmbox_layout clearfix">
                <div class="bmbox_title">
                    <h5>专家组</h5>
                    <div class="bmbox_tool">
                        <button class="btn btn-white btn-sm btn-smx pullright" id="btn_newGroup" type="button"><i class="fa fa-plus"></i> 新增组</button>
                    </div>
                </div>
                <div class="bmbox_content clearfix">
                    <table id="table3" class="table table-striped"></table>
                    <div id="pager3"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="div_chooseTo" style="display: none;padding-top: 20px;">
    <div class="form_item wb75 fl">
        <label>选则专家组</label>
        <select class="form-control" id="from_sel_groups">
            <option value="">--请选择专家组--</option>
        </select>
    </div>
    <div class="form_item wb25 fl" style="text-align: right;padding-top: 30px;">
        <button class="btn btn-primary" type="button" id="btn_chosenCaseToGroup">确定</button>
    </div>
</div>
<div id="div_newGroup" style="display: none;">
    <input type="hidden" id="form_ipt_groupid" />
    <input type="hidden" id="form_hid_pcajs" />
    <input type="hidden" id="form_hid_zb" />
    <div class="form_item wb100 fl">
        <label>组名<span>*</span></label>
        <input type="text" class="form-control" placeholder="" id="from_ipt_groupname"/>
    </div>

    <div class="form_item wb100 fl">
        <label>组长<span>*</span></label>
        <select data-placeholder=""  class="chosen-select form-control "  id="form_sel_teamleader" style="width: 200px;">
            <option value="">--选择组长--</option>
        </select>
    </div>

    <div class="form_item wb100 fl">
        <label>组员</label>
        <select data-placeholder="--选择组员--" class="chosen-select form-control " retype="multiselect" multiple id="form_sel_teammate">
        </select>
    </div>
    <div class="form_item wb100 fl" style="text-align: center;padding-top: 30px;">
        <button class="btn btn-primary btn-sm" type="button" id="btn_savegroup">确定</button>
    </div>
</div>
</body>
</html>