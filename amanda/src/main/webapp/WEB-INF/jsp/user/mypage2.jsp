<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%-- /WebContent/WEB-INF/jsp/board/detail.jsp --%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����������</title>
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
<h2>${user.m_name} ���� ������</h2>&nbsp;&nbsp;&nbsp;
<table>
<tr>
   <td><img alt="�̹���"></td>
<tr>
   <th>�̸��� </th>
   <td>${user.m_email}</td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;�̸� </th>
   <td>${user.m_name}</td>
</tr>
<tr>
   <th>�г���: </th>
   <td>${userProfile.m_nickname}</td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;���� </th>
    <td>${userProfile.m_nickname}</td>
</tr>   
<tr>
    <th>&nbsp;&nbsp;&nbsp;�б� </th>
    <td>${userProfile.m_school}</td>
</tr>
<tr>
    <th>&nbsp;&nbsp;&nbsp;���� </th>
    <td>${userProfile.m_major}</td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;���� </th>
   <td>${userProfile.m_area}</td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ű </th>
   <td>${userProfile.m_height}</td>
</tr>
<tr>
   <th>������ </th>
    <td>
       <c:if test="${userProfile.m_bloodtype==0}" >A</c:if>
       <c:if test="${userProfile.m_bloodtype==1}" >B</c:if>
       <c:if test="${userProfile.m_bloodtype==2}" >AB</c:if>
       <c:if test="${userProfile.m_bloodtype==3}" >O</c:if>
    </td>
</tr>
<tr>
    <th>&nbsp;&nbsp;&nbsp;ü�� </th>
    <td>
       <c:if test="${userProfile.m_bodytype==0}">����</c:if>
       <c:if test="${userProfile.m_bodytype==1}">���� źź</c:if>
       <c:if test="${userProfile.m_bodytype==2}">����</c:if>
       <c:if test="${userProfile.m_bodytype==3}">������</c:if>
       <c:if test="${userProfile.m_bodytype==4}">��¦����</c:if>
       <c:if test="${userProfile.m_bodytype==5}">�۷���</c:if>
    </td>
</tr>
<tr>
   <th>&nbsp;&nbsp;&nbsp;���� </th>
   <td>   
       <c:if test="${userProfile.m_religion==0}" >��������</c:if>
       <c:if test="${userProfile.m_religion==1}" >�⵶��</c:if>
       <c:if test="${userProfile.m_religion==2}" >�ұ�</c:if>
       <c:if test="${userProfile.m_religion==3}" >õ�ֱ�</c:if>
       <c:if test="${userProfile.m_religion==4}" >���ұ�</c:if>
       <c:if test="${userProfile.m_religion==5}" >�̽�����</c:if>
       <c:if test="${userProfile.m_religion==6}" >����</c:if>
    </td>
</tr>
<tr>
    <th>&nbsp;&nbsp;&nbsp;���� </th>
    <td>
       <c:if test="${userProfile.m_drinking==0}">������ ����</c:if>
       <c:if test="${userProfile.m_drinking==1}">���� ����</c:if>
       <c:if test="${userProfile.m_drinking==2}">������� ���� ��</c:if>
       <c:if test="${userProfile.m_drinking==3}">���ڸ��� ���</c:if>
    </td>
</tr>
<tr>
    <th>&nbsp;&nbsp;&nbsp;���� </th>
    <td>
       <c:if test="${userProfile.m_character==0}">������</c:if>
       <c:if test="${userProfile.m_character==1}">������</c:if>
       <c:if test="${userProfile.m_character==2}">�����ִ�</c:if>
       <c:if test="${userProfile.m_character==3}">��õ����</c:if>
       <c:if test="${userProfile.m_character==4}">��������</c:if>
       <c:if test="${userProfile.m_character==5}">��������</c:if>
       <c:if test="${userProfile.m_character==6}">��������</c:if>
       <c:if test="${userProfile.m_character==7}">�����</c:if>
       <c:if test="${userProfile.m_character==8}">�Ϳ���</c:if>
       <c:if test="${userProfile.m_character==9}">��������</c:if>
       <c:if test="${userProfile.m_character==10}">������</c:if>
       <c:if test="${userProfile.m_character==11}">�����ִ�</c:if>
    </td>
</tr>
</table>
<br/>
&nbsp;&nbsp;&nbsp;<input type="button" value="������ ����" onclick="" class="btn1">
<br/>
</c:if>
</c:forEach>
</div>

<div class="profile2">
<div class="blank"></div>
<table class="join02">
   <thead>
   <tr>
      <th >���� ���ƿ��� ���</th>
      <th >���ƿ�</th>         
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
      <td align="left"><a href="likelist.do?userNum=${chat.y_number}"><img src="../img/Heart2.png" alt="���ƿ�" width="20px"/></a></td>
   </c:if>
   <c:if test="${chat.m_like==1}">
      <td align="left">${user.m_name}</td>
      <td align="left"><a href="likelist.do?userNum=${chat.y_number}">�������ƿ䢾</a></td>
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
      <th colspan="4">���� ���ƿ��� ���</th>
      <th colspan="4">���ƿ�</th>         
   </tr>
   </thead>
   <tbody>
   <c:forEach items="${youpage}" var="chat">
   <tr>
         <c:forEach items="${userList}" var="user">
         <c:if test="${chat.m_number == user.m_number}">
   <c:if test="${chat.m_like!=1}">
      <td align="left">${user.m_name}</td>
      <td align="left"><a href="likelist.do?userNum=${chat.m_number}">���ƿ䢾</a></td>
   </c:if>
   <c:if test="${chat.m_like==1}">
      <td align="left">${user.m_name}</td>
      <td align="left"><a href="nolist.do?userNum=${chat.m_number}">�������ƿ䢾</a></td>
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
            <th>���� ���ƿ��� ���</th>
            <th>���ƿ�</th>
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
                           <img src="../img/Heart2.png" alt="���ƿ�" width="20px" /></a></td>
                     </c:if>
                     <c:if test="${chat.m_like==1}">
                        <td align="left">${user.m_name}</td>
                        <td align="left">
                           <a href="likelist.do?userNum=${chat.y_number}">�������ƿ䢾</a></td>
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
            <th colspan="4">���� ���ƿ��� ���</th>
            <th colspan="4">���ƿ�</th>
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
                           href="likelist.do?userNum=${chat.m_number}">���ƿ䢾</a></td>
                     </c:if>
                     <c:if test="${chat.m_like==1}">
                        <td align="left">${user.m_name}</td>
                        <td align="left"><a
                           href="nolist.do?userNum=${chat.m_number}">�������ƿ䢾</a></td>
                     </c:if>
                  </c:if>
               </c:forEach>
            </tr>
         </c:forEach>
      </tbody>
   </table>


</body>
</html>