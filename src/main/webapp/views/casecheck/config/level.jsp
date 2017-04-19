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
    #table_score td,#table_score th{vertical-align: middle}
  </style>
</head>
<body>
<div class="bmbox_layout clearfix">
  <div class="bmbox_title">
    <h5>案件评查评分项设置</h5>
    <div class="bmbox_tool">
      <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-plus"></i> 新增</button>
    </div>
  </div>
  <div class="bmbox_content clearfix">
    <div class="clearfix pd10">
      <table id="table1" class="table table-striped"></table>
    </div>
  </div>
</div>
<script>
    $(function(){
        var mydata = [
            {
                id: "1",
                xh: "1",
                dj: "优秀",
                fzqj: "85-100"
            },{
                id: "2",
                xh: "2",
                dj: "良好",
                fzqj: "70-84"
            },{
                id: "3",
                xh: "3",
                dj: "合格",
                fzqj: "60-69"
            }
        ];

        // Configuration for jqGrid Example 1
        $("#table1").jqGrid({
            data: mydata,
            datatype: "local",
            height: $('body').height()-100,
            autowidth: true,
            shrinkToFit: true,
            rowNum: 1000,
            colNames: ['操作', '序号','等级', '分值区间'],
            colModel: [
                {
                    name: 'id',
                    index: 'id',
                    width: 60,
                    sortable : false,
                    frozen : true,
                    align:'center',
                    formatter:formatoption
                },
                {
                    name: 'xh',
                    index: 'xh',
                    width: 60,
                    align:'center'
                },
                {
                    name: 'dj',
                    index: 'dj',
                    width: 200,
                    align:'center'

                },
                {
                    name: 'fzqj',
                    index: 'fzqj',
                    width: 200,
                    align:'center'
                }
            ],
            viewrecords: true,
            hidegrid: false
        });
    })


    function formatoption(cellvalue, options, rowObject) {
        return '<button class="btn btn-white btn-xs " type="button" onclick="" title="删除"><i class="fa fa-trash"></i> 删除</button>'+
            '<button class="btn btn-white btn-xs " type="button" onclick="deleteItem()" title="编辑"><i class="fa fa-edit"></i> 编辑</button>';
    }

    function deleteItem () {
        layer.confirm('确定要删除该项？', {
            btn: ['确定','取消'] //按钮
        }, function(){
        }, function(){
        });
    }
</script>
</body>
</html>