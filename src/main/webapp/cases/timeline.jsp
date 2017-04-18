<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TimeLine</title>
        <jsp:include page="/header.jsp?libs=jqgrid" />
		<script type="text/javascript">
			$(function(){
				//timeline();
				openrightslide();
				$(".closeslide").click(function(){
					closerightslide(); 
				})
				$(".openslide_btn").click(function(){
					openrightslide("businessid");//必须传businessid
				})
				$(".openslide_btn2").click(function(){
					openrightslide("businessid");
				})
			}) 
		</script>
    </head>
    <body class="gray_bg">
    	<div class="warpslide fullbox">
	    	<div class="rightslide_menu">
	    		<div class="fullbox timeline_layout">
		    		<div class="rightslide_close" title="关闭"><i class="fa fa-close"></i></div>
		    		<div class="project_timeline m15"></div> 
	    		</div>
	    	</div>
			<div class="leftslide_layout fullbox">
			  	<input type="button" class="btn btn-primary btn-xs openslide_btn" value="点击打开右滑菜单1" />
			  	<input type="button" class="btn btn-primary btn-xs openslide_btn2" value="点击打开右滑菜单2" />
			  	<input type="button" class="btn btn-primary btn-xs closeslide" value="关闭" />
			</div>
		</div>
 	</body>
</html>