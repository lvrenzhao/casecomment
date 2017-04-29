<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=jqgrid" />
    <style>
      #table_score th{text-align: center}
      #table_score td{vertical-align: middle}
    </style>
  </head>
  <body>
  <div class="bmbox_layout clearfix wb30 fl">
    <div class="bmbox_title">
      <h5>案件资料</h5>
      <div class="bmbox_tool">
      </div>
    </div>
    <div class="bmbox_content clearfix">
      <table id="table1" class="table table-striped"></table>
    </div>
  </div>
  <div class="bmbox_layout clearfix wb70 fl">
    <div class="bmbox_title">
      <h5>评分表</h5>
      <div class="bmbox_tool">
        <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-bookmark"></i> 暂存</button>
        <button class="btn btn-warning btn-sm btn-smx" type="button"><i class="fa fa-check"></i> 提交</button>
      </div>
    </div>
    <div class="bmbox_content clearfix">



      <table class="table table-bordered" id="table_score">
        <thead>
        <tr>
          <th class="wb20">评审内容</th>
          <th class="wb40">评分标准</th>
          <th class="wb7">分值</th>
          <th class="wb7">扣分</th>
          <th class="wb19">理由</th>
          <th class="wb7">得分</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>事实证据与实体处理</td>
          <td>审理查明的事实是否全面、客观、清楚</td>
          <td>8分</td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>
        <tr>
          <td>事实证据与实体处理</td>
          <td>使用法律是否正确</td>
          <td>5分</td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>
        <tr>
          <td>事实证据与实体处理</td>
          <td>处理结果是否适当</td>
          <td>3分</td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>
        <tr>
          <td>事实证据与实体处理</td>
          <td>是否有其他不规范情形</td>
          <td>6分</td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>
        <tr>
          <td>审理程序</td>
          <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
          <td>2分</td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>
        <tr>
          <td>审理程序</td>
          <td>是否严格遵守规定</td>
          <td>2分</td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>
        <tr>
          <td>审理程序</td>
          <td>是否充分保障诉讼参与人行使诉讼权利</td>
          <td>2分</td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
          <td class="no-padding"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>
        <tr>
          <td>简要点评</td>
          <td colspan="5" height="100"><input type="text" style="border: none;width: 100%;height: 100%;"></td>
        </tr>

        <tr >
          <td>总分</td>
          <td colspan="4"></td>
          <td>89</td>
        </tr>
        </tbody>
      </table>


    </div>
  </div>
  <script>
    $(function(){


        _w_table_rowspan("#table_score", 1);

        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            shrinkToFit : true,
            rowNum : 100000,
            colModel : [ {
                label : 'ggid',
                name : 'ggid',
                hidden : true,
                key : true
            },{
                label : 'fmt',
                name : 'fmt',
                hidden : true,
                key : true
            }, {
                label : '文件名',
                name : 'ggbt',
                width : 300
            },{
                label : '&nbsp;',
                name : 'ggid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter : formatoption1
            }]
        });
    })

    function formatoption1(cellvalue, options, rowObject) {
        if(rowObject.fmt == "video"){
            //return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="下载"><i class="fa fa-download"></i></button>';
            return '<a class="btn btn-link btn-xs " target="_blank" href="${ctx}/player.do" title="播放"><i class="fa fa-play"></i></a>';
        }else{
            return '<a class="btn btn-link btn-xs " target="_blank" href="${ctx}/assets/1.pdf" title="打开"><i class="fa fa-file-pdf-o"></i></a>';
        }

    }
    function gridWidth() {
        return $('body').width() * 0.3 ;
    }
    function gridHeight() {
        return $('body').height() -80;
    }
  </script>
  </body>
</html>