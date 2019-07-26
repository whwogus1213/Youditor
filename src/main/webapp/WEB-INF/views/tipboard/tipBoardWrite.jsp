<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편집 팁 - 작성 - YouditoR</title>
<jsp:include page="./../module/header.jsp" flush="false"/>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/tipboard/tipboard.jpg'); background-position:50% 20%; background-size:100%; font-family: 'Noto Serif KR', sans-serif; color:Peru; padding-top:130px; padding-bottom:5%"  >
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>편집 Tip</strong></h1>
			<h4 align="center"><br>나만의 편집 팁을 공유하세요.</h4>
		</div>
	</div>
	
	<div class="container">
		<div align="right" >
			<br>
			<h1 style="color:Brown; font-family: 'Noto Serif KR'">편집 Tip 작성</h1>
		</div>
		<hr>
		<br>
	    <form class="form-horizontal" method="post" action=" ${path}/tipboard/insertTipBoardPro">
	    	<div class="form-inline">
	        	<label class="control-label col-sm-2"><strong style="color:brown">제목</strong></label>
	        	<div class="col-sm-8">
	        		<input type="text" class="form-control" name="subject" maxlength="50" placeholder="Enter Title" style="width:100%">
	        	</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:brown">카테고리</strong></label>
				<div class="col-sm-3">
	        		<select class="browser-default custom-select" name="categoryId" style="width:100%">
		           		<option value="1">팁</option>
		           		<option value="2">질문</option>
		           </select>
				</div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-2"><strong style="color:brown">작성자</strong></label>
		        <div class="col-sm-3">
					<input type="text" class="form-control" maxlength="50" value="${login.nickname}" readonly style="width:100%">
					<input type="text" class="form-control" name="accountId" maxlength="50" value="${login.accountId}" style="display:none" readonly>
		        </div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:brown">내용</strong></label>
				<div class="col-sm-3">
					<textarea rows="10" cols="90" name="object"></textarea>
				</div>
			</div>
			<br>
			<div class="col-sm-12" align="center" style="color:brown">
			<button type="submit" id="submit" class="btn btn-sm"><strong style="color:brown">올리기</strong></button>&nbsp;|
	       <button type="reset" class="btn btn-sm"><strong style="color:brown">초기화</strong></button>&nbsp;|
	       <button type="button" class="btn btn-sm" onclick="location.href='/tipboard/tipBoardList?num=1'"><strong style="color:brown">뒤로 가기</strong></button>
	       </div>
			<br>
		</form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>
