<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
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
	function fn_prev(page, range, rangeSize, searchType, keyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}

	// 검색버튼 이벤트
	$(document)
			.on(
					'click',
					'#btnSearch',
					function(e) {
						e.preventDefault();
						var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";
						url = url + "?searchType=" + $('#searchType').val();
						url = url + "&keyword=" + $('#keyword').val();

						location.href = url;
						console.log(url);
					});

	//게시글을 삭제 했을시 삭제했다고 경고창이 떳다가 사라지는 기능
	var result = '${result}';
	$(function() {
		if (result === 'deleteOK') {
			$('#deleteOK').removeClass('hidden');
			$('#deleteOK').removeAttr("style");
			$('#deleteOK').fadeOut(2000);
		}
	});
</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h5 align="center">&nbsp;</h5>
			<h1 align="center">
				<strong>공지 사항</strong>
			</h1>
		</div>
	</div>
	<h5 align="center">YouditoR의 최신 소식과 이벤트를 알려드립니다.</h5>
	<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
		
	<div class="container">
		<table class="table table-striped nanum table-hover">
			<!-- <table border="1"> -->
			<thead align="center">
				<tr>
					<th style="width: 80px;">번호</th>
					<th style="width: 80px;">분류</th>
					<th>제목</th>
					<th style="width: 100px;">작성자</th>
					<th style="width: 130px;">작성일</th>
					<th style="width: 80px;">조회수</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${NoticeBoardList}" var="NoticeBoardList">
					<tr>
						<td>${NoticeBoardList.boardId}</td>
						<td>${NoticeBoardList.categoryName}</td>
						<td align="left" style="padding-left: 30px; cursor: pointer;"
						onclick="location.href='/noticeboard/noticeBoardView?boardId=${NoticeBoardList.boardId}'">
								${NoticeBoardList.subject}
						</td>
						<td>${NoticeBoardList.nickname}</td>
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
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}',
						'${pagination.searchType}', '${pagination.keyword}')">Pre</a>
					</li>
				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}',
						'${pagination.searchType}', '${pagination.keyword}')">${idx}</a>
					</li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}',
						'${pagination.searchType}', '${pagination.keyword}')">Next</a>
					</li>
				</c:if>

				<!-- 검색 -->
				<div class="row input-group">
					<div class="col-sm-2" align="right">
						<select class="form-control form-control-sm" name="searchType"
							id="searchType" style="width: 66.6%">
							<option value="subject">제목</option>
							<option value="object">본문</option>
							<option value="nickname">닉네임</option>
						</select>
					</div>
					<div class="col-sm-6" align="right">
						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword">
					</div>
					<div class="col-sm-2">
						<button class="btn btn-sm btn-primary" name="btnSearch"
							id="btnSearch">검색</button>
					</div>
					<div class="col-sm-2" align="right">
						<c:if test="${login.email != null}">
							<c:if test="${login.authority == 5}">
								<button type="button" class="btn btn-sm btn-primary" 
									onclick="location.href='/noticeboard/write.do' ">글쓰기</button>
							</c:if>
						</c:if>
					</div>
				</div>
				<!-- 검색 -->
			</ul>
		</div>
		<!-- 페이징 -->




		<!-- 검색 -->
		<!-- 
		<div class="row input-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2" align="right">
				<select class="form-control form-control-sm" name="searchType"
					id="searchType" style="width: 66.6%">
					<option value="subject">제목</option>
					<option value="object">본문</option>
					<option value="nickname">닉네임</option>
				</select>
			</div>
			<div class="col-sm-4" align="right">
				<input type="text" class="form-control form-control-sm"
					name="keyword" id="keyword">
			</div>
			<div class="col-sm-1">
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch">검색</button>
			</div>
			<div class="col-sm-3" align="center">
				<c:if test="${login.email != null}">
					<c:if test="${login.authority == 5}">
						<button type="button" class="btn btn-primary"
							onclick="location.href='/noticeboard/write.do' ">글쓰기</button>
					</c:if>
				</c:if>
			</div>
		</div>
		 -->
		<!-- 검색 -->

	</div>
	<br>
	<jsp:include page="./../module/bottom.jsp" flush="false" />
</body>
</html>
