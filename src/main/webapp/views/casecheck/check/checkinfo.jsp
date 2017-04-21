<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>双评工作平台</title>
  <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
  <jsp:include page="/header.jsp?libs=jqgrid;layer" />
  <style>
    #table_score th{text-align: center}
    #table_score td{vertical-align: middle}
  </style>
</head>
<body>
<div class="bmbox_layout title_fixed">
  <div class="bmbox_title home-righttab">
    <ul class="nav nav-tabs navs-3">
      <li class="active">
        <a data-toggle="tab" href="#tab-1">
          <i class="fa fa-balance-scale"></i> 评查信息
        </a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#tab-2">
          <i class="fa fa-user"></i> 专家信息
        </a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#tab-3">
          <i class="fa fa-info-circle"></i> 案件信息
        </a>
      </li>
    </ul>
  </div>
  <div class="bmbox_content">
    <div class="tab-content">
      <div id="tab-1" class="tab-pane active">
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
            <td class="no-padding"></td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
          </tr>
          <tr>
            <td>事实证据与实体处理</td>
            <td>使用法律是否正确</td>
            <td>5分</td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
          </tr>
          <tr>
            <td>事实证据与实体处理</td>
            <td>处理结果是否适当</td>
            <td>3分</td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
          </tr>
          <tr>
            <td>事实证据与实体处理</td>
            <td>是否有其他不规范情形</td>
            <td>6分</td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
          </tr>
          <tr>
            <td>审理程序</td>
            <td>庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
            <td>2分</td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
          </tr>
          <tr>
            <td>审理程序</td>
            <td>是否严格遵守规定</td>
            <td>2分</td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
          </tr>
          <tr>
            <td>审理程序</td>
            <td>是否充分保障诉讼参与人行使诉讼权利</td>
            <td>2分</td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
            <td class="no-padding"></td>
          </tr>
          <tr>
            <td>简要点评</td>
            <td colspan="5" height="100"></td>
          </tr>

          <tr >
            <td colspan="5" style="color: #ac2925;">评查人:张三 &nbsp;&nbsp;&nbsp;&nbsp; 评查时间:2010-01-01 &nbsp;&nbsp;&nbsp;&nbsp; 质量等级: 合格</td>
            <td style="color: #ac2925;">总分:89</td>
          </tr>
          </tbody>
        </table>
      </div>
      <div id="tab-2" class="tab-pane">
        <div class="form_center  clearfix" style="padding: 15px 0;">
          <div class="form_item wb100 fl">
            <label>专家姓名:</label>
            <span style="color: #ac2925;">张三</span>
          </div>
          <div class="form_item wb100 fl">
            <label>专家来自:</label>
            <span style="color: #ac2925;">安徽省高级人民法院</span>
          </div>
          <div class="form_item wb100 fl">
            <label>头衔:</label>
            <span style="color: #ac2925;">法官</span>
          </div>
          <div class="form_item wb100 fl">
            <label>可评查案件类型:</label>
            <span style="color: #ac2925;">刑事；民事</span>
          </div>
          <div class="form_item wb100 fl">
          <label>介绍:</label>
          <p style="color: #ac2925;">张三法官是安徽省高级人民的资深法官，层审判过多起重大刑事案件...</p>
        </div>
        </div>
      </div>
      <div id="tab-3" class="tab-pane pd10">
        <div class="form_center  clearfix">
          <div class="form_item wb25 fl">
            <label>案号:</label>
            <span style="color: #ac2925;"></span>
          </div>
          <div class="form_item wb25 fl">
            <label>案件性质:</label>
            <span style="color: #ac2925;">民事</span>
          </div>
          <div class="form_item wb50 fl">
            <label>案由:</label>
            <span style="color: #ac2925;">经济纠纷</span>
          </div>
          <div class="form_item wb25 fl">
            <label>归属法院:</label>
            <span style="color: #ac2925;">安徽省高级人民法院</span>
          </div>
          <div class="form_item wb25 fl">
            <label>承办部门:</label>
            <span style="color: #ac2925;">刑事一庭</span>
          </div>
          <div class="form_item wb50 fl">
            <label>承办人:</label>
            <span style="color: #ac2925;">王五</span>
          </div>

          <div class="form_item wb25 fl">
            <label>结案时间:</label>
            <span style="color: #ac2925;">2016-01-01</span>
          </div>
          <div class="form_item wb25 fl">
            <label>结案方式:</label>
            <span style="color: #ac2925;">判决</span>
          </div>
        </div>

        <table id="table1" style=""></table>

      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
    $(function() {

        _w_table_rowspan("#table_score", 1);

        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : 300,
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
                label : '&nbsp;',
                name : 'ggid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter : formatoption1
            },{
                label : '文件名',
                name : 'ggbt',
                width : 300
            },{
                label : '文件大小',
                name : 'pclx',
                align : 'center',
                width : 100
            },{
                label : '上传人',
                name : 'bcbpcajs',
                align : 'right',
                width : 100
            }, {
                label : '上传时间',
                name : 'lxrmc',
                width : 100
            }],
            caption:"案件资料"
        });

    });

    function formatoption1(cellvalue, options, rowObject) {
        if(rowObject.fmt == "video"){
            return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="下载"><i class="fa fa-download"></i></button>';
        }else{
            return '<a class="btn btn-link btn-xs _myproject_list_btn_view_busPro" target="_blank" href="${ctx}/player.do" title="下载"><i class="fa fa-play"></i></a>';
        }

    }
    function gridWidth() {
        return $('body').width() -22;
    }
</script>
</body>
</html>