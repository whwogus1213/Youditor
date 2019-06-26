<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>  <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

  <title>YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<script>
		function getYoutubeCode(e){
			var youtubeCode;
			var eSplit  = e.split('/');
			for( var i in eSplit ) {
				youtubeCode = eSplit[i];
			}
			return youtubeCode;
		}
	</script>

  <!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false"/>
	
	<!-- 게시글 상세정보 -->
	<div align="center" style="background-color:black; padding:30px">
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
	<h1>${row.subject }</h1>
	<h1>${row.object }</h1>
	<h1>${row.accountId }</h1>
	<h1>${row.categoryId }</h1>
	<h1>${row.youtubeLink }</h1>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
 
</body>
</html>