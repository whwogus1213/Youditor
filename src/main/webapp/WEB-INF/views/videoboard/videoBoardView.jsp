<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<title>YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>


<!-- 댓글기능 시작 -->
<script type="text/javascript">

$(function(){
	$("#replyAdd").click(function(){
		console.log("댓글 추가 시작");
		var object = $('#reply_input').val();
		var boardId = ${row.boardId};
				
		console.log(boardId);
		
		var reply = {
				"boardId" : boardId,
				"object" : object
				};

		console.log(reply);

		$.ajax({
			type : "POST",
			url : "/reply/insert",
			data : reply,
			success : function(){
				console.log("성공!!!");
				$("#reply_input").val("");
				alert("성공");
					
				}
			});

		
		});
	
	
});



</script>

</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false"/>
	
	<!-- 게시글 상세정보 -->
	<div align="center" style="background-color:black; padding-top:60px">
		<script>
			var e = '${row.youtubeLink}';
			var eArray  = e.split('/');
			var youtubeID;
			for( var i in eArray ) {
				youtubeID = eArray[i];
			}
			if(youtubeID.length >11){
				eArray = youtubeID.split("=");
				youtubeID = eArray[1];
				youtubeID = youtubeID.substr(0,11);
			}
			document.write('<iframe width="667" height="375" src="https://www.youtube.com/embed/' + youtubeID + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
		</script>
	</div>
	<!-- <h1>${row.boardId }</h1> -->
	<div class="container">
		<br>
		<h2> ${row.subject }</h2>
		<br>
		<h5>${row.object }</h5>
		<br>
		<h5 align="right"> 조회수 ${row.viewCount }</h5>
		<hr>
	</div>
<%-- 	<h1>${row.youtubeLink }</h1> --%>
<div class="container">
	<div class="input-group" align="center">
		<input class="form-control" type="text" id="reply_input" placeholder="댓글 추가..." maxlength="200">
		<span class="input-group-btn">
			<button id="replyAdd" class='btn btn-dark'>등록</button>
		</span>
	</div>
	
	<div class="form-group">
		<div class="col-sm-8" id="replyList">
			
		</div>
	</div>
	
	
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../module/bottom.jsp" flush="false"/>
 
</body>
</html>