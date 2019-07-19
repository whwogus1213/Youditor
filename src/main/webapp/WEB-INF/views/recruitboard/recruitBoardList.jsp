<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인구직 - YouditoR</title>
<style type="text/css">
button[type="button"] {
	font-family: FontAwesome;
}
</style>
<jsp:include page="../module/header.jsp" flush="false" />
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<link href="/resources/css/pagination.css" rel="stylesheet">
<style type="text/css">
.fa-search:before {
    content: "\f002";
    cursor: pointer;
}
 @media (min-width:476px){.container{max-width: 240px;}}
 @media (min-width:576px){.container{max-width: 300px;}}
 @media (min-width:768px){.container{max-width: 440px;}}
 @media (min-width:992px){.container{max-width: 640px;}}
 @media (min-width:1080px){.container{max-width: 800;}}
 @media (min-width:1200px){.container{max-width: 925px;}}
 @media (min-width:1400px){.container{max-width: 1100px;}}
 .container {
    float: left;
}
footer{
    margin-top: 250px;
}
</style>
<script>
	// 이전 버튼
	function fn_prev(page, range, rangeSize, searchType, keyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/recruitboard/recruitBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/recruitboard/recruitBoardList";

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
		var url = "${pageContext.request.contextPath}/recruitboard/recruitBoardList";

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
				var url = "${pageContext.request.contextPath}/recruitboard/recruitBoardList";
				url = url + "?searchType=" + $('#searchType').val();
				url = url + "&keyword=" + $('#keyword').val();

				location.href = url;
			}

			e.stopPropagation();
		});

	});
	
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/recruitboard/recruitBoardList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
		console.log(url);
	});
	
	//게시글을 삭제 했을시 삭제했다고 경고창이 떳다가 사라지는 기능
	var result = '${result}';
	$(function(){
		if(result === 'deleteOK'){
			$('#deleteOK').removeClass('hidden');
			$('#deleteOK').removeAttr("style");
			$('#deleteOK').fadeOut(2000);
		}
	})
</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/recruit/recruit.jpg'); background-position:50% 60%; background-size:100%; font-family: 'Song Myung', sans-serif; color:white; text-shadow: -1px 0 LightPink, 0 1px LightPink, 1px 0 LightPink, 0 -1px LightPink; padding-top:130px; padding-bottom:5%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>구인/구직</strong></h1>
			<h4 align="center"><br>당신의 파트너가 될 YouditoR가 있습니다.</h4>
		</div>
	</div>
	
	<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility:hidden">글이 삭제되었습니다.</div>
	
	<jsp:include page="../module/aside.jsp" flush="false" />
	<div class="container">
		<table class="table table-striped nanum table-hover">
			<!-- <table border="1"> -->
			<thead align="center">
				<tr>
					<th style="width: 80px;">번호</th>
					<th style="width: 100px;">분류</th>
					<th>제목</th>
					<th style="width: 100px;">작성자</th>
					<th style="width: 130px;">작성일</th>
					<th style="width: 80px;">조회수</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${RecruitBoardList}" var="RecruitBoardList">
					<tr>
						<td>${RecruitBoardList.boardId}</td>
						<c:if test="${RecruitBoardList.categoryId eq 1}">
							<td><button type="button" class="btn btn-info btn-sm" disabled>구인</button></td>
						</c:if>
						<c:if test="${RecruitBoardList.categoryId eq 2}">
							<td><button type="button" class="btn btn-secondary btn-sm" disabled>구직</button></td>
						</c:if>
						
						<td align="left" style="padding-left: 30px; cursor: pointer;"
						onclick="location.href='/recruitboard/recruitBoardView?boardId=${RecruitBoardList.boardId}'">
								${RecruitBoardList.subject}
						</td>
						<td class="dropright">						
							<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor:pointer">
								<img src="<spring:url value='/image/${RecruitBoardList.picture}'/>" class=" mx-auto rounded-circle" width="20px" height="20px"/>
								${RecruitBoardList.nickname}
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/recruitboard/recruitBoardList?searchType=nickname&keyword=${RecruitBoardList.nickname}">
									<i class="far fa-file-alt" style="width: 20; height: 20"></i>&nbsp;&nbsp;글 더보기
								</a>
								<a class="dropdown-item" href="#" onclick="messagePopup();">
									<i class="far fa-envelope"></i>&nbsp;&nbsp;쪽지 보내기
								</a>
								<script type="text/javascript">
								function messagePopup() {
									var nickname = "${RecruitBoardList.nickname }";
									var win = window.open("/message/writePopup.do?nickname=" + nickname, "_blank", 
											"width=650, height=470, left=200, top=200, location=no, menubar=no, resizble=no, scrollbars=no, status=no, titlebar=no, toolbar=no");
								}
								</script>
								<a class="dropdown-item" href="#">
									<i class="far fa-heart"></i>&nbsp;&nbsp;팔로우하기
								</a>
							</div>
						</td>
						<td><fmt:formatDate value="${RecruitBoardList.reg_date}" pattern="yyyy-MM-dd" /></td>
						<td>${RecruitBoardList.viewCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<!-- 페이징 검색 시작 -->
		<div class="row">
			<!-- 페이징 -->
			<div class="p1 pagination col-4">
				<ul>
					<c:if test="${pagination.prev}">
						<a href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}',
						'${pagination.searchType}', '${pagination.keyword}')"><li><</li></a>
					</c:if>
					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						<a class="<c:out value="${pagination.page == idx ? 'is-active' : ''}"/>" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}',
						'${pagination.searchType}', '${pagination.keyword}')">
							<li>${idx}</li></a>
					</c:forEach>
					<c:if test="${pagination.next}">
						<a href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}',
						'${pagination.searchType}', '${pagination.keyword}')"><li>></li></a>
					</c:if>
				</ul>
			</div>
			<!-- 페이징 -->

			<!-- 검색 -->
			<div class="input-group col-8" style="padding-top: 6px;" align="right">
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
					<i class="fas fa-search" name="btnSearch" id="btnSearch" style="cursor:"></i>
				</div>

				<div class="col-2" align="right" style="padding-left: 0px; padding-right: 5px;">
					<c:if test="${login.authority >= 3 }">
						<button type="button" class="btn btn-sm"
							onclick="location.href='/noticeboard/write.do' " style="background-color: #2ecc71; color: white;">글쓰기</button>
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
