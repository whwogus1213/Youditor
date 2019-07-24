<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">

<title>YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>

</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/videoList/upload.jpg'); background-position:50% 50%; background-size:100%; color:white; padding-top: 5%; padding-bottom:4%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>게시글 수정</strong></h1>
			<h4 align="center"><br>수정 완료 후, '수정' 버튼을 눌러주세요.</h4>
		</div>
	</div>
	

		
	<!-- <h1>${videoBoardUpdate.boardId }</h1> -->
	<div class="container" style="padding-top:2%;">
		<!-- 게시글 상세정보 -->
		<form class="form-horizontal" method="post" action="${path}/videoboard/updateVideoBoardPro">
			<div class="form-inline">
				<label class="control-label col-sm-3"><strong>제목</strong></label>
				<input type="text" class="form-control col-sm-5" name="subject" id="subject" maxlength="50" value="${videoBoardUpdate.subject }">
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-3"><strong>등록일</strong></label>
				<input type="text" class="form-control col-sm-5" name="subject" id="subject" maxlength="50" value="<fmt:formatDate value="${videoBoardUpdate.reg_date}" pattern="yyyy년 MM월 dd일  hh:mm:ss" />" disabled>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-3"><strong>링크</strong></label>
				<input type="text" class="form-control col-sm-5" name="youtubeLink" id="youtubeLink" maxlength="50" value="${videoBoardUpdate.youtubeLink }">
				<div class="col-sm-2">
					<input type="button" id="test" class="btn btn-danger"  value="썸네일 보기"></input>
				</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="col-sm-3"><strong>썸네일 미리보기</strong></label>
				<div id="thumb1">
					<img id ="profileImg" src = "/resources/images/ThumbnailDefault.jpg" style = "border-radius:0%; padding-left : 15px; padding-top:10px; height:200px; width:300px;">
					<script type="text/javascript">
						$("#test").click(function(){
							var e = $('input[name=youtubeLink]').val();
							if(e===null || e===""){
								alert("유투브 주소를 입력해주세요");
							} else {
								var eArray  = e.split('/');
								var youtubeID;
								youtubeID = eArray[3];
								if(youtubeID.length >11){
									eArray = youtubeID.split("=");
									youtubeID = eArray[1];
									youtubeID = youtubeID.substr(0,11);
								}
								//document.write('<p>' + youtubeID + '</p>');
								var time= new Date().getTime();
								var src = 'https://img.youtube.com/vi/' + youtubeID + '/mqdefault.jpg?time=' + time;
								$('#profileImg').attr('src', src);
							}
						});
					</script>
				</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-3"><strong>내용</strong></label>
				<textarea rows="10" cols="80" name="object">${videoBoardUpdate.object}</textarea>
			</div>
			<hr>
			<input type="text" class="form-control" name="boardId" id="boardId" maxlength="50" value="${videoBoardUpdate.boardId}" style="visibility:hidden">
			<div class="row">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-2" align="right">
					<button type="submit" class="btn btn-outline-success" id="submit">수정</button>
				</div>
				<div class="col-sm-2" align="left">
					<button type="button" class="btn btn-outline-danger" onclick="location.href='/videoboard/videoBoardView?boardId=${videoBoardUpdate.boardId}' ">취소</button>
				</div>
			</div>
		</form>
	</div>
	<%-- 	<h1>${videoBoardUpdate.youtubeLink }</h1> --%>
	
	
	<jsp:include page="../module/bottom.jsp" flush="false"/>
 
</body>
</html>