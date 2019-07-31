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
	<title>받은 메세지 읽기 - YouDitor</title>
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

<div class="container" align="center">
	<div class="col-sm-8" style="font-family: 'Poor Story', sans-serif; color:DarkGoldenRod;">
		<h3 align="right"><strong>받은 메세지</strong></h3>
		<hr>
	</div>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			<strong style="color:DarkGoldenRod;">보낸이</strong>
		</div>
		<div class="col-sm-2" align="left">
			${rMessage.nickname }
		</div>
		<div class="col-sm-2">
			<strong style="color:DarkGoldenRod;">보낸 날짜</strong>
		</div>
		<div>
			<fmt:formatDate value="${rMessage.send_date}" pattern="yyyy-MM-dd" />
		</div>
	</div>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			<strong style="color:DarkGoldenRod;">받는이</strong>
		</div>
		<div class="col-sm-2" align="left">
			${login.nickname }
		</div>
		<div class="col-sm-2">
			<strong style="color:DarkGoldenRod;">읽은 날짜</strong>
		</div>
		<div>
			<fmt:formatDate value="${rMessage.read_date}" pattern="yyyy-MM-dd" />
		</div>
	</div>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			<strong style="color:DarkGoldenRod;">제목</strong>
		</div>
		<div class="col-sm-6" align="left">
			${rMessage.subject }
		</div>
	</div>
	<div class="col-sm-8">
		<hr>
	</div>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			<strong style="color:DarkGoldenRod;">내용</strong>
		</div>
		<div class="col-sm-6" align="left">
			<pre style="white-space:pre-wrap"><c:out value="${rMessage.object }" /></pre>
		</div>
	</div>
	<div class="col-sm-8">
		<hr>
	</div>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-2">
			<button type="button" class="btn btn-md btn-link" onclick="location.href='/message/messageReceiveList' " style="color:DarkGoldenRod;"><strong><i class="fas fa-mail-bulk"></i>&nbsp;&nbsp;목록</strong></button>
		</div>
		<div class="col-sm-3"></div>
		<div class="col-sm-3">
			<button type="button" class="btn btn-md btn-link" onclick="location.href='/message/reply.do?messageId=${param.messageId}' " style="color:DarkGoldenRod;"><strong><i class="fas fa-paper-plane"></i>&nbsp;&nbsp;답장</strong></button>
			&nbsp;|&nbsp;
			<button type="button" class="btn btn-md btn-link" name="hideBtn" id="hideBtn" style="color:DarkGoldenRod;"><strong><i class="fas fa-eraser"></i>&nbsp;&nbsp;지우기</strong></button>
			<script>
			$("#hideBtn").click(function(){
				var chArr = new Array();
				
				chArr.push(${rMessage.messageId});
				
				var confirm_val = confirm("정말 삭제하시겠습니까?");
					
				if(confirm_val) {
					$.ajax({
						url : "/message/hideReceivedMessage",
						type : "post",
						data : { chBox : chArr },
						success : function(result){
							if(result == 1) {
								location.href='/message/messageReceiveList';
							} else {
								alert("삭제 실패");
							}
						}
					});
				}
			});
			</script>
		</div>
	</div>
</div>
<br>
<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>