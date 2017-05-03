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
  <div class="clearfix pd10">
    <table id="table1" class="table table-striped"></table>
    <div id="pager1"></div>
  </div>
  <script>
    $(function(){
        $("#table1").jqGrid({
            url : ahcourt.ctx + '/publish/unwatchedlistjson.do',
            datatype : "json",
            mtype : "post",
            height : gridHeight()-65,
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 20,
            rowList : [ 10, 20, 30 ],
            colModel : [ {
                label : 'xxid',
                name : 'xxid',
                hidden : true,
                key : true
            },{
                label : '操作',
                name : 'xxid',
                width : 80,
                align : 'center',
                sortable : false,
                formatter : formatter_grid2_opts
            }, {
                label : '公告标题',
                name : 'bt',
                width : 300
            }, {
                label : '状态',
                name : 'ztmc',
                align : 'center',
                width : 80,
                formatter : formatter_zt
            }, {
                label : '信息类型',
                name : 'xxlxmc',
                align : 'center',
                width : 100
            }, {
                label : '发布人',
                name : 'createByMC',
                width : 100
            }, {
                label : '发布时间',
                name : 'createDate',
                width : 100
            }],
            pager : '#pager1'
            ,viewrecords: true
        });
    })

    function formatter_zt(cellvalue, options, rowObject) {
        if (cellvalue == '审核不通过') {
            return '<lable class="label label-danger">审核不通过</lable>'
        } else if (cellvalue == '审核通过') {
            return '<lable class="label label-primary">审核通过</lable>'
        } else {
            return '<lable class="label label-default ">待审核</lable>'
        }
    }

    function formatter_grid2_opts(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="verify(1,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 查看</button>';
    }

    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -35;
    }

    function verify(mode,ggid) {
        layer.open({
            type : 2,
            shift : 5,
            title : mode==1?"查看":"审核",
            shadeClose : false,
            shade : 0.3,
            area : [ '95%', '90%' ],
            content : ahcourt.ctx + '/publish/input.do?mode='+mode+'&ggid=' + ggid,
            cancel : function(index) {
                layer.close(index);
            }
        });
    }
  </script>
  </body>
</html>