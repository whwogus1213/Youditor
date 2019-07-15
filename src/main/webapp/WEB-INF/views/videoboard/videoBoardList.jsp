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
<title>비디오게시판- YouditoR</title>
<jsp:include page="../module/header.jsp" flush="false"/>
<!-- Custom styles -->
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<style type="text/css">
a {
	text-decoration: none;
}
.card-body:hover
	{
		/* 그림자 이펙트 */
 		-moz-box-shadow: 0 0 20px #999; 
 		-webkit-box-shadow: 0 0 20px #999; 
 		box-shadow: 0 0 20px #999;
 		-webkit-transform: scale(1.05);
    	transform: scale(1.05);
 		/* 흐려짐 이펙트 */ 
/* 		opacity: 0.3; */
/* 		filter: alpha(opacity=30); */
	}
</style>
</head>
<body>
	<script>
	// 이전 버튼
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, categoryId, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";

		url = url + "?category=" + categoryId;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
		
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 검색버튼 이벤트
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";

		url = url + "?category=" + ${pagination.categoryId};
		//url = url + "&page=" + 1;
		//url = url + "&range=" + 1;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
	});
	
	var result = '${result}';
	$(function(){
		//수정이나 글쓰기 하면 추가할수 있음
		/*
		if(result === 'registerOK'){
			$('#registerOK').removeClass('hidden');
			$('#registerOK').fadeOut(2000);
		}*/
		if(result === 'deleteOK'){
			$('#deleteOK').removeClass('hidden');
			$('#deleteOK').removeAttr("style");
			$('#deleteOK').fadeOut(2000);
		}
	});
	</script>
	<jsp:include page="../module/top2.jsp" flush="false" />
	<br>
	
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">
				<strong><%=request.getAttribute("categoryName")%></strong>
			</h1>
		</div>
		<h5 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h5>
		<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
	</div>
	
	<div class="container">
		<!-- Marketing Icons Section -->
		<h2 align="center">&nbsp;</h2>

		<div class="row">
			<c:forEach items="${VideoBoardList}" var="VideoBoardList">
				<div class="col-lg-4 mb-4">
					<div class="card h-100" style="display: block;">
						<div align="center">
							<h5 class="card-header"
								style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 100%; height: 50px">
								<a
									href="/videoboard/videoBoardView?boardId=${VideoBoardList.boardId}">${VideoBoardList.subject}</a>
							</h5>
						</div>
						<div class="card-body" align="center" style="margin: 0; border: 0; padding: 0;">
						<a href="/videoboard/videoBoardView?boardId=${VideoBoardList.boardId}">
							<script>
							var e = '${VideoBoardList.youtubeLink}';
							var eArray  = e.split('/');
							var youtubeID;
							youtubeID = eArray[3];
							//document.write('<p>' + youtubeID + '</p>');
							if(youtubeID.length > 11){
								eArray = youtubeID.split("=");
								youtubeID = eArray[1];
								youtubeID = youtubeID.substr(0,11);
							}
							//document.write('<p>' + youtubeID + '</p>');
							document.write('<img width="100%" height="100%" src="https://img.youtube.com/vi/' + youtubeID + '/mqdefault.jpg"></img>');
						</script>
          			</a>
          			</div>
          			<div class="card-footer" align="left">
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Made by.</strong>
          					</div>
          					<div class="col-sm-6" align="right">
          						<div class="dropright">
          							<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor:pointer">
										<img src="<spring:url value='/image/${VideoBoardList.picture}'/>" class=" mx-auto rounded-circle" width="20px" height="20px"/>&nbsp;${VideoBoardList.nickname}<br>
          							</a>
          							<div class="dropdown-menu">
          								<a class="dropdown-item" href="/videoboard/videoBoardList?searchType=nickname&keyword=${VideoBoardList.nickname}">
          									<img alt="more" src="/resources/images/icon/more.png" width="20" height="20">
          									영상 더보기
          								</a>
          								<a class="dropdown-item" href="#">
          									<img alt="message" src="/resources/images/icon/message.png" width="20" height="20">
          									쪽지 보내기
          								</a>
          								<a class="dropdown-item" href="#">
          									<img alt="follow" src="/resources/images/icon/follow.png" width="20" height="20">
          									팔로우하기
          								</a>
          							</div>
          						</div>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Date</strong> 
          					</div>
          					<div class="col-sm-6" align="right">
								<fmt:formatDate value="${VideoBoardList.reg_date}" pattern="yyyy-MM-dd" /><br>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Views</strong>
          					</div>
          					<div class="col-sm-6" align="right">
								${VideoBoardList.viewCount }<br>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Comments</strong>
          					</div>
          					<div class="col-sm-6" align="right">
						 		${VideoBoardList.replyCount}
          					</div>
          				</div>
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Rate</strong>
          					</div>
          					<div class="col-sm-6" align="right">
          					
          						<fmt:parseNumber var="starCnt" value="${VideoBoardList.starCount}" integerOnly="true"/>
          					
          						<c:forEach var="starDraw" begin="1" end="5">
          							<c:choose>
          								<c:when test="${starDraw <= starCnt}">
          									<i class="fas fa-star" style="color: #ffd400; margin: 0;"></i>
          								</c:when>
          								<c:when test="${starDraw > starCnt && starDraw-1 < VideoBoardList.starCount && VideoBoardList.starCount > starCnt}">
          									<i class="fas fa-star-half-alt" style="color: #ffd400;"></i>
          								</c:when>
          								<c:otherwise>
          									<i class="far fa-star" style="color: #ffd400;"></i>
          								</c:otherwise>
          							</c:choose>
          						</c:forEach>
          						
          						<h6>${VideoBoardList.starCount}</h6>
						 		
          					</div>
          				</div>
          			</div>
        		</div>
      		</div>
			</c:forEach>
		</div>
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
						 '${pagination.categoryId}', '${pagination.searchType}', '${pagination.keyword}')">${idx}</a>
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
				<button type="button" class="btn btn-sm btn-primary"
					onclick="location.href='/recruitboard/write.do' ">글쓰기</button>
			</c:if>
		</div>
	</div>
	<!-- 검색 -->
	</div>

	<h2 align="center">&nbsp;</h2>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>