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
    <style>
      #table_score th{text-align: center}
      #table_score td,#table_score th{vertical-align: middle}
    </style>
  </head>
  <body>


  <div class="bmbox_layout">
    <div class="bmbox_title home-righttab">
      <ul class="nav nav-tabs navs-3">
        <li class="active">
          <a data-toggle="tab" href="#tab-1">
            <i class="fa fa-bell"></i> 精品案件评选评分项
          </a>
        </li>
        <li class="">
          <a data-toggle="tab" href="#tab-2">
            <i class="fa fa-history"></i> 精品庭审影像评选评分项
          </a>
        </li>
        <li class="">
          <a data-toggle="tab" href="#tab-3">
            <i class="fa fa-history"></i> 精品裁判文书评选评分项
          </a>
        </li>
      </ul>
        <div class="bmbox_tool">
          <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-plus"></i> 新增</button>
        </div>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active">
          <table class="table table-bordered" id="table_score" >
            <thead>
            <tr>
              <th class="wb5">序号</th>
              <th class="wb15">操作</th>
              <th class="wb15">评审内容</th>
              <th class="wb60">评分标准</th>
              <th class="wb5">分值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>审理查明的事实是否全面、客观、清楚</td>
              <td>8分</td>
            </tr>
            <tr>
              <td>2</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>使用法律是否正确</td>
              <td>5分</td>
            </tr>
            <tr>
              <td>3</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>处理结果是否适当</td>
              <td>3分</td>
            </tr>
            <tr>
              <td>4</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>是否有其他不规范情形</td>
              <td>6分</td>
            </tr>
            <tr>
              <td>5</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>6</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>是否严格遵守规定</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>7</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>是否充分保障诉讼参与人行使诉讼权利</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>满分</td>
              <td colspan="3"></td>
              <td>100分</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div id="tab-2" class="tab-pane">
          <table class="table table-bordered" id="table_score" >
            <thead>
            <tr>
              <th class="wb5">序号</th>
              <th class="wb15">操作</th>
              <th class="wb15">评审内容</th>
              <th class="wb60">评分标准</th>
              <th class="wb5">分值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>审理查明的事实是否全面、客观、清楚</td>
              <td>8分</td>
            </tr>
            <tr>
              <td>2</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>使用法律是否正确</td>
              <td>5分</td>
            </tr>
            <tr>
              <td>3</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>处理结果是否适当</td>
              <td>3分</td>
            </tr>
            <tr>
              <td>4</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>是否有其他不规范情形</td>
              <td>6分</td>
            </tr>
            <tr>
              <td>5</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>6</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>是否严格遵守规定</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>7</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>是否充分保障诉讼参与人行使诉讼权利</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>满分</td>
              <td colspan="3"></td>
              <td>100分</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div id="tab-3" class="tab-pane">
          <table class="table table-bordered" id="table_score" >
            <thead>
            <tr>
              <th class="wb5">序号</th>
              <th class="wb15">操作</th>
              <th class="wb15">评审内容</th>
              <th class="wb60">评分标准</th>
              <th class="wb5">分值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>审理查明的事实是否全面、客观、清楚</td>
              <td>8分</td>
            </tr>
            <tr>
              <td>2</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>使用法律是否正确</td>
              <td>5分</td>
            </tr>
            <tr>
              <td>3</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>处理结果是否适当</td>
              <td>3分</td>
            </tr>
            <tr>
              <td>4</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>事实证据与实体处理</td>
              <td>是否有其他不规范情形</td>
              <td>6分</td>
            </tr>
            <tr>
              <td>5</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>6</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>是否严格遵守规定</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>7</td>
              <td align="center"><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button></td>
              <td>审理程序</td>
              <td>是否充分保障诉讼参与人行使诉讼权利</td>
              <td>2分</td>
            </tr>
            <tr>
              <td>满分</td>
              <td colspan="3"></td>
              <td>100分</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <script>
    $(function(){

        _w_table_rowspan("#table_score", 3);
    })
  </script>
  </body>
</html>