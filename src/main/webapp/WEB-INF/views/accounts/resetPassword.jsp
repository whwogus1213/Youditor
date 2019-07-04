<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>패스워드 리셋 - YouDitor</title>
	
	<jsp:include page="../module/header.jsp" flush="false"/>
	
	
	<!-- Custom styles -->
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<script type="text/javascript">
	var isCheckEmail = 0;
	function DosignUp() {
		var email = $("#email").val();
		$.ajax({
			async: true,
			type: "POST",
			data: email,
			url: "checkEmail.do",
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success: function (data) {
		        if(data.cnt == 1) {
					isCheckEmail = 1;
		        } else {
					alert("존재하지 않는 이메일입니다.");
					$("#email").focus();
		        }
			}
		});
		var email = $("#email").val();
		if(email.length == 0) {
			alert("이메일를 입력해 주세요.");
			$("#email").focus();
			return;
		}
		if(isCheckEmail == 1) {
			$("#frm").submit();
		}
	}
	</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<form class="form-horizontal" id="frm" method="post" action="/accounts/resetPasswordPro">
		<div class="form-inline">
			<h2 align="center">&nbsp;</h2>
			<label class="control-label col-sm-3">이메일</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="email"
					name="email" maxlength="30" placeholder="Enter ID">
			</div>
		</div>
		<div class="form-group">
			<h2 align="center">&nbsp;</h2>
			<div class="col-sm-offset-2 col-sm-12" align="center">
				<button type="button" class="btn btn-primary" onclick="DosignUp();">
					비번리셋
				</button>
			</div>
		</div>
	</form>
</body>
</html>