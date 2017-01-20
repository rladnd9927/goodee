<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../decorator/css/style.css">
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
function win_open(){
	var op = "width = 500, height = 540, scrollbars = yes, resizable = yes, left = 50, op = 150";
	window.open("userList.do", "picture", op);
}
</script>
<script>
/* function win_open(){
	var url = "userDtail.do?m_email="+document.f.m_email.value";
	var name="win_open";
	window.oepn(url,"회원 상세 정보","width=300,height=300,tollbar=no,location=no,resizable=yes,left=50,right=50");
    /* var op="width=300, height=250, scrollbars=yes, resizeable=no, left=50, top=10";
    window.open("userDetail.do?m_number="+document.f.m_number.value,"m_number",op)}
*/

$(document).ready(function(){
$('.user_btn').on('click',function(){
$('.in_table').toggle();
});
});
</script>
<title>관리자페이지</title>
</head>
<body>
<div class="container">
	<div class="searchuser">
		<form action="admin.do" method="post" name="f">
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
	<hr/>
	<div class="userwrapper">
		<h2>회원리스트</h2>
		<table class="join02">
		<thead>
			<tr><th colspan="4">회원목록</th></tr>
			</thead>
		<tbody >
			<tr>
				<th>회원번호</th>
				<th>ID/EMAIL</th>
				<th>이름</th>
				<th>성별</th>
				<th colspan="3" align="center">편집항목</th>
			</tr>
			<c:forEach items="${userCount}" var = "user">
			<c:if test="${sessionScope.USER.m_email != user.m_email}">
				<tr>
					<td>${user.m_number}</td>
					<td>${user.m_email}</td>
					<td>${user.m_name}</td>
					<td><c:if test="${user.gender == 0}">남자</c:if>
						<c:if test="${user.gender == 1}">여자</c:if>
					</td>
										
					<td>
						<input type="button" 
							onclick="location.href='updateForm.do?m_number=${user.m_number}'" 
							class="white" value="회원수정"></a></td>
					<td>
						<input type="button" 
							onclick="location.href='deleteForm.do?m_number=${user.m_number}'" 
							class="white" value="회원탈퇴"></a></td>	
					<td>
						<input type="button" 
							onclick="location.href='userDetail.do?m_number=${user.m_number}'" 
							class="white" value="회원페이지"></a></td>		
				</tr>
				</c:if>
			</c:forEach>
	</table>
	</div>
</div>
</body>
</html>
