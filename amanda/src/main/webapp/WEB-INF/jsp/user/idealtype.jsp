<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이상형 설정</title>
</head>
<body>
<div class="IdealWrapper">
	<h2>내 이상형</h2>
	<input type="button" value="편집" onclick="location.href='idealtype2.do'" class="btn1">
	<table class="join02" align="center">
		<tr>
			<th>키</th>
			<td>${idealType.i_height}</td>
		</tr>
		<tr>
			<th>체형</th>
			<td>
				<c:if test="${idealType.i_bodytype == 0}">마름</c:if>
				<c:if test="${idealType.i_bodytype == 1}">슬림탄탄</c:if>
				<c:if test="${idealType.i_bodytype == 2}">보통</c:if>
				<c:if test="${idealType.i_bodytype == 3}">통통한</c:if>
				<c:if test="${idealType.i_bodytype == 4}">살짝볼륨</c:if>
				<c:if test="${idealType.i_bodytype == 5}">글래머</c:if>
			</td>
		</tr>
		<tr>
			<th>성격</th>
			<td>
				<c:if test="${idealType.i_character == 0}">지적인</c:if>
				<c:if test="${idealType.i_character == 1}">차분한</c:if>
				<c:if test="${idealType.i_character == 2}">유머있는</c:if>
				<c:if test="${idealType.i_character == 3}">낙천적인</c:if>
				<c:if test="${idealType.i_character == 4}">내향적인</c:if>
				<c:if test="${idealType.i_character == 5}">외향적인</c:if>
				<c:if test="${idealType.i_character == 6}">감성적인</c:if>
				<c:if test="${idealType.i_character == 7}">상냥한</c:if>
				<c:if test="${idealType.i_character == 8}">귀여운</c:if>
				<c:if test="${idealType.i_character == 9}">열정적인</c:if>
				<c:if test="${idealType.i_character == 10}">듬직한</c:if>
				<c:if test="${idealType.i_character == 11}">개성있는</c:if>
			</td>
		</tr>
		<tr>
			<th>종교</th>
			<td>
				<c:if test="${idealType.i_religion == 0}">종교없음</c:if>
				<c:if test="${idealType.i_religion == 1}">기독교</c:if>
				<c:if test="${idealType.i_religion == 2}">불교</c:if>
				<c:if test="${idealType.i_religion == 3}">천주교</c:if>
				<c:if test="${idealType.i_religion == 4}">원불교</c:if>
				<c:if test="${idealType.i_religion == 5}">이슬람교</c:if>
				<c:if test="${idealType.i_religion == 6}">유교</c:if>
			</td>
		</tr>
		<tr>
			<th>흡연</th>
			<td>
				<c:if test="${idealType.i_smoking == 0}">비흡연</c:if>
				<c:if test="${idealType.i_smoking == 1}">흡연</c:if>
			</td>
		</tr>
		<tr>
			<th>음주</th>
			<td>
				<c:if test="${idealType.i_drinking == 0}">마시지않음</c:if>
				<c:if test="${idealType.i_drinking == 1}">가끔마심</c:if>
				<c:if test="${idealType.i_drinking == 2}">어느정도 즐기는편</c:if>
				<c:if test="${idealType.i_drinking == 3}">술자리를 즐김</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>