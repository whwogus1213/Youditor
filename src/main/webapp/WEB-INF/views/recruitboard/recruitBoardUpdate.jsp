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
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/recruit/recruit.jpg'); background-position:50% 60%; background-size:100%; font-family: 'Song Myung', sans-serif; color:white; text-shadow: -1px 0 LightPink, 0 1px LightPink, 1px 0 LightPink, 0 -1px LightPink; padding-top:130px; padding-bottom:5%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>구인/구직</strong></h1>
			<h4 align="center"><br>당신의 파트너가 될 YouditoR가 있습니다.</h4>
		</div>
	</div>
	
	<form class="form-horizontal" method="post" action="${path}/recruitboard/update">
	
	
	<!-- 게시글 상세정보 -->
	<div class="container">
		<div class="col-sm-11" align="right" >
			<br>
			<h1 style="color:PaleVioletRed; font-family: 'Song Myung', sans-serif; ">구인/구직 게시글 수정</h1>
		</div>
		<hr>
		<br>
		<div class="row">
			<label class="control-label col-sm-2"><strong>제목</strong></label>
			<input class="col-sm-9" type="text" class="form-control" name="subject" id="subject" maxlength="50" value="${row.subject }">
		</div>
		<br>
		<div class="row">
			<label class="control-label col-sm-2"><strong>작성일</strong></label>
			<label class="control-label col-sm-4"><span>${row.reg_date}</span></label>

			<label class="control-label col-sm-2"><strong>마지막 수정일</strong></label>
			<label class="control-label col-sm-4"><fmt:formatDate value="${row.mod_date}" pattern="yyyy-MM-dd" /></label>
		</div>
		<br>
		<div class="row">
			<label class="control-label col-sm-2"><strong>내용</strong></label>
			<textarea rows="10" cols="104" name="object" id="object">${row.object }</textarea>
		</div>
		<br>
		<div class="row">
			<label class="control-label col-sm-2"><strong>급여</strong></label>
			<input class="col-sm-9" type="text" class="form-control" name="fee" id="fee" maxlength="50" value="${row.fee}">
		</div>
		<input type="text" class="form-control" name="boardId" id="boardId" maxlength="50" value="${row.boardId}" style="visibility:hidden">
		<br>
		</div>
		<hr>
		<br>
		<div align="center">
			<button type="submit" class="btn btn-link" id="submit" style="color:black"><i class="fas fa-cut"></i>&nbsp;&nbsp;수정</button>
			<button type="button" class="btn btn-link" onclick="location.href='/recruitboard/recruitBoardView?boardId=${row.boardId}'" style="color:black"><i class="fas fa-undo"></i>&nbsp;&nbsp;취소</button>
		</div>
		<br>
	</form>

</body>
<jsp:include page="../module/bottom.jsp" flush="false"/>
</html>
