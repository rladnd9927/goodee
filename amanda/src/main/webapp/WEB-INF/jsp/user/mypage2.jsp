<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%-- /WebContent/WEB-INF/jsp/board/detail.jsp --%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>마이페이지</title>
<style type="text/css">
.profile2{
   width: 600px;
   height:500px;
   display: inline-block;
}
.profile3{
   width: 600px;
   height:500px;
   display: inline-block;
   left: 30%;
   top: 50%;
}
.profile{
   width: 250px;
   height:100%;
   position: absolute;
   left:1%;
   margin-left: 0px;
   margin-top: 15px;
   border: 0px;
   border-right: 1px;
   border-right-style: solid;
   border-right-color: silver;
}
.profile th{
   width: 55px;
}
.memberupdate{
   position: absolute;
   bottom: 25%;
}


</style>
</head>
<body>
<div class="container">
<div class="profile">
<c:forEach items="${userList}" var="user">
<c:if test="${sessionScope.USER.m_number == user.m_number}">
<h2>${user.m_name} 님의 프로필</h2>&nbsp;&nbsp;&nbsp;
<table>
<tr>
   <td><img alt="이미지"></td>
<tr>
   <th>이메일 </th>
   <td>${user.m_email}</td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;이름 </th>
   <td>${user.m_name}</td>
</tr>
<tr>
   <th>닉네임: </th>
   <td>${userProfile.m_nickname}</td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;직업 </th>
    <td>${userProfile.m_nickname}</td>
</tr>   
<tr>
    <th>&nbsp;&nbsp;&nbsp;학교 </th>
    <td>${userProfile.m_school}</td>
</tr>
<tr>
    <th>&nbsp;&nbsp;&nbsp;전공 </th>
    <td>${userProfile.m_major}</td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;지역 </th>
   <td>${userProfile.m_area}</td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;키 </th>
   <td>${userProfile.m_height}</td>
</tr>
<tr>
   <th>혈액형 </th>
    <td>
       <c:if test="${userProfile.m_bloodtype==0}" >A</c:if>
       <c:if test="${userProfile.m_bloodtype==1}" >B</c:if>
       <c:if test="${userProfile.m_bloodtype==2}" >AB</c:if>
       <c:if test="${userProfile.m_bloodtype==3}" >O</c:if>
    </td>
</tr>
<tr>
    <th>&nbsp;&nbsp;&nbsp;체형 </th>
    <td>
       <c:if test="${userProfile.m_bodytype==0}">마름</c:if>
       <c:if test="${userProfile.m_bodytype==1}">슬림 탄탄</c:if>
       <c:if test="${userProfile.m_bodytype==2}">보통</c:if>
       <c:if test="${userProfile.m_bodytype==3}">통통한</c:if>
       <c:if test="${userProfile.m_bodytype==4}">살짝볼륨</c:if>
       <c:if test="${userProfile.m_bodytype==5}">글래머</c:if>
    </td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;종교 </th>
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
    <th>&nbsp;&nbsp;&nbsp;음주 </th>
    <td>
       <c:if test="${userProfile.m_drinking==0}">마시지 않음</c:if>
       <c:if test="${userProfile.m_drinking==1}">가끔 마심</c:if>
       <c:if test="${userProfile.m_drinking==2}">어느정도 즐기는 편</c:if>
       <c:if test="${userProfile.m_drinking==3}">술자리를 즐김</c:if>
    </td>
</tr>
<tr>
    <th>&nbsp;&nbsp;&nbsp;성격 </th>
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
</table>
<br/>
&nbsp;&nbsp;&nbsp;<input type="button" value="프로필 수정" onclick="" class="btn1">
<br/>
</c:if>
</c:forEach>
</div>

