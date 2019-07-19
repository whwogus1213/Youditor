<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>${row.subject } - 공지사항 - YouDitor</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/resources/vendor/bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<jsp:include page="../module/header.jsp" flush="false" />
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12"  style="background-image:url('/resources/images/notice/notice.jpg'); background-position:50% 60%; font-family: 'Jua', sans-serif; color:white; padding-top:130px; padding-bottom:5%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>공지사항</strong></h1>
			<h5 align="center"><br>YouditoR의 최신 소식과 이벤트를 알려드립니다.</h5>
		</div>
	</div>
	
	<!-- 게시글 상세정보 -->
	<div class="container">
	<script>
		
		//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 noticeboardcontroller 의 deleteVideoBoardPro 메서드 호출
		$(function(){
			$('#deletebtn').click(function(){
				if(confirm("정말 삭제하시겠습니까?")){
					self.location.href = "${path}/noticeboard/deleteNoticeBoardPro?boardId=${row.boardId}";
				}
			});
		});
	</script>
		<div class="col-12" style="margin-left:3%; margin-right:3%; margin-top:3%; margin-bottom:1%">
			<h3><strong>[${row.categoryName}]</strong>&nbsp;&nbsp;${row.subject }</h3>
		</div>
		<div class="row">
			<div class="col-6 row" align="left" style="margin-top:2%">
				<div style="margin-left:12%">
					<strong>작성자</strong>
				</div>
				<div class="dropright" style="margin-left:12%">
					<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer">
						<img src="<spring:url value='/image/${row.picture}'/>" class=" mx-auto rounded-circle" width="30px" height="30px" />
						&nbsp;${row.nickname}
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#" onclick="messagePopup();">
							<i class="far fa-envelope"></i>&nbsp;&nbsp;쪽지 보내기
						</a>
						<script type="text/javascript">
						function messagePopup() {
							var nickname = "${row.nickname }";
							var win = window.open("/message/writePopup.do?nickname=" + nickname, "_blank", 
									"width=650, height=470, left=200, top=200, location=no, menubar=no, resizble=no, scrollbars=no, status=no, titlebar=no, toolbar=no");
						}
						</script>
					</div>
				</div>
			</div>

			<div class="col-4" align="right" style="margin-top:2%">
				<strong>조회수</strong>&nbsp;&nbsp;&nbsp;${row.viewCount }&nbsp;&nbsp;
			</div>
			<div class="col-2" align="right" style="margin-top:2%">
				<strong>게시일</strong>&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${row.reg_date}" pattern="yyyy. MM. dd." />
			</div>
				
		</div>
		<hr>
		<div class="col-12" style="margin-left:3%; margin-right:3%; margin-top:3%; margin-bottom:3%">
			<pre>${row.object}</pre>
		</div>
		<hr>
		<div align="right">
			<button type="button" class="btn btn-sm" onclick="location.href='/noticeboard/noticeBoardList'">목록으로</button>
			<c:if test="${login.authority >= 4 }">
				<button type="button" class="btn btn-sm" onclick="location.href='/noticeboard/update.do?boardId=${row.boardId}' ">수정</button>
				<button class="btn btn-sm" id="deletebtn">삭제</button>
			</c:if>
		</div>
		<br>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>
