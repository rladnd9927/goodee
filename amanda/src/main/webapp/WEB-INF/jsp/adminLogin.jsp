<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	alert("관리자만 거래 가능합니다.");
	location.href="${pageContext.request.contextPath}/user/mypage.shop?id=${USER.userId}";
</script>