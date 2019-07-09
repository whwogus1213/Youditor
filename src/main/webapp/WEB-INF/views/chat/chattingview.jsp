<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../module/header.jsp" flush="false"/>
<script src="https://code.jquery.com/jquery-1.9.0.js"></script>
<script src="/resources/js/sockjs.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

// var sock = new SockJS("<c:url value="/echo"/>");
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

// 			var keycode = (event.keyCode ? event.keyCode : event.which);
			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			console.log(keycode);
			if (keycode == '13') {
				sendMessage();
			}

			event.stopPropagation();
	});

});

	function sendMessage() {

		sock.send($("#message").val());
		$("#message").val('');
		$("#message").focus();
	}

	//evt 파라미터는 websocket이 보내준 데이터이다.
	function onMessage(evt) {
		var data = evt.data;
		console.log(data);
		var sessionid = null;
		var message = null;

		// 문자열 splite
		var strArray = data.split('|');

		for (var i = 0; i < strArray.length; i++) {
			console.log('str[' + i + ']: ' + strArray[i]);
		}
		// current session id
		var currentuser_session = $('#sessionuserid').val();
		console.log('current session id : ' + currentuser_session);

		sessionid = strArray[0]; // 메시지를 보낸 사람의 세션 등록
		message = strArray[1]; //현재 메세지를 저장

		if (sessionid == currentuser_session) {
			var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-info'>";
			printHTML += "<strong>[" + ${userNickname}+"] -> " + message + "</strong>";
			printHTML += "</div>";
			printHTML += "</div>";

			$("#chatdata").append(printHTML);

		} else {
			var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-warning'>";
			printHTML += "<strong>[" + ${userNickname}+"] -> " + message + "</strong>";
			printHTML += "</div>";
			printHTML += "</div>";

			$("#chatdata").append(printHTML);
		}

		console.log('chatting data: ' + data);

	}

	function onClose(evt) {
		$("#data").append("연결 끊김");

	}
</script>


</head>
<body>
	<h4>Youditor 채팅방 (${userid})</h4>
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
    		<input type="hidden" value='${userid}' id="sessionuserid">
    	</div>
    	
	</div>
</body>

</html>