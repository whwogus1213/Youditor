<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>  <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- <link href="/resources/css/chat.css" rel="stylesheet"> -->

  <title>비밀번호 찾기 완료 - YouDitor</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<jsp:include page="../module/header.jsp" flush="false"/>

<jsp:include page="../module/header.jsp" flush="false"/>

	
	<!-- Custom styles -->
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<style type="text/css">
	.confirm {
		text-align: center;
		font-family: 'Jua';
	}
	</style>
</head>
<body style="background-color: #FFF;">
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<br/><br/><br/><br/><br/>
		<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>${message}</h3><hr/>
			</div>
			<div>
				<p class="confirm">
					이메일이 발송되었습니다.
				</p>
				<p class="confirm">
					메일을 확인해 주세요.
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>
