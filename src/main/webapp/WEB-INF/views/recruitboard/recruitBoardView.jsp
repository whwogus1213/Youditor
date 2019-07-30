<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

  	<title>${row.subject } - 구인구직 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<!-- Custom styles -->
	<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>

</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/recruit/recruit.jpg'); background-position:50% 60%; background-size:100%; font-family: 'Song Myung', sans-serif; color:white; text-shadow: -1px 0 LightPink, 0 1px LightPink, 1px 0 LightPink, 0 -1px LightPink; padding-top:130px; padding-bottom:5%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>구인/구직</strong></h1>
			<h4 align="center"><br>당신의 파트너가 될 YouditoR가 있습니다.</h4>
		</div>
	</div>
	
	<!-- 게시글 상세정보 -->
	<div class="container">
		<script>
			
			//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 noticeboardcontroller 의 deleteVideoBoardPro 메서드 호출
			$(function(){
				$('#deletebtn').click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						self.location.href = "${path}/recruitboard/delete?boardId=${row.boardId}";
					}
				});
			});
		</script>
		<hr>
		<div style="padding-left:5%; padding-right:5%;">
			<div class="form-inline">
				<div class="col-sm-12 row" align="center" style="margin-bottom:50px">
					<div class="col-sm-2">
						<h4><c:if test="${row.categoryId eq 1}"><button type="button" class="btn btn-info btn-md" disabled>구인</button></c:if>
						<c:if test="${row.categoryId eq 2}"><button type="button" class="btn btn-secondary btn-md" disabled>구직</button></c:if></h4>
					</div>
					<div class="col-sm-10" >
						<h2>${row.subject }</h2>
						<h4 style="color:brown">| 급여 : ${row.fee} \ |</h4>
					</div>
				</div>
				<div class="col-sm-12 row">
					<div class="dropdown show">
						<strong style="color:PaleVioletRed">작성자</strong>&nbsp;&nbsp;
						<!-- 내 아이디에 마우스 오버 -->						
						<c:if test="${row.accountId eq login.accountId }">
							<img src="<spring:url value='/image/${row.picture}'/>" class=" mx-auto rounded-circle" 
							width="20px" height="20px"/>&nbsp;${row.nickname}<br>
						</c:if>
						<!-- 다른 사람 아이디에 마우스 오버 -->
						<c:if test="${row.accountId ne login.accountId }">
							<a id="dropdownBtn${row.boardId}" onclick="checkFollow('${row.accountId}'); return false;"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor:pointer">
								<img src="<spring:url value='/image/${row.picture}'/>" class=" mx-auto rounded-circle" width="20px" height="20px"/>
								${row.nickname }
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/videoboard/videoBoardList?category=0&searchType=nickname&keyword=${row.nickname}">
									<i class="fab fa-youtube" style="width: 20; height: 20"></i>&nbsp;&nbsp;편집 영상 보기
								</a>
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
								<a class="dropdown-item dropdownBtnFollow${row.accountId}"
								onclick="fn_follow(${row.accountId}); return false;" style="cursor: pointer;">
									<i class="far fa-heart"></i>&nbsp;&nbsp;팔로우하기
								</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="form-inline">
				<div class="col-sm-10" align="right">
					<h6>
						<strong style="color:PaleVioletRed">작성 일시</strong>&nbsp;&nbsp;
						<fmt:parseDate value='${row.reg_date}' var='reg_date' pattern='yyyymmdd'/>
						<fmt:formatDate value="${reg_date}" pattern="yyyy-MM-dd" />
					</h6>
				</div>
				<div class="col-sm-2" align="right">
					<h6><strong style="color:PaleVioletRed">조회수</strong>&nbsp;&nbsp;${row.viewCount }</h6>
				</div>
			</div>
		</div>
		<hr>
		<div class="form-inline" style="white-space:pre-line; padding-left:5%; padding-right:5%;">
			<c:out value="${row.object}"/><br>
		</div>
		<hr>
		<div align="center">
			<button type="button" class="btn btn-link" onclick="location.href='/recruitboard/recruitBoardList'"><strong style="color:PaleVioletRed"><i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;목록으로</strong></button>
			<c:if test="${login.accountId eq row.accountId}">|
			<button type="button" class="btn btn-link" onclick="location.href='/recruitboard/updateRecruitBoard?boardId=${row.boardId}'" ><strong style="color:PaleVioletRed"><i class="fas fa-cut"></i>&nbsp;&nbsp;수정</strong></button>|
			<button class="btn btn-link" id="deletebtn"><strong style="color:PaleVioletRed"><i class="fas fa-trash-alt"></i>&nbsp;&nbsp;삭제</strong></button>
			</c:if>
		</div>
	</div>
	<br>
	<div id="listReply">
		<jsp:include page="../recruitboard/recruitBoardReply.jsp" flush="false"/>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
<script type="text/javascript">
	 //팔로우 추가
	 function fn_follow(accountId) {
	 	var tr = $(".dropdownBtnFollow"+accountId);
	 	var json = {
	 		"followAccountId" : accountId
	 	}
	 				
	 	event.stopPropagation();
	 	
	 	$.ajax({
	 		type : "POST",
	 		url : "/follow/insert",
	 		data : json,
	 		success : function(data) {
	 			if (data == "success") {
	 				tr.attr("style","");
	 				tr.css("color", "red");
	 				tr.find("i").css("color","red");
	 				tr.attr("onclick","");
	 				tr.css("cursor","default");
	 				tr.html("<i class='far fa-heart'></i>&nbsp;&nbsp;팔로우중");
	 			}
	 			
	 		},
	 		error : function(data) {
	 			alert("에러");
	 		}
	 	});
	 	
	 }

	 //팔로우 체크
	 function checkFollow(accountId){
	 	console.log(accountId+"bbbbbbbbbbbbbbbbbbbbbb");
	 	var tr = $(".dropdownBtnFollow"+accountId);
	 	var json = {
	 			"followAccountId" : accountId,
	 			"followerAccountId" : ${login.accountId}
	 			};
	 	$.ajax({
	 		type : "POST",
	 		url : "/follow/check",
	 		data : json,
	 		success : function(data) {
	 			if (data == "1") {
	 				console.log("팔로우 되어있습니다.");
	 				tr.attr("style","");
	 				tr.css("color", "red");
	 				tr.find("i").css("color","red");
	 				tr.attr("onclick","");
	 				tr.css("cursor","default");
	 				tr.html("<i class='far fa-heart'></i>&nbsp;&nbsp;팔로우중");
	 				
	 			} else {
	 				console.log("팔로우 아님");
	 			}
	 		},
	 		error : function(data) {
	 			alert("에러");
	 		}
		});
	}
</script>
</body>
</html>
