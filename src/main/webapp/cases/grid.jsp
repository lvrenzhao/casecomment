<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>JQgrid</title>
		<jsp:include page="/header.jsp?libs=jqgrid" />
		<script type="text/javascript">
    		$(function(){
    			testgrid();
    		})
    		function testgrid(){
    			var mydata = [
				    { id: "ED001", name: "咨询师证书1", certificatenum: "bm20160630001", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED002", name: "咨询师证书2", certificatenum: "bm20160630002", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED003", name: "咨询师证书3", certificatenum: "bm20160630003", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED004", name: "咨询师证书4", certificatenum: "bm20160630004", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED005", name: "咨询师证书5", certificatenum: "bm20160630005", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED001", name: "咨询师证书1", certificatenum: "bm20160630001", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED002", name: "咨询师证书2", certificatenum: "bm20160630002", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED003", name: "咨询师证书3", certificatenum: "bm20160630003", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED004", name: "咨询师证书4", certificatenum: "bm20160630004", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED005", name: "咨询师证书5", certificatenum: "bm20160630005", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED001", name: "咨询师证书1", certificatenum: "bm20160630001", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED002", name: "咨询师证书2", certificatenum: "bm20160630002", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED003", name: "咨询师证书3", certificatenum: "bm20160630003", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED004", name: "咨询师证书4", certificatenum: "bm20160630004", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				    { id: "ED005", name: "咨询师证书5", certificatenum: "bm20160630005", getime:"2014-06-12",endtime:"2018-06-06",major:"造价咨询",note: "这里是测试数据"},
				
    			];
				$("#test_grid").jqGrid({
			        datatype: "local",
					data: mydata,
					//width:gridWidth(),
					height: 200,
			        rownumbers:true,
			        multiselect : true,
					multiselectWidth : 25,
			        shrinkToFit : false,
			        rowNum : 5,
					rowList : [ 5, 10, 15],
			        colModel: [
			            { label: 'id', name: 'id', hidden : true, key:true },
			            { label: '操作', name: 'operations',align : 'center',width:140,formatter:gridmenu},
			            { label: '证书名称', name: 'name' },
			            { label: '执业证号', name: 'certificatenum' },
			            { label: '取得日期', name: 'getime',align : 'right' },
			            { label: '到期日期', name: 'endtime',align : 'right' },
			            { label: '专业', name: 'major',align : 'center' },
			            { label: '备注', name: 'note' }
			            
			        ],
			        pager : "#pager_test"
			    });
    		}
    		function gridmenu(cellvalue, options, rowObject){
    			var edit = '<button class="btn btn-link btn-xs" type="button" onclick="editqua(\'' + rowObject.id + '\')"><i class="fa fa-edit"></i>&nbsp;修改</button>&nbsp;';
				var del = '<button class="btn btn-link btn-xs" type="button" onclick="del(\'' + rowObject.id + '\')"><i class="fa fa-close"></i>&nbsp;删除</button>';
				return edit + del;
    		}
    	</script>
    </head>
    <body>
    	<div class="clearfix pd10">
    		<table id="test_grid" class="table table-striped"></table>
			<div id="pager_test"></div>
    	</div>	
 	</body>
</html>