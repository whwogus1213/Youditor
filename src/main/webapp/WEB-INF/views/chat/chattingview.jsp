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
<!-- <link href="/resources/css/chat.css" rel="stylesheet"> -->

<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<div class="chat_window">
    <div class="top_menu">
        <div class="title">유디터(<span id='sessionCnt'></span>)</div>
    </div>
    <ul class="messages"></ul>
    <div class="bottom_wrapper clearfix">
		<p style="font-size: 10px;margin-bottom: 3px;text-align: left;font-weight: 300;">${login.nickname}</p>
        <div class="message_input_wrapper">
            <input class="message_input" />
        </div>
    </div>
</div>

<!-- 반복되는 html 설정  -->
<div class="message_template">
    <li class="message">
        <div class="avatar"></div>
<!--         <span style="line-height:5%;"><br></span> -->
        <div class="text_wrapper">
            <div class="text"></div>
        </div>
    </li>
</div>
<!-- 반복되는 html 설정 끝 -->


<div class="well" id="chatdata">
	<!-- User Session Info Hidden -->
	<input type="hidden" value="${login.accountId}" id="sessionuserid">
	<input type="hidden" value="${login.nickname}" id="sessionnickname">
</div>
    	
	
	
	
<script type="text/javascript">

	var sock = new SockJS("/echo");

	sock.onmessage = onMessage;
	sock.onclose = onClose;

    var Message;
    Message = function (arg) {
        this.text = arg.text, this.message_side = arg.message_side, this.sessionnickname = arg.sessionnickname;
        this.draw = function (_this) {
            return function () {
                var $message;
                $message = $($('.message_template').clone().html());
                $message.addClass(_this.message_side).find('.text').html(_this.text);
                $message.find('.avatar').html(_this.sessionnickname);
                $('.messages').append($message);
                return setTimeout(function () {
                    return $message.addClass('appeared');
                }, 0);
            };
        }(this);
        return this;
    };

    
    $(function () {
        var getMessageText, message_side, sendMessage;
        message_side = 'right';

        /* message_input 자기가 쓴 채팅을 리턴해주는 함수 */
        getMessageText = function () {
            var $message_input;
            $message_input = $('.message_input');
            return $message_input.val();
        };

        
		/* 서버에 메세지 보내기 */
        function sendMessage(text) {
            if(text.trim() === '') {
				return;
			}
        	sock.send(text);
            $('.message_input').val('');
            $('.message_input').focusin();    
        }

        $('.message_input').keyup(function (e) {
            if (e.which === 13) {
				sendMessage(getMessageText());
            }
        });
        
    });




    //evt 파라미터는 websocket이 보내준 데이터이다.
	//서버에서 메세지를 받을때 
	function onMessage(evt) {
		var data = evt.data;
		console.log(data);
		var sessionid = null;
		var sessionnickname = null;
		var evtmessage = null;

		// 문자열 splite
		var strArray = data.split('|');

		/* 방참여 인원수 표시 */
		if(strArray[0]=='sessionCnt') {
			$('#sessionCnt').html(strArray[1]);
			return;
		}

		for (var i = 0; i < strArray.length; i++) {
			console.log('str[' + i + ']: ' + strArray[i]);
		}
		// current session id
		var currentuser_session = $('#sessionuserid').val();
		var currentuser_nickname = $('#sessionnickname').val();
		console.log('current session id : ' + currentuser_session);

		sessionid = strArray[0]; // 메시지를 보낸 사람의 세션 등록
		sessionnickname = strArray[1]; // 메세지를 보낸 사람의 닉네임
		evtmessage = strArray[2]; //현재 메세지를 저장

		var $messages, message;
		var message_side;

        $messages = $('.messages');
		if (sessionid == currentuser_session) { //자신의 메세지 일때
    		message_side='right';	
		} else {
			message_side='left';
    	}

		message = new Message({
    		text : evtmessage,
    		message_side : message_side,
    		sessionnickname : sessionnickname
    	});

    	message.draw();
    	return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
	}

    
	//서버와 연결을 끊을 때 
	function onClose(evt) {
		$("#data").append("연결 끊김");
	}


</script>
</body>

</html>