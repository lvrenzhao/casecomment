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
    <script type="text/javascript" src="add_table.js"></script>
    <style>
        td{vertical-align: middle !important;}
    </style>
</head>
<body>
<div class="bmbox_layout clearfix" style="height:185px;">
    <div class="bmbox_title">
        <h5>评分表基本信息</h5>
        <div class="bmbox_tool">
            <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-save"></i> 保存</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">
        <div class="form_center  clearfix">
            <input type ="hidden" id="form_hid_tableid" />
            <div class="form_item wb100 fl">
                <label>模板名称<span>*</span></label>
                <input id="form_inp_mbmc" type="text" class="form-control" placeholder="请输入模板名称"/>
            </div>
            <div class="form_item wb100 fl">
                <label>模板描述</label>
                <input id="form_inp_mbms" type="text" class="form-control" placeholder="请输入模板描述"/>
            </div>
        </div>
    </div>
</div>
<div class="bmbox_layout  clearfix" style="height:400px;">
    <div class="bmbox_title">
        <h5>评分表模板设置</h5>
        <div class="bmbox_tool">
            <button id="btn_additem" class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-plsu"></i> 新增评分项</button>
        </div>
    </div>
    <div class="bmbox_content clearfix pd10">
        <table id="table_score" class="table table-bordered table-hover">
            <thead>
            <tr style="background: #e0e0e0">
                <th class="width50" style="text-align: center">序号</th>
                <th class="width120" style="text-align: center">操作</th>
                <th class="width200" style="text-align: center">评审内容</th>
                <th class="width400" style="text-align: center">评分标准</th>
                <th class="width50" style="text-align: center">分值</th>
            </tr>
            </thead>
            <tbody id="table_score_tbody">
                <tr id="remindRow">
                    <td colspan="5">暂无评分项，请点击 [新增评分项] 添加一些评分项.</td>
                </tr>
            </tbody>
            <tfoot>
            <tr style="background: #e0e0e0">
                <td>满分</td>
                <td colspan="3"></td>
                <td style="text-align: right" ><span id="label_mf"></span></td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>


<div style="display: none" id="item_form">
    <div class="bmbox_layout clearfix">
        <div class="bmbox_title">
            <h5>备注(* 为必填)</h5>
            <div class="bmbox_tool">
                <button class="btn btn-primary btn-sm btn-smx" type="button" id="btn_save_item"><i class="fa fa-save"></i> 保存</button>
            </div>
        </div>
        <div class="bmbox_content clearfix">

            <form id="form_item">
                <input type ="hidden" id="form_hid_rowid" />
                <div class="form_item wb100 fl">
                    <label>序号 <span style="color:darkred;">*</span></label>
                    <input type="text" id="form_inp_xh" class="form-control input-sm" />
                </div>

                <div class="form_item wb100 fl">
                    <label>评审内容 <span style="color:darkred;">*</span></label>
                    <input type="text" id="form_inp_psnr" class="form-control input-sm" />
                </div>

                <div class="form_item wb100 fl">
                    <label>评分标准 <span style="color:darkred;">*</span></label>
                    <input type="text" id="form_inp_pfbz" class="form-control input-sm"  />
                </div>

                <div class="form_item wb100 fl">
                    <label>分值 <span style="color:darkred;">*</span></label>
                    <input type="text" id="form_inp_fz" class="form-control input-sm"  />
                </div>

            </form>

        </div>
    </div>
</div>


</body>
</html>