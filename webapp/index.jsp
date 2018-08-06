<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<script>
			window.onload = function() {
				var obj = document.getElementsByTagName("a")[0].onclick = function() {
					//定义xmlhttp
					var xmlhttp;
					if(window.XMLHttpRequest) {
						//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
						xmlhttp = new XMLHttpRequest();
					} else {
						// IE6, IE5 浏览器执行代码
						xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
					}
					//设置请求方式以及请求地址
					xmlhttp.open("POST", "hello.xml", true);
					
					xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					//发送请求
					xmlhttp.send();
					//有返回事件
					xmlhttp.onreadystatechange = function() {
						//通信状态
						if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
							var result= xmlhttp.responseXML;
							var name=result.getElementsByTagName("name")[0].firstChild.nodeValue;
							var age=result.getElementsByTagName("age")[0].firstChild.nodeValue;
							var sex=result.getElementsByTagName("sex")[0].firstChild.nodeValue;
							document.getElementById("myDiv").innerHTML="name:"+name+"age:"+age+"sex"+sex;
						}
					}
					return false;
				}
			}
		</script>
	</head>

	<body>
		<a href="hello.xml">hello</a>
		<div id="myDiv"></div>
	</body>

</html>