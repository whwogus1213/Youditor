<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:include page="../module/header.jsp" flush="false"/> --%>
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
	$("#sendBtn").click(function(){
		console.log("send message..");
		sendMessage();
		$("#sendBtn").val('');
	});
});

function sendMessage(){
	
	console.log("sendMessage() 메서드 진입");
	sock.send($("#message").val());
	console.log("sendMessage() 메서드 sock.send 실행 완료");
}

//evt 파라미터는 websocket이 보내준 데이터이다.
function onMessage(evt){
	console.log("onMessage@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	var data = evt.data;
	console.log(data);
	var sessionid = null;
	var message = null;

	// 문자열 splite
	var strArray = data.split('|');

	for(var i=0 ; i<strArray.length; i++) {
		console.log('str['+i+']: ' + strArray[i]);
	}
	// current session id
	var currentuser_session = $('#sessionuserid').val();
	console.log('current session id : ' + currentuser_session);

	sessionid = strArray[0]; // 메시지를 보낸 사람의 세션 등록
	message = strArray[1];	//현재 메세지를 저장

	// 나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.
	if(sessionid == currentuser_session) {
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-info'>";
		printHTML += "<strong>["+sessionid+"] -> " + message + "</strong>";
		printHTML += "</div>";
		printHTML += "</div>";

		$("#chatdata").append(printHTML);
		
	} else {
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-warning'>";
		printHTML += "<strong>["+sessionid+"] -> " + message + "</strong>";
		printHTML += "</div>";
		printHTML += "</div>";

		$("#chatdata").append(printHTML);
	}

	console.log('chatting data: '+data);
	
}

function onClose(evt) {
	$("#data").append("연결 끊김");
	
}

</script>


</head>
<body>
	<h1>Chatting Page (id: ${userid})</h1>
	<div>
		<input type="button" id="chattinglistbtn" value="채팅 참여자 리스트">
	</div>
	<br>
	<div>
		<div>
			<input type="text" id="message"/>
    		<input type="button" id="sendBtn" value="전송"/>
    	</div>
    	<br>
    	<div class="well" id="chatdata">
    		<!-- User Session Info Hidden -->
    		<input type="hidden" value='${userid}' id="sessionuserid">
    	</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#chattinglistbtn").click(function(){
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>채팅방 참여자 리스트</p>',{
			title: 'Chatting List',
			type: 'confirmation',
			print: false,
			width: 260,
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					//alert('yes click');
				}
			}
		});
    });
});
</script>
</html>