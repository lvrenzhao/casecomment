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
                        <button class="btn btn-white btn-sm btn-smx" id="btn_close_score_table" type="button"><i class="fa fa-hand-o-right"></i> 暂存并收起评分表</button>
                    </div>
                </div>
                <div class="bmbox_content clearfix">
                    <table class="table table-bordered" id="table_score" >
                        <thead>
                        <tr>
                            <th class="wb5" style="text-align: center">序号</th>
                            <th class="wb15" style="text-align: center">评审内容</th>
                            <th class="wb40" style="text-align: center">评分标准</th>
                            <th class="wb5" style="text-align: center">分值</th>
                            <th class="wb10" style="text-align: center">扣分</th>
                            <th class="wb30" style="text-align: center">扣分理由</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>事实证据与实体处理</td>
                            <td>审理查明的事实是否全面、客观、清楚</td>
                            <td style="text-align: right">8</td>
                            <td><input class="form-control" /></td>
                            <td><input class="form-control" /></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>事实证据与实体处理</td>
                            <td>使用法律是否正确</td>
                            <td style="text-align: right">5</td>
                            <td><input class="form-control" /></td>
                            <td><input class="form-control" /></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>事实证据与实体处理</td>
                            <td>处理结果是否适当</td>
                            <td style="text-align: right">3</td>
                            <td><input class="form-control" /></td>
                            <td><input class="form-control" /></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>事实证据与实体处理</td>
                            <td>是否有其他不规范情形</td>
                            <td style="text-align: right">6</td>
                            <td><input class="form-control" /></td>
                            <td><input class="form-control" /></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>审理程序</td>
                            <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
                            <td style="text-align: right">2</td>
                            <td><input class="form-control" /></td>
                            <td><input class="form-control" /></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>审理程序</td>
                            <td>是否严格遵守规定</td>
                            <td style="text-align: right">2</td>
                            <td><input class="form-control" /></td>
                            <td><input class="form-control" /></td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>审理程序</td>
                            <td>是否充分保障诉讼参与人行使诉讼权利</td>
                            <td style="text-align: right">2</td>
                            <td><input class="form-control" /></td>
                            <td><input class="form-control" /></td>
                        </tr>
                        <tr>
                            <td>满分</td>
                            <td colspan="4"></td>
                            <td style="text-align: right">100</td>
                        </tr>
                        </tbody>
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
        <iframe class="J_iframe" name="iframe0" width="100%" height="100%" frameborder="0" seamless src="viewer.jsp"></iframe>
    </div>
</div>
</body>
</html>