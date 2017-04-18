<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SlideRight</title>
		<jsp:include page="/header.jsp" />
    </head>
    <body>
    	<div class="warpslide fullbox">
	    	<div class="rightslide_menu">
	    		<div class="rightslide_close" title="关闭"><i class="fa fa-close"></i></div>
	    	</div>
			<div class="leftslide_layout fullbox">
			  	<input type="button" class="btn btn-primary btn-xs openslide_btn" value="点击打开右滑菜单1" />
			  	<input type="button" class="btn btn-primary btn-xs openslide_btn2" value="点击打开右滑菜单2" />
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$(".openslide_btn").click(function(){
					openrightslide();
				});
				$(".openslide_btn2").click(function(){
					openrightslide();
				});
				$(".rightslide_close").click(function(){
					closerightslide();
				});
			});
			
			function openrightslide(){
				if($(".rightslide_menu").hasClass("menu_transitioning") || $(".rightslide_menu").hasClass("warpslide_active")){
					return;
				}else{
					$(".rightslide_menu").addClass("menu_transitioning");
					$(".warpslide").addClass("warpslide_active");
					$(".rightslide_menu").css("-webkit-transform","translate3d(0px, 0px, 0px)");
				}
			};
			function closerightslide(){
				$(".rightslide_menu").css("-webkit-transform","translate3d(100%, 0px, 0px)");
				$(".warpslide").removeClass("warpslide_active");
				$(".rightslide_menu").removeClass("menu_transitioning");
			}
		</script>
 	</body>
</html>