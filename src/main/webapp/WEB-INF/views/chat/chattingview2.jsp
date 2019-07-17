<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:include page="../module/header.jsp" flush="false"/> --%>
<!-- <script src="https://code.jquery.com/jquery-1.9.0.js"></script> -->
<script src="/resources/js/sockjs.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

var sock = new SockJS("/echo");

sock.onmessage = onMessage;

sock.onclose = onClose;


$(function(){
	$("#message").focus();
	$("#sendBtn").click(function(){
		console.log("send message..");
		sendMessage();
	});


	$('#message').keypress(function(event) {

			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			console.log(keycode);
			if (keycode == '13') {
				sendMessage();
			}

			event.stopPropagation();
	});

});

	// 메세지 전송
	function sendMessage() {

		sock.send($("#message").val());
		$("#message").val('');
		$("#message").focus();
	}

	//evt 파라미터는 websocket이 보내준 데이터이다.
	//서버에서 메세지를 받을때 
	function onMessage(evt) {
		var data = evt.data;
		console.log(data);
		var sessionid = null;
		var sessionnickname = null;
		var message = null;

		// 문자열 splite
		var strArray = data.split('|');

		for (var i = 0; i < strArray.length; i++) {
			console.log('str[' + i + ']: ' + strArray[i]);
		}
		// current session id
		var currentuser_session = $('#sessionuserid').val();
		var currentuser_nickname = $('#sessionnickname').val();
		console.log('current session id : ' + currentuser_session);

		sessionid = strArray[0]; // 메시지를 보낸 사람의 세션 등록
		sessionnickname = strArray[1]; // 메세지를 보낸 사람의 닉네임
		message = strArray[2]; //현재 메세지를 저장

		if (sessionid == currentuser_session) {
			var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-info'>";
			printHTML += "<strong>[" + currentuser_nickname+"] -> " + message + "</strong>";
			printHTML += "</div>";
			printHTML += "</div>";

			$("#chatdata").append(printHTML);

			
		} else {
			var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-warning'>";
			printHTML += "<strong>[" + sessionnickname +"] -> " + message + "</strong>";
			printHTML += "</div>";
			printHTML += "</div>";

			$("#chatdata").append(printHTML);
		}

		console.log('chatting data: ' + data);

	}

	//서버와 연결을 끊을 때 
	function onClose(evt) {
		$("#data").append("연결 끊김");

	}
</script>


</head>
<body>
	<h4>Youditor 채팅방 (${login.nickname})</h4>
	<hr>
	<div class="container">
	
	
		<form class="form-inline" onsubmit="return false">
		<div class="form-group form-group-sm">
		<div class="col-xs-offset-2 col-xs-4">
			<input type="text" id="message" class="form-control" style="width:180px"/>
    	</div>
    	</div>
    	<div class="form-group form-group-sm">
		<div class="col-xs-offset-2 col-xs-4">
    	<input type="button" class="btn btn-xs btn-danger form-control" id="sendBtn" value="전송"/>
    	</div>
    	</div>
    	</form>
    	<br>
    	
    	<div class="well" id="chatdata">
    		<!-- User Session Info Hidden -->
    		<input type="hidden" value="${login.accountId}" id="sessionuserid">
    		<input type="hidden" value="${login.nickname}" id="sessionnickname">
    	</div>
    	
	</div>
</body>

</html>