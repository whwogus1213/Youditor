<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>  <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

  <title>로그인 - YouDitor</title>
<!-- 	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<jsp:include page="../module/header.jsp" flush="false"/>


	<!-- Custom styles -->
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<script type="text/javascript">
	$(function(){
		$('#pwd').keypress(function(event) {
			// var keycode = (event.keyCode ? event.keyCode : event.which);
			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			console.log(keycode);
			if (keycode == '13') {
				DoLogin();
			}

			event.stopPropagation();
		});
	});
    function DoLogin() {
  		var email = $("#email").val();
  		var pwd = $("#pwd").val();
  		if(email.length == 0) { alert("이메일를 입력해 주세요."); $("#email").focus(); return; }
  		if(pwd.length == 0) { alert("비밀번호를 입력해 주세요."); $("#pwd").focus(); return; }
		$("#frm").submit();
  	}
  	</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<div align="center">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">로그인</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
	</div>
	<div class="container" align ="center">
	<form class="form-horizontal" id="frm" method="post">
		<div class="form-inline">
			<h2 align="center">&nbsp;</h2>
			<label class="control-label col-sm-3">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="email"
					name="email" maxlength="30" placeholder="Enter ID">
			</div>
		</div>
		<div class="form-inline">
			<h2 align="center">&nbsp;</h2>
			<label class="control-label col-sm-3">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="pwd"
					name="pwd" maxlength="20" placeholder="Enter Password"><br>
				<a href="/accounts/resetPassword.do">비밀번호를 잊어버리셨습니까?</a>
			</div>
		</div>
		<h2 align="center">&nbsp;</h2>
		<div class="form-group">
			<h2 align="center">&nbsp;</h2>
			<div class="col-sm-offset-2 col-sm-12" align="center">
<!-- 				<button type="button" class="btn btn-primary"
					onclick="memberInsertCheckForm(this.form)">
				로그인</button> -->
				<button type="button" class="btn btn-primary" onclick="DoLogin();">
					로그인
				</button>
			</div>
		</div>
	</form>
	</div>

	<c:if test="${error.error == false }">
		<c:choose>
			<c:when test="${error.msg eq 0 }">
				<script>
					alert( '탈퇴된 계정입니다.' );
		   		</script>
			</c:when>
			<c:when test="${error.msg eq 1 }">
				<script>
					alert( '영구정지된 계정입니다.' );
		   		</script>
			</c:when>
			<c:when test="${error.msg eq 2 }">
				<script>
					alert( '임시정지된 계정입니다.' );
		   		</script>
			</c:when>
			<c:otherwise>
				<script>
					alert( '로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.' );
		   		</script>
			</c:otherwise>
		</c:choose>
	</c:if>
	<h2 align="center">&nbsp;</h2>
	<h2 align="center">&nbsp;</h2>

	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
