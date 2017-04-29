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
  </head>
  <body>

  <div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
      <h5>2015年全省庭审影像精品案例评选&nbsp;&nbsp;<i class="fa fa-gg"></i> 案件评选</small>&nbsp;&nbsp;<small><i class="fa fa-user"></i> 吕仁钊</small>&nbsp;&nbsp;<small><i class="fa fa-clock-o"></i> 2016-03-01</small></h5>
      <div class="bmbox_tool">
        <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-check"></i> 填报完毕</button>
        <button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-bookmark"></i> 暂存</button>
      </div>
    </div>
    <div class="bmbox_content clearfix">
      <div class="alert alert-warning" role="alert">请各院按照公告内容按时填报三精案列，若无案例填报请直接点击【填报完毕】</div>

      <div class="bmbox_layout  clearfix">
        <div class="bmbox_title">
          <h5>已填报案例</h5>
          <div class="bmbox_tool">
            <button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-plus"></i> 填报案例</button>
          </div>
        </div>
        <div class="bmbox_content clearfix">
          <div class="clearfix pd10">
            <table id="table1" class="table table-striped"></table>
          </div>
        </div>
      </div>

    </div>
  </div>
<script>
  $(function () {
      $("#table1").jqGrid({
          url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
          datatype : "json",
          mtype : "post",
          height : gridHeight(),
          width : gridWidth(),
          rownumbers : true,
          shrinkToFit : true,
          rowNum : 20,
          rowList : [ 10, 20, 30 ],
          colModel : [ {
              label : 'ggid',
              name : 'ggid',
              hidden : true,
              key : true
          },{
              label : '操作',
              name : 'ggid',
              width : 180,
              align : 'center',
              sortable : false
              ,formatter : formatter_grid1_opts
          },{
              label : '案号',
              name : 'xmmc',
              frozen : true,
              width : 100
          }, {
              label : '已上传',
              name : 'xmmc',
              frozen : true,
              width : 80
          },{
              label : '归属法院',
              name : 'xmzt',
              width : 150
          }, {
              label : '承办部门',
              name : 'htmc',
              width : 100
          }, {
              label : '承办人',
              name : 'xmlxmc',
              width : 80
          }, {
              label : '案件性质',
              name : 'zylbmc',
              width : 80
          }, {
              label : '案由',
              name : 'xmfzrmc',
              width : 120
          }, {
              label : '结案方式',
              name : 'xmjlmc',
              width : 80
          }, {
              label : '结案时间',
              name : 'xmcymc',
              width : 80
          },{
              label : '推荐理由',
              name : 'xmcymc',
              width : 80
          } ]
          ,viewrecords: true

      });
  })

  function formatter_grid1_opts(cellvalue, options, rowObject) {
      return '<button class="btn btn-link btn-xs " type="button" onclick="upload()" title="上传资料"><i class="fa fa-upload"></i> 上传资料</button>'
      +'<button class="btn btn-link btn-xs " type="button" onclick="" title=""><i class="fa fa-trash"></i> 删除</button>';
  }

  function gridWidth() {
      return $('body').width() - 22;
  }
  function gridHeight() {
      return $('body').height() -175;
  }

  function upload(ggid) {
      layer.open({
          type : 2,
          shift : 5,
          title : '上传文件',
          shadeClose : false,
          shade : 0.3,
          area : [ '60%', '80%' ],
          content : ahcourt.ctx + '/casecheck/notice/upload.do?ggid=' + ggid,
          cancel : function(index) {
              layer.close(index);
          }
      });
  }

</script>
  </body>
</html>