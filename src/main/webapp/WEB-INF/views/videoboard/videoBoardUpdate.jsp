<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
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
	<form class="form-horizontal" method="post" action="${path}/videoboard/updateVideoBoardPro">

		
	<!-- <h1>${videoBoardUpdate.boardId }</h1> -->
	<div class="container">
			<h2 align="center">&nbsp;</h2>
			<h2 align="center">&nbsp;</h2>
		<label class="control-label col-sm-2">링크</label>
		<input type="text" class="form-control" name="youtubeLink" id="youtubeLink" maxlength="50" value="${videoBoardUpdate.youtubeLink }">
		<span style="line-height:30%"><br></span>
		<br>
		<label class="control-label col-sm-2">제목</label>
		<input type="text" class="form-control" name="subject" id="subject" maxlength="50" value="${videoBoardUpdate.subject }">
		<span style="line-height:30%"><br></span>
		<label class="control-label col-sm-2">내용</label>
		<input type="text" class="form-control" name="object" id="object" maxlength="50" value="${videoBoardUpdate.object}">
		<br>
		<h5 align="right">등록일 &nbsp;&nbsp; <fmt:formatDate value="${videoBoardUpdate.reg_date}" pattern="yyyy년 MM월 dd일  hh:mm:ss" /></h5>
		<hr>
		<input type="text" class="form-control" name="boardId" id="boardId" maxlength="50" value="${videoBoardUpdate.boardId}" style="visibility:hidden">
		
		<h6>${videoBoardUpdate.accountId } 프로필이 표시되게끔....</h6>
		<hr>
		<button type="submit" id="submit">수정</button>
		<button type="button" class="btn btn-danger" onclick="location.href='/videoboard/videoBoardView?boardId=${videoBoardUpdate.boardId}' ">취소</button>
	</div>
	</form>
	<%-- 	<h1>${videoBoardUpdate.youtubeLink }</h1> --%>
	
	
	<jsp:include page="../module/bottom.jsp" flush="false"/>
 
</body>
</html>