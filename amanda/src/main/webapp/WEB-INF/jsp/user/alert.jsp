<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/WEB-INF/jsp/dummyLogin.jsp --%>
<script>
   alert("이미 중복된 아이디 입니다.");
   location.href="${pageContext.request.contextPath}/user/joinForm1.do";
</script> 