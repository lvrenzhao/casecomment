<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Btn</title>
		<jsp:include page="/header.jsp?libs=" />
    </head>
    <body>
    	<div class=" clearfix pd10">
    		最大级别：(尽量少用)
            <br />
    		<button class="btn btn-primary" type="button"><i class="fa fa-bars"></i> 搜索/保存/提交</button>
            <button class="btn btn-white" type="button"><i class="fa fa-bars"></i> 一般操作</button>
            <button class="btn btn-warning" type="button"><i class="fa fa-bars"></i> 删除</button>
            <br />
            <br />
    		中等级别：（正常表单多用）
            <br />
            <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-bars"></i> 搜索/保存/提交</button>
            <button class="btn btn-white btn-sm" type="button"><i class="fa fa-bars"></i> 一般操作</button>
            <button class="btn btn-warning btn-sm" type="button"><i class="fa fa-bars"></i> 删除</button>
            <br />
            <br />
    		比较小级别：（一般用于ibox中）
            <br />
            <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-bars"></i> 搜索/保存/提交</button>
            <button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-bars"></i> 一般操作</button>
            <button class="btn btn-warning btn-sm btn-smx" type="button"><i class="fa fa-bars"></i> 删除</button>
            <br />
            <br />
    		最小级别：（一般用于表格中）
            <br />
            <button class="btn btn-primary btn-xs" type="button"><i class="fa fa-bars"></i> 搜索/保存/提交</button>
            <button class="btn btn-white btn-xs" type="button"><i class="fa fa-bars"></i> 一般操作</button>
            <button class="btn btn-warning btn-xs" type="button"><i class="fa fa-bars"></i> 删除</button>
            
            <br />
            <br />
            <br />
            常用图标
            <br />
		            提交<i class="fa fa-check"></i><br /> 
		            关闭:<i class="fa fa-close"></i> <br />
		            删除<i class="fa fa-trash"></i> <br />
		            查询<i class="fa fa-search"></i><br />
		            历史记录<i class="fa fa-history"></i>  <br />
		            查看<i class="fa fa-info-circle"></i> <br />
		            编辑<i class="fa fa-pencil"></i> <br />
		            新增/添加<i class="fa fa-plus"></i> <br />
		            共享 <i class="fa fa-share-alt"></i> <br />
		            警告<i class="fa fa-warning"></i>  <br />
		            附件 <i class="fa fa-paperclip"></i> <br />
		            待审核列表1(默认):<i class="fa fa-list-ul"></i> <br />
		            待审核列表2:<i class="fa fa-table"></i> <br />
		            待审核列表2:<i class="fa fa-outdent"></i><br />
		            保存<i class="fa fa-save"></i><br />
		            归档<i class="fa fa-cloud-upload"></i><br />
		            审核<i class="fa fa-eye"></i><br />
		            保养<i class="fa fa-coffee"></i><br />
    	</div>	
 	</body>
</html>