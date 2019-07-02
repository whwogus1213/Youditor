<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>YouDitor - 회원가입</title>
	<jsp:include page="./../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">

	<style type="text/css">
		.container.imgs_wrap img{
			resize:	both;
			width:			100px;
			height:			100px;
			max-width:	100px;
		}
	</style>
	<script type="text/javascript">
		var sel_file;

		$(document).ready(function(){
			$("#picture").on("change", handleImgFileSelect);
		});

		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f){
				if(!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}

				sel_file = f;

				var reader = new FileReader();
				reader.onload = function(e) {
					$("#profileImg").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
	</script>
	<script type="text/javascript">
	var isCheckEmail = 0;
	$(function() {
		$("#checkEmail").click(function() {
			var email = $("#email").val();
			$.ajax({
				async: true,
				type: "POST",
				data: email,
				url: "checkEmail.do",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success: function (data) {
			        if(data.cnt > 0) {
						alert("이메일이 존재합니다. 다른 이메일을 입력해주세요.");
						//이메일이 존재할 경우 빨강으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputEmail").addClass("has-error")
						$("#divInputEmail").removeClass("has-success")
						$("#email").focus();
			        } else {
						alert("사용가능한 이메일입니다.");
						//이메일이 존재할 경우 빨강으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputEmail").addClass("has-success")
						$("#divInputEmail").removeClass("has-error")
						$("#pwd").focus();
						//이메일이 중복하지 않으면  isCheckEmail = 1
						isCheckEmail = 1;
			        }
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
		});
	});

	var isCheckNickname = 0;
	$(function() {
		$("#checkNickname").click(function() {
			var nickname = $("#nickname").val();
			$.ajax({
				async: true,
				type: "POST",
				data: nickname,
				url: "checkNickname.do",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success: function (data) {
			        if(data.cnt > 0) {
						alert("닉네임이 존재합니다. 다른 닉네임을 입력해주세요.");
						//닉네임이 존재할 경우 빨강으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputNickname").addClass("has-error")
						$("#divInputNickname").removeClass("has-success")
						$("#nickname").focus();
			        } else {
						alert("사용가능한 닉네임입니다.");
						//닉네임이 존재할 경우 빨강으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputNickname").addClass("has-success")
						$("#divInputNickname").removeClass("has-error")
						$("#picture").focus();
						//닉네임이 중복하지 않으면  isCheckEmail = 1
						isCheckNickname = 1;
			        }
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
		});
	});

  	function DosignUp() {

  		var email = $("#email").val();
  		var pwd = $("#pwd").val();
  		var pwdCfm = $("#pwdCfm").val();
  		var nickname = $("#nickname").val();
  		var agreement = $("#agreement").val();

  		if(email.length == 0) { alert("이메일를 입력해 주세요."); $("#email").focus(); return; }
  		if(isCheckEmail == 0) { alert("이메일 중복 체크를 해주세요."); $("#email").focus(); return; }

  		if(pwd.length == 0) { alert("비밀번호를 입력해 주세요."); $("#pwd").focus(); return; }
  		if(pwd != pwdCfm) { alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); $("#pwd").focus(); return; }

  		if(nickname.length == 0) { alert("닉네임을 입력해 주세요."); $("#nickname").focus(); return; }
  		if(isCheckNickname == 0) { alert("닉네임 중복 체크를 해주세요."); $("#nickname").focus(); return; }

  		if(agreement != "1") { alert("약관에 동의해주세요."); $("#agreement").focus(); return; }

		if(confirm("회원가입을 하시겠습니까?")) {
			if(isCheckEmail == 0) {
				alert('이메일 중복체크를 해주세요');
				$("#email").focus();
				return false;
        	} else if(isCheckNickname == 0) {
        		alert('닉네임 중복체크를 해주세요');
        		$("#nickname").focus();
				return false;
        	} else {
          		alert("회원가입을 축하합니다");
          		$("#frm").submit();
        	}
      	}
  	}
	</script>
</head>
<body>
	<jsp:include page="./../module/top.jsp" flush="false"/>
  <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-3" style="margin: auto; width: 50%">
				<div class="login-panel panel panel-default" style="margin-top: 10%; margin-bottom: 10%;">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign Up</h3>
					</div>
					<div class="panel-body">
						<form role="form" name="frm" id="frm" action="${path}/accounts/insertAccountsPro" method="post">
						<!-- <form role="form"> -->
							<fieldset>
								<div class="form-group" id="divInputEmail">
									<label>이메일</label>
									<input class="form-control" style="margin-bottom: 5px;" placeholder="이메일" name="email" id="email" type="text" />
									<input type="button" class="btn btn-default" style="width: 30%;" value="중복확인" name="checkEmail" id="checkEmail" />
								</div>
								<div class="form-group">
									<label>비밀번호</label>
									<input class="form-control" placeholder="비밀번호" name="pwd" id="pwd" type="password" />
								</div>
								<div class="form-group">
									<label>비밀번호 확인</label>
									<input class="form-control" placeholder="비밀번호 확인" name="pwdCfm" id="pwdCfm" type="password" />
								</div>
								<div class="form-group" id="divInputNickname">
									<label>닉네임</label>
									<input class="form-control" style="margin-bottom: 5px;" placeholder="닉네임" name="nickname" id="nickname" type="text" />
									<input type="button" class="btn btn-default" style="width: 30%;" value="중복확인" name="checkNickname" id="checkNickname" />
								</div>
								<div class="form-group" id="divInputPicture">
									<label>포트레이트</label>
									<div class="img_wrap">
										<c:choose>
											<c:when test="${empty picture }">
												<div>
													<img id ="profileImg" src = "/resources/images/profile/default_img.jpg" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
												</div>
											</c:when>
											<c:otherwise>
												<div>
													<img id="profileImg" style="height:100px; width:100px" />
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<input type="file" name="picture"  id="picture">
								</div>
								<div class="form-group" id="divInputFooter">
									<label>자기소개</label>
									<textarea class="form-control" name="footer" id="footer" rows="5" cols="80" placeholder="Enter Profile"></textarea>
								</div>
								<div class="form-group">
									<hr>
									<input type="button" value="약관보기" onclick="window.open('./agreement.do', '가입약관', 'width=600, height=800, resizable=no, status=no, toolbar=no, menubar=no, scrollbar=yes')">
									<div class="checkbox">
										<label>
											<input type="checkbox" id="agreement" name="agreement" value="1"/>
										</label> 약관에 동의합니다.
									</div>
								</div>
								<input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" />
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="./../module/bottom.jsp" flush="false"/>
</body>
</html>
