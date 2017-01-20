<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이상형 설정</title>
</head>
<body>
<div class="IdealWrapper">
	<h2>이상형 편집</h2>
	<form:form modelAttribute="idealType" method="post" action="idealtype_update.do">
		<table class="join02">
			<tr>
				<th>키</th>
				<td>
					<form:input path="i_height" />
				</td>
			</tr>
			<tr>
				<th>종교</th>
				<td>
					<form:select path="i_religion">
						<form:option value="0">종교없음</form:option>
						<form:option value="1">기독교</form:option>
						<form:option value="2">불교</form:option>
						<form:option value="3">천주교</form:option>
						<form:option value="4">원불교</form:option>
						<form:option value="5">이슬람교</form:option>
						<form:option value="6">유교</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<th>흡연</th>
				<td>
					<form:radiobutton path="i_smoking" value="0" label="비흡연" />
					<form:radiobutton path="i_smoking" value="1" label="흡연" />
				</td>
			</tr>
			<tr>
				<th>음주</th>
				<td>
					<form:select path="i_drinking">
						<form:option value="0">마시지 않음</form:option>
						<form:option value="1">가끔 마심</form:option>
						<form:option value="2">어느정도 즐기는편</form:option>
						<form:option value="3">술자리를 즐김</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<th>체형</th>
				<td>
					<form:select path="i_bodytype">
						<form:option value="0">마름</form:option>
						<form:option value="1">슬림탄탄</form:option>
						<form:option value="2">보통</form:option>
						<form:option value="3">통통한</form:option>
						<form:option value="4">살짝볼륨</form:option>
						<form:option value="5">글레머</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<th>성격</th>
				<td>
					<form:checkbox path="i_character" value="0" label="지적인" />
					<form:checkbox path="i_character" value="1" label="차분한" /> 
					<form:checkbox path="i_character" value="2" label="유머있는" /> 
					<form:checkbox path="i_character" value="3" label="낙천적인" /> 
					<form:checkbox path="i_character" value="4" label="내향적인" /> 
					<form:checkbox path="i_character" value="5" label="외향적인" /> 
					<form:checkbox path="i_character" value="6" label="감성적인" /> 
					<form:checkbox path="i_character" value="7" label="상냥한" /> 
					<form:checkbox path="i_character" value="8" label="귀여운" /> 
					<form:checkbox path="i_character" value="9" label="열정적인" /> 
					<form:checkbox path="i_character" value="10" label="듬직한" /> 
					<form:checkbox path="i_character" value="11" label="개성있는" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정" class="btn1">
					<input type="reset" value="리셋" class="btn1">
				</td>
			</tr>
		</table>
	</form:form>
</div>
</body>
</html>