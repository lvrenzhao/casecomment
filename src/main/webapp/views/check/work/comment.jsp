<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=" />
    <script type="text/javascript" src="comment.js"></script>
</head>
<body>
<div class="bmbox_layout clearfix" style="height:380px;">
    <div class="bmbox_title">
        <h5>评分</h5>
        <div class="bmbox_tool">
        </div>
    </div>
    <div class="bmbox_content clearfix" style="padding-bottom: 60px;" >
        <table class="table table-bordered" id="table_score"  style="margin-bottom: 60px;">
            <thead>
            <tr>
                <th class="wb5" rowspan="2" style="text-align: center">序号</th>
                <th class="wb15" rowspan="2" style="text-align: center">评审内容</th>
                <th class="wb30" rowspan="2" style="text-align: center">评分标准</th>
                <th class="wb5" rowspan="2" style="text-align: center">分值</th>
                <th class="wb20" colspan="2" style="text-align:center;">宋佳卿</th>
                <th class="wb20" colspan="2" style="text-align:center;">李飞</th>
                <th class="wb5"  rowspan="2" style="text-align:center;">平均分</th>
            </tr>
            <tr>
                <th  style="text-align: center">扣分</th>
                <th style="text-align: center">扣分理由</th>
                <th style="text-align: center">扣分</th>
                <th style="text-align: center">扣分理由</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>事实证据与实体处理</td>
                <td>审理查明的事实是否全面、客观、清楚</td>
                <td style="text-align: right">8</td>
                <td>2</td>
                <td>证据不够充分</td>
                <td>1</td>
                <td>关键证据不够充分</td>
                <td>6.5</td>
            </tr>
            <tr>
                <td>2</td>
                <td>事实证据与实体处理</td>
                <td>使用法律是否正确</td>
                <td style="text-align: right">5</td>
                <td>0</td>
                <td></td>
                <td>0</td>
                <td></td>
                <td>2</td>
            </tr>
            <tr>
                <td>3</td>
                <td>事实证据与实体处理</td>
                <td>处理结果是否适当</td>
                <td style="text-align: right">3</td>
                <td>0</td>
                <td></td>
                <td>0</td>
                <td></td>
                <td>3</td>
            </tr>
            <tr>
                <td>4</td>
                <td>事实证据与实体处理</td>
                <td>是否有其他不规范情形</td>
                <td style="text-align: right">6</td>
                <td>0</td>
                <td></td>
                <td>0</td>
                <td></td>
                <td>4</td>
            </tr>
            <tr>
                <td>5</td>
                <td>审理程序</td>
                <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
                <td style="text-align: right">2</td>
                <td>0</td>
                <td></td>
                <td>0</td>
                <td></td>
                <td>2</td>
            </tr>
            <tr>
                <td>6</td>
                <td>审理程序</td>
                <td>是否严格遵守规定</td>
                <td style="text-align: right">2</td>
                <td>0</td>
                <td></td>
                <td>0</td>
                <td></td>
                <td>6</td>
            </tr>
            <tr>
                <td>7</td>
                <td>审理程序</td>
                <td>是否充分保障诉讼参与人行使诉讼权利</td>
                <td style="text-align: right">2</td>
                <td>0</td>
                <td></td>
                <td>0</td>
                <td></td>
                <td>2</td>
            </tr>
            <tr>
                <td>满分</td>
                <td colspan="7"></td>
                <td style="text-align: right">100</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="bmbox_layout clearfix" style="height:200px">
    <div class="bmbox_title">
        <h5>点评</h5>
        <div class="bmbox_tool">
            <button class="btn btn-primary btn-sm btn-smx" type="button" id="btn_submit" style="display: none;"><i class="fa fa-check"></i> 提交</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">
        <div class="form_item wb100 fl">
            <label>简要点评</label>
            <textarea class="form-control" style="height:120px" placeholder="请输入您的简要点评..."></textarea>
        </div>
        <div class="form_item wb33 fl">
            <label>点评人</label>
            <span></span>
        </div>
        <div class="form_item wb33 fl">
            <label>点评人部门</label>
            <span></span>
        </div>
        <div class="form_item wb33 fl">
            <label>点评时间</label>
            <span></span>
        </div>
    </div>
</div>
</body>
</html>