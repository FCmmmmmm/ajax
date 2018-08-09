<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<!-- 导入jquery -->
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="http://malsup.github.io/min/jquery.blockUI.min.js"></script>

		<script type="text/javascript">
			$(function() {
				$("a").click(function() {
					var sec = this.href;
					var args = {
						"time": new Date()
					};
					$("#content").load(sec, args);
					return false;
				});
			});
		</script>
	</head>

	<body>
		<a href="hello.txt" id="as">点我</a>
		<div id="cl">另一种方法</div>
		<div id="content"></div>
		<div style="background-image: url(a.jpg); height: 200px;display: none;background-size:contain" id="displayBox"></div>
	</body>
	<script type="text/javascript">
		$(function() {
			$("#cl").click(function() {
				$.blockUI({
					message: $('#displayBox'),
					css: {
						top: ($(window).height() - 400) / 2 + 'px',
						left: ($(window).width() - 400) / 2 + 'px',
						width: '300px'
					}
				});

				$.ajax({
					type: "get",
					url: "hello.txt",
					async: true,
					//data:{},
					//dataType: "json",
					success: function(data) {
						$('#content').empty(); //清空resText里面的所有内容							
						$('#content').html("data:____" + data);
						//$.unblockUI();
					}
				});
				setTimeout(function() {
					$.unblockUI();
				}, 2000)
			});
		});
	</script>

</html>