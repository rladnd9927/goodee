<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/WEB-INF/jsp/board/detail.jsp --%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
     // 0.3초 간격으로
   	setInterval(sendms, 300);
    
    $("#content").scrollTop($("#content")[0].scrollHeight);
    $('#ms').focus();
    
    $('#submit').on("click", function() {
    	sendms();
    });
     
});


function sendms() {
	$.ajax({
        method: "POST",
        url: "../detailAjax.do?num=" + $("#num").val(),
        cache: false,
        async: false,
        success: function(data){
        	//console.log(data.con);
        	$('#content').html(data.con);
		    $("#content").scrollTop($("#content")[0].scrollHeight);
        }
       /*,  error : function() {
        	alert('error');
        } */
    });
}



</script>
<title>채팅방</title>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td width="10%">상대방</td>
		<c:forEach items="${chat}" var="chat">
		<c:if test="${chat.m_number==USER.m_number}">
		<td align="right">${chat.y_number}</td> 
		</c:if>
		<c:if test="${chat.y_number==USER.m_number}">
		<td align="right">${chat.m_number}</td>    
		</c:if>
		</c:forEach>
	</tr> 
	<tr>
		<td colspan="2">
			<table width="100%" height="250">
				<tr><td>
				${USER.m_name}
				<div style="overflow: auto; width: 1000px; height: 500px;" id="content">${chat2.c_subject}</div></td></tr>
			</table>
		</td>
	</tr>
	<tr> 
		<td colspan="2">
			<div id="board">
			<form action="send.do" method="post" name="sendform">
			<br>
			<c:forEach items="${chat}" var="chat">
			<input type="hidden" name="myId" value="${USER.m_name}"/>
			<c:if test="${chat.m_number==USER.m_number}">
			<input type="hidden" name="userId" value="${chat.y_number}"/> 
			</c:if>
			<c:if test="${chat.y_number==USER.m_number}">
			<input type="hidden" name="userId" value="${chat.m_number}"/>
			</c:if> 
			<input type="hidden" name="num" id=num value="${chat.c_number}"/>
			</c:forEach>
			<input type="text" name="ms" id="ms"><input type="submit" value="전송" id="submit"> 
			<br>  
			</form> 
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<%-- <a href="replyForm.shop?num=${board.num}">[답변]</a>
			<a href="updateForm.shop?num=${board.num}">[수정]</a>
			<a href="deleteForm.shop?num=${board.num}">[삭제]</a> --%>
			<a href="chatlist.do">[목록]</a>
		</td>
	</tr>
</table>
</body>
</html>