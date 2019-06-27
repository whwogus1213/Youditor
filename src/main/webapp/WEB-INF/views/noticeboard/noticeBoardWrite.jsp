<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 - 작성 - YouditoR</title>
<jsp:include page="./../module/header.jsp" flush="false"/>
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">공지 올리기</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
	</div>
	<div class="container">
	    <form class="form-horizontal" method="post"action=" ${path}/noticeboard/insertNoticeBoardPro">
	    	<div class="form-inline">
	        	<label class="control-label col-sm-2">제목</label>
	        	<div class="col-sm-3">
	        		<input type="text" class="form-control" name="subject" maxlength="50" placeholder="Enter Title">
	        	</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2">카테고리</label>
				<div class="col-sm-3">
	        		<select name="categoryId">
		           		<option value="1">공지</option>
		           		<option value="2">이벤트</option>
		           </select>
				</div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-2">작성자</label>
		        <div class="col-sm-3">
					<input type="text" class="form-control" name="accountId" maxlength="50" placeholder="Enter Title">
		        </div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea rows="10" cols="100" name="object"></textarea>
				</div>
			</div>
			<br>
			<div class="col-sm-12" align="center">
			<button type="submit" id="submit">올리기</button>
	       <button type="reset" class="btn btn-warning btn-sm">초기화</button>
	       <button type="button" class="btn btn-info btn-sm" onclick="location.href='/noticeboard/noticeBoardList?num=1'">뒤로 가기</button>
	       </div>
			<br>
		</form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>
