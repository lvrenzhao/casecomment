<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Vertical Tab</title>
	    <jsp:include page="/header.jsp?libs=layer" />
	    <link type="text/css" rel="stylesheet" href="${ctx}/static/benmodata/common_css/b_component-tab.css" />
    </head>
    <body>
    	<div class="verticaltab_box fullbox">
    		<div class="vtab_menu">
    			<ul>
    				<li class="active">
                        <a data-toggle="tab" href="#tab-1">
                        	<i class="fa fa-home mr5"></i> 
                        	<span class="nav-label">客户列表 </span>
                        	<span class="label label-primary pull-right">16</span>
                        </a>
	                </li>
	                <li class="">
	                	<a data-toggle="tab" href="#tab-2">
	                		<i class="fa fa-plus mr5"></i> 
                        	<span class="nav-label">客户登记 </span>
                        	<span class="label label-primary pull-right">6</span>
	                	</a>
	                </li>
	                <li>
	                	<a data-toggle="tab" href="#tab-3">
	                		<i class="fa fa-check mr5"></i> 
                        	<span class="nav-label">客户审核 </span>
                        	<span class="label label-primary pull-right">8</span>
	                	</a>
	                </li>
    			</ul>
    		</div>
    		<div class="vtab_content">
                <div id="tab-1" class="vtab_box active">
                 	这里是测试一容器
                </div>
                <div id="tab-2" class="vtab_box">
					<div class="bmbox_layout clearfix">
			    		<div class="bmbox_title">
			    			<h5>我的任务</h5>
				            <div class="bmbox_tool">
				                <a id="mode_list">
				                   <i class="fa fa-bars"></i> 列表
				                </a>
				                <a id="mode_carlendar">
				                   <i class="fa fa-calendar"></i> 日程
				                </a>
				            </div>
			    		</div>
			    		<div class="bmbox_content"></div>
			    	</div>
                </div>
                <div id="tab-3" class="vtab_box">
					这里是测试三容器
                </div>
    		</div>
    	</div>
 	</body>
</html>