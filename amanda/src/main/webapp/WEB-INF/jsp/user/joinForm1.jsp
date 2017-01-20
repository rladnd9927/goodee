<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../decorator/css/style.css">
<title>회원가입</title>
</head>
<body>
	<form:form modelAttribute="semiuser" method="post" action="join1.do">
		<spring:hasBindErrors name="semiuser">
			<font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		<div class="joinwrapper">
			<div class="joinimg"></div>
			<table class="join02">
				<thead>
					<tr>
						<th colspan="6">기본 회원가입 사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>email</th>
						<td>
							<%-- <form:input path="s_email" required/> --%>
							<input type="text" name="s_email" required>
							<%-- <font color="red"><form:errors path="s_email" /></font> --%>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="s_password" required>
							<%-- <form:password path="s_password" /> --%>
							<%-- <font color="red"><form:errors path="s_password" /></font> --%>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="s_name" required>
							<%-- <form:input path="s_name" /> --%>
							<%-- <font color="red"><form:errors path="s_name" /></font> --%>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td><form:radiobutton path="gender" value="0" label="남자" />
							<form:radiobutton path="gender" value="1" label="여자" />
						</td>
					</tr>
				</tbody>
			</table>
			<br />
			<div class="joinbutton">
				<input type="reset" class="jb" value="리셋"> <input
					type="submit" class="jb" value="다음">
			</div>
		</div>
	</form:form>
</body>
</html>