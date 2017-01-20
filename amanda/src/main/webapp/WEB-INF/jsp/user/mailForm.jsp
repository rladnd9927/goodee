<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메일 보내기</title>
<script type="text/javascript" 
	src="//cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
</head>
<body>
<form name="mailform" method="post" action="mail.shop" enctype="multipart/form-data">	<%-- multipart/form-data: 첨부파일사용 --%>
	<table border="1" cellpadding="0" cellspacing="0" width="100%">
		<tr><td>보내는 사람</td>
			<td>admin@goodee.co.kr</td>
		</tr>
		<tr><td>받는사람</td>
			<td><input type="text" name="recipient" size="100" value=
			'<c:forEach items="${userList}" var="user">${user.userName} &lt;${user.email}&gt;,</c:forEach>'></td></tr>		
																	<!-- &lt;${user.email}&gt; 뷰단에 태그로 들어가지 않게 하기위해 -->	
		<tr><td>제목</td>
			<td><input type="text" name="title" size="100"></td></tr>
			
		<tr><td>메시지형식</td>
			<td><select name="mtype">
				<option value="text/html; charset=euc-kr">HTML</option>	
				<option value="text/plain; charset=euc-kr">TEXT</option>	<!--text/plain:순수문자로 인식하고 한글은 euc-kr로 인코딩한것으로 보여주기 -->
			</select></td></tr>
			
		<tr><td>첨부파일</td>
			<td><input type="file" name="file1"></td></tr>
		
		<tr><td colspan="2"><textarea name="editor1" cols="120" rows="10"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('editor1');
			</script>
		</td></tr>
		
		<tr><td colspan="2" align="center">
			<input type="submit" value="메일보내기"></td></tr>
	</table></form></body></html>