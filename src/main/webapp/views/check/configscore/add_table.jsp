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
    <script type="text/javascript" src="add_table.js"></script>
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
            <div class="form_item wb100 fl">
                <label>模板名称<span>*</span></label>
                <input type="text" class="form-control" placeholder="请输入模板名称"/>
            </div>
            <div class="form_item wb100 fl">
                <label>模板描述</label>
                <input type="text" class="form-control" placeholder="请输入模板描述"/>
            </div>
        </div>
    </div>
</div>
<div class="bmbox_layout clearfix" style="height:400px;">
    <div class="bmbox_title">
        <h5>评分表模板设置</h5>
        <div class="bmbox_tool">
            <button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-plus"></i> 新增</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">
        <table class="table table-bordered" id="table_score" >
            <thead>
            <tr>
                <th class="wb5" style="text-align: center">序号</th>
                <th class="wb15" style="text-align: center">操作</th>
                <th class="wb15" style="text-align: center">评审内容</th>
                <th class="wb60" style="text-align: center">评分标准</th>
                <th class="wb5" style="text-align: center">分值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
                <td>事实证据与实体处理</td>
                <td>审理查明的事实是否全面、客观、清楚</td>
                <td style="text-align: right">8</td>
            </tr>
            <tr>
                <td>2</td>
                <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
                <td>事实证据与实体处理</td>
                <td>使用法律是否正确</td>
                <td style="text-align: right">5</td>
            </tr>
            <tr>
                <td>3</td>
                <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
                <td>事实证据与实体处理</td>
                <td>处理结果是否适当</td>
                <td style="text-align: right">3</td>
            </tr>
            <tr>
                <td>4</td>
                <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
                <td>事实证据与实体处理</td>
                <td>是否有其他不规范情形</td>
                <td style="text-align: right">6</td>
            </tr>
            <tr>
                <td>5</td>
                <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
                <td>审理程序</td>
                <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
                <td style="text-align: right">2</td>
            </tr>
            <tr>
                <td>6</td>
                <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
                <td>审理程序</td>
                <td>是否严格遵守规定</td>
                <td style="text-align: right">2</td>
            </tr>
            <tr>
                <td>7</td>
                <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
                <td>审理程序</td>
                <td>是否充分保障诉讼参与人行使诉讼权利</td>
                <td style="text-align: right">2</td>
            </tr>
            <tr>
                <td>满分</td>
                <td colspan="3"></td>
                <td style="text-align: right">100</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>