<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>redirectpage</title>
</head>
<body>
<%
	String redirectURL = "messageReceiveList";
	response.sendRedirect(redirectURL);
%>
</body>
</html>