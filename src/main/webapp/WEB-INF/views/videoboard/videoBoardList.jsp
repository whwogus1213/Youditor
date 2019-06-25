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
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h1 align="center">게시판</h1>
		</div>
	</div>
	<h5 align="center">ㅇㅇ</h5>
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
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>