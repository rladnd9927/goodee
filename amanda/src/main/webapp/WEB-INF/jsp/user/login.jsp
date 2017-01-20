<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../decorator/css/style.css">
<title>로그인</title>
</head>
<body>
<form:form modelAttribute="user" method="post" action="login.do">
<div class="loginwrapper">
<div id="loginlogo"><img alt="logo" src=""></div>
   <h2>LOGIN</h2>
   <br/>
<table class="logintab">
   <tr><th>&nbsp;&nbsp;&nbsp;&nbsp;아이디</th>
      <td >&nbsp;<form:input path="m_email" class="input"/></td>
      <td align="left"><font color="red"><form:errors path="m_email"></form:errors></font></td>
   </tr>
   <tr><th>비밀번호</th>
      <td>&nbsp;<form:password  path="m_password" class="input"/></td>
      <td><font color="red"><form:errors path="m_password"></form:errors></font>
                    <spring:hasBindErrors name="user">
      <font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
      <spring:message code="${error.code}" />
      </c:forEach> </font>
      </spring:hasBindErrors>
         </td></tr>
</table>
<br/>
<input type="button" class="btn1" value="Join" onclick="location.href='joinForm1.do'">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" class="btn1" value="Login">
</div>
</form:form>
</body>
</html>