<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>${row.subject} - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>

<script type="text/javascript">
	// 팔로우 추가
	function fn_following(accountId) {
		var json = {
			"followAccountId" : accountId
		}
		$.ajax({
			type : "POST",
			url : "/follow/insert",
			data : json,
			success : function(data) {
				if (data == "success") {
					console.log("성공");
					$('#followbtn').attr('class', 'btn btn-warning btn-sm');
					$('#followbtn').html('팔로잉√');
				}
			},
			error : function(data) {
				alert("에러");
			}
		});
	}

	// 팔로우 삭제
	function fn_unfollow(accountId) {
		var json = {
			"followAccountId" : accountId
		}
		$.ajax({
			type : "POST",
			url : "/follow/delete",
			data : json,
			success : function(data) {
				if (data == "success") {
					console.log("성공");
					${'#followbtn'}.attr('class', 'btn btn-primary btn-sm');
					${'#followbtn'}.html('팔로우');
				}
			},
			error : function(data) {
				alert("에러");
			}
		});
	}
</script>


</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false"/>
	
	<!-- 게시글 상세정보 -->

		<div align="center" style="background-color:black; padding-top:60px">
		<script>
			var e = '${row.youtubeLink}';
			var eArray  = e.split('/');
			var youtubeID;
			for( var i in eArray ) {
				youtubeID = eArray[i];
			}
			if(youtubeID.length >11){
				eArray = youtubeID.split("=");
				youtubeID = eArray[1];
				youtubeID = youtubeID.substr(0,11);
			}
			document.write('<iframe width="667" height="375" src="https://www.youtube.com/embed/' + youtubeID + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
		
			//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 videoboardcontroller 의 deleteVideoBoardPro 메서드 호출
			$(function(){
				$('#deletebtn').click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						self.location.href = "${path}/videoboard/deleteVideoBoardPro?boardId=${row.boardId}";
					}
				});
			});
		</script>
	</div>
	<!-- <h1>${row.boardId }</h1> -->
	<div class="container">
		<br>
		<h2> ${row.subject }</h2>
		<span style="line-height:30%"><br></span>
		<h5>${row.object }</h5>
		<br>
		<h6 style="color:gray"> 조회수&nbsp;&nbsp; ${row.viewCount }</h6>
		<h5 align="right">등록일 &nbsp;&nbsp; <fmt:formatDate value="${row.reg_date}" pattern="yyyy년 MM월 dd일  HH:mm:ss" /></h5>
		<hr>
		<h6><strong>${row.nickname }</strong><br><br>${row.footer }</h6>
		<%-- 	<h1>${row.youtubeLink }</h1> --%>
		<!-- 디자인 필요 -->
		<div align="right">
			<!-- 팔로우 버튼 -->
			<div id="followDiv">
				<!-- 로그인 아디이와 글쓴이 아이디가 같지 않을 때 -->
				<c:if test="${login.accountId ne row.accountId}">
					<!-- 팔로우 되어 있지 않을 때 -->
					<c:if test="${followCheck eq 0}">
						<button class="btn btn-primary btn-sm" id="followbtn" onclick="fn_following('${row.accountId}')">팔로우</button>
					</c:if>
					<!-- 팔로우 되어 있을 때 -->
					<c:if test="${followCheck eq 1}">
						<button class="btn btn-warning btn-sm" id="followbtn" onclick="fn_unfollow('${row.accountId}')">팔로잉√</button>
					</c:if>
				</c:if>
				
			<!-- 수정/삭제 버튼 -->
			</div>
			<!-- 로그인 아이디와 글쓴이 아이디가 같을 때 -->
				<c:if test="${login.accountId eq row.accountId}">
					<button class="btn btn-warning btn-sm" onclick="location.href='/videoboard/updateVideoBoard.do?boardId=${row.boardId}'">수정</button>
					<button class="btn btn-danger btn-sm" id="deletebtn">삭제</button>
				</c:if>
		</div>
		<hr>
	</div>
	<div id="listReply">
		<jsp:include page="../videoboard/videoBoardReply.jsp" flush="false"/>
		
	</div>

	<jsp:include page="../module/bottom.jsp" flush="false"/>
 
</body>
</html>