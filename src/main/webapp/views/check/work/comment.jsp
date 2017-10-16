<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=layer" />
    <script type="text/javascript" src="comment.js"></script>
    <style>
        th{border:1px solid #999 !important;}
        td{vertical-align: middle !important;}
    </style>
</head>
<body style="overflow:hidden;">
<div class="bmbox_layout title_fixed clearfix" style="overflow: auto;padding-bottom: 200px;">
    <div class="bmbox_title">
        <h5>评分</h5>
        <div class="bmbox_tool">
        </div>
    </div>
    <div class="bmbox_content clearfix" style="" >
        <table class="table table-bordered" id="table_score"  style="width:1000px;margin-left:auto;margin-right:auto">
            <thead>
            <tr style="background: #e0e0e0">
                <th class="width50" rowspan="2" style="text-align: center">序号</th>
                <th class="width150" rowspan="2" style="text-align: center">评审内容</th>
                <th class="width250" rowspan="2" style="text-align: center">评分标准</th>
                <th id="increseColumn" class="width50" rowspan="2" style="text-align: center">分值</th>
                <%----%>
                <%--<th class="width250" colspan="2" style="text-align:center;">李飞</th>--%>
                <%--<th class="width250" colspan="2" style="text-align:center;">李飞1</th>--%>
                <%--<th class="width250" colspan="2" style="text-align:center;">李飞1</th>--%>
                <%--<th class="width250" colspan="2" style="text-align:center;">李飞1</th>--%>
                <th class="width50"  rowspan="2" style="text-align:center;">平均</th>
            </tr>
            <tr style="background: #e0e0e0;" id="increseColumnDetails">
                <%--<th class="width50" style="text-align: center">扣分</th>--%>
                <%--<th id="increseColumnDetails" class="width200" style="text-align: center">扣分理由</th>--%>
                <%--<th class="width50" style="text-align: center">扣分</th>--%>
                <%--<th class="width200" style="text-align: center">扣分理由</th>--%>
                <%--<th class="width50" style="text-align: center">扣分</th>--%>
                <%--<th class="width200" style="text-align: center">扣分理由</th>--%>
                <%--<th class="width50" style="text-align: center">扣分</th>--%>
                <%--<th class="width200" style="text-align: center">扣分理由</th>--%>
                <%--<th class="width50" style="text-align: center">扣分</th>--%>
                <%--<th class="width200" style="text-align: center">扣分理由</th>--%>
            </tr>
            </thead>
            <tbody id="tbody1">

            </tbody>
            <tfoot id="tfooter1">

            </tfoot>
        </table>
    </div>
</div>
<div class="bmbox_layout clearfix" style="position: absolute;width:100%;height:200px;bottom: 0;left: 0">
    <div class="bmbox_title">
        <h5>点评</h5>
        <div class="bmbox_tool">
            <button class="btn btn-primary btn-sm btn-smx" type="button" id="btn_submit" style="display: none;"><i class="fa fa-check"></i> 提交</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">
        <div class="form_item wb100 fl">
            <label>简要点评</label>
            <textarea id="form_inp_jydp" class="form-control" style="height:120px" placeholder="请输入您的简要点评..."></textarea>
        </div>
        <%--<div class="form_item wb33 fl">--%>
            <%--<label>点评人</label>--%>
            <%--<span></span>--%>
        <%--</div>--%>
        <%--<div class="form_item wb33 fl">--%>
            <%--<label>点评人部门</label>--%>
            <%--<span></span>--%>
        <%--</div>--%>
        <%--<div class="form_item wb33 fl">--%>
            <%--<label>点评时间</label>--%>
            <%--<span></span>--%>
        <%--</div>--%>
    </div>
</div>
</body>
</html>