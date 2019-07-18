<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>  <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

  <title>${row.subject } - 구인구직 - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>

</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<form class="form-horizontal" method="post" action="${path}/recruitboard/update">
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/recruit/recruit.jpg'); background-position:50% 60%; background-size:100%; font-family: 'Song Myung', sans-serif; color:white; text-shadow: -1px 0 LightPink, 0 1px LightPink, 1px 0 LightPink, 0 -1px LightPink; padding-top:130px; padding-bottom:5%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>구인/구직</strong></h1>
			<h4 align="center"><br>당신의 파트너가 될 YouditoR가 있습니다.</h4>
		</div>
	</div>
	
	<!-- 게시글 상세정보 -->
	<div class="container">
		<hr>
		<br>
		<label class="control-label col-sm-2">제목</label>
		<input type="text" class="form-control" name="subject" id="subject" maxlength="50" value="${row.subject }">
		<br>
		<label class="control-label col-sm-2">내용</label>
		
		<textarea rows="10" cols="100" name="object" id="object">${row.object }</textarea>
		<br>
		<input type="text" class="form-control" name="boardId" id="boardId" maxlength="50" value="${row.boardId}" style="visibility:hidden">
		<br>
		<label class="control-label col-sm-2">급여</label>
		<input type="text" class="form-control" name="boardId" id="boardId" maxlength="50" value="${row.fee}">
		
		<div align="right">
		<h4>작성 일시 <fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd" />
		</h4>
		</div>
		<hr>
		<br>
		
		<br>
		<hr>
		<div align="center">
			<button type="submit" id="submit">수정</button>
			<button type="button" class="btn btn-danger" onclick="location.href='/recruitboard/recruitBoardList' ">취소</button>
		</div>
		<br>
	</div>
	</form>
	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
