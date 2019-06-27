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

</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false"/>
	
	<!-- 게시글 상세정보 -->
	<h1>${row.boardId }</h1>
	<h1>${row.accountId }</h1>
	<h1>${row.categoryId }</h1>
	<h1>${row.subject }</h1>
	<h1>${row.object }</h1>
<%-- 	<h1>${row.youtubeLink }</h1> --%>
<div class="container">
	<div class="form-group">
		<div class="col-sm-8">
			<input class="form-control" type="text" id="reply_input" placeholder="댓글 추가..." maxlength="200">
			<button id="replyAdd" class='btn btn-success btn-sm'>댓글</button>
		</div>
	</div>
	


	<div id="rList">
		<%@ include file="../videoboard/videoBoardReply.jsp" %>
	</div>
	
	
	
</div>
	
	

	
	
	
	
	
	
	
	<jsp:include page="../module/bottom.jsp" flush="false"/>
 
</body>
</html>