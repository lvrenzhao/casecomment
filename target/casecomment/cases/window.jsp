<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>window弹窗</title>
    <!-- library list = blueimp;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=layer" />
    <style>
    	.bm-desktop{background: #18c8f6;height: auto;background:url("/smartec/static/benmodata/img/desktop_default.jpg") no-repeat center fixed;-webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;color: rgba(255,255,255,.95);}
    </style>
  </head>
  <body class="bm-desktop">
  	<div class="box_layout" style="display: none; background: #1ab394;"></div>
  		<script type="text/javascript">
  			$(function(){
  				
  				//调用本页div
//				layer.open({
//						type : 1,
//						title : '新增学历证书',
//						shadeClose : false,
//						shade : 0.3,
//						area : [ '450px', '620px' ],
//						content : $(".box_layout"),
//						cancel : function(index) {
//
//						}
//					})
	
					layer.open({
					    type: 2,
					    title: '<i class="fa fa-internet-explorer mr5"></i>测试windows标题',
					    shadeClose: true,
					    shade: false,
					    maxmin: true, //开启最大化最小化按钮
					   	area: ['1000px', '620px'],
					    shift:-1,
					    content:'${ctx}/cases/benmobox_with_tab.jsp',
					    min:function(dom){
					      	console.log("触发最小化事件！")  
					    },
					    success:function(){
					    	$(".layui-layer-max").hide();
					    }
					});
  			})
  		</script>
  </body>
</html>