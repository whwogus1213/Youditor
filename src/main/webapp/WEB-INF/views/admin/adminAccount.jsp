<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>회원정보수정 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<style>
	
	table {
    	margin: 40px;
    	width: 800px;
	}
		textarea, input {
	    padding-left: 5px;
	}
	textarea{
		width: 300px;
	}
	td, th {
	    line-height: 14px;
	    text-align: left;
	    vertical-align: top;
	    letter-spacing: -1px;
	    border: 0;
	    border: 1px solid #e5e5e5;
	    padding: 32px 0 32px 30px;
	}
	th {
	    color: #333;
	    border-right: 1px solid #e5e5e5;
	    background: #f9f9f9;
	}
	.thcell {
	    padding: 32px 31px 32px;
	}
	#pass-st{
		margin-top: 30px;
	}
	.ud-st{
		margin-bottom: 40px;
	}
	#bt-st {
	    background-color: #fff;
	    padding: 15px;
	    border: 1px solid #777;
	    margin-left: 35px;
	}
	#bt-st1 {
	    background-color: #fff;
	    padding: 15px;
	    border: 1px solid #777;
	}
	</style>
	<script type="text/javascript">
	// 변경될 사진을 미리 보여준다.
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
	
	function validateEmail(email) {
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
	}
	
  	var isCheckEmail = 0;
  	$(function() {
  		$("#checkEmail").click(function() {
  			var email = $("#email").val();
  			if(validateEmail(email)) {
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
	  						$("#email").focus();
	  			        } else {
	  						alert("사용가능한 이메일입니다.");
	  						$("#pwd").focus();
	  						//이메일이 중복하지 않으면  isCheckEmail = 1
	  						isCheckEmail = 1;
	  			        }
	  				},
	  				error : function(error) {
	  					alert("error : " + error);
	  				}
	  			});
  			} else {
  				alert("이메일 주소가 아닙니다.");
				$("#email").focus();
  	  		}
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
  						$("#nickname").focus();
  			        } else {
  						alert("사용가능한 닉네임입니다.");
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
	
	function updateBtn() {
  		var email = $("#email").val();
  		var emailCfm = "${AccountInfo.email}";
  		var pwd = $("#pwd").val();
  		var nickname = $("#nickname").val();
  		var nicknameCfm = "${AccountInfo.nickname}";
  		if(email.length == 0) { alert("이메일를 입력해 주세요."); $("#email").focus(); return; }
  		if(pwd.length < 8) { alert("비밀번호는 8자 이상이어야 합니다."); $("#pwd").focus(); return; }
  		if(nickname.length < 3) { alert("닉네임을 입력해 주세요."); $("#nickname").focus(); return; }

		if(email != emailCfm && isCheckEmail == 0) {
  			alert(email + '이메일 중복체크를 해주세요' + emailCfm);
  			$("#email").focus();
  			return false;
		} else if(nickname != nicknameCfm && isCheckNickname == 0) {
       		alert(nickname + '닉네임 중복체크를 해주세요' + nicknameCfm);
       		$("#nickname").focus();
  			return false;
		} else {
			document.modForm.action = "${path}/adminAccountUpdate";
			document.modForm.submit();
		}
	}
	</script>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body style="background-color: #FFF;">
<jsp:include page="./adminTop.jsp" flush="false"/>
<div align="center">
	<form name="modForm" method="POST" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="thcell">가입날자</th>
				<td>${AccountInfo.reg_date }</td>
			</tr>
			<tr>
				<th class="thcell">마지막수정날자</th>
				<td>${AccountInfo.mod_date }</td>
			</tr>
			<tr>
				<th class="thcell">마지막로그인날자</th>
				<td>${AccountInfo.newLogin_date }</td>
			</tr>
			<tr>
				<th class="thcell">이메일</th>
				<td><input type="text" name="email" id="email" value="${AccountInfo.email }">
				<input class="btn text-dark" type="button" name="checkEmail" id="checkEmail" style="background-color:#e9ecef; border: 1px solid #ced4da;" value="중복확인"></td>
			</tr>
			<tr>
				<th class="thcell">비밀번호</th>
				<td>
					<input type="text" name="pwd" id="pwd" value="${AccountInfo.pwd }">
				</td>
			</tr>
			<tr>
				<th class="thcell">닉네임</th>
				<td><input type="text" name="nickname" id="nickname" maxlength="16" value="${AccountInfo.nickname }">
				<input class="btn text-dark" type="button" name="checkNickname" id="checkNickname" style="background-color:#e9ecef; border: 1px solid #ced4da;" value="중복확인"></td>
			</tr>
			<tr>
				<th class="thcell">포트레이트</th>
				<td>
				 	<!-- name="picture"의 변수명과 컨트롤러의 MultipartFile file과 일치해야 한다. -->
					<input type="file" name="picture" id="picture" value="${AccountInfo.picture }">
				 </td>
			</tr>
			<tr>
				 <th class="thcell">미리보기<br> (용량: 10mb미만)</th>
				<td>
					<c:choose>
				 		<c:when test="${empty picture }">
							<div>
								<img id ="profileImg" src = "<spring:url value = '/image/${AccountInfo.picture}'/>" class=" mx-auto rounded-circle" width="100px" height="100px">
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<img id="profileImg" class=" mx-auto rounded-circle" width="100px" height="100px" />
							</div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="thcell">자기소개</th>
				<td><textarea name="footer" id="footer" rows="4" cols="10"><c:out value="${AccountInfo.footer }"/></textarea>
			</tr>
			<tr>
				<th class="thcell">권한</th>
				<td>
					<c:choose>
						<c:when test="${AccountInfo.authority == 0 }">
							<label><input type="radio" name="authority" id="authority" value="0" checked>탈퇴계정</label>&nbsp;
						</c:when>
						<c:otherwise>
							<label><input type="radio" name="authority" id="authority" value="0">탈퇴계정</label>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${AccountInfo.authority == 1 }">
							<label><input type="radio" name="authority" id="authority" value="1" checked>영구정지</label>&nbsp;
						</c:when>
						<c:otherwise>
							<label><input type="radio" name="authority" id="authority" value="1">영구정지</label>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${AccountInfo.authority == 2 }">
							<label><input type="radio" name="authority" id="authority" value="2" checked>임시정지</label>&nbsp;
						</c:when>
						<c:otherwise>
							<label><input type="radio" name="authority" id="authority" value="2">임시정지</label>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${AccountInfo.authority == 3 }">
							<label><input type="radio" name="authority" id="authority" value="3" checked>일반계정</label>&nbsp;
						</c:when>
						<c:otherwise>
							<label><input type="radio" name="authority" id="authority" value="3">일반계정</label>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${AccountInfo.authority == 4 }">
							<label><input type="radio" name="authority" id="authority" value="4" checked>매니저</label>&nbsp;
						</c:when>
						<c:otherwise>
							<label><input type="radio" name="authority" id="authority" value="4">매니저</label>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${AccountInfo.authority == 5 }">
							<label><input type="radio" name="authority" id="authority" value="5" checked>관리자</label>&nbsp;
						</c:when>
						<c:otherwise>
							<label><input type="radio" name="authority" id="authority" value="5">관리자</label>&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<div class="ud-st">
			<input id="bt-st" type="button" value="뒤로가기" onclick="location.href='adminView'">
			<input type="hidden" name="accountId" id="accountId" value="${AccountInfo.accountId }">
			<input id="bt-st" type="button" value="수정하기" onclick="updateBtn();">
		</div>
	</form>
</div>
</body>
</html>