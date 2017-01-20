<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../decorator/css/style.css">
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<style type="text/css">
li.on{color:red}
</style>
<script>
$(function() {
	$('li').click(function(){
		$('li').removeClass()
		$(this).addClass('on')
	})
})
</script>
</head>
<body>
<ul>
	<li>sdfsdfdsfd</li>
	<li>sdfsdfdsfd</li>
</ul>
</body>
</html>
