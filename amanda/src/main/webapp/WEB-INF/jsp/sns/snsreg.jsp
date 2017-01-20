<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@include file ="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SNS에 글 작성하기</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
  </head>
<body>
<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul class="lead nav nav-justified nav-pills">
              <li>
                <a href="snsmain.do">나의 SNS</a>
              </li>
              <li class="active">
                <a href="snsreg.do">글쓰기</a>
              </li>
              <li>
                <a href="othersnslist.do">내가 좋아요한 회원들 소식</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
	<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <form:form modelAttribute="sns" action = "snswrite.do" enctype="multipart/form-data" role="form" class="text-left">
              <form:hidden path="m_number"/>
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">제목</label>
                <form:input path="sns_subject" class="form-control" placeholder="제목을 입력하세요"/>
				<br>
					<font color="red">
						<form:errors path="sns_subject"/>
					</font>
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">본문</label>
                <form:textarea path="sns_content" cols="67" rows="15" class="form-control" placeholder="본문을 입력하세요"/>
				<br>
					<font color="red">
						<form:errors path="sns_content"/>
					</font>
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputEmail1">파일첨부</label>
                <input type="file" name="sns_picture">
              </div>
              <button type="submit" class="btn btn-block btn-primary btn-sm">등록하기</button>
            </form:form>
          </div>
        </div>
      </div>
    </div>
</body>
</html>