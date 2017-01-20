<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Amanda</title>
</head>
<body>
	<h2>회원심사</h2>
	<table class="join02">
		<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>점수</th>
			<th>평가자 수</th>
			<th>평점</th>
			
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${semiuserList}" var="semiuser">
			<c:if test="${semiuser.s_usercount >= 5}"></c:if>
			<c:if test="${semiuser.s_usercount < 5}">
			<tr>
				<td><a href="semiDetail.do?m_number=${semiuser.m_number}">${semiuser.s_email}</a></td>
				<td>${semiuser.s_name}</td>
				<td>
					<c:if test="${semiuser.gender == 0}">남자</c:if>
					<c:if test="${semiuser.gender == 1}">여자</c:if>
				</td>
				<td>${semiuser.s_score}</td>
				<td>${semiuser.s_usercount}</td>
				<td>
					<c:if test="${semiuser.s_score/semiuser.s_usercount == 'NaN'}">X</c:if>
					<c:if test="${semiuser.s_score/semiuser.s_usercount != 'NaN'}"><f:formatNumber value="${semiuser.s_score/semiuser.s_usercount}" pattern="###.#"/></c:if>
				</td>
			</tr>
			</c:if>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>