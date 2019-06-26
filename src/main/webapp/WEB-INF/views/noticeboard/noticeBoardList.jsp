<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - YouditoR</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<!-- Custom styles -->
	<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="./../module/top.jsp" flush="false"/>
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">공지 사항</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
	</div>
	<h5 align="center">  YouditoR의 최신 소식을 알려드립니다.</h5>
	<h2 align="center">&nbsp;</h2>
	<div class="container">
	<table class="table table-bordered table-striped nanum table-hover">
	<!-- <table border="1"> -->
		<thead>
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno}</td>
					<td>
						<a href="/board/view?bno=${list.bno}">${list.title}</a>
					</td>
					<td>${list.category}</td>
					<td>${list.writer}</td>
					<td>
						<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" />
					</td>
					<td>${list.viewCount }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>
	<jsp:include page="./../module/bottom.jsp" flush="false"/>
</body>
</html>
