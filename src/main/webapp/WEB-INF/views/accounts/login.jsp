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
</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false"/>
	<h2 align="center">&nbsp;</h2>
	<h2 align="center">&nbsp;</h2>
	<h1 align="center">YouditoR 로그인</h1>
	<h2 align="center">&nbsp;</h2>
	<h2 align="center">&nbsp;</h2>
<<<<<<< Updated upstream
	<h2 align="center">&nbsp;</h2>

=======

>>>>>>> Stashed changes

	<div class="container" align ="center">
	<form class="form-horizontal" method="post">
		<div class="form-inline">
			<h2 align="center">&nbsp;</h2>
			<label class="control-label col-sm-3">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="email"
					name="email" maxlength="16" placeholder="Enter ID">
			</div>
		</div>
		<div class="form-inline">
			<h2 align="center">&nbsp;</h2>
			<label class="control-label col-sm-3">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="pwd"
					name="pwd" maxlength="16" placeholder="Enter Password">
			</div>
		</div>
		<h2 align="center">&nbsp;</h2>
		<div class="form-group">
			<h2 align="center">&nbsp;</h2>
			<div class="col-sm-offset-2 col-sm-12" align="center">
<!-- 				<button type="button" class="btn btn-primary"
					onclick="memberInsertCheckForm(this.form)">
				로그인</button> -->
				<button type="submit" class="btn btn-primary">
				로그인</button>
			</div>
		</div>
	</form>
	</div>
	<c:if test="${msg == false }">
		 <script>
	      alert( '로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.' );
	    </script>
	</c:if>
>>>>>>> Stashed changes
	<h2 align="center">&nbsp;</h2>
	<h2 align="center">&nbsp;</h2>

	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
