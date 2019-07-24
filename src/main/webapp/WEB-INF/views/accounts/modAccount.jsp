<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>회원정보수정 - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false" />
<link href="/resources/css/modAccount.css" rel="stylesheet">
<style>
table {
	margin: 20px;
	width: 800px;
}

textarea, input {
	padding-left: 5px;
}

textarea {
	width: -webkit-fill-available;
}

td, th {
	line-height: 14px;
	text-align: left;
	vertical-align: top;
	letter-spacing: -1px;
	border: 0;
	border: 1px solid #e5e5e5;
	padding: 15px;
}

th {
	color: #fff;
	border-right: 1px solid #e5e5e5;
	background: #81bbc5;
}

.thcell {
	width: 200px;
	text-align: center;
	vertical-align: middle;
}

.ud-st {
	margin-bottom: 40px;
}
</style>
<script type="text/javascript">
	// 변경될 사진을 미리 보여준다.
	var sel_file;

	$(document).ready(function() {
		$("#picture").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
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

	// 비밀번호 확인
	function btnRePwd() {
		var pwdCfm = $("#pwdCfm").val();
		var pwd = $("#pwd").val();
		if (pwd == pwdCfm) {
			$("#myModalPwd").modal();
		} else {
			alert("비밀번호를 확인해주세요.");
			$("#pwdCfm").focus();
			return;
		}
	}

	// 수정
	function btnUpdate() {
		var pwdCfm = $("#pwdCfm").val();
		var pwd = $("#pwd").val();
		if (pwd == pwdCfm) {
			document.modForm.action = "${path}/accounts/updateAccount.do";
			document.modForm.submit();
		} else {
			alert("비밀번호를 확인해주세요.");
			$("#pwdCfm").focus();
			return;
		}
	}

	// 삭제
	function btnDelete() {
		var pwdCfm = $("#pwdCfm").val();
		var pwd = $("#pwd").val();
		if (pwd == pwdCfm) {
			msg = "정말로 계정을 삭제하시겠습니까?";
			if (confirm(msg) != 0) {
				// Yes click
				document.modForm.action = "${path}/accounts/deleteAccount.do";
				document.modForm.submit();
			} else {
				// no click
				return;
			}
		} else {
			alert("비밀번호를 확인해주세요.");
			$("#pwdCfm").focus();
			return;
		}
	}

	// 비밀번호 변경
	function changePwd() {
		var pwd = $("#pwd").val();
		var pwdCfm = $("#pwdCfm").val();
		
		if (pwd == pwdCfm) {
		var newpwd = $("#newpwd").val();
		var newpwdCfm = $("#newpwdCfm").val();
		
			if (newpwd.length < 8) {
				alert("비밀번호가 최소 8자 이상이어야 합니다.");
				$("#newpwd").focus();
				return;
			}
			if (newpwd != newpwdCfm) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#newpwdCfm").focus();
				return;
			} else {
				$("#newPwdForm").submit();
			}
		} else {
			alert("비밀번호를 확인해주세요.");
			$("#pwdCfm").focus();
			return;
		}
	}
</script>
</head>
<body style="background-color: #FFF;">
	<jsp:include page="../module/top2.jsp" flush="false" />
	<div align="center" style="padding-top: 7%">
		<c:if test="${login.accountId ne null }">
			<form name="modForm" method="POST" enctype="multipart/form-data">
				<h2>회원정보수정</h2>
				<table>
					<tr>
						<th class="thcell">가입일</th>
						<td>
							<fmt:formatDate value="${login.reg_date}" pattern="yyyy년 MM월 dd일 hh시 mm분" />
						</td>
					</tr>
					<tr>
						<th class="thcell">수정일</th>
						<td>
							<fmt:formatDate value="${login.mod_date}" pattern="yyyy년 MM월 dd일 hh시 mm분" />
						</td>
					</tr>
					<tr>
						<th class="thcell">이메일</th>
						<td>
							<input type="email" name="email" id="email" value="${login.email }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th class="thcell">비밀번호 확인</th>
						<td>
							<input type="password" name="pwdCfm" id="pwdCfm">
							<input type="hidden" name="pwd" id="pwd" value="${login.pwd }">
							<button class="btn btn-modify" type="button" onclick="btnRePwd();"><i class="far fa-edit"></i>비밀번호변경</button>
							
						</td>
					</tr>
					<tr>
						<th class="thcell">닉네임</th>
						<td>
							<input type="text" name="nickname" id="nickname" value="${login.nickname }" style="font-weight: 600;">
						</td>
					</tr>
					<tr>
						<th class="thcell">프로필 사진</th>
						<td>
							<!-- name="picture"의 변수명과 컨트롤러의 MultipartFile file과 일치해야 한다. -->
							<c:choose>
								<c:when test="${empty picture }">
									<div>
										<img id="profileImg" src="<spring:url value = '/image/${login.picture}'/>"
											class=" mx-auto rounded-circle" width="100px" height="100px">
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<img id="profileImg" class=" mx-auto rounded-circle" width="100px" height="100px" />
									</div>
								</c:otherwise>
							</c:choose>
							<br>
							<input type="file" name="picture" id="picture" value="${login.picture }">
						</td>
					</tr>
					<tr>
						<th class="thcell">자기소개</th>
						<td>
							<textarea name="footer" id="footer" rows="4" cols="10" style="border: 0">${login.footer }</textarea>
						</td>
					</tr>

				</table>
				<div class="ud-st">
					<input type="hidden" name="accountId" id="accountId" value="${login.accountId}">
					<button class="btn btn-modify" type="button" onclick="btnUpdate();"><i class="fas fa-user-edit"></i>수정하기</button>
					<button class="btn btn-delete" type="button" onclick="btnDelete();"><i class="fas fa-user-slash"></i>삭제하기</button>
				</div>
			</form>
		</c:if>
		<c:if test="${login.accountId eq null }">
			로그인상태가 아닙니다.<br>
			<a class="button" href="/accounts/login.do">로그인하러 가기</a>
		</c:if>
	</div>
	<c:if test="${msg == false }">
		<script>
			alert('계정 삭제에 실패했습니다.');
		</script>
	</c:if>
	<jsp:include page="../module/bottom.jsp" flush="false" />
	
	    <!-- 비밀번호변경 모달 -->
    <div id="myModalPwd" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">x</button>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal" id="newPwdForm" method="post" action="${path}/accounts/updatePasswordPro">
                    
                        <div class="form-inline">
                            <label class="control-label col-4">새 비밀번호</label>
                            <div class="col-7">
                                <input type="password" name="newpwd" id="newpwd" maxlength="20" placeholder="Enter New Password" style="width: 100%;">
                            </div>
                        </div>
                        <br><br>
                        
                        <div class="form-inline">
                            <label class="control-label col-4">새 비밀번호 확인</label>
                            <div class="col-7">
                                <input type="password" name="newpwdCfm" id="newpwdCfm" maxlength="20" placeholder="Confirm New Password" style="width: 100%;">
                            </div>
                        </div>
                        <br><br>
                                                
                        <div class="form-group">
                            <div class="col-12" align="center">
                                <button type="button" class="btn btn-primary" onclick="changePwd();">변경</button>
                            </div>
                        </div>
                        <input type="hidden" name="accountId" id="accountId" value="${login.accountId }">
                        <input type="hidden" name="email" id="email" value="${login.email }">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>