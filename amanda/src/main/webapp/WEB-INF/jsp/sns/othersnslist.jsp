<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>좋아요 한 회원들의 게시물</title>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../decorator/css/style.css">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
	<style type="text/css">
#bgc{
	background-color :  #ffffff;
}
#makepopup{
	visibility : hidden;
}
#fixedSize{
	width : 200px;
	height : 200px;
}
#close {
	cursor: pointer;
}

#ajaxprepend {
	display: none;
	position : absolute;
	left : 10px;
	top : 100px;
	vertical-align: top;
	width: 100%;
	height: 100%;
	z-index: 1000;
}
#prev{
	cursor : pointer;
}
#next{
	cursor : pointer;
}
.popupImg{
	width : 400px;
	height : 400px;
}
</style>

<script type="text/javascript"
	src="${contextPath}/decorator/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("a#clickAtag").bind("click", function(event){
		event.preventDefault();
		var sns_no = $(this).parents().parents().children("#snsno").val();
		var m_number = $(this).parents().parents().children("#mnumber").val();
		ajax(sns_no, m_number);
	});

});

function ajax(sns_no, m_number) {
	$.ajax({url:"snsdetail.do",
		data:"sns_no="+sns_no+"&m_number="+m_number, //현재, 데이터를 서버로 보내는 것까지는 됨..
		success : function(data) {
			makePopup(data); //해당 앵커태그 눌리면 팝업형식으로 띄우기 
		},
		 error : function(xhr, status, error){
                alert(" 서버를 불러오는데 실패 했습니다. : "+xhr.status + "\n status :" + status + "\n error : "+error);
        }
	});
}

