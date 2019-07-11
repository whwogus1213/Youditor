<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>받은 메세지 읽기 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../module/top2.jsp" flush="false"/>
<div align="center">
	<div class="col-sm-12">
		<h2 align="center">&nbsp;</h2>
		<h1 align="center">받은 메세지</h1>
		<h2 align="center">&nbsp;</h2>
	</div>
	<div>
		<a href="/message/messageSendList">보낸 메세지 보기</a>
	</div>
</div>
<hr>
<div class="container" align="center">
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			보낸이
		</div>
		<div class="col-sm-2" align="left">
			${rMessage.nickname }
		</div>
		<div class="col-sm-2">
			보낸 날짜
		</div>
		<div>
			<fmt:formatDate value="${rMessage.send_date}" pattern="yyyy-MM-dd" />
		</div>
	</div>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			받는이
		</div>
		<div class="col-sm-2" align="left">
			${login.nickname }
		</div>
		<div class="col-sm-2">
			읽은 날짜
		</div>
		<div>
			<fmt:formatDate value="${rMessage.read_date}" pattern="yyyy-MM-dd" />
		</div>
	</div>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			제목
		</div>
		<div class="col-sm-6" align="left">
			${rMessage.subject }
		</div>
	</div>
	<hr>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			내용
		</div>
		<div class="col-sm-6" align="left">
			${rMessage.object }
		</div>
	</div>
	<hr>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/message/messageReceiveList' ">목록</button>
		</div>
		<div class="col-sm-4"></div>
		<div class="col-sm-2">
			<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/message/messageReply' ">답장</button>
			&nbsp;|&nbsp;
			<button type="button" class="btn btn-sm btn-danger" onclick="location.href='/message/messagehideReceivedMessage' ">지우기</button>
		</div>
	</div>
</div>
<div>
	&nbsp;<br>
</div>
<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>