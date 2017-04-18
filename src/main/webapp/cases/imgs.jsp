<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<jsp:include page="../header.jsp?libs=blueimp" />
<script type="text/javascript">
	$(function() {
		$('#imgs').click(function(event) {
			event = event || window.event;
			var target = event.target || event.srcElement, link = target.src ? target.parentNode : target, options = {
				index : link,
				event : event,
				container: '#blueimp-gallery'
			}, links = $(this).find('a');
			blueimp.Gallery(links, options);
		});
	})
</script>
</head>
<body>
	<div id="imgs">
		<a href="img/p_big1.jpg" title="图片"><img src="img/p1.jpg"></a> 
		<a href="img/p_big2.jpg" title="图片"><img src="img/p2.jpg"></a> 
		<a href="img/p_big3.jpg" title="图片"><img src="img/p3.jpg"></a>
	</div>
	<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
		<div class="slides"></div>
		<h3 class="title"></h3>
		<a class="prev">‹</a> 
		<a class="next">›</a> 
		<a class="close">×</a>
		<ol class="indicator"></ol>
	</div>
</body>
</html>
