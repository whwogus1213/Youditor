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
	<div class="container">
		<div class="form-group">
			<div class="col-sm-12" style="background-image:url('/resources/images/recruit/recruit.jpg'); background-position:50% 60%; font-family: 'Song Myung', sans-serif; color:white; text-shadow: -1px 0 LightPink, 0 1px LightPink, 1px 0 LightPink, 0 -1px LightPink; margin-top:70px;">
				<h1 align="center" style="font-size:50px; letter-spacing:10px"><br><strong>구인/구직</strong></h1>
				<h4 align="center"><br>당신의 파트너가 될 YouditoR가 있습니다.</h4>
				<h1 align="center"><br></h1>
			</div>
		</div>
	    <form class="form-horizontal" method="post" action=" ${path}/recruitboard/insertRecruitBoardPro">
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
	        		<select class="browser-default custom-select" name="categoryId" style="width:190px">
		           		<option value="1">구인</option>
		           		<option value="2">구직</option>
		           </select>
				</div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-2">작성자</label>
		        <div class="col-sm-3">
					<input type="text" class="form-control" maxlength="50" value="${login.nickname}" readonly>
					<input type="text" class="form-control" name="accountId" maxlength="50" value="${login.accountId}" style="display:none" readonly>
		        </div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-2">급여</label>
		        <div class="col-sm-3">
					<input type="text" class="form-control" id="fee" name="fee" maxlength="50">
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
			<button type="submit" id="submit" class="btn btn-success">올리기</button>
	       <button type="reset" class="btn btn-warning">초기화</button>
	       <button type="button" class="btn btn-info" onclick="history.go(-1)">뒤로 가기</button>
	       </div>
			<br>
		</form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>
