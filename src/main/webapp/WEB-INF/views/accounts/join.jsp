<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>  <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<jsp:include page="../module/header.jsp" flush="false"/>
		
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

	<title>회원 가입 - YouDitor</title>

	<!-- Custom styles -->
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	
</head>

<body>
	<jsp:include page="../module/top.jsp" flush="false"/>
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">YouditoR 회원 가입</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
	</div>
	<div class="container">
		<form class="form-horizontal" method="post" name="memInsForm"
		action="${path}/accounts/insertAccountsPro">
			
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">아이디(E-mail)</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="email" 
						name="email" maxlength="16" placeholder="Enter ID">
				</div>
				<input class="btn btn-danger btn-sm" type="button"
					name="confirm_id" value="ID중복확인"
					OnClick="confirmId(document.memInsForm.id.value)">
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="pwd" 
						name="pwd" maxlength="16" placeholder="Enter Password">
				</div>		
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">비밀번호확인</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="repwd" 
						name="repwd" maxlength="16" placeholder="Enter Password">
				</div>		
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">이름(별명)</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="nickname" 
						name="nickname" maxlength="10" placeholder="Enter Nickname">
				</div>		
			</div>
			<div class="form-inline">
				<h2 align="center">&nbsp;</h2>
				<label class="control-label col-sm-3">사진</label>
				<div class="col-sm-3">
					<input type="file" name="picture"  id="picture">
				</div>
				<label class="col-sm-2">미리보기</label>
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
						<input type="checkbox" id="is_subscribed" name="is_subscribed" value="o"/>
					</label> YouditoR의 개인정보 수집 및 이용에 동의합니다.
				</div>
			</div>
			<div class="form-group">
				<h2 align="center">&nbsp;</h2>
				<div class="col-sm-offset-2 col-sm-12" align="center">
					<button type="submit" id="submit">
					회원가입</button>
					<button type="reset" id="reset">
					다시 작성</button>
				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="../module/bottom.jsp" flush="false"/>
  
</body>
</html>