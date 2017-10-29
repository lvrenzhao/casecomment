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
        th{border:1px solid #c6c6c6 !important;}
        td{vertical-align: middle !important;}
    </style>
</head>
<body>

<div class="bmbox_layout">
    <div class="bmbox_title home-righttab">
        <ul class="nav nav-tabs navs-3">
            <li class="active">
                <a data-toggle="tab" href="#tab-1">
                    评分成绩
                </a>
            </li>
            <li class="">
                <a data-toggle="tab" href="#tab-2">
                    合议点评
                </a>
            </li>
        </ul>
        <div class="tabrightmenu">
            <div class="bmbox_tool active">
            </div>
            <div class="bmbox_tool">
                <button class="btn btn-primary btn-sm btn-smx" type="button" id="btn_submit" style="display: none;"><i class="fa fa-check"></i> 提交</button>
            </div>
        </div>
    </div>
    <div class="bmbox_content">
        <div class="tab-content">
            <div id="tab-1" class="tab-pane active" style="overflow: auto;">
                <table class="table table-bordered" id="table_score"  style="width:1000px;margin-left:auto;margin-right:auto">
                    <thead>
                    <tr style="background: #e0e0e0">
                        <th class="width50" rowspan="2" style="text-align: center">序号</th>
                        <th class="width150" rowspan="2" style="text-align: center">评审内容</th>
                        <th class="width250" rowspan="2" style="text-align: center">评分标准</th>
                        <th id="increseColumn" class="width50" rowspan="2" style="text-align: center">分值</th>
                        <th class="width50"  rowspan="2" style="text-align:center;">平均</th>
                    </tr>
                    <tr style="background: #e0e0e0;" id="increseColumnDetails">
                    </tr>
                    </thead>
                    <tbody id="tbody1">

                    </tbody>
                    <tfoot id="tfooter1">

                    </tfoot>
                </table>
            </div>
            <div id="tab-2" class="tab-pane" style="padding:10px;">

                <div class="bmbox_layout clearfix">
                    <div class="bmbox_title">
                        <h5>组员点评</h5>
                        <div class="bmbox_tool"> </div>
                    </div>
                    <div class="bmbox_content clearfix" id="div_advice">

                    </div>
                </div>

                <div class="bmbox_layout clearfix" style="margin-top:10px;">
                    <div class="bmbox_title">
                        <h5>合议点评</h5>
                        <div class="bmbox_tool"> </div>
                    </div>
                    <div class="bmbox_content clearfix" style="padding-top:10px;">
                        <div class="form_item wb25 fl" id="div_level" style="display: none">
                            <select class="form-control input-sm" id="form_sel_level">
                                <option value="">--请选择质量等级--</option>
                                <option value="优秀">优秀</option>
                                <option value="合格">合格</option>
                                <option value="瑕疵">瑕疵</option>
                                <option value="差错">差错</option>
                            </select>
                        </div>
                        <div class="form_item wb100 fl">
                            <textarea id="form_inp_jydp" class="form-control" style="height:80px" placeholder="请输入合议点评.."></textarea>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>








<%--<div class="bmbox_layout title_fixed clearfix" style="overflow: auto;padding-bottom: 200px;">--%>
    <%--<div class="bmbox_title">--%>
        <%--<h5>评分</h5>--%>
        <%--<div class="bmbox_tool">--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bmbox_content clearfix" style="" >--%>
        <%----%>
    <%--</div>--%>
<%--</div>--%>
<%--<div class="bmbox_layout clearfix" style="position: absolute;width:100%;height:200px;bottom: 0;left: 0">--%>
    <%--<div class="bmbox_title">--%>
        <%--<h5>合议评查笔录</h5>--%>
        <%--<div class="bmbox_tool">--%>
            <%--<button class="btn btn-primary btn-sm btn-smx" type="button" id="btn_submit" style="display: none;"><i class="fa fa-check"></i> 提交</button>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bmbox_content clearfix" style="overflow: auto !important;">--%>
        <%----%>
    <%--</div>--%>
<%--</div>--%>
</body>
</html>