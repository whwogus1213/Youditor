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
<body>
<jsp:include page="../module/top2.jsp" flush="false"/>

<!-- 배너 -->
<div class="form-group">
	<div class="col-sm-12" style="background-image:url('/resources/images/message/message.jpg'); background-position:50% 50%; background-size:100%; font-family: 'Poor Story', sans-serif; color:black; padding-top: 5%; padding-bottom:4%">
		<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>메세지 보관함</strong></h1>
		<h4 align="center"><br>다른 YouditoR와 메세지를 주고 받을 수 있습니다.</h4>
	</div>
</div>

<div align="center">
	<div class="col-sm-12">
		<h1 align="center">메세지 보내기</h1>
	</div>
	<div>
		<button type="button" class="btn btn-sm btn-link" onclick="location.href='/message/messageReceiveList' ">받은 메세지 보기</button>
		&nbsp;|&nbsp;
		<button type="button" class="btn btn-sm btn-link" onclick="location.href='/message/messageSendList' ">보낸 메세지 보기</button>
	</div>
</div>
<hr>
<div class="container" align="center">
<form name="messageForm">
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			받는이
		</div>
		<div class="col-sm-6" align="left">
			<c:choose>
				<c:when test="${replyInfo.nickname eq null }">
					<input type="text" name="nickname" id="nickname" placeholder="받는이" autofocus>
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
	<br>
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
					<textarea cols="40" rows="6" name="object" id="object" style="width: 400px" autofocus><c:out value="${replyInfo.object }" />
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
			<button type="button" class="btn btn-sm btn-primary" onClick="sendMessageBtn();">보내기</button>
			<script type="text/javascript">
			function sendMessageBtn() {
				var senderAccountId = $("#senderAccountId").val();
	  			var nickname = $("#nickname").val();
	  			var subject = $("#subject").val();
	  			var object = $("#object").val();
	  			if(nickname.length == 0) { alert("닉네임을 입력해 주세요."); $("#nickname").focus(); return; }
	  			if(subject.length == 0) { alert("제목을 입력해 주세요."); $("#subject").focus(); return; }
	  			if(object.length == 0) { alert("내용을 입력해 주세요."); $("#object").focus(); return; }

				var messageData = {"senderAccountId": senderAccountId, "nickname": nickname, "subject": subject, "object": object};
	  			
	  			$.ajax({
	  				url : "/message/sendMessagePro",
	  				type : "POST",
	  				data : messageData,
	  				success : function(result){
	  							if(result == 1) {
	  								location.href='/message/messageSendList';
	  							} else {
	  								alert("존재하지 않는 닉네임입니다.");
	  								$("#nickname").focus();
	  							}
	  						}
	  			});
			}
			</script>
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