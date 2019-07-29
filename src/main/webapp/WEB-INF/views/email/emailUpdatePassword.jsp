<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" charset="UTF-8">
	<title>비밀번호수정 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<script type="text/javascript">
	$(function() {
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
				var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
				results = regex.exec(location.search);
				return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
			}
		var accountId = getParameterByName("accountId");
		alert(accountId);
		$("#accountId").val(accountId);
		
	});

	function changePwd() {

		var pwd = $("#pwd").val();
		var pwdCfm = $("#pwdCfm").val();
		if(pwd.length < 8) {
			alert("비밀번호가 최소 8자 이상이어야 합니다.");
			$("#pwd").focus();
			return;
		}
		if(pwd != pwdCfm) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwdCfm").focus();
			return;	
		} else {
			$("#newPwdForm").submit();
		}
	}
	</script>
	<style>
input {
    padding-left: 5px;
}
.passform {
    margin: 80px;
    padding-bottom: 230px;
    padding-top: 50px;
}
.button-style1 {
    color: #fff;
    background-color: #007bff;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    
}
.thcell {
    background: #f9f9f9;
}
.pbnt-st{
	margin-top: 40px;
}
td {
	border: 1px solid #e5e5e5;
	padding: 32px 31px 32px;
}
	</style>
</head>
<body style="background-color: #FFF;">
	<div align="center" class="passform">
			<form id="newPwdForm" method="POST" action="${path}/email/emailUpdatePasswordPro">
				<table>
					<tr>
						<td class="thcell">새비밀번호</td>
						<td><input type="password" name="pwd" id="pwd" maxlength="20" placeholder="Enter New Password"></td>
						<form:errors path="pwd" />
					</tr>
					<tr>
						<td class="thcell">새비밀번호 확인</td>
						<td>
							<input type="password" name="pwdCfm" id="pwdCfm" maxlength="20" placeholder="Confirm New Password">
						</td>
					</tr>
				</table>
						<div>
						<input id="accountId" name="accountId"/>
						
							<p class="pbnt-st">
							<button type="button" onclick="changePwd();">비밀번호 변경</button>
						 	</p>
						</div>
			</form>
		
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>