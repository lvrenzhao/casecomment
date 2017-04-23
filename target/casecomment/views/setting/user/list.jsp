<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>帐号列表</title>
	<jsp:include page="/header.jsp?libs=jqgrid;ztree;layer;chosen;icheck" />
	<script type="text/javascript" src="${ctx}/views/setting/user/list.js"></script>
	<style type="text/css">
		.acount_top{ z-index: 10; position: relative; padding-right: 100px;}
		.accountsearch_btn{ position: absolute; right: 15px; top: 40px;}
	</style>
  </head>
  <body>
		<div class="bmbox_layout acountlist clearfix fullbox">
    		<div class="bmbox_content clearfix">
    			<div class="acount_top clearfix pdt_10">
    				<div class="form_item wb20 fl">
	    				<label>姓名</label>
	    				<input type="text" id="xm" class="form-control input-sm">
	    			</div>
	    			<div class="form_item wb20 fl">
	    				<label>帐号</label>
	    				<input type="text" id="zh" class="form-control input-sm">
	    			</div>
	    			<div class="form_item wb20 fl">
	    				<label>所属组织机构</label>
	    				<div style="position: relative;">
	    					<div class="input-group">
	    						<input class="hidden" id="zzjgids"/>
								<input type="text" class="form-control input-sm" readonly id="organization_input"> 
								<span class="input-group-btn"> 
	                    			<button type="button" class="btn btn-primary btn-sm" id="organization_btn">选择</button>
	                    		</span>
               				</div>
							<div id="organization_Content" class="menuContent">
								<ul id="organization_menu" class="ztree"></ul>
							</div>
	    				</div>
	    			</div>
	    			<div class="form_item wb20 fl">
	    				<label>帐号状态</label>
	    				<select class="form-control input-sm" id="zhzt">
	    					<option value="">--请选择--</option>
	    					<option value="1">启用</option>
	    					<option value="2">禁用</option>
	    				</select>
	    			</div>
					<div class="form_item wb20 fl pdt_30 " style="text-align: right">
						<button type="button" id="serch" class="btn btn-primary btn-sm "><i class="fa fa-search mr5"></i>查询</button>
						<button type="button" id="new" class="btn btn-defualt btn-sm " onclick="newstaff()"><i class="fa fa-plus mr5"></i>新建用户</button>
					</div>
    			</div>
    			<div class="acount_table pdt_10">
    					<table id="acounttable_grid"></table>
    					<div id="acounttable_page"></div>
    			</div>
    		</div>
    	</div>	
  </body>
</html>