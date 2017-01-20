<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../decorator/css/style.css">
<title>회원정보 수정</title>
<script type="text/javascript">
	function file1_delete() {
		document.updateform.file4.value = "";
		document.getElementById("file1_desc").innerHTML = "";
	}
	function file2_delete() {
		document.updateform.file5.value = "";
		document.getElementById("file2_desc").innerHTML = "";
	}
	function file3_delete() {
		document.updateform.file6.value = "";
		document.getElementById("file3_desc").innerHTML = "";
	}
</script>
</head>
<body>
	<form:form modelAttribute="userProfile" method="post"
		action="update.do?m_number=${user.m_number}&" enctype="multipart/form-data" name="updateform">
		<input type="hidden" name="file4" value="${userProfile.m_pictureUrl1 }">
		<input type="hidden" name="file5" value="${userProfile.m_pictureUrl2 }">
		<input type="hidden" name="file6" value="${userProfile.m_pictureUrl3 }">
		<input type="hidden" name="user.m_number" value="${user.m_number }">
		<div class="joinwrapper">
			<div class="joinimg">
				<table class="join02">
					<thead>
						<tr>
							<th colspan="6">기본 프로필</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>email</th>
							<td>${user.m_email }</td> 
						</tr>
						<tr>
							<th>비밀번호</th>
							<%-- <td><form:password path="user.m_password" /></td> --%>
							<td><input type="password" name="user.m_password" required></td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${user.m_name }</td>
						</tr>
						<tr>
							<th>성별</th>
							<td><c:if test="${user.gender == 0}">남자</c:if>
								<c:if test="${user.gender == 1}">여자</c:if></td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="join02">
					<thead>
						<tr>
							<th colspan="6">상세 프로필</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="../fileupload/${userProfile.m_pictureUrl1 }" id="pic"
								width="100" height="120">
							<img src="../fileupload/${userProfile.m_pictureUrl2 }" id="pic"
								width="100" height="120">
							<img src="../fileupload/${userProfile.m_pictureUrl3 }" id="pic"
								width="100" height="120"></td>
						</tr>
						<tr>
							<td>
								<c:if test="${not empty userProfile.m_pictureUrl1 }">
									<div id="file_desc1">
										${userProfile.m_pictureUrl1 } 
										<a href="javascript:file1_delete()">[첨부파일삭제]</a>
									</div>
								</c:if> <input type="file" name="m_picture1"> 
								<c:if test="${not empty userProfile.m_pictureUrl2 }">
									<div id="file_desc2">
										${userProfile.m_pictureUrl2 } 
										<a href="javascript:file2_delete()">[첨부파일삭제]</a>
									</div>
								</c:if> <input type="file" name="m_picture2"> 
								<c:if test="${not empty userProfile.m_pictureUrl3 }">
									<div id="file_desc3">
										${userProfile.m_pictureUrl3 } 
										<a href="javascript:file3_delete()">[첨부파일삭제]</a>
									</div>
								</c:if> <input type="file" name="m_picture3">
							</td>
						</tr>
				</table>

				<table class="join02">
					<tr>
						<th>닉네임</th>
						<td><form:input path="m_nickname" /></td>
					</tr>
					<tr>
						<th>학교</th>
						<td><form:input path="m_school" /></td>
					</tr>
					<tr>
						<th>전공</th>
						<td><form:input path="m_major" /></td>
					</tr>
					<tr>
						<th>직업</th>
						<td><form:input path="m_job" /></td>
					</tr>
					<tr>
						<th>지역</th>
						<td><form:input path="m_area" /></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><form:input path="m_birthday" /></td>
					</tr>
					<tr>
						<th>키</th>
						<td><form:input path="m_height" /></td>
					</tr>
					<tr>
						<th>혈액형</th>
						<td><form:select path="m_bloodtype">
								<form:option value="0">A</form:option>
								<form:option value="1">B</form:option>
								<form:option value="2">AB</form:option>
								<form:option value="3">O</form:option>
							</form:select></td>
					</tr>
					<tr>
						<th>종교</th>
						<td><form:select path="m_religion">
								<form:option value="0">종교없음</form:option>
								<form:option value="1">기독교</form:option>
								<form:option value="2">불교</form:option>
								<form:option value="3">천주교</form:option>
								<form:option value="4">원불교</form:option>
								<form:option value="5">이슬람교</form:option>
								<form:option value="6">유교</form:option>
							</form:select></td>
					</tr>
					<tr>
						<th>흡연</th>
						<td><form:radiobutton path="m_smoking" value="0" label="비흡연" />
							<form:radiobutton path="m_smoking" value="1" label="흡연" /></td>
					</tr>
					<tr>
						<th>음주</th>
						<td><form:select path="m_drinking">
								<form:option value="0">마시지 않음</form:option>
								<form:option value="1">가끔 마심</form:option>
								<form:option value="2">어느정도 즐기는편</form:option>
								<form:option value="3">술자리를 즐김</form:option>
							</form:select></td>
					</tr>
					<tr>
						<th>체형</th>
						<td><form:select path="m_bodytype">
								<form:option value="0">마름</form:option>
								<form:option value="1">슬림탄탄</form:option>
								<form:option value="2">보통</form:option>
								<form:option value="3">통통한</form:option>
								<form:option value="4">살짝볼륨</form:option>
								<form:option value="5">글레머</form:option>
							</form:select></td>
					</tr>
					<tr>
						<th>성격</th>
						<td><form:checkbox path="m_character" value="0" label="지적인" />
							<form:checkbox path="m_character" value="1" label="차분한" /> <form:checkbox
								path="m_character" value="2" label="유머있는" /> <form:checkbox
								path="m_character" value="3" label="낙천적인" /> <form:checkbox
								path="m_character" value="4" label="내향적인" /> <form:checkbox
								path="m_character" value="5" label="외향적인" /> <form:checkbox
								path="m_character" value="6" label="감성적인" /> <form:checkbox
								path="m_character" value="7" label="상냥한" /> <form:checkbox
								path="m_character" value="8" label="귀여운" /> <form:checkbox
								path="m_character" value="9" label="열정적인" /> <form:checkbox
								path="m_character" value="10" label="듬직한" /> <form:checkbox
								path="m_character" value="11" label="개성있는" /></td>
					</tr>
					</tbody>
				</table>
				<br />
			</div>
			<br />
			<div class="joinbutton">
				<input type="button" class="jb" value="뒤로가기" onclick="history.back(-1);">
				<input type="submit" class="jb" value="다음">
			</div>
		</div>
	</form:form>
</body>
</html>