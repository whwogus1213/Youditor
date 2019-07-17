<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal content-->
<div class="modal-content" align="center">
	<div class="modal-header">
		<h4 class="modal-title">로그인</h4>
		<button type="button" class="close" data-dismiss="modal">x</button>
	</div>
	<div class="modal-body">
		<form name="messageForm">
			<div class="form-inline">
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					받는이
				</div>
				<div class="col-sm-6" align="left">
					<input type="text" name="nickname" id="nickname" placeholder="받는이" value="${row.nickname }" readonly>
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
					<input type="text" name="subject" id="subject" placeholder="제목" style="width: 400px" autofocus>
				</div>
			</div>
			<hr>
			<div class="form-inline">
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					내용
				</div>
				<div class="col-sm-6" align="left">
					<textarea cols="40" rows="6" name="object" id="object" style="width: 400px"></textarea>
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
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</div>