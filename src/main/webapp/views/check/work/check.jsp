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
    <style>
        td{vertical-align: middle !important;}
    </style>
</head>
<body class="warpslide fullbox" style="overflow: hidden">
<div class="rightslide_menu" style="">
    <div class="fullbox ">
        <div class="fullbox">
            <div class="bmbox_layout fullbox clearfix">
                <div class="bmbox_title">
                    <h5>评分表</h5>
                    <div class="bmbox_tool">
                        <button class="btn btn-primary btn-sm btn-smx" id="btn_submit" style="display: none;" type="button"><i class="fa fa-check"></i> 提交</button>
                        <%--<button class="btn btn-white btn-sm btn-smx" id="btn_save" style="display: none;" type="button"><i class="fa fa-save"></i> 暂存</button>--%>
                        <button class="btn btn-white btn-sm btn-smx" id="btn_close_score_table" type="button"><i class="fa fa-hand-o-right"></i> 收起评分表(自动暂存)</button>
                    </div>
                </div>
                <div class="bmbox_content fullbox clearfix" style="overflow: auto;padding-bottom: 40px;">
                    <table id="table_score" class="fullbox table table-bordered table-hover" style="">
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
                        <tr>
                            <td colspan="2">我的点评</td>
                            <td colspan="4">
                                <input type="text" id="txt_jydp" class="form-control input-sm" placeholder="请输入简要点评" maxlength="2000" />
                            </td>
                        </tr>
                        <%--<tr>--%>
                            <%--<td colspan="2">简要点评</td>--%>
                            <%--<td colspan="4">--%>
                                <%--<select class="form-control input-sm" id="form_sel_pclx" style="width:200px;">--%>
                                <%--<option value="">--请选择质量等级--</option>--%>
                                <%--<option value="优秀">优秀</option>--%>
                                <%--<option value="合格">合格</option>--%>
                                <%--<option value="瑕疵">瑕疵</option>--%>
                                <%--<option value="差错">差错</option>--%>
                                <%--</select>--%>
                            <%--</td>--%>
                        <%--</tr>--%>


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
            <button id="btn_tongbu" class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-refresh"></i> 同步</button>
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
    <div class="bmbox_content clearfix fullbox" style="overflow: auto">
        <div id="displayOnce" style="text-align: center;padding-top: 160px;font-size: 16px;color:#666">
            <p>请选择左侧档案目录后进行查看</p>
        </div>
        <img id="viewer_img" src="" style="display:none;width:100%;" />
        <iframe id="viewframe" style="display: none;" class="J_iframe" name="iframe0" width="100%" height="100%" frameborder="0" seamless src="viewer.jsp"></iframe>
    </div>
</div>
</body>
</html>