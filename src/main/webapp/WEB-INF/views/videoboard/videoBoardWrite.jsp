<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${row ne null }">
		<title>비디오게시판 - 수정 - YouditoR</title>
	</c:when>
	<c:otherwise>
		<title>비디오게시판 - 작성 - YouditoR</title>
	</c:otherwise>
</c:choose>
<jsp:include page="./../module/header.jsp" flush="false"/>
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false" />
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/videoList/upload.jpg'); background-position:50% 50%; background-size:100%; color:white; padding-top: 5%; padding-bottom:4%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong><a style="color:Crimson"><i class="fab fa-youtube"></i>유투브</a> 올리기</strong></h1>
			<h4 align="center"><br>여러분이 직접 편집한 유투브를 올려주세요!</h4>
		</div>
	</div>
	
	<div class="container" style="padding-top:2%">
	    <form class="form-horizontal" name="videoForm" method="post">
	    	<div class="form-inline">
	        	<label class="control-label col-sm-3"><strong>제목</strong></label>
	        	<div class="col-sm-4">
	        		<c:choose>
	        			<c:when test="${row ne null }">
	        				<input type="text" class="form-control" name="subject" id="subject" maxlength="50" placeholder="Enter Title" value="${row.subject }">
	        				<input type="hidden" name="boardId" id="boardId" value="${row.boardId }">
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" class="form-control" name="subject" id="subject" maxlength="50" placeholder="Enter Title">
	        			</c:otherwise>
	        		</c:choose>
	        	</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-3"><strong>카테고리</strong></label>
				<div class="col-sm-4">
	        		<select class="browser-default custom-select" name="categoryId" id="categoryId" style="width:190px">
	        			<c:forEach items="${vCatList}" var="CatList">
		           			<c:choose>
		           				<c:when test="${CatList.categoryId == 99 }">
		           					<c:if test="${login.authority >= CatList.editAuthority }">
		           						<c:choose>
						        			<c:when test="${row.categoryId == CatList.categoryId }">
						        				<option value="${CatList.categoryId }" selected>${CatList.categoryName }</option>
						        			</c:when>
						        			<c:otherwise>
						        				<c:choose>
						        					<c:when test="${catId == CatList.categoryId }">
								        				<option value="${CatList.categoryId }" selected>${CatList.categoryName }</option>
								        			</c:when>
								        			<c:otherwise>
								        				<option value="${CatList.categoryId }">${CatList.categoryName }</option>
								        			</c:otherwise>
						        				</c:choose>
						        			</c:otherwise>
						        		</c:choose>
		           					</c:if>
		           				</c:when>
		           				<c:otherwise>
		           						<c:choose>
						        			<c:when test="${row.categoryId == CatList.categoryId }">
						        				<option value="${CatList.categoryId }" selected>${CatList.categoryName }</option>
						        			</c:when>
						        			<c:otherwise>
						        				<c:choose>
						        					<c:when test="${catId == CatList.categoryId }">
								        				<option value="${CatList.categoryId }" selected>${CatList.categoryName }</option>
								        			</c:when>
								        			<c:otherwise>
								        				<option value="${CatList.categoryId }">${CatList.categoryName }</option>
								        			</c:otherwise>
						        				</c:choose>
						        			</c:otherwise>
						        		</c:choose>
		           				</c:otherwise>
		           			</c:choose>
		           		</c:forEach>
		           </select>
				</div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-3"><strong>작성자</strong></label>
		        <div class="col-sm-4">
	        		<c:choose>
	        			<c:when test="${row ne null }">
	        				<input type="text" class="form-control" maxlength="50" value="${row.nickname}" readonly>
							<input type="text" class="form-control" name="accountId" id="accountId" maxlength="50" value="${row.accountId}" style="display:none" readonly>
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" class="form-control" maxlength="50" value="${login.nickname}" readonly>
							<input type="text" class="form-control" name="accountId" id="accountId" maxlength="50" value="${login.accountId}" style="display:none" readonly>
	        			</c:otherwise>
	        		</c:choose>
		        </div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-3"><strong>유투브 링크</strong></label>
		        <div class="col-sm-8" style="display:inline-block">
	        		<c:choose>
	        			<c:when test="${row ne null }">
	        				<input type="text" class="form-control" name="youtubeLink" id="youtubeLink" maxlength="300" placeholder="Enter Youtube Link" style="width:400px" value="${row.youtubeLink }">
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" class="form-control" name="youtubeLink" id="youtubeLink" maxlength="300" placeholder="Enter Youtube Link" style="width:400px">
	        			</c:otherwise>
	        		</c:choose>
					<input type="button" id="test" class="btn btn-danger"  value="썸네일 보기"></input>
		        </div>
			</div>
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
								//document.write('<img id="profileImg" style="border-radius:0%; padding-left : 15px; padding-top:10px; height:200px; width:300px;" src="https://img.youtube.com/vi/' + youtubeID + '/mqdefault.jpg"></img>');
							}
						});
					</script>
				</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-3"><strong>내용</strong></label>
				<div class="col-sm-4">
	        		<c:choose>
	        			<c:when test="${row ne null }">
	        				<textarea rows="10" cols="80" name="object" id="object"><c:out value="${row.object }"/></textarea>
	        			</c:when>
	        			<c:otherwise>
	        				<textarea rows="10" cols="80" name="object" id="object"></textarea>
	        			</c:otherwise>
	        		</c:choose>
				</div>
			</div>
			<br>
			<hr>
			<br>
			<div class="row" align="center">
			<div class="col-sm-5">
			</div>
			<div class="col-sm-2">
        		<c:choose>
        			<c:when test="${row ne null }">
        				<button type="button" class="btn btn-outline-danger" onclick="updateBtn();"><i class="fab fa-youtube"></i>&nbsp;&nbsp;수정하기</button>
        			</c:when>
        			<c:otherwise>
        				<button type="button" class="btn btn-outline-danger" onclick="insertBtn();"><i class="fab fa-youtube"></i>&nbsp;&nbsp;동영상 올리기</button>
        			</c:otherwise>
        		</c:choose>
        		<script type="text/javascript">
				function insertBtn() {
					var p = /^(?:https?:\/\/)?(?:m\.|www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
		  			var subject = $("#subject").val();
		  			var object = $("#object").val();
		  			var youtubeLink = $("#youtubeLink").val();
		  			if(subject.length == 0) { alert("제목을 입력해 주세요."); $("#subject").focus(); return; }
		  			if(object.length == 0) { alert("내용을 입력해 주세요."); $("#object").focus(); return; }
		  			if(youtubeLink.length == 0) { alert("유튜브링크를 입력해 주세요."); $("#youtubeLink").focus(); return; }
		  			if(!youtubeLink.match(p)) { alert("유튜브링크를 입력해 주세요."); $("#youtubeLink").focus(); return; }
					
		  			document.videoForm.action = "/videoboard/insertVideoBoardPro";
		  			document.videoForm.method = "POST";
		  			document.videoForm.submit();
				}
				
				function updateBtn() {
					var p = /^(?:https?:\/\/)?(?:m\.|www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
		  			var subject = $("#subject").val();
		  			var object = $("#object").val();
		  			var youtubeLink = $("#youtubeLink").val();
		  			if(subject.length == 0) { alert("제목을 입력해 주세요."); $("#subject").focus(); return; }
		  			if(object.length == 0) { alert("내용을 입력해 주세요."); $("#object").focus(); return; }
		  			if(youtubeLink.length == 0) { alert("유튜브링크를 입력해 주세요."); $("#youtubeLink").focus(); return; }
		  			if(!youtubeLink.match(p)) { alert("유튜브링크를 입력해 주세요."); $("#youtubeLink").focus(); return; }

		  			document.videoForm.action = "/videoboard/updateVideoBoardPro";
		  			document.videoForm.method = "POST";
		  			document.videoForm.submit();
				}
				</script>
			</div>
			<div class="col-sm-1">
			</div>
			<div class="col-sm-4" align="left">
	       		<button type="reset" class="btn btn-outline-info">초기화</button>
	       		<button type="button" class="btn btn-outline-dark" onclick="location.href='/videoboard/videoBoardList'">목록으로</button>
			</div>
			</div>
		</form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>
