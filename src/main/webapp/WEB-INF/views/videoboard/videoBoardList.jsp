<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비디오게시판- YouditoR</title>
<jsp:include page="../module/header.jsp" flush="false"/>
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">oo</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
		<h5 align="center">ㅇㅇ유투버의 편집영상을 감상할 수 있습니다</h5>
		<h2 align="center">&nbsp;</h2>
	</div>
	<div class="container">
		<table class="table table-bordered table-striped nanum table-hover">
			<!-- <table border="1"> -->
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${VideoBoardList}" var="VideoBoardList">
					<tr>
						<td>${VideoBoardList.boardId}</td>
						<td><a href="/videoboard/videoBoardView?boardId=${VideoBoardList.boardId}">${VideoBoardList.subject}</a>
						</td>
						<td>${VideoBoardList.accountId}</td>
						<td><fmt:formatDate value="${VideoBoardList.reg_date}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<h2 align="center">&nbsp;</h2>
	<div class="col-sm-9" align="right">
		<button type="button" class="btn btn-primary" onclick="location.href='/board/write.do' ">유투브 올리기</button>
	</div>
	<h2 align="center">&nbsp;</h2>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>