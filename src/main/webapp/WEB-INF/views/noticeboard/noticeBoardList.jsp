<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - YouditoR</title>
<jsp:include page="../module/header.jsp" flush="false" />
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<script>
	// 이전 버튼
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 검색버튼 이벤트
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
		console.log(url);
	});
</script>
</head>
<body>
	<jsp:include page="./../module/top.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">공지 사항</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
	</div>
	<h5 align="center">YouditoR의 최신 소식을 알려드립니다.</h5>
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
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${NoticeBoardList}" var="NoticeBoardList">
					<tr>
						<td>${NoticeBoardList.boardId}</td>
						<td>${NoticeBoardList.categoryId}</td>
						<td><a
							href="/noticeboard/noticeBoardView?boardId=${NoticeBoardList.boardId}">${NoticeBoardList.subject}</a>
						</td>
						<td>${NoticeBoardList.accountId}</td>
						<td><fmt:formatDate value="${NoticeBoardList.reg_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${NoticeBoardList.viewCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징 -->
		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item">
						<a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
					</li>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a>
					</li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item">
						<a class="page-link" href="#"
						onClick="fn_next('${pagination.range}', '${pagination.range}',
						'${pagination.rangeSize}')">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 -->

		<!-- 검색 -->
		<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right: 10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="subject">제목</option>
					<option value="object">본문</option>
					<option value="accountId">작성자</option>
				</select>
			</div>
			<div class="w300" style="padding-right: 10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>
		<!-- 검색 -->

	</div>

	<h2 align="center">&nbsp;</h2>

	<div class="col-sm-9" align="right">
		<button type="button" class="btn btn-primary"
			onclick="location.href='/noticeboard/write.do' ">공지 올리기</button>
	</div>
	<h2 align="center">&nbsp;</h2>
	<jsp:include page="./../module/bottom.jsp" flush="false" />
</body>
</html>
