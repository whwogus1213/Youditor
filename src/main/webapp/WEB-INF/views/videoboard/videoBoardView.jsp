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

<title>YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>

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
		<h5 align="right">등록일 &nbsp;&nbsp; <fmt:formatDate value="${row.reg_date}" pattern="yyyy년 MM월 dd일  hh:mm:ss" /></h5>
		<hr>
		<h6>${row.accountId } 프로필이 표시되게끔....</h6>
		<hr>
	</div>
	<%-- 	<h1>${row.youtubeLink }</h1> --%>
	<!-- 디자인 필요 -->
	<c:if test="${login.email ne row.boardId}">
		<a href="/videoboard/updateVideoBoard.do?boardId=${row.boardId}">수정 ${row.subject}</a>
		<a href="/videoboard/delete">삭제</a>
	</c:if>
	<c:if test="${login.email eq row.boardId}">
		<a href="/videoboard/delete">test 수정 버튼이 안보이고 이 버튼이 보이면 로그인한 아이디로 작성한 게시물이 아님</a>
	</c:if>
		<div id="listReply">
			<jsp:include page="../videoboard/videoBoardReply.jsp" flush="false"/>
		</div>

	<jsp:include page="../module/bottom.jsp" flush="false"/>
 
</body>
</html>