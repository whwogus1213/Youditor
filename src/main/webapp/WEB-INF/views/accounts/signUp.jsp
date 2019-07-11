<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<script type="text/javascript">
		$().ready(function(){
			
			$("#insertBtn").click(function(){
				$("#signUpForm").attr({
					"method" : "post",
					"action" : "<c:url value="/accounts/signUpPro" />"
				});
				$("#signUpForm").submit();
			});
			
		});
	</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">YouditoR 회원 가입</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
	</div>
	<div align="center">
		<form:form commandName="signUpForm"> <!-- 스프링 태그의 form으로 변경 id 대신 commandName 사용 -->
			<input type="text" name="email" placeholder="input email"/>
				<form:errors path="email" /><br>
			<input type="password" name="pwd" placeholder="input password" />
				<form:errors path="pwd" /><br>
			<input type="password" name="pwdCfm" placeholder="confirm password" /><br>
			<input type="text" name="nickname" placeholder="input nickname" />
				<form:errors path="nickname" /><br>
			<input type="file" name="picture"><br>
			<textarea name="footer" rows="6" cols="10"></textarea><br>
			<input type="button" id="insertBtn" value="등록" /><br>
		</form:form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>