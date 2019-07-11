<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>회원정보수정 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<script type="text/javascript">
	function btnRePwd() {
		var pwdCfm = $("#pwdCfm").val();
		var pwd = $("#pwd").val();
  		if(pwd == pwdCfm) {
  			document.modForm.action = "${path}/accounts/updatePassword.do";
			document.modForm.submit();
  	  	} else {
	  	  	alert("비밀번호가 틀렸습니다.");
  			$("#pwdCfm").focus();
  			return;
		}
  	}
	
	function btnUpdate() {
		var pwdCfm = $("#pwdCfm").val();
		var pwd = $("#pwd").val();
		if(pwd == pwdCfm) {
			document.modForm.action = "${path}/accounts/updateAccount.do";
			document.modForm.submit();
  	  	} else {
  	  		alert("비밀번호가 틀렸습니다.");
			$("#pwdCfm").focus();
			return;
		}
  	}
	
	function btnDelete() {
		var pwdCfm = $("#pwdCfm").val();
		var pwd = $("#pwd").val();
		if(pwd == pwdCfm) {
			msg = "정말로 계정을 삭제하시겠습니까?";
            if (confirm(msg)!=0) {
				// Yes click
            	document.modForm.action = "${path}/accounts/deleteAccount.do";
    			document.modForm.submit();
            } else {
				// no click
				return;
			}
  		} else {
  			alert("비밀번호가 틀렸습니다.");
  			$("#pwdCfm").focus();
  			return;
  	  	}
  	}
	</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<div align="center">
		<c:if test="${login.accountId ne null }">
			<form:form name="modForm" method="POST" enctype="multipart/form-data">
				<table>
					<tr>
						<td>가입날자</td>
						<td>${login.reg_date }</td>
					</tr>
					<tr>
						<td>마지막수정날자</td>
						<td>${login.mod_date }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" id="email" value="${login.email }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td>
							<input type="password" name="pwdCfm" id="pwdCfm" value="">
							<input type="hidden" name="pwd" id="pwd" value="${login.pwd }">
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="button" value="비밀번호바꾸기" onclick="btnRePwd();">
						</td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="nickname" id="nickname" value="${login.nickname }"></td>
					</tr>
					<tr>
						<td>포트레이트</td>
						<td>
						 	<!-- name="picture"의 변수명과 컨트롤러의 MultipartFile file과 일치해야 한다. -->
							<input type="file" name="picture" id="picture" value="${login.picture }">
						 </td>
					</tr>
					<tr>
						 <td>미리보기 - 준비중</td>
						<td>
							<c:choose>
						 		<c:when test="${empty picture }">
									<div>
										<img id ="profileImg" src = "<spring:url value = '/image/${login.picture}'/>" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<img id="profileImg" style="height:100px; width:100px" />
									</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td><textarea name="footer" id="footer" rows="4" cols="10">${login.footer }</textarea>
					</tr>
					<tr>
						<td align="center">
							<input type="hidden" name="accountId" id="accountId" value="${login.accountId }">
							<input type="button" value="수정하기" onclick="btnUpdate();">
							<input type="button" value="삭제하기" onclick="btnDelete();">
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
	<c:if test="${msg == false }">
		 <script>
	      alert( '계정 삭제에 실패했습니다.' );
	    </script>
	</c:if>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>