<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Bmbox With Tab</title>
		<jsp:include page="/header.jsp?libs=jqgrid;steps;icheck;bsfileinput;ztree;layer;laydate" />
    </head>
    <body>
    	<div class="bmbox_layout">
	        <div class="bmbox_title home-righttab">
	            <ul class="nav nav-tabs navs-3">
	                <li class="active">
	                    <a data-toggle="tab" href="#tab-1">
	                        <i class="fa fa-gear"></i> 主题
	                    </a>
	                </li>
	                <li class="">
	                	<a data-toggle="tab" href="#tab-2">
	                		通知
	                	</a>
	                </li>
	                <li>
	                	<a data-toggle="tab" href="#tab-3">
	                    	项目进度
	               		</a>
	                </li>
	            </ul>
	             <div class="tabrightmenu">
	             	 <div class="bmbox_tool active">
	                     <a class="collapse-link">
	                         <i class="fa fa-history"> 历史记录</i>
	                     </a>
	                 </div>
	                 <div class="bmbox_tool">
	                     <a class="collapse-link">
	                         <i class="fa fa-history"> 历史记录</i>
	                     </a>
	                     <a class="collapse-link">
	                         <i class="fa fa-bars"></i>列表</i>
	                     </a>
	                 </div>
	                 <div class="bmbox_tool">
	                     <a class="collapse-link">
	                         <i class="fa fa-bars"></i>列表</i>
	                     </a>
	                     <a class="collapse-link">
	                         <i class="fa fa-history"> 历史记录</i>
	                     </a>
	                 </div>
	             </div>
	         </div>
	         <div class="bmbox_content">
	            <div class="tab-content">
	                <div id="tab-1" class="tab-pane active">
	                    111
	                </div>
	                <div id="tab-2" class="tab-pane">
						222
	                </div>
	                <div id="tab-3" class="tab-pane">
						333
	                </div>
	            </div>
	         </div>
	     </div>
    	<script type="text/javascript">
        	$(function(){
	        	//双tab联动
	            var firstitem=$(".home-righttab .nav-tabs li");
	            var secitem=$(".tabrightmenu .bmbox_tool");
	            doubletab(firstitem,secitem);
            })
        </script>
 	</body>
</html>