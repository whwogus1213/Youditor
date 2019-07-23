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
<link href="/resources/css/pagination.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<style type="text/css">
.fa-search:before {
    content: "\f002";
    cursor: pointer;
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
	
	.vbrow:hover {
	border: 1px solid black;
	box-shadow: 0px 0px 20px #000;
}	
</style>


</head>
<body>
	<script>
	// 이전 버튼
	/*function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}*/
	// 이전 버튼
	function fn_prev(categoryId, page, rangeSize, searchType, keyword) {
		var page = parseInt((page - 1) / rangeSize) * rangeSize;
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList?";

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
	/*function fn_pagination(page, range, rangeSize, categoryId, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";

		url = url + "?category=" + categoryId;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
		
	}*/
	//페이지 번호 클릭
	function fn_pagination(categoryId, page, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList?";
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
	/*function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}*/
	//다음 버튼 이벤트
	function fn_next(categoryId, page, rangeSize, searchType, keyword) {
		var page = ((parseInt((page - 1) / rangeSize) + 1) * rangeSize) + 1;
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList?";

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
	/*$(function(){
		$('#keyword').keypress(function(e) {

			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			if (keycode == '13') {
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";
		url = url + "?category=" + ${pagination.categoryId};
		//url = url + "&page=" + 1;
		//url = url + "&range=" + 1;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

				location.href = url;
			}
			e.stopPropagation();
		});
	});*/
	// 검색버튼 이벤트
	$(function(){
		$('#keyword').keypress(function(e) {

			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			if (keycode == '13') {
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/videoboard/videoBoardList?";
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
	
	/*$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";
		url = url + "?category=" + ${pagination.categoryId};
		//url = url + "&page=" + 1;
		//url = url + "&range=" + 1;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
		console.log(url);
	});
	var result = '${result}';*/
	// 검색
	function searchBtn(categoryId, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList?";
		var categoryId = "${categoryInfo.categoryId}";
		if(categoryId != 0) {
			url = url + "categoryId=" + categoryId + "&";
		}
		url = url + "searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		
		location.href = url;
	}
	
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
	
	
	<!-- 배너 목록 -->
	<div class="col-sm-12" style="background-image:url('/resources/images/videoList/${categoryInfo.categoryPicture}'); height: 300px; background-size:100%; color:white; padding-top:130px; padding-bottom:5%; background-position: center;">
	</div>
	<div class="bg-text" style="background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 24%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 60%;
  padding: 30px;
  text-align: center;">
		<h1 align="center" style="font-size:60px; letter-spacing:60px">
			<strong>&nbsp;${categoryInfo.categoryName }</strong>
		</h1>
		<h4 align="center">${categoryInfo.categoryName } 유투버들의 편집 영상입니다.</h4>
	</div>
	<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>

	<jsp:include page="../module/ListAside.jsp" flush="false" />
	<div class="container" style="background-color: #E8E8E8 ;">
	
		<!-- Marketing Icons Section -->
		<br>
		<div class="row">
		
			<c:forEach items="${VideoBoardList}" var="VideoBoardList">
				<div class="col-lg-4 mb-4">
					<div class="card h-100 vbrow" style="display: block;">
						<div align="center">
							<h5 class="card-header" onclick="location.href='/videoboard/videoBoardView?boardId=${VideoBoardList.boardId}'"
								style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 100%; height: 50px; cursor: pointer;">
								${VideoBoardList.subject}
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
											<i class="fab fa-youtube"></i>&nbsp;&nbsp;영상 더보기
										</a>
										<a class="dropdown-item" href="#" onclick="messagePopup();">
											<i class="far fa-envelope"></i>&nbsp;&nbsp;쪽지 보내기
										</a>
										<script type="text/javascript">
										function messagePopup() {
											var nickname = "${VideoBoardList.nickname }";
											var win = window.open("/message/writePopup.do?nickname=" + nickname, "_blank", 
													"width=650, height=470, left=200, top=200, location=no, menubar=no, resizble=no, scrollbars=no, status=no, titlebar=no, toolbar=no");
										}
										</script>
										<a class="dropdown-item" href="#">
											<i class="far fa-heart"></i>&nbsp;&nbsp;팔로우하기
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
						onclick="fn_pagination('${categoryInfo.categoryId }', '${idx}', '${pagination.searchType}', '${pagination.keyword}'); return false;">
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
						<c:if test="${login.authority >= categoryInfo.viewAuthority }">
							<button type="button" class="btn btn-sm"
								onclick="location.href='/videoboard/write.do' " style="background-color: #2ecc71; color: white;">글쓰기</button>
						</c:if>
					</c:if>
				</div>
			</div>
			<!-- 검색 -->
		</div>
		<!-- 페이징, 검색 끝 -->

	</div>

	<h2 align="center">&nbsp;</h2>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>