function makePopup(json){ // json이라는 스트링 배열을 받는다.
	
	var data1 = eval("("+json[0]+")"); //json형태 ({,,,})로 들어온것을 요소별로 나눠서 파싱해주는 역할을 eval()이 한다.
	var data2 = eval("("+json[1]+")"); //data1 = SNS게시글의 정보, data2 = 게시글에 대한 댓글의 정보
	//data1 (게시물)의 정보는 아래 picturesrc변수에 불러오는 방식으로 부르고, data2(댓글)정보는 배열의 형태로 들어오므로, for문을 이용하여 data2[i].~~~의 형태로 뽑아낸다.
	var loginUserNum = $("#loginuser").val();
	var picturesrc = "../fileupload/"+data1.fileUrl; //게시물 사진주소
	var replyCnt = data2.length; //댓글의 갯수
	var html = "";
 	
	html += "<div class=\"section\" id=\"ajaxprepend\" tabindex=\"0\">                                                                                                                                     ";
    html += "  <div class=\"container\">                                                                                                                                 ";
    html += "    <div class=\"row\" id=\"bgc\">                                                                                                                                     ";
    html += "      <div class=\"col-md-8\">                                                                                                                              ";
    html += "        <div data-interval=\"false\" id=\"fullcarousel-example\" class=\"carousel slide\" data-ride=\"carousel\">" ;
    html += "          <div class=\"carousel-inner\">                                                                                                                    ";
    html += "            <div class=\"item active\">                                                                                                                     ";
    html += "              <img src="+picturesrc+" class= \"popupImg\">";
    html += "            </div>                                                                                                                                        ";
    html += "          </div>                                                                                                                                          ";
    html += "        </div>                                                                                                                                            ";
    html += "      </div>                                                                                                                                              ";
    html += "      <div class=\"col-md-4\">                                                                                                                              ";
   	html += " 		<i id = \"close\" class=\"fa fa-2x fa-fw fa-times-circle pull-right text-muted\"></i>";
    html += "        <div class=\"row\">                                                                                                                                 ";
    html += "          <h3 class=\"text-primary\">"
    html += "이 게시물에 대한 "+replyCnt+"개 의 댓글</h3>"
    html += "        </div>"
    html += "        <hr>                                                                                                                                              ";
    html += "        <div class=\"replyWrapper\">                                                                                                                        ";
    for(var i = 0; i < replyCnt; i++){
    html += "          <div class=\"replyDetail\">                                                                                                                       ";
    html += "            <ul>                                                                                                                                          ";
    html += "              <li id=\"replyTitle\">                                                                                                                        ";
    html += "                <h5 class=\"text-primary\">"+data2[i].m_nickname+"님의 댓글</h5>";
    html += "              </li>                                                                                                                                       ";
    html += "              <h6>"+data2[i].r_content+"</h6>                                                                                                                                 ";
    if(data2[i].m_number == loginUserNum){
    html += "            	<a href=\"javascript:if(confirm('지우시겠습니까?')) document.location.href='replydelete.do?sns_no="+data1.sns_no+"&m_number="+data2[i].m_number+"&r_num="+data2[i].r_num+"'\">[댓글 삭제]</a>";
    }
    html += "            </ul>                                                                                                                                         ";
    html += "          </div>                                                                                                                                          ";
    }
    html += "        </div>                                                     ";
    html += " 		<hr>                                                              ";
    html += " 		<div class=\"custom-search-form input-group input-group-sm\">       ";
    html += "   			<input type=\"text\" class=\"form-control\" placeholder=\"Type the comment\" id = \"comment\">";
    html += "   			<input type=\"hidden\" id = \"currsnsnum\" value =\""+data1.sns_no+"\">";
    html += "   			<input type=\"hidden\" id = \"currmembernum\" value =\""+data1.m_number+"\">";
    html += "   			<span class=\"input-group-btn\"> ";
    html += "     		<button class=\"btn btn-default\" type=\"button\" onclick=\"replyReg()\">";
    html += "       <i class=\"fa fa-comment-o\"></i>                                ";
    html += "     </button>                                                     ";
    html += "   </span>                                                         ";
    html += " </div>                                                            ";
    html += " </div>                                                            ";
    html += " </div>                                                            ";
  	html += "  <div class=\"row\">                                                                ";
  	html += "  <div class=\"col-md-12\">                                                          ";
  	html += "    <div class=\"well\">                                                             ";
  	html += "      <h2 class=\"text-center\">제목 : "+data1.sns_subject+"</h2>                                                             ";
  	html += "      <p class=\"lead\">내용 :<br>"+data1.sns_content+"</p>                                                              ";
  	html += "    </div>                                                                         ";
  	html += "  </div>                                                                           ";
  	html += "</div>                                                                             ";
    html += " </div>                                                            ";
    html += " </div>                                                            ";

    $("#makePopup").html(html);
	$("#ajaxprepend").fadeIn(); //.ajaxprepend : 가장 바깥 div의 클래스명. css설정 해주어야 함.
	$("#ajaxprepend").trigger("focus");
	$("#close").off("click");
	$("#close").on("click", function () {
		$("#ajaxprepend").fadeOut(function () {
			$("#ajaxprepend").remove();
		});
	});
	
}		
function replyReg(){
	var r_content = $("#comment").val();
	var sns_no = $("#currsnsnum").val();
	var m_number = $("#currmembernum").val();
	$.ajax({
		url : "replyreg.do",
		type : "GET",
		data : "sns_no="+sns_no+"&r_content="+r_content+"&m_number="+m_number,
		success : function(data){
			makePopup(data);
		},
		error : function(xhr, status, error){
            alert(" 서버를 불러오는데 실패 했습니다. : "+xhr.status + "\n status :" + status + "\n error : "+error);
    	}
	});
}
</script>
</head>


