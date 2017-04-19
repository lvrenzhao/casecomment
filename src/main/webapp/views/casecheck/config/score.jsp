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
  </head>
  <body>
  <div class="bmbox_layout clearfix title_fixed fl">
    <div class="bmbox_title">
      <div class="bmbox_tool">
        <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-plus"></i> 新增</button>
      </div>
    </div>
    <div class="bmbox_content clearfix">



      <table class="table table-bordered" id="table_score">
        <thead>
        <tr>
          <th class="wb30">评审内容</th>
          <th class="wb60">评分标准</th>
          <th class="wb10">分值</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>事实证据与实体处理</td>
          <td>审理查明的事实是否全面、客观、清楚</td>
          <td>8分</td>
        </tr>
        <tr>
          <td>事实证据与实体处理</td>
          <td>使用法律是否正确</td>
          <td>5分</td>
        </tr>
        <tr>
          <td>事实证据与实体处理</td>
          <td>处理结果是否适当</td>
          <td>3分</td>
        </tr>
        <tr>
          <td>事实证据与实体处理</td>
          <td>是否有其他不规范情形</td>
          <td>6分</td>
        </tr>
        <tr>
          <td>审理程序</td>
          <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
          <td>2分</td>
        </tr>
        <tr>
          <td>审理程序</td>
          <td>是否严格遵守规定</td>
          <td>2分</td>
        </tr>
        <tr>
          <td>审理程序</td>
          <td>是否充分保障诉讼参与人行使诉讼权利</td>
          <td>2分</td>
        </tr>
        <tr>
          <td>简要点评</td>
          <td colspan="5" height="100"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>
        </tbody>
      </table>


    </div>
  </div>
  </body>
</html>