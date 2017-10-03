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
    <script src="view_table.js"></script>
    <style>
        td{vertical-align: middle !important;}
    </style>
</head>
<body>
<div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
        <h5 id="label_title"></h5>
    </div>
    <div class="bmbox_content clearfix pd10" >
        <table id="table_score" class="table table-bordered table-hover" style="margin-top: 40px">
            <thead>
            <tr style="background: #e0e0e0">
                <th class="width50" style="text-align: center">序号</th>
                <th class="width200" style="text-align: center">评审内容</th>
                <th class="width400" style="text-align: center">评分标准</th>
                <th class="width50" style="text-align: center">分值</th>
            </tr>
            </thead>
            <tbody id="table_score_tbody">
            <tr>
                <td colspan="5">暂无评分项....</td>
            </tr>
            </tbody>
            <tfoot>
                <tr style="background: #e0e0e0">
                    <td>满分</td>
                    <td colspan="2"></td>
                    <td style="text-align: right" ><span id="label_mf"></span></td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
</body>
</html>