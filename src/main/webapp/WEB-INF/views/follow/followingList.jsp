<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로우 리스트</title>
<jsp:include page="../module/header.jsp" flush="false" />
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<!-- 
<script>
// 이전 버튼
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/follow/followingList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/follow/followingList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/follow/followingList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 검색버튼 이벤트
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/follow/followingList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
		console.log(url);
	});
</script>
 -->
</head>
<body>
	<jsp:include page="./../module/top.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">Following List</h1>
			<h2 align="center">내가 팔로우 중인 사람</h2>
		</div>
	</div>
	<div class="container">
		<table class="table table-bordered table-striped nanum table-hover">
			<!-- <table border="1"> -->
			<thead>
				<tr>
					<th>아이디</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${followingList}" var="followingList">
					<tr>
						
						<td>${followingList.followAccountId}</td>
						<td><fmt:formatDate value="${followingList.reg_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징 -->
<!-- 
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
 -->
		<!-- 페이징 -->

		<!-- 검색 -->
<!-- 
		<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right: 10px">
				<select class="form-control form-control-sm" name="searchType"
					id="searchType">
					<option value="followAccountId">아이디</option>
				</select>
			</div>
			<div class="w300" style="padding-right: 10px">
				<input type="text" class="form-control form-control-sm"
					name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch">검색</button>
			</div>
		</div>
 -->
		<!-- 검색 -->

	</div>

	<h2 align="center">&nbsp;</h2>

<!-- 팔로워 추가 기능? -->
<!-- 
	<div class="col-sm-9" align="right">
		<button type="button" class="btn btn-primary"
			onclick="location.href='/noticeboard/write.do' ">공지 올리기</button>
	</div>
	<h2 align="center">&nbsp;</h2>
	<jsp:include page="./../module/bottom.jsp" flush="false" />
 -->
</body>
</html>
