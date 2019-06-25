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

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body>
	<div class="container">
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<label><span class="glyphicon glyphicon-user"></span>
					Manager ID</label> <input type="text" class="form-control" id="adminID"
					name="adminID" maxlength="16" placeholder="Enter Admin ID">
			</div>
			<div class="form-group">
				<label><span class="glyphicon glyphicon-eye-open"></span>
					Password</label> <input type="password" class="form-control" id="adminPWD"
					name="adminPWD" maxlength="16" placeholder="Enter Admin Password">
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
