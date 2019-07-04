<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>패스워드 리셋 확인 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body> 
	<jsp:include page="../module/top.jsp" flush="false"/>
	<div align="center">
		<div>
		비밀번호가 성공적으로 리셋되었습니다.<br>
		리셋된 비밀번호는 "tempPassword"입니다.<br>
		리셋된 비밀번호는 바로 자신만의 비밀번호로 변경해주시기 바랍니다.
		</div>
		<div>
			<a class="button" href="#">회원정보수정</a>
		</div>
	</div>
</body>
</html> 