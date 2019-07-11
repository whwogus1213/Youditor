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
	
	<!-- 게시글 상세정보 -->
	<div class="container">
		<div align="center">
			<br><br>
			<h1>구인 구직</h1>
			<br><br>
		</div>
		<hr>
		<br>
		<label class="control-label col-sm-2">제목</label>
		<input type="text" class="form-control" name="subject" id="subject" maxlength="50" value="${row.subject }">
		<br>
		<label class="control-label col-sm-2">내용</label>
		<input type="text" class="form-control" name="object" id="object" maxlength="50" value="${row.object }">
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
