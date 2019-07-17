<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메세지 보내기 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
</head>
<body>
<div align="center">
	<div class="col-sm-10">
		<h3 align="center">&nbsp;</h3>
		<h3 align="center">메세지 보네기</h3>
	</div>
</div>
<hr>
<div class="container" align="center">
<form name="messageForm">
	<div class="form-inline">
		<div class="col-sm-2">
			받는이
		</div>
		<div class="col-sm-8" align="left">
			<input type="text" name="nickname" id="nickname" placeholder="받는이" value="${to }" readonly>
			<input type="hidden" name="senderAccountId" id="senderAccountId" value="${login.accountId }" readonly><br>
		</div>
	</div>
	<div class="form-inline">
		<div class="col-sm-2">
			제목
		</div>
		<br>
		<br>
		<div class="col-sm-8" align="left">
			<input type="text" name="subject" id="subject" placeholder="제목" style="width: 350px">
		</div>
	</div>
	<hr>
	<div class="form-inline">
		<div class="col-sm-2">
			내용
		</div>
		<div class="col-sm-8" align="left">
			<textarea cols="40" rows="6" name="object" id="object" style="width: 350px"></textarea>
		</div>
	</div>
	<hr>
	<div class="form-inline">
		<div class="col-sm-2"></div>
		<div class="col-sm-8" align="right">
			<button type="button" class="btn btn-sm btn-primary" onClick="sendMessageBtn();">보내기</button>
			<script type="text/javascript">
			function sendMessageBtn() {
				var senderAccountId = $("#senderAccountId").val();
	  			var nickname = $("#nickname").val();
	  			var subject = $("#subject").val();
	  			var object = $("#object").val();
	  			if(subject.length == 0) { alert("제목을 입력해 주세요."); $("#subject").focus(); return; }
	  			if(object.length == 0) { alert("내용을 입력해 주세요."); $("#object").focus(); return; }

				var messageData = {"senderAccountId": senderAccountId, "nickname": nickname, "subject": subject, "object": object};
	  			
	  			$.ajax({
	  				url : "/message/sendMessagePro",
	  				type : "POST",
	  				data : messageData,
	  				success : function(result){
	  							if(result == 1) {
		  							alert("메세지를 보내는데 성공했습니다.");
	  								self.close();
	  							} else {
	  								alert("메세지를 보내는데 실패했습니다.");
	  							}
	  						}
	  			});
			}
			</script>
		</div>
	</div>
</form>
</div>
</body>
</html>