<body data-spy="scroll">
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="lead nav nav-justified nav-pills">
						<li><a href="snsmain.do">나의 SNS</a></li>
						<li class="active"><a href="snsreg.do">글쓰기</a></li>
						<li><a href="othersnslist.do">내가 좋아요한 회원들 소식</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<hr>
				</div>
			</div>
		</div>
	</div>
	
     
     
	<div class="section">
		<%--게시물 섹션 시작 (컨테이너) --%>
		<c:if test="${empty snsList}">
			<div id="fullcarousel-example" data-interval="false"
				class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="item">
						<img
							src="https://unsplash.imgix.net/photo-1423347834838-5162bb452ca7?w=1024&amp;q=50&amp;fm=jpg&amp;s=c255e589621f06513c1d123c7323fe9c">
						<div class="carousel-caption">
							<h1>등록된 게시물이 없습니다.</h1>
						</div>
					</div>
					<div class="item active">
						<img
							src="https://unsplash.imgix.net/photo-1421986527537-888d998adb74?w=1024&amp;q=50&amp;fm=jpg&amp;s=e633562a1da53293c4dc391fd41ce41d">
						<div class="carousel-caption">
							<h1>등록된 게시물이 없습니다.</h1>
						</div>
					</div>
					<div class="item">
						<img
							src="https://ununsplash.imgix.net/reserve/RONyPwknRQOO3ag4xf3R_Kinsey.jpg?w=1024&amp;q=50&amp;fm=jpg&amp;s=c8e85e7825f6c74ff13321833a9bc28d">
						<div class="carousel-caption">
							<h1>등록된 게시물이 없습니다.</h1>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#fullcarousel-example"
					data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a> <a
					class="right carousel-control" href="#fullcarousel-example"
					data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
			</div>
		</c:if>
		<c:if test="${not empty snsList}">
			<c:forEach items="${snsList}" var="sns">
			<div id = "makePopup">
			</div>
				<div class="section">
					<%--게시물섹션 반복구간 시작 --%>
					<div class="container">
						<div class="row">
							<input type="hidden" id="snsno" value="${sns.sns_no }" /> <input
								type="hidden" id="mnumber" value="${sns.m_number }" />
							<input type="hidden" id="loginuser" value="${loginUser.m_number}" /> 
							<c:if test="${sns.fileUrl ne 'nothing'}">
								<div class="col-md-4">
									<img src="../fileupload/${sns.fileUrl}"
										class="img-circle img-responsive" id="fixedSize">
								</div>
							</c:if>
							<div class="col-md-8">
								<h5 class="text-muted text-right">
									<c:if test="${sns.datetoString == today}">
										<%--SNS객체의 property인 datetoString을 이용해 오늘 날짜인지 비교 --%>
          			${sns.userProfile.m_nickname}님이 오늘 <f:formatDate value="${sns.sns_date}" pattern="a hh:mm" />&nbsp;에 등록
       			</c:if>
									<c:if test="${sns.datetoString != today}">
										${sns.userProfile.m_nickname}님이 <f:formatDate value="${sns.sns_date}"
											pattern="yyyy-MM-dd a hh:mm" />&nbsp;에 등록
       			</c:if>
								</h5>
								<h1 class="text-primary">
									<a href="javascript:void(0)" id="clickAtag">${sns.sns_subject}</a>
								</h1>

								<p>${sns.sns_content}</p>
								<div class="col-md-12 text-right">
									<a href="javascript:void(0);" id="clickAtag"><i class="fa fa-3x fa-comments-o fa-fw text-success"></i></a> 
									
            					</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<%--문단구분선 --%>
					<div class="row">
						<div class="col-md-12">
							<hr>
						</div>
					</div>
				</div>



			</c:forEach>
		</c:if>
	</div>

	<script type="text/javascript">
            $(function(){
                // This code is not even almost production ready. It's 2am here, and it's a cheap proof-of-concept if anything.
                $(".img-modal-btn.right").on('click', function(e){
                    e.preventDefault();
                    cur = $(this).parent().find('img:visible()');
                    next = cur.next('img');
                    par = cur.parent();
                    if (!next.length) { next = $(cur.parent().find("img").get(0)) }
                    cur.addClass('hidden');
                    next.removeClass('hidden');
                    
                    return false;
                })
                
                $(".img-modal-btn.left").on('click', function(e){
                    e.preventDefault();
                    cur = $(this).parent().find('img:visible()');
                    next = cur.prev('img');
                    par = cur.parent();
                    children = cur.parent().find("img");
                    if (!next.length) { next = $(children.get(children.length-1)) }
                    cur.addClass('hidden');
                    next.removeClass('hidden');
                    
                    return false;
                })
            
            });
        </script>

</body>
</html>