<div class="profile2">
<div class="blank"></div>
<table class="join02">
   <thead>
   <tr>
      <th >내가 좋아요한 사람</th>
      <th >좋아요</th>         
   </tr>
   </thead>
   <c:forEach items="${mypage}" var="chat">
   <tbody>
   <tr>
     <c:forEach items="${userList}" var="user"> 
        <c:if test="${chat.y_number == user.m_number}">
   <c:if test="${chat.m_like!=1}"> 
      <td align="left">
         <a href="userDetail.do?m_number=${user.m_number}">${user.m_name}</a>            
      </td>
      <td align="left"><a href="likelist.do?userNum=${chat.y_number}"><img src="../img/Heart2.png" alt="좋아요" width="20px"/></a></td>
   </c:if>
   <c:if test="${chat.m_like==1}">
      <td align="left">${user.m_name}</td>
      <td align="left"><a href="likelist.do?userNum=${chat.y_number}">서로좋아요♥</a></td>
   </c:if>
         </c:if>
      </c:forEach>
   </tr>
      </tbody>
   </c:forEach> 
</table>
</div>
<br/>
<div class="profile3">
<table class="join02">
   <thead>
   <tr>
      <th colspan="4">나를 좋아요한 사람</th>
      <th colspan="4">좋아요</th>         
   </tr>
   </thead>
   <tbody>
   <c:forEach items="${youpage}" var="chat">
   <tr>
         <c:forEach items="${userList}" var="user">
         <c:if test="${chat.m_number == user.m_number}">
   <c:if test="${chat.m_like!=1}">
      <td align="left">${user.m_name}</td>
      <td align="left"><a href="likelist.do?userNum=${chat.m_number}">좋아요♥</a></td>
   </c:if>
   <c:if test="${chat.m_like==1}">
      <td align="left">${user.m_name}</td>
      <td align="left"><a href="nolist.do?userNum=${chat.m_number}">서로좋아요♥</a></td>
   </c:if>
         </c:if>
         </c:forEach> 
   </tr>
   </c:forEach>
   </tbody> 
</table>
</div>
</div>
</body> 
   <table class="join02">
      <thead>
         <tr>
            <th>내가 좋아요한 사람</th>
            <th>좋아요</th>
         </tr>
      </thead>
      <c:forEach items="${mypage}" var="chat">
         <tbody>
            <tr>
               <c:forEach items="${userList}" var="user">
                  <c:if test="${chat.y_number == user.m_number}">
                     <c:if test="${chat.m_like!=1}">
                        <td align="left">
                           <a href="userDetail.do?m_number=${user.m_number}">${user.m_name}</a>
                        </td>
                        <td align="left">
                           <a href="likelist.do?userNum=${chat.y_number}">
                           <img src="../img/Heart2.png" alt="좋아요" width="20px" /></a></td>
                     </c:if>
                     <c:if test="${chat.m_like==1}">
                        <td align="left">${user.m_name}</td>
                        <td align="left">
                           <a href="likelist.do?userNum=${chat.y_number}">서로좋아요♥</a></td>
                     </c:if>
                  </c:if>
               </c:forEach>
            </tr>
         </tbody>
      </c:forEach>
   </table>

   <table class="join02">
      <thead>
         <tr>
            <th colspan="4">나를 좋아요한 사람</th>
            <th colspan="4">좋아요</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${youpage}" var="chat">
            <tr>
               <c:forEach items="${userList}" var="user">
                  <c:if test="${chat.m_number == user.m_number}">
                     <c:if test="${chat.m_like!=1}">
                        <td align="left">${user.m_name}</td>
                        <td align="left"><a
                           href="likelist.do?userNum=${chat.m_number}">좋아요♥</a></td>
                     </c:if>
                     <c:if test="${chat.m_like==1}">
                        <td align="left">${user.m_name}</td>
                        <td align="left"><a
                           href="nolist.do?userNum=${chat.m_number}">서로좋아요♥</a></td>
                     </c:if>
                  </c:if>
               </c:forEach>
            </tr>
         </c:forEach>
      </tbody>
   </table>


</body>
</html>