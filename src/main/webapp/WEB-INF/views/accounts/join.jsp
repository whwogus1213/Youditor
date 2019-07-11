<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta name="description" content="">
	<meta name="author" content="">

	<style type="text/css">
		.container.imgs_wrap img{
			resize:	both;
			width:			100px;
			height:			100px;
			max-width:	100px;
		}
	</style>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<script type="text/javascript">
		var sel_file;

		$(document).ready(function(){
			$("#uploadFile").on("change", handleImgFileSelect);
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
					$("#picture_ex").attr("src", e.target.result);
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
  						$("#uploadFile").focus();
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
  		var agreement = $('input:checkbox[id="agreement"]').is(':checked');
  		if(email.length == 0) { alert("이메일를 입력해 주세요."); $("#email").focus(); return; }
  		if(isCheckEmail == 0) { alert("이메일 중복 체크를 해주세요."); $("#email").focus(); return; }
  		if(pwd.length == 0) { alert("비밀번호를 입력해 주세요."); $("#pwd").focus(); return; }
  		if(pwd != pwdCfm) { alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); $("#pwd").focus(); return; }
  		if(nickname.length == 0) { alert("닉네임을 입력해 주세요."); $("#nickname").focus(); return; }
  		if(isCheckNickname == 0) { alert("닉네임 중복 체크를 해주세요."); $("#nickname").focus(); return; }
  		if(agreement != 1) { alert("약관에 동의해주세요."); $("#agreement").focus(); return; }
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
          		$("#frm").submit();
          		alert("회원가입을 축하합니다");
        	}
      	}
  	}
	</script>

	<title>회원 가입 - YouDitor</title>

	<!-- Custom styles -->
	<link href="/resources/css/modern-business.css" rel="stylesheet">

</head>

<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">YouditoR 회원 가입</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
	</div>
	<div class="container">
		<form:form  id="frm" method="post" enctype="multipart/form-data" name="memInsForm"
		action="${path}/accounts/insertAccountsPro">

			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">E-mail<font color="red">(*필수)</font></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="email"
						name="email" maxlength="30" placeholder="Enter ID">
				</div>
				<input class="btn btn-danger btn-sm" type="button" name="checkEmail" id="checkEmail" value="중복확인">
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">비밀번호<font color="red">(*필수)</font></label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="pwd"
						name="pwd" maxlength="20" placeholder="Enter Password">
				</div>
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">비밀번호확인</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="pwdCfm"
						name="pwdCfm" maxlength="20" placeholder="Enter Password">
				</div>
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">이름(별명)<font color="red">(*필수)</font></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="nickname"
						name="nickname" maxlength="16" placeholder="Enter Nickname">
				</div>
				<input class="btn btn-danger btn-sm" type="button" name="checkNickname" id="checkNickname" value="중복확인">
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">사진</label>
				<div class="col-sm-3">
					<input type="file" class="form-control" name="uploadFile"  id="uploadFile">
				</div>
				<label class="col-sm-2">미리보거</label>
				<div class="img_wrap">
					<c:choose>
				 		<c:when test="${empty uploadFile }">
							<div>
								<img id ="picture_ex" src = "/resources/images/profile/default_img.jpg" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<img id="picture_ex" style="height:100px; width:100px" />
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">자기소개</label>
				<div class="col-sm-7">
					<textarea class="form-control" name="footer" id="footer"
						rows="5" cols="80" placeholder="Enter Profile"></textarea>
				</div>
			</div>
			<div class="form-inline" align="center">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-12">회원가입동의</label>
			</div>
			<h2 align="center">&nbsp;</h2>
			<div class="alert alert-info ol-sm-9">
				<strong>[ YouditoR의 개인 정보 수집 및 이용 안내]</strong>
				<p>
					<h6>
						개인 정보 제3자 제공 동의
						<br>① 개인정보를 제공받는 자: YouditoR
						<br>② 개인정보를 제공받는 자의 개인 정보 이용 목적 : 영업관리,
						설문조사 및 프로모션, 이벤트 경품 제공, e-mail 발송, 행사 관련 마케팅
						<br>③ 제공하는 개인정보항목 : 이름, 이메일주소, 회사명, 직무/직책, 연락처, 휴대전화
						<br>④ 개인정보를 제공받는 자의 개인 정보 보유 및 이용 기간 :
						개인정보 취급 목적을 달성하여 더 이상 개인정보가 불 필요하게 된 경우이거나
						5년이 지나면 지체 없이 해당 정보를 파기할 것입니다.
						<br>귀하는 위와 같은 YouditoR의 개인정보 수집 및 이용정책에 동의하지
						않을 수 있으나, YouditoR으로부터 솔루션, 최신 IT정보, 행사초청안내 등의
						유용한 정보를 제공받지 못 할 수 있습니다.
						<br> 개인 정보 보호에 대한 자세한 내용은 http://www.YouditoR.com 을 참조바랍니다.
					</h6>
				<div class="checkbox">
					<label>
						<input type="checkbox" id="agreement" name="agreement" value="1"/>
					</label> YouditoR의 개인정보 수집 및 이용에 동의합니다.
				</div>
			</div>
			<div class="form-group">
				<h2 align="center">&nbsp;</h2>
				<div class="col-sm-offset-2 col-sm-12" align="center">
					<button type="button" onclick="DosignUp();">
					회원가입</button>
					<button type="reset" id="reset">
					다시 작성</button>
				</div>
			</div>
		</form:form>
	</div>

	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
