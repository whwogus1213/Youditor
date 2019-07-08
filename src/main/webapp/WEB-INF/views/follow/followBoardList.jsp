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
	var result = '${result}';
	$(function(){
		//이건 아직 미구현
		if(result === 'registerOK'){
			$('#registerOK').removeClass('hidden');
			$('#registerOK').fadeOut(2000);
		}
		if(result === 'deleteOK'){
			$('#deleteOK').removeClass('hidden');
			$('#deleteOK').removeAttr("style");
			$('#deleteOK').fadeOut(2000);
		}
	})
	</script>
	<jsp:include page="../module/top2.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">oo</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
		<h5 align="center">팔로우영상</h5>
		<h2 align="center"></h2>
		<div id="deleteOK" class="alert alert-danger hidden" role="alert" style="visibility:hidden">글이 삭제되었습니다.</div>
	</div>
		
	<div class="container">
    	<!-- Marketing Icons Section -->
    	<div class="row">
			<c:forEach items="${follow}" var="follow">
     		 <div class="col-lg-4 mb-4">
        		<div class="card h-100" style="display:block">
        			<div align="center">
         				<h5 class="card-header" style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:100%; height: 50px">
	         				<a href="../videoboard/videoBoardView?boardId=${follow.boardId}">${follow.subject}</a>
	         			</h5>
        			</div>
          			<div class="card-body" align="center">
						<script>
							var e = '${follow.youtubeLink}';
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
								${follow.nickname}<br>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Date</strong> 
          					</div>
          					<div class="col-sm-6" align="right">
								<fmt:formatDate value="${follow.reg_date}" pattern="yyyy-MM-dd" /><br>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Views</strong>
          					</div>
          					<div class="col-sm-6" align="right">
								${follow.viewCount }<br>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col-sm-6" align="left">
          						<strong>Comments</strong>
          					</div>
          					<div class="col-sm-6" align="right">
						 		${follow.replyCount}
          					</div>
          				</div>
          			</div>
        		</div>
      		</div>
			</c:forEach>
      	</div>
      </div>
	<h2 align="center">&nbsp;</h2>
	<h2 align="center">&nbsp;</h2>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>