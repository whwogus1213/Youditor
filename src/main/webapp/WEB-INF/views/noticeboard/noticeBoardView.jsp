<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>  <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

  <title>${row.subject } - 공지사항 - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>
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
		<br>
		<h1>${row.subject }</h1>
		<br>
		<div align="right">
			<div class="form-inline">
				<div class="col-sm-10" align="right">
					<div class="dropright">
						<h4>작성자 <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor:pointer">
							${row.nickname }
						</a></h4>
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
				<div class="col-sm-2" align="right">
					<h4>카테고리 ${row.categoryId}</h4>
				</div>
			</div>
			<div class="form-inline">
				<div class="col-sm-10" align="right">
					<h4>작성 일시 <fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd" /></h4>
				</div>
				<div class="col-sm-2" align="right">
					<h4>조회수 ${row.viewCount }</h4>
				</div>
			</div>
		</div>
		<hr>
		<br>
		<h2>${row.object }</h2>
		<br>
		<hr>
		<div align="center">
			<button type="button" class="btn btn-primary" onclick="location.href='/noticeboard/noticeBoardList' ">목록으로</button>
			<c:if test="${login.accountId eq row.accountId}">
			<button type="button" class="btn btn-success" onclick="location.href='/noticeboard/updateNoticeBoard.do?boardId=${row.boardId}' ">수정</button>
			<button class="btn btn-danger" id="deletebtn">삭제</button>
			</c:if>
		</div>
		<br>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
