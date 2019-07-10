<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비디오게시판- YouditoR</title>
<jsp:include page="../module/header.jsp" flush="false"/>
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
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
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/videoboard/videoBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
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
		url = url + "?searchType=" + $('#searchType').val();
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
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center"><strong><%=request.getAttribute("categoryName") %></strong></h1>
			<h2 align="center">&nbsp;</h2>
		</div>
		<h5 align="center"><%=request.getAttribute("categoryName") %> 유투버들의 편집 영상입니다.</h5>
		<h2 align="center">&nbsp;</h2>
		<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility:hidden">글이 삭제되었습니다.</div>
	</div>
	
	<div class="container">
    	<!-- Marketing Icons Section -->
    	<div class="row">
			<c:forEach items="${VideoBoardList}" var="VideoBoardList">
     		 <div class="col-lg-4 mb-4">
        		<div class="card h-100" style="display:block">
        			<div align="center">
         				<h5 class="card-header" style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:100%; height: 50px">
	         				<a href="/videoboard/videoBoardView?boardId=${VideoBoardList.boardId}">${VideoBoardList.subject}</a>
	         			</h5>
        			</div>
          			<div class="card-body" align="center">
						<script>
							var e = '${VideoBoardList.youtubeLink}';
							var eArray  = e.split('/');
							var youtubeID;
							youtubeID = eArray[3];
							//document.write('<p>' + youtubeID + '</p>');
							if(youtubeID.length >11){
								eArray = youtubeID.split("=");
								youtubeID = eArray[1];
								youtubeID = youtubeID.substr(0,11);
							}
							//document.write('<p>' + youtubeID + '</p>');
							document.write('<img width="300" height="200" src="https://img.youtube.com/vi/' + youtubeID + '/mqdefault.jpg"></img>');
						</script>
          			</div>
          			<div class="card-footer" align="left">
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Made by.</strong>
          					</div>
          					<div class="col-sm-6" align="right">
								${VideoBoardList.nickname}<br>
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
          						<strong>평점</strong>
          					</div>
          					<div class="col-sm-6" align="right">
						 		${VideoBoardList.starCount}
          					</div>
          				</div>
          			</div>
        		</div>
      		</div>
			</c:forEach>
      	</div>
      </div>
	<h2 align="center">&nbsp;</h2>
	<!-- 페이징 -->
		<div id="paginationBox">
			<ul class="pagination" style="display:table; margin-left:auto; margin-right: auto;">
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
		<div class="row input-group">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-2" align="right">
				<select class="form-control form-control-sm" name="searchType" id="searchType" style="width:66.6%">
					<option value="subject">제목</option>
					<option value="object">본문</option>
					<option value="accountId">작성자</option>
				</select>
			</div>
			<div class="col-sm-4" align="right" >
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" >
			</div>
			<div class="col-sm-1">
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
			<div class="col-sm-3" align="center">
				<button type="button" class="btn btn-primary" onclick="location.href='/videoboard/write.do' ">유투브 올리기</button>
			</div>
		</div>
		<!-- 검색 -->
	<h2 align="center">&nbsp;</h2>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>