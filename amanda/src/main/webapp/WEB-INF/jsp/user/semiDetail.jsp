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
	<h2>회원 상세정보</h2>
	<table border="1" cellpadding="0" cellspacing="0" class="join02">
		<tr>
		<!--
			<td>
				여기에 semi_member의 사진
				${semiuserProfile.m_pictureUrl1}
			</td>
			  -->
			<td>
				<table border="1">
					<tr>
						<th>닉네임</th>
						<td>${semiuserProfile.m_nickname}</td>
					</tr>
					<tr>
						<th>키</th>
						<td>${semiuserProfile.m_height}</td>
					</tr>
					<tr>
						<th>체형</th>
						<td>
							<c:if test="${semiuserProfile.m_bodytype == 0}">마름</c:if>
							<c:if test="${semiuserProfile.m_bodytype == 1}">슬림탄탄</c:if>
							<c:if test="${semiuserProfile.m_bodytype == 2}">보통</c:if>
							<c:if test="${semiuserProfile.m_bodytype == 3}">통통한</c:if>
							<c:if test="${semiuserProfile.m_bodytype == 4}">살짝볼륨</c:if>
							<c:if test="${semiuserProfile.m_bodytype == 5}">글래머</c:if>
						</td>
					</tr>
					<tr>
						<th>성격</th>
						<td>
							<c:if test="${semiuserProfile.m_character == 0}">지적인</c:if>
							<c:if test="${semiuserProfile.m_character == 1}">차분한</c:if>
							<c:if test="${semiuserProfile.m_character == 2}">유머있는</c:if>
							<c:if test="${semiuserProfile.m_character == 3}">낙천적인</c:if>
							<c:if test="${semiuserProfile.m_character == 4}">내향적인</c:if>
							<c:if test="${semiuserProfile.m_character == 5}">외향적인</c:if>
							<c:if test="${semiuserProfile.m_character == 6}">감성적인</c:if>
							<c:if test="${semiuserProfile.m_character == 7}">상냥한</c:if>
							<c:if test="${semiuserProfile.m_character == 8}">귀여운</c:if>
							<c:if test="${semiuserProfile.m_character == 9}">열정적인</c:if>
							<c:if test="${semiuserProfile.m_character == 10}">듬직한</c:if>
							<c:if test="${semiuserProfile.m_character == 11}">개성있는</c:if>
						</td>
					</tr>
					<tr>
						<th>종교</th>
						<td>
							<c:if test="${semiuserProfile.m_religion == 0}">종교없음</c:if>
							<c:if test="${semiuserProfile.m_religion == 1}">기독교</c:if>
							<c:if test="${semiuserProfile.m_religion == 2}">불교</c:if>
							<c:if test="${semiuserProfile.m_religion == 3}">천주교</c:if>
							<c:if test="${semiuserProfile.m_religion == 4}">원불교</c:if>
							<c:if test="${semiuserProfile.m_religion == 5}">이슬람교</c:if>
							<c:if test="${semiuserProfile.m_religion == 6}">유교</c:if>
						</td>
					</tr>
					<tr>
						<th>흡연</th>
						<td>
							<c:if test="${semiuserProfile.m_smoking == 0}">비흡연</c:if>
							<c:if test="${semiuserProfile.m_smoking == 1}">흡연</c:if>
						</td>
					</tr>
					<tr>
						<th>음주</th>
						<td>
							<c:if test="${semiuserProfile.m_drinking == 0}">마시지않음</c:if>
							<c:if test="${semiuserProfile.m_drinking == 1}">가끔마심</c:if>
							<c:if test="${semiuserProfile.m_drinking == 2}">어느정도 즐기는편</c:if>
							<c:if test="${semiuserProfile.m_drinking == 3}">술자리를 즐김</c:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<form:form modelAttribute="semiUser" method="post" action="semi1.do">
			<tr>
				<td colspan="3" align="right">
				<input type="hidden" name="m_number" value="${semiUser.m_number}">
					<form:select path="s_score">
						<form:option value="1">★☆☆☆☆</form:option>
						<form:option value="2">★★☆☆☆</form:option>
						<form:option value="3">★★★☆☆</form:option>
						<form:option value="4">★★★★☆</form:option>
						<form:option value="5">★★★★★</form:option>
					</form:select>
					<input type="submit" class="btn1" value="점수주기">
				</td>
			</tr>
		</form:form>
	</table>
</body>
</html>