<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
  alert("중복심사는 불가능 합니다.");
  location.href="${pageContext.request.contextPath}/user/evaluate.do";
</script>