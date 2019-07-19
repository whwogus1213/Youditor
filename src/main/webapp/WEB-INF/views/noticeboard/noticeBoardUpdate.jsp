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
	<form class="form-horizontal" method="post" action="${path}/noticeboard/updateNoticeBoardPro">
	<!-- 게시글 상세정보 -->
	<div class="container">
		<hr>
		<br>
		<label class="control-label col-sm-2">제목</label>
		<input type="text" class="form-control" name="subject" id="subject" maxlength="50" value="${noticeBoardUpdate.subject }">
		<br>
		<label class="control-label col-sm-2">내용</label>
		<input type="text" class="form-control" name="object" id="object" maxlength="50" value="${noticeBoardUpdate.object }">
		<br>
		<input type="text" class="form-control" name="boardId" id="boardId" maxlength="50" value="${noticeBoardUpdate.boardId}" style="visibility:hidden">
		
		<div align="right">
		<h4>작성 일시 <fmt:formatDate value="${noticeBoardUpdate.reg_date}" pattern="yyyy-MM-dd" />
		</h4>
		</div>
		<hr>
		<br>
		
		<br>
		<hr>
		<div align="center">
			<button type="submit" id="submit">수정</button>
			<button type="button" class="btn btn-danger" onclick="location.href='/noticeboard/noticeBoardList' ">취소</button>
		</div>
		<br>
	</div>
	</form>
	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
