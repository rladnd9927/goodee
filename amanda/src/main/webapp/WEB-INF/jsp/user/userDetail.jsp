<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<%
	Date birthday = new Date();
	request.setAttribute("birthday", birthday);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="joinwrapper">
			<table class="join02">
				<thead>
				 <tr>
					<th colspan="6">회원프로필</th>
				 </tr>
				</thead>
				<tbody>
				 <%-- <tr>
				 	<th>사진</th>
				 	<td><img src="../fileupload/${userProfile.m_pictureUrl1}" alt="회원사진"></td>
				 </tr> --%>
				 <tr>
				 	<th>닉네임</th>
				 	<td>${userProfile.m_nickname}</td>
				 	<th>직업</th>
				 	<td>${userProfile.m_nickname}</td>
				 </tr>
				 <tr>
				 	<th>학교</th>
				 	<td>${userProfile.m_school}</td>
				 	<th>전공</th>
				 	<td>${userProfile.m_major}</td>
				 </tr>
				 <tr>
				 	<th>지역</th>
				 	<td>${userProfile.m_area}</td>
				 	<th>생년월일</th>
				 	<td>${userProfile.m_birthday}</td>
				 </tr>
				 <tr>
				 	<th>키</th>
				 	<td>${userProfile.m_height}</td>
				 	<th>혈액형</th>
				 	<td>
				 		<c:if test="${userProfile.m_bloodtype==0}" >A</c:if>
				 		<c:if test="${userProfile.m_bloodtype==1}" >B</c:if>
				 		<c:if test="${userProfile.m_bloodtype==2}" >AB</c:if>
				 		<c:if test="${userProfile.m_bloodtype==3}" >O</c:if>
				 	</td>
				 </tr>
				 <tr>
				 	<th>체형</th>
				 	<td>
				 		<c:if test="${userProfile.m_bodytype==0}">마름</c:if>
				 		<c:if test="${userProfile.m_bodytype==1}">슬림 탄탄</c:if>
				 		<c:if test="${userProfile.m_bodytype==2}">보통</c:if>
				 		<c:if test="${userProfile.m_bodytype==3}">통통한</c:if>
				 		<c:if test="${userProfile.m_bodytype==4}">살짝볼륨</c:if>
				 		<c:if test="${userProfile.m_bodytype==5}">글래머</c:if>
				 	</td>
				 	<th>종교</th>
				 	<td>
				 		<c:if test="${userProfile.m_religion==0}" >종교없음</c:if>
				 		<c:if test="${userProfile.m_religion==1}" >기독교</c:if>
				 		<c:if test="${userProfile.m_religion==2}" >불교</c:if>
				 		<c:if test="${userProfile.m_religion==3}" >천주교</c:if>
				 		<c:if test="${userProfile.m_religion==4}" >원불교</c:if>
				 		<c:if test="${userProfile.m_religion==5}" >이슬람교</c:if>
				 		<c:if test="${userProfile.m_religion==6}" >유교</c:if>
				 	</td>
				 </tr>
				 <tr>
				 	<th>음주</th>
				 	<td>
				 		<c:if test="${userProfile.m_drinking==0}">마시지 않음</c:if>
				 		<c:if test="${userProfile.m_drinking==1}">가끔 마심</c:if>
				 		<c:if test="${userProfile.m_drinking==2}">어느정도 즐기는 편</c:if>
				 		<c:if test="${userProfile.m_drinking==3}">술자리를 즐김</c:if>
				 	</td>
				 	<th>성격</th>
				 	<td>
				 		<c:if test="${userProfile.m_character==0}">지적인</c:if>
				 		<c:if test="${userProfile.m_character==1}">차분한</c:if>
				 		<c:if test="${userProfile.m_character==2}">유머있는</c:if>
				 		<c:if test="${userProfile.m_character==3}">낙천적인</c:if>
				 		<c:if test="${userProfile.m_character==4}">내향적인</c:if>
				 		<c:if test="${userProfile.m_character==5}">외향적인</c:if>
				 		<c:if test="${userProfile.m_character==6}">감성적인</c:if>
				 		<c:if test="${userProfile.m_character==7}">상냥한</c:if>
				 		<c:if test="${userProfile.m_character==8}">귀여운</c:if>
				 		<c:if test="${userProfile.m_character==9}">열정적인</c:if>
				 		<c:if test="${userProfile.m_character==10}">듬직한</c:if>
				 		<c:if test="${userProfile.m_character==11}">개성있는</c:if>
				 	</td>
				 </tr>
				</tbody>
			</table>
			<br />
<!-- 			<div class="joinbutton">
				<input type="reset" class="jb" value="리셋"> 
				<input type="submit" class="jb" value="회원가입">
			</div> -->
		</div>
</body>
</html>