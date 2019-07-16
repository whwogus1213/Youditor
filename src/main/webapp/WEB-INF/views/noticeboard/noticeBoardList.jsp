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
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<style type="text/css">
.fa-search:before {
    content: "\f002";
    cursor: pointer;
}
</style>
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
	
	$(function(){
		$('#keyword').keypress(function(e) {

			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			if (keycode == '13') {
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";
				url = url + "?searchType=" + $('#searchType').val();
				url = url + "&keyword=" + $('#keyword').val();

				location.href = url;
			}

			e.stopPropagation();
		});

	});
	
	$(document).on('click', '#btnSearch', function(e) {
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
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<br><br>
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center"><strong>공지사항</strong></h1>
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

		<!-- 페이징 검색 시작 -->
		<div class="row">
		
		<!-- 페이징 -->
		<div id="paginationBox" class="col-4">
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
			</ul>
		</div>
		<!-- 페이징 -->
		
		<!-- 검색 -->
		<div class="input-group col-8" style="padding-top: 6px;">
			<div class="col-sm-3 offset-2" align="right" style="padding-right: 0px;">
				<select class="form-control form-control-sm" name="searchType"
					id="searchType" style="width: 66.6%">
					<option value="subject">제목</option>
					<option value="object">본문</option>
					<option value="nickname">닉네임</option>
				</select>
			</div>
			<div class="col-sm-4" align="right" style="padding-right: 0px; padding-left: 5px;">
				<input type="text" class="form-control form-control-sm"
					name="keyword" id="keyword" style="float: left;">
			</div>

			<div class="col-1" style="padding-left: 5px; text-align: center; padding-top: 2px;">
				<i class="fas fa-search" name="btnSearch" id="btnSearch" style="cursor: "></i>
			</div>
			
			<div class="col-sm-2" align="right">
			
				<c:if test="${login.email != null}">
					<button type="button" class="btn btn-sm btn-primary"
						onclick="location.href='/noticeboard/write.do' ">글쓰기</button>
				</c:if>
			</div>
		</div>
		<!-- 검색 -->
	</div>
	<!-- 페이징, 검색 끝 -->

	</div>
	<br>
	<jsp:include page="./../module/bottom.jsp" flush="false" />
</body>
</html>
