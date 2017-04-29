<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=bsfileinput;jqgrid" />
    <style>
      .kv-upload-progress{float: left;width: 150px;margin-top: 10px;}
    </style>
  </head>
  <body>
  <div class="bmbox_layout  clearfix">
    <div class="bmbox_title ">
      <h5>文件列表</h5>
      <div class="bmbox_tool">
        <%--<input id="inputimage" type="file" name="file">--%>
      </div>
    </div>
    <div class="bmbox_content clearfix ofh">
      <div class="clearfix pd10">
        <table id="table1" class="table table-striped"></table>
      </div>
    </div>
  </div>
<script>
  $(function(){
//      //设定支持的上传格式只能是:doc/docx/pdf/mp4/ 千万不能是zip,rar等。
//      $("#inputimage").fileinput({
//          language : 'zh',
//          uploadUrl : ahcourt.ctx + '/setting/file/fileupload.do',
//          enctype : 'multipart/form-data',
//          mainClass : 'file-caption-main',
//          maxFileCount : 1,
//          showPreview : false,
//          autoReplace : true,
//          showUpload : false,
//          showCaption : false,
//          browseIcon:'<i class="glyphicon glyphicon-folder-open"></i> 点击上传',
//          showRemove : false,
//          msgFilesTooMany : "选择上传的文件数量 超过允许的最大数值！"
//      }).on("fileuploaded", function(event, data, previewId, index) {
//          var result = data.response;
//          //console.log("load completed..");
//      }).on("filebatchselected", function(event, files) {
//          $(this).fileinput("upload");
//          //console.log("load begin..");
//      })

      $("#table1").jqGrid({
          url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
          datatype : "json",
          mtype : "post",
          height : gridHeight(),
          width : gridWidth(),
          rownumbers : true,
          shrinkToFit : true,
          rowNum : 100000,
          colModel : [ {
              label : 'ggid',
              name : 'ggid',
              hidden : true,
              key : true
          },{
              label : '操作',
              name : 'ggid',
              width : 60,
              align : 'center',
              sortable : false,
              formatter : formatoption1
          }, {
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
          } ]
      });

  })

//  function formatoption1(cellvalue, options, rowObject) {
//      return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button>'
//          +'<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="下载"><i class="fa fa-download"></i> 下载</button>';
//  }

  function formatoption1(cellvalue, options, rowObject) {
      if(rowObject.fmt == "video"){
          //return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="下载"><i class="fa fa-download"></i></button>';
          return '<a class="btn btn-link btn-xs " target="_blank" href="${ctx}/player.do" title="播放"><i class="fa fa-play"></i></a>';
      }else{
          return '<a class="btn btn-link btn-xs " target="_blank" href="${ctx}/assets/1.pdf" title="打开"><i class="fa fa-file-pdf-o"></i></a>';
      }

  }

  function gridWidth() {
      return $('body').width() - 22;
  }
  function gridHeight() {
      return $('body').height() -115;
  }
</script>
  </body>
</html>