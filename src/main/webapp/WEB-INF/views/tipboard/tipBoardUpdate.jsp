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

  <title>${row.subject } - 팁 - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>

</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/tipboard/tipboard.jpg'); background-position:50% 20%; background-size:100%; font-family: 'Noto Serif KR', sans-serif; color:Peru; padding-top:130px; padding-bottom:5%">
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>편집 Tip</strong></h1>
			<h4 align="center"><br>나만의 편집 팁을 공유하세요.</h4>
		</div>
	</div>
	
	<!-- 게시글 상세정보 -->
	<div class="container">
		<form class="form-horizontal" method="post" action="${path}/tipboard/updateTipBoardPro">
		<div align="right" >
			<br>
			<h1 style="color:Brown; font-family: 'Noto Serif KR'">편집 Tip 수정</h1>
		</div>
		<hr>
		<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:brown">제목</strong></label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="subject" id="subject" maxlength="50" style="width:100%" value="${tipBoardUpdate.subject }">
				</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:brown">카테고리</strong></label>
				<div class="col-sm-3">
	        		<select class="browser-default custom-select" name="categoryId" style="width:190px">
		           		<option value="1">팁</option>
		           		<option value="2">질문</option>
		           </select>
				</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:brown">작성 일</strong></label>
				<div class="col-sm-3">
					<fmt:formatDate value="${tipBoardUpdate.reg_date}" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:brown">내용</strong></label>
				<div class="col-sm-3">
				<textarea rows="10" cols="90" name="object">${tipBoardUpdate.object }</textarea>
				</div>
			</div>
			<input type="text" class="form-control" name="boardId" id="boardId" maxlength="50" value="${tipBoardUpdate.boardId}" style="visibility:hidden">
			
			<div align="right">
			</div>
			<hr>
			<br>
			<div align="center" style="color:brown">
				<button type="submit" class="btn btn-sm" id="submit"><strong style="color:brown">수정</strong></button>&nbsp;|
				<button type="reset" class="btn btn-sm"><strong style="color:brown">초기화</strong></button>&nbsp;|
				<button type="button" class="btn btn-sm" onclick="location.href='/tipboard/tipBoardList' "><strong style="color:brown">취소</strong></button>
			</div>
			<br>
		</form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
