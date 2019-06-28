<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
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

  <!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false"/>

	<!-- 게시글 상세정보 -->
	<div class="container">
		<div align="center">
			<br><br>
			<h1>공지 사항</h1>
			<br><br>
		</div>
		<hr>
		<br>
		<h1>${row.subject }</h1>
		<br>
		<div align="right">
		<h4>작성자 ${row.accountId } 카테고리 ${row.categoryId}
		</h4>
		<h4>작성 일시 <fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd" /> 조회수 ${row.viewCount }
		</h4>
		</div>
		<hr>
		<br>
		<h2>${row.object }</h2>
		<br>
		<hr>
		<div align="center">
			<button type="button" class="btn btn-primary" onclick="location.href='/noticeboard/noticeBoardList' ">목록으로</button>
			<button type="button" class="btn btn-success" onclick="location.href='/noticeboard/noticeBoardList' ">수정</button>
			<button type="button" class="btn btn-danger" onclick="location.href='/noticeboard/noticeBoardList' ">삭제</button>
		</div>
		<br>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
