<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../decorator/css/style.css">
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
</script>
<title>회원목록</title>
</head>
<body>
<div class="container">
	<div class="searchuser">
		<form action="userList.do" method = "post" name="f">
		 회원 검색:
			<select name="column">
				<option selected="selected" value="">선택하세요</option>
				<option value="m_name">이름</option>
				<option value="m_bodytype">체형</option>
			</select>
			<script type="text/javascript">
				document.f.column.value="${param.column}";
			</script>
			<input type="text" name="find" size="50" value="${find}">
			<input type="submit" value="검색">
		</form>
	</div>

	
	<h2>명예의 전당</h2>
	<div class="userwrapper">
		<table class="join02">
			<thead>
			<tr><th colspan="7">회원목록</th></tr>
			</thead>
			<tbody>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>나이</th>
				
			</tr>

			</tbody>
		</table>

	</div>
	<hr/>
	<div class="userwrapper">
		<h2>회원리스트</h2>
		<table class="join02">
		<thead>
			<tr><th colspan="4">회원목록</th></tr>
			</thead>
		<tbody >
			<tr>
				<th>성별</th>
				<th>이름</th>
				<th>상세정보</th>
				<th>좋아요</th> 
			</tr>
			<c:forEach items="${userCount}" var = "user">
			<c:if test="${sessionScope.USER.m_email != user.m_email}">
				<tr >
					<td><c:if test="${user.gender == 0}">남자</c:if>
						<c:if test="${user.gender == 1}">여자</c:if>
					</td>
					<td >${user.m_name}</td>					
					<td><input type="button" onclick="location.href='userDetail.do?m_number=${user.m_number}'" class="white" value="상세정보"></a></td>
					<td><a href="likelist.do?userNum=${user.m_number}" class="ovalbutton"><img src="../img/Heart.png" alt="좋아요" width="20px"/></a></td>
				</tr>
				</c:if>
			</c:forEach>
	</table>
</div>
<hr>
<h2>소개팅</h2>
	<input type="button" value="내 이상형" onclick="location.href='idealtype.do'" class="btn1">
	<div class="userwrapper">
		<table class="join02">
			<thead>
				<tr>
					<th colspan="7">회원목록</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>닉네임</th>
					<th>키</th>
					<th>체형</th>
					<th>성격</th>
					<th>종교</th>
					<th>흡연</th>
					<th>음주</th>
				</tr>
				<c:forEach items="${idealList}" var = "ideal">
					<tr>
						<td>${ideal.m_nickname}</td>
						<td>${ideal.m_height}</td>
						<td>
							<c:if test="${ideal.m_bodytype == 0}">마름</c:if>
							<c:if test="${ideal.m_bodytype == 1}">슬림탄탄</c:if>
							<c:if test="${ideal.m_bodytype == 2}">보통</c:if>
							<c:if test="${ideal.m_bodytype == 3}">통통한</c:if>
							<c:if test="${ideal.m_bodytype == 4}">살짝볼륨</c:if>
							<c:if test="${ideal.m_bodytype == 5}">글래머</c:if>
						</td>
						<td>
							<c:if test="${ideal.m_character == 0}">지적인</c:if>
							<c:if test="${ideal.m_character == 1}">차분한</c:if>
							<c:if test="${ideal.m_character == 2}">유머있는</c:if>
							<c:if test="${ideal.m_character == 3}">낙천적인</c:if>
							<c:if test="${ideal.m_character == 4}">내향적인</c:if>
							<c:if test="${ideal.m_character == 5}">외향적인</c:if>
							<c:if test="${ideal.m_character == 6}">감성적인</c:if>
							<c:if test="${ideal.m_character == 7}">상냥한</c:if>
							<c:if test="${ideal.m_character == 8}">귀여운</c:if>
							<c:if test="${ideal.m_character == 9}">열정적인</c:if>
							<c:if test="${ideal.m_character == 10}">듬직한</c:if>
							<c:if test="${ideal.m_character == 11}">개성있는</c:if>
						</td>
						<td>
							<c:if test="${ideal.m_religion == 0}">종교없음</c:if>
							<c:if test="${ideal.m_religion == 1}">기독교</c:if>
							<c:if test="${ideal.m_religion == 2}">불교</c:if>
							<c:if test="${ideal.m_religion == 3}">천주교</c:if>
							<c:if test="${ideal.m_religion == 4}">원불교</c:if>
							<c:if test="${ideal.m_religion == 5}">이슬람교</c:if>
							<c:if test="${ideal.m_religion == 6}">유교</c:if>
						</td>
						<td>
							<c:if test="${ideal.m_smoking == 0}">비흡연</c:if>
							<c:if test="${ideal.m_smoking == 1}">흡연</c:if>
						</td>
						<td>
							<c:if test="${ideal.m_drinking == 0}">마시지않음</c:if>
							<c:if test="${ideal.m_drinking == 1}">가끔마심</c:if>
							<c:if test="${ideal.m_drinking == 2}">어느정도 즐기는편</c:if>
							<c:if test="${ideal.m_drinking == 3}">술자리를 즐김</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div> 
</body>
</html>
