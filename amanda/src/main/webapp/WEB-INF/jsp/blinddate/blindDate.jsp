<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../decorator/css/style.css">
<title>Amanda</title>
</head>
<body>
<form:form modelAttribute="user" method="post" action="list.do">
<div class="blindDate_wrap"><!-- 가장 바깥쪽 wrap -->
	<div class="blindDate_userInfo">
		<table class="join02" border="1">
			<tr>
				<td colspan="2" width="200" height="200">사진자리</td>
				<td>
					<table>
					<!-- 키 체형 성격 종교 흡연 음주 -->
					<thead>
					<tr>
						<th colspan="2">...님의 프로필</th>
					</tr>
					</thead>
						<tr>
							<th>닉네임</th>
							<td>칸수 확인을 위한 무의미한 텍스트${userProfile.m_nickname}</td>
						</tr>
						<tr>
							<th>키</th>
							<td>${userProfile.m_height}</td>
						</tr>
						<tr>
							<th>체형</th>
							<td>${userProfile.m_bodytype}</td>
						</tr>
						<tr>
							<th>성격</th>
							<td>${userProfile.m_character}</td>
						</tr>
						<tr>
							<th>종교</th>
							<td>${userProfile.m_religion}</td>
						</tr>
						<tr>
							<th>흡연</th>
							<td>${userProfile.m_smoking}</td>
						</tr>
						<tr>
							<th>음주</th>
							<td>${userProfile.m_drinking}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<input type="submit" value="♡" class="jb">
					<input type="reset" value="새로고침" class="jb">
				</td>
			</tr>
		</table>
	</div>
</div>
</form:form>
</body>
</html>