<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" charset="UTF-8">
	<title>비밀번호수정 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<script type="text/javascript">
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
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<div align="center">
		<c:if test="${login.accountId ne null }">
			<form:form id="newPwdForm" commandName="newPwdForm" action="${path}/accounts/updatePasswordPro">
				<table>
					<tr>
						<td>새비밀번호</td>
						<td><input type="password" name="pwd" id="pwd" maxlength="20" placeholder="Enter New Password"></td>
						<td><form:errors path="pwd" /></td>
					</tr>
					<tr>
						<td>새비밀번호 확인</td>
						<td>
							<input type="password" name="pwdCfm" id="pwdCfm" maxlength="20" placeholder="Confirm New Password">
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="accountId" id="accountId" value="${login.accountId }">
							<input type="hidden" name="email" id="email" value="${login.email }">
							<input type="button" value="비밀번호 변경" onclick="changePwd();">
						</td>
					</tr>
				</table>
			</form:form>
		</c:if>
		<c:if test="${login.accountId eq null }">
			로그인상태가 아닙니다.<br>
			<a class="button" href="/accounts/login.do">로그인하러 가기</a>
		</c:if>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>