<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메세지 보내기 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<c:choose>
	<c:when test="${replyInfo.object eq null }">
		<body OnLoad="document.messageForm.nickname.focus();">
	</c:when>
	<c:otherwise>
		<body OnLoad="document.messageForm.object.focus();">
	</c:otherwise>
</c:choose>
<jsp:include page="../module/top2.jsp" flush="false"/>
<div align="center">
	<div class="col-sm-12">
		<h2 align="center">&nbsp;</h2>
		<h1 align="center">메세지 보네기</h1>
		<h2 align="center">&nbsp;</h2>
	</div>
	<div>
		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/message/messageReceiveList' ">받은 메세지 보기</button>
		&nbsp;|&nbsp;
		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/message/messageSendList' ">보낸 메세지 보기</button>
	</div>
</div>
<hr>
<div class="container" align="center">
	<form name="messageForm" method="post" action="${path}/message/sendMessagePro">
		<div class="form-inline">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				받는이
			</div>
			<div class="col-sm-6" align="left">
				<c:choose>
					<c:when test="${replyInfo.nickname eq null }">
						<input type="text" name="nickname" id="nickname" placeholder="받는이">
					</c:when>
					<c:otherwise>
						<input type="text" name="nickname" id="nickname" placeholder="받는이" value="${replyInfo.nickname }">
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="senderAccountId" id="senderAccountId" value="${login.accountId }"><br>
			</div>
		</div>
		<div class="form-inline">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				제목
			</div>
			<br>
			<br>
			<div class="col-sm-6" align="left">
				<c:choose>
					<c:when test="${replyInfo.subject eq null }">
						<input type="text" name="subject" id="subject" placeholder="제목" style="width: 400px">
					</c:when>
					<c:otherwise>
						<input type="text" name="subject" id="subject" placeholder="제목" style="width: 400px" value="RE: ${replyInfo.subject }">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr>
		<div class="form-inline">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				내용
			</div>
			<div class="col-sm-6" align="left">
				<c:choose>
					<c:when test="${replyInfo.object eq null }">
						<textarea cols="40" rows="6" name="object" id="object" style="width: 400px"></textarea>
					</c:when>
					<c:otherwise>
						<textarea cols="40" rows="6" name="object" id="object" style="width: 400px" focus=""><c:out value="${replyInfo.object }" />
=================================

</textarea>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr>
		<div class="form-inline">
			<div class="col-sm-2"></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-4"></div>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-sm btn-primary">보내기</button>
			</div>
		</div>
	</form>
</div>
<div>
	&nbsp;<br>
</div>
<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>