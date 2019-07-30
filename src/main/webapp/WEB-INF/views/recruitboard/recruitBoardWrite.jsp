<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인구직 - YouditoR</title>
<jsp:include page="./../module/header.jsp" flush="false"/>

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
	
	<div class="container">
		<div class="col-sm-11" align="right" >
			<br>
			<h1 style="color:PaleVioletRed; font-family: 'Song Myung', sans-serif; ">구인/구직 게시글 작성</h1>
		</div>
		<hr>
		<br>
	    <form class="form-horizontal" method="post" action=" ${path}/recruitboard/insertRecruitBoardPro">
	    	<div class="form-inline">
	        	<label class="control-label col-sm-2"><strong style="color:PaleVioletRed">제목</strong></label>
	        	<div class="col-sm-3">
	        		<input type="text" class="form-control" name="subject" maxlength="50" placeholder="Enter Title">
	        	</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:PaleVioletRed">카테고리</strong></label>
				<div class="col-sm-3">
	        		<select class="browser-default custom-select" name="categoryId" style="width:190px">
		           		<option value="1">구인</option>
		           		<option value="2">구직</option>
		           </select>
				</div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-2"><strong style="color:PaleVioletRed">작성자</strong></label>
		        <div class="col-sm-3">
					<input type="text" class="form-control" maxlength="50" value="${login.nickname}" readonly>
					<input type="text" class="form-control" name="accountId" maxlength="50" value="${login.accountId}" style="display:none" readonly>
		        </div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-2"><strong style="color:PaleVioletRed">급여</strong></label>
		        <div class="col-sm-3">
					<input type="text" class="form-control" id="fee" name="fee" maxlength="50">
		        </div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:PaleVioletRed">내용</strong></label>
				<div class="col-sm-3">
					<textarea rows="10" cols="100" name="object"></textarea>
				</div>
			</div>
			<br>
			<div class="col-sm-11" align="right">
				<button type="submit" id="submit" class="btn btn-link"><strong style="color:PaleVioletRed"><i class="fas fa-file-upload"></i>&nbsp;&nbsp;올리기</strong></button>|
				<button type="reset" class="btn btn-link"><strong style="color:PaleVioletRed"><i class="fas fa-undo-alt"></i>&nbsp;&nbsp;초기화</strong></button>&nbsp;|
				<button type="button" class="btn btn-link" onclick="history.go(-1)"><strong style="color:PaleVioletRed"><i class="fas fa-backspace"></i>&nbsp;&nbsp;뒤로 가기</strong></button>
			</div>
			<br>
		</form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>
