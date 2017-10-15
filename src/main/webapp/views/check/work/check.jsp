<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=layer;ztree" />
    <script type="text/javascript" src="check.js"></script>
</head>
<body class="warpslide fullbox" style="overflow: hidden">
<div class="rightslide_menu">
    <div class="fullbox ">
        <div class="">
            <div class="bmbox_layout  clearfix">
                <div class="bmbox_title">
                    <h5>评分表</h5>
                    <div class="bmbox_tool">
                        <button class="btn btn-primary btn-sm btn-smx" id="btn_submit" style="display: none;" type="button"><i class="fa fa-check"></i> 提交</button>
                        <button class="btn btn-white btn-sm btn-smx" id="btn_save" style="display: none;" type="button"><i class="fa fa-save"></i> 暂存</button>
                        <button class="btn btn-white btn-sm btn-smx" id="btn_close_score_table" type="button"><i class="fa fa-hand-o-right"></i> 收起评分表(自动暂存)</button>
                    </div>
                </div>
                <div class="bmbox_content clearfix">
                    <table id="table_score" class="table table-bordered table-hover" style="">
                        <thead>
                        <tr style="background: #e0e0e0">
                            <th class="width50" style="text-align: center">序号</th>
                            <th class="width200" style="text-align: center">评审内容</th>
                            <th class="width400" style="text-align: center">评分标准</th>
                            <th class="width50" style="text-align: center">分值</th>
                            <th class="width50" style="text-align: center">扣分</th>
                            <th class="width200" style="text-align: center">扣分理由</th>
                        </tr>
                        </thead>
                        <tbody id="table_score_tbody">
                        <tr>
                            <td colspan="5">暂无评分项....</td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr style="background: #e0e0e0">
                            <td>得分</td>
                            <td colspan="4"></td>
                            <td style="text-align: right" ><span id="label_mf"></span></td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="bmbox_layout wb30 clearfix fl fullbox">
    <div class="bmbox_title">
        <h5>案件资料</h5>
        <div class="bmbox_tool">
        </div>
    </div>
    <div class="bmbox_content clearfix fullbox" style="padding-bottom: 60px;overflow: auto">
        <ul id="pTree" class="ztree"></ul>
    </div>
</div>
<div class="bmbox_layout wb70 clearfix fl fullbox">
    <div class="bmbox_title">
        <h5>查看器</h5>
        <div class="bmbox_tool">
            <button class="btn btn-white btn-sm btn-smx" id="btn_open_score_table" type="button"><i class="fa fa-hand-o-left"></i> 打开评分表</button>
        </div>
    </div>
    <div class="bmbox_content clearfix fullbox">
        <div id="displayOnce" style="text-align: center;padding-top: 160px;font-size: 16px;color:#666">
            <p>请选择左侧档案目录后进行查看</p>
        </div>
        <iframe id="viewframe" style="display: none;" class="J_iframe" name="iframe0" width="100%" height="100%" frameborder="0" seamless src="viewer.jsp"></iframe>
    </div>
</div>
</body>
</html>