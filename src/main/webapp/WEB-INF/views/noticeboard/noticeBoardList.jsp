<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - YouditoR</title>
<jsp:include page="../module/header.jsp" flush="false" />
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<link href="/resources/css/pagination.css" rel="stylesheet">

<style type="text/css">
.fa-search:before {
	content: "\f002";
	cursor: pointer;
}

.card-body {
	display: -webkit-box;
	line-height: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.card-footer {
	font-size: 13px;
	height: 30px;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>
<script>
	// 이전 버튼
	function fn_prev(categoryId, page, rangeSize, searchType, keyword) {
		var page = parseInt((page - 1) / rangeSize) * rangeSize;
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList?";

		if(categoryId != 0) {
			url = url + "categoryId=" + categoryId + "&";
		}
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(categoryId, page, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList?";

		if(categoryId != 0) {
			url = url + "categoryId=" + categoryId + "&";
		}
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(categoryId, page, range, rangeSize, searchType, keyword) {
		var page = ((parseInt(page / rangeSize) + 1) * rangeSize) + 1;
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList?";

		if(categoryId != 0) {
			url = url + "categoryId=" + categoryId + "&";
		}
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}

	// 검색버튼 이벤트
	$(function(){
		$('#keyword').keypress(function(e) {

			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			if (keycode == '13') {
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList?";
				var categoryId = "${categoryInfo.categoryId}";
				if(categoryId != 0) {
					url = url + "categoryId=" + categoryId + "&";
				}
				url = url + "searchType=" + $('#searchType').val();
				url = url + "&keyword=" + $('#keyword').val();

				location.href = url;
				console.log(url);
			}
			e.stopPropagation();
		});
	});

	// 검색
	function searchBtn(categoryId, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList?";
		var categoryId = "${categoryInfo.categoryId}";
		if(categoryId != 0) {
			url = url + "categoryId=" + categoryId + "&";
		}
		url = url + "searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		
		location.href = url;
	}
	
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
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12"  style="background-image:url('/resources/images/notice/notice.jpg'); background-position:50% 60%; font-family: 'Jua', sans-serif; color:white; padding-top:130px; padding-bottom:5%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong><c:out value="${categoryInfo.categoryName }"></c:out></strong></h1>	
			<h5 align="center"><br>YouditoR의 최신 소식과 이벤트를 알려드립니다.</h5>
		</div>
	</div>
	<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>

	<jsp:include page="../module/aside.jsp" flush="false" />
	<div class="container">
		<div class="row">
			<c:forEach items="${NoticeBoardList}" var="NoticeBoardList">
				<div class="col-lg-6 mb-4">
					<div class="card h-100" style="display: block;">
						<div align="left">
							<div class="card-header" onclick="location.href='/noticeboard/noticeBoardView?boardId=${NoticeBoardList.boardId}'"
								style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 100%; height: 50px; cursor: pointer;">
								<c:if test="${NoticeBoardList.categoryName == '공지'}">
									<strong><i class="fas fa-exclamation"></i>&nbsp;[${NoticeBoardList.categoryName}]</strong>
								</c:if>
								<c:if test="${NoticeBoardList.categoryName == '이벤트'}">
									<strong><i class="fas fa-gift"></i>&nbsp;[${NoticeBoardList.categoryName}]</strong>
								</c:if>
								No.${NoticeBoardList.boardId}&nbsp;${NoticeBoardList.subject}
							</div>
						</div>
						<div class="card-body" align="left" style="margin: 0; border: 0; padding: 10px; height: 70px; cursor: pointer;"
							onclick="location.href='/noticeboard/noticeBoardView?boardId=${NoticeBoardList.boardId}'">
							${NoticeBoardList.object}
						</div>
						<div class="card-footer">
							<div class="row" style="margin: 0">
								<div class="col-sm-3" align="left" style="padding: 0px;">
									<i class="far fa-clock"></i>
									<fmt:formatDate value="${NoticeBoardList.reg_date}" pattern="yy. MM. dd." />
								</div>
								<div class="col-sm-2" align="left" style="padding: 0px;">
									<i class="far fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;${NoticeBoardList.viewCount}<br>
								</div>
								<div class="col-sm-7" align="right" style="padding: 0px;">
									<div class="dropright">
										<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer">
											<img src="<spring:url value='/image/${NoticeBoardList.picture}'/>" class=" mx-auto rounded-circle" width="20px" height="20px"/>&nbsp;${NoticeBoardList.nickname}<br>
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="/noticeboard/noticeBoardList?searchType=nickname&keyword=${NoticeBoardList.nickname}">
												<i class="far fa-file-alt" style="width: 20; height: 20"></i>&nbsp;&nbsp;게시물 더보기
											</a>
											<a class="dropdown-item" href="#">
												<i class="far fa-envelope"></i>&nbsp;&nbsp;쪽지 보내기
											</a>
											<a class="dropdown-item" href="#">
												<i class="far fa-heart"></i>&nbsp;&nbsp;팔로우하기
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
					
		<!-- 페이징 검색 시작 -->
		<div class="col-12">
			<!-- 페이징 -->
			<div class="p1 pagination col-12">
				<ul>
					<c:if test="${pagination.prev}">
						<a href="#" onclick="fn_prev('${categoryInfo.categoryId }', '${pagination.page}', '${pagination.rangeSize}',
						'${pagination.searchType}', '${pagination.keyword}'); return false;"><li>◀</li></a>
					</c:if>
					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						<a class="<c:out value="${pagination.page == idx ? 'is-active' : ''}"/>" href="#"
						onclick="fn_pagination('${categoryInfo.categoryId }', '${idx}', '${pagination.searchType}', 
						'${pagination.keyword}'); return false;">
							<li>${idx}</li></a>
					</c:forEach>
					<c:if test="${pagination.next}">
						<a href="#" onclick="fn_next('${categoryInfo.categoryId }', '${pagination.page}', '${pagination.rangeSize}',
						'${pagination.searchType}', '${pagination.keyword}'); return false;"><li>▶</li></a>
					</c:if>
				</ul>
			</div>
			<!-- 페이징 -->

			<!-- 검색 -->
			<div class="input-group col-12" style="padding-top: 6px;" align="right">
				<div class="col-3" align="right" style="padding-right: 0px;">
					<select class="form-control form-control-sm" name="searchType"
						id="searchType" style="width: 66.6%">
						<option value="subject">제목</option>
						<option value="object">본문</option>
						<option value="nickname">닉네임</option>
					</select>
				</div>
				<div class="col-6" align="right" style="padding-right: 0px; padding-left: 5px;">
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" style="float: left;">
				</div>

				<div class="col-1" style="padding-left: 0px;text-align: center;padding-right: 0px;padding-top: 5px;">
					<i class="fas fa-search" id="btnSearch" style="cursor:" onclick="searchBtn('${categoryInfo.categoryId }',
					'${pagination.searchType}', '${pagination.keyword}'); return false;"></i>
				</div>

				<div class="col-2" align="right" style="padding-left: 0px; padding-right: 5px;">
					<c:if test="${login ne null }">
						<c:if test="${login.authority >= categoryInfo.editAuthority }">
							<button type="button" class="btn btn-sm"
								onclick="location.href='/noticeboard/write.do' " style="background-color: #2ecc71; color: white;">글쓰기</button>
						</c:if>
					</c:if>
				</div>
			</div>
			<!-- 검색 -->
		</div>
		<!-- 페이징, 검색 끝 -->
		</div>
	</div>
	<br>
		<jsp:include page="./../module/bottom.jsp" flush="false" />
</body>
</html>