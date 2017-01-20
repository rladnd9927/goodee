<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 등록</title>
</head>
<body>
<form:form modelAttribute="board" action="write.shop" enctype="multipart/form-data" name="boardform">
 <table border="1" cellspacing="0" cellpadding="0" align="center">
 	<tr><td colspan="2" align="center">Spring 게시판 글쓰기</td></tr>
 	<tr><td>작성자</td>
 	    <td><form:input path="name"/>
 		<font color="red"><form:errors path="name"></form:errors></font>
 	</td></tr>
 	<tr><td>비밀번호</td>
 	    <td><form:password path="pass"/>
 		<font color="red"><form:errors path="pass"></form:errors></font>
 	</td></tr>
 	<tr><td>제목</td>
 	    <td><form:input path="subject"/>
 		<font color="red"><form:errors path="subject"></form:errors></font>
 	</td></tr>
 	<tr><td>내용</td>
 		<td><font color="red"><form:errors path="content"></form:errors></font>
 		<br>
 	    <form:textarea path="content" cols="67" rows="15"/>
 	</td></tr>
 	<tr><td>파일첨부</td>
 	    <td><input type="file" name="file1"></td></tr>
 	<tr><td colspan="2" align="center">
 		  <a href="javascript:document.boardform.submit()">[등록]</a>&nbsp;
 		  <a href="list.shop">[게시물 목록]</a>
 	</td></tr>
 </table>
</form:form>
</body>
</html>