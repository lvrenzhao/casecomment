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
<div class="bmbox_layout  clearfix wb100 fl">
  <div class="bmbox_title">
    <h5>评选报告</h5>
    <div class="bmbox_tool">
      <input type="text" class="form-control fl" placeholder="三精评选公告标题" style="width:150px;margin-top: 3px;margin-right: 10px;" /><button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-search"></i> 查询</button>
    </div>
  </div>
  <div class="bmbox_content clearfix">
    <div class="clearfix pd10">
      <table id="table1" class="table table-striped"></table>
      <div id="pager1"></div>
    </div>
  </div>
</div>
<script>
    $(function(){
        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : $('body').height() -95 -65,
            width : $('body').width() - 22,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 20,
            rowList : [ 10, 20, 30 ],
            colModel : [
                {label : 'ggid',name : 'ggid',hidden : true,key : true },
                {label : 'btys',name : 'btys',hidden : true},
                {label : 'sfyd',name : 'sfyd',hidden : true},
                {label : '操作',name : 'ggid', width : 200,align : 'center',sortable : false,
                    formatter : function(cellvalue, options, rowObject) {
                        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="openCases(2,\'' + rowObject.ggid + '\')" title=""><i class="fa fa-info-circle"></i> 公告详细</button>'
                            +      '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="openDetails()" title=""><i class="fa fa-balance-scale"></i> 评查情况</button>'
//                              +      '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="downLoad()" title=""><i class="fa fa-file-word-o"></i> 下载报告</button>';
                    }
                },
                {label : '公告标题',name : 'ggbt',width : 300,sortable:false,
                    formatter : function(cellvalue, options, rowObject) {
                        var style = "";
                        if(rowObject.btys == 2){
                            style = "color:red"
                        }
                        return '<span style="'+style+'">'+cellvalue+'</span>';
                    }
                },
                {label : '评选类型',name : 'pclx',align : 'center',sortable:false,width : 100},
                {label : '发起人',name : 'lxrmc',sortable:false,width : 100},
                {label : '发布时间',name : 'fbsj',sortable:false,width : 100}
            ],
            pager : '#pager1'
            ,viewrecords: true
        });
    });

    function reloadGrid() {
        $("#table1").jqGrid().setGridParam({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            postData:{
            },
            page : 1
        }).trigger("reloadGrid");
    }

    function openCases(mode,ggid) {
        layer.open({
            type : 2,
            shift : 5,
            title : mode==1?"审核案件评查公告":"查看审核评查公告",
            shadeClose : false,
            shade : 0.3,
            area : [ '95%', '90%' ],
            content : ahcourt.ctx + '/views/chosen/start/main.jsp?ggid=' + ggid+"&mode="+mode,
            cancel : function(index) {
                layer.close(index);
                reloadGrid();
            }

        });
    }
    function openDetails(){
        layer.open({
            type : 2,
            shift : 5,
            title : '详细评查报告',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx + "/statics/chosenreportitem.do",
            cancel : function(index) {
                layer.close(index);
            }
        });
    }

    function downLoad() {
        layer.open({
            type : 2,
            shift : 5,
            title : '下载中心',
            shadeClose : false,
            shade : 0.3,
            area : [ '80%', '80%' ],
            content : ahcourt.ctx + "/views/statics/downloadcenter.jsp",
            cancel : function(index) {
                layer.close(index);
            }
        });
    }
</script>
</body>
</html>