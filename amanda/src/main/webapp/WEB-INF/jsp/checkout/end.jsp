<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑완료</title>
</head>
<body>
<font color="green">배송받을 곳</font>
<table>
	<tr><td>구매자ID</td><td>${loginUser.userId}</td>	</tr>
	<tr><td>이름</td><td>${loginUser.userName}</td></tr>
	<tr><td>우편번호</td><td>${loginUser.postCode}</td></tr>
	<tr><td>주소</td><td>${loginUser.address}</td></tr>
	<tr><td>번화번호</td><td>${loginUser.phoneNo}</td></tr>
	<tr><td>이메일</td><td>${loginUser.email}</td></tr>
</table>
<br>

<font color="green">주문 상품 목록</font>
<table>
	<tr><th>상품명</th><th>가격</th><th>수량</th><th>소계</th></tr>
	<c:forEach items="${sale.saleItemList}" var="saleItem">
		<tr>
			<td>${saleItem.item.name}</td>
			<td>${saleItem.item.price}</td>
			<td>${saleItem.quantity}개</td>
			<td>${saleItem.quantity * saleItem.item.price}원</td>
		</tr>
	</c:forEach>
</table>
<h2>주문해 주셔서 감사합니다.</h2>
<h2>총 주문금액: ${totalAmount}원</h2>
<a href="../item/list.shop">목록 보기</a>
</body>
</html>