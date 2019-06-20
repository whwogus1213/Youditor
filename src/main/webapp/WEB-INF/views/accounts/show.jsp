<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<h1>show.jsp</h1>

	<div class="container">
		<table class="table table-bordered table-striped nanum table-hover">
			<!-- <table border="1"> -->
			<thead>
				<tr>
					<th>아이디</th>
					<th>비번</th>
					<th>닉네임</th>
					<th>작성일</th>
					<th>권한</th>
					<th>사진</th>
					<th>소개</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.id}</td>
						<td>${list.passwd}</td>
						<td>${list.nickname}</td>
						<td><fmt:formatDate value="${list.reg_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${list.authority}</td>
						<td>${list.picture}</td>
						<td>${list.footer}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>


</body>
</html>