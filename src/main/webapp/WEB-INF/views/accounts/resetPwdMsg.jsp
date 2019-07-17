<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>패스워드 리셋 확인 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<style>
	.reform{
		margin-top: 40px;
		margin-bottom: 400px;
	}
	
.button-style1{
	background-color: #fff;
	border: 0;
	color: blue;
}
	</style>
</head>
<body style="background-color: #FFF;"> 
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<div align="center" class="reform">
		<div>
		비밀번호가 성공적으로 리셋되었습니다.<br>
		리셋된 비밀번호는 "tempPassword"입니다.<br>
		리셋된 비밀번호는 바로 자신만의 비밀번호로 변경해주시기 바랍니다.
		</div>
		<div>
			<button type="button" class="nav-link button-style1" data-toggle="modal" 
						data-target="#myModal">로그인</button>
		</div>
	</div>
	
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html> 