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

	.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: 230px;
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
	
	$(function(){
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

	});
	
	$(document).on('click', '#btnSearch', function(e) {
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
	
	<p>
	<jsp:include page="../module/VideoBoardListAside.jsp" flush="false" />
	</p>

	<div class="container" style="background-color: #E8E8E8 ;">
		<br>
	<c:choose>
		<c:when test="${ categoryName eq '전체'}">
			<div style="background-image:url('/resources/images/videoList/all.jpg'); background-position:43% 70%; color:white; text-shadow: -1px 0 #0099CC, 0 1px #0099CC, 1px 0 #0099CC, 0 -1px #0099CC">
				<div class="col-sm-12">
					<br><br><br><br>
					<h1 align="center" style="font-size:60px; letter-spacing:60px">
						<strong>&nbsp;전체보기</strong>
					</h1>
				</div>
				<br>
				<h4 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h4>
				<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
			</div>
		</c:when>
		<c:when test="${ categoryName eq '게임'}">
			<div style="background-image:url('/resources/images/videoList/game.png'); background-position:44% 50%; font-family: 'Do Hyeon', sans-serif; color:#3366FF;">
				<div class="col-sm-12">
					<br><br><br><br>
					<h1 align="center" style="font-size:60px; letter-spacing:60px">
						<strong>&nbsp;<%=request.getAttribute("categoryName")%></strong>
					</h1>
				</div>
				<br>
				<h4 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h4>
				<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
			</div>
		</c:when>
		<c:when test="${ categoryName eq '먹방'}">
			<div style="background-image:url('/resources/images/videoList/social_dining.jpg'); background-position:65% 25%; font-family: 'Nanum Brush Script', sans-serif; color:white;">
				<div class="col-sm-12">
					<br><br><br><br>
					<h1 align="center" style="font-size:60px; letter-spacing:60px">
						<strong>&nbsp;<%=request.getAttribute("categoryName")%></strong>
					</h1>
				</div>
				<br>
				<h4 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h4>
				<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
			</div>
		</c:when>
		<c:when test="${ categoryName eq '일상'}">
			<div style="background-image:url('/resources/images/videoList/daily_life.jpg'); background-position:70% 60%; font-family: 'Hi Melody', sans-serif; color:#FFCC00; text-shadow: -1px 0 #996600, 0 1px #996600, 1px 0 #996600, 0 -1px #996600;">
				<div class="col-sm-12">
					<br><br><br><br>
					<h1 align="center" style="font-size:60px; letter-spacing:60px">
						<strong>&nbsp;<%=request.getAttribute("categoryName")%></strong>
					</h1>
				</div>
				<br>
				<h4 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h4>
				<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
			</div>
		</c:when>
		<c:when test="${ categoryName eq '모터'}">
			<div style="background-image:url('/resources/images/videoList/motor.jpg'); background-position:70% 50%; background-size:120% 120%; font-family: 'Do Hyeon', sans-serif; color:white; text-shadow: -1px 0 #990033, 0 1px #990033, 1px 0 #990033, 0 -1px #990033;">
				<div class="col-sm-12">
					<br><br><br><br>
					<h1 align="center" style="font-size:60px; letter-spacing:60px">
						<strong>&nbsp;<%=request.getAttribute("categoryName")%></strong>
					</h1>
				</div>
				<br>
				<h4 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h4>
				<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
			</div>
		</c:when>
		<c:when test="${ categoryName eq '스포츠'}">
			<div style="background-image:url('/resources/images/videoList/sports.jpg'); background-position:50% 75%; font-family: 'Black Han Sans', sans-serif; color:white; text-shadow: -2px 0 #51A149, 0 2px #51A149, 2px 0 #51A149, 0 -2px #51A149;">
				<div class="col-sm-12">
					<br><br><br><br>
					<h1 align="center" style="font-size:60px; letter-spacing:60px">
						<strong>&nbsp;<%=request.getAttribute("categoryName")%></strong>
					</h1>
				</div>
				<br>
				<h4 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h4>
				<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
			</div>
		</c:when>
		<c:when test="${ categoryName eq '예능'}">
			<div style="background-image:url('/resources/images/videoList/entertainment.jpg'); background-position:50% 60%; font-family: 'Cute Font', sans-serif; color:white;  text-shadow: -1px 0 #339966, 0 1px #339966, 1px 0 #339966, 0 -1px #339966;">
				<div class="col-sm-12">
					<br><br><br><br>
					<h1 align="center" style="font-size:60px; letter-spacing:60px">
						<strong>&nbsp;<%=request.getAttribute("categoryName")%></strong>
					</h1>
				</div>
				<br>
				<h3 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h3>
				<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
			</div>
		</c:when>
		<c:otherwise>
			<div style="background-color: #C8C8C8; font-family: 'Do Hyeon', sans-serif; ">
				<div class="col-sm-12">
					<br><br><br><br>
					<h1 align="center" style="font-size:60px; letter-spacing:60px">
						<strong>&nbsp;<%=request.getAttribute("categoryName")%></strong>
					</h1>
				</div>
				<br>
				<h5 align="center"><%=request.getAttribute("categoryName")%> 유투버들의 편집 영상입니다.</h5>
				<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility: hidden">글이 삭제되었습니다.</div>
			</div>
		</c:otherwise>
	</c:choose>
	
	
	
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
				<i class="fas fa-search" name="btnSearch" id="btnSearch"></i>
			</div>
			
			<div class="col-sm-2" align="right">
			
				<c:if test="${login.email != null}">
					<button type="button" class="btn btn-sm btn-primary"
						onclick="location.href='/videoboard/write.do' ">글쓰기</button>
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