<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>비밀번호 찾기 - YouDitor</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<jsp:include page="../module/header.jsp" flush="false"/>
	<script>
	</script>
	<style>
	.w3-block {
    width: 50%;
    margin-left: auto;
    margin-right: auto;
}
	</style>
</head>
<body style="background-color: #FFF;">
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<br/><br/><br/><br/><br/>
			<form id="search" name="search" action="${path }/email/sendpwd.do" method="post">
				<div class="w3-content w3-container w3-margin-top">
				<div class="w3-container w3-card-4">
					<div class="w3-center w3-large w3-margin-top">
						<h3>비밀번호 찾기</h3>
					</div>
					<div>
						<p>
							<label><strong>닉네임(nickname)</strong></label>
							<input class="w3-input" type="text" id="nickname" name="nickname" required>
						</p>
						<p>
							<label><strong>이메일(e-mail)</strong></label>
							<input class="w3-input" type="text" id="email" name="email" required>
						</p>
						<p>
							<label><strong>${message }</strong></label>
						</p>
						<p class="w3-center">
							<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
							<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
						</p>
					</div>
				</div>
				</div>
			</form>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>

