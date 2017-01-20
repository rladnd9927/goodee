<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Amanda</title>
<style type="text/css">
.appraisal_wrap{
	display : inline-block;
	border : 1px solid #000000;
	width : 100%;
	height : 500px;
}
.appraisal_info{
	display : inline-block;
	border : 1px solid #000000;
	width : 30%;
	height : 400px;
	margin-left: 35%;
}
.appraisal_picture{
	display : inline-block;
	width : 100%;
	height : 50%;
	background: #bdbdbd;
}
.appraisal_profile{
	display : inline-block;
	width : 100%;
	height : 30%;
	background: #ff0000;
}
.appraisal_score{
	display : inline-block;
	width : 100%;
	height : 20%;
	background: #00ff00;
	
}
</style>
</head>
<body>
<div class="appraisal_wrap">
	<h2>회원 심사 페이지</h2>
	<div class="appraisal_info">
		<div class="appraisal_picture">사진</div>
		<div class="appraisal_profile">정보</div>
		<div class="appraisal_score">
			<input type="button" value="☆">
			<input type="button" value="☆">
			<input type="button" value="☆">
			<input type="button" value="☆">
			<input type="button" value="☆">
		</div>
	</div>
</div>
</body>
</html>