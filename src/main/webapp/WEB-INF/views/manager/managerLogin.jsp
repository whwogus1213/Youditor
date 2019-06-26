<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>YouditoR</title>

	<jsp:include page="../module/header.jsp" flush="false"/>

</head>

<body>
	<div class="container">
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<label><span class="glyphicon glyphicon-user"></span>
					Manager ID</label> <input type="text" class="form-control" id="adminId"
					name="adminId" maxlength="16" placeholder="Enter Admin ID">
			</div>
			<div class="form-group">
				<label><span class="glyphicon glyphicon-eye-open"></span>
					Password</label> <input type="password" class="form-control" id="adminPwd"
					name="adminPwd" maxlength="16" placeholder="Enter Admin Password">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-success btn-block">
					<span class="glyphicon glyphicon-off"></span> Login
				</button>
			</div>
		</form>
	</div>
</body>

</html>
