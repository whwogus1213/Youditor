<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로우 리스트</title>
<jsp:include page="../module/header.jsp" flush="false" />
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<script type="text/javascript">
// 초기 팔로우 버튼
$(function(){
	fn_followbtn();
});

//팔로우 삭제
function fn_unfollow(followAccountId) {
	console.log("ㄷㄷ");
	 var tr = $("#followbtn"+followAccountId).parent().parent();

	var json = {
		"followAccountId" : followAccountId
	}
	$.ajax({
		type : "POST",
		url : "/follow/delete",
		data : json,
		success : function(data) {
			if (data == "success1") {
				alert("팔로우가 취소되었습니다.");
				console.log("ㅅㅅ");
				tr.remove();
				console.log("ㅛ");
				
			}
		},
		error : function(data) {
			alert("에러");
		}
	});
}
/*
// 팔로우 버튼 변경
function fn_followbtn() {
		var loginId = ${login.accountId};
		var followAccountId = ${followList.followAccountId};
		alert(loginId + "  " + followAccountId);
		
		var json = {
				"followAccountId" : followAccountId,
				"followerAccountId" : loginId
			}
		$.ajax({
			type : "POST",
			url : "/follow/check",
			data : json,
			success : function(data) {
				if (data == 1) {
					var html = "<button class='btn btn-warning btn-sm' id='followbtn' onclick='fn_unfollow("+${row.accountId}+")'>팔로잉√</button>";			
				} else {
					var html = "<button class='btn btn-primary btn-sm' id='followbtn' onclick='fn_following("+${row.accountId}+")'>팔로우</button>";
				}
				$('#followDiv').html(html);
			},
			error : function(data) {
				alert("에러");
			}
		});

}
*/
</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">Following List</h1>
			<h2 align="center">${login.nickname}의팔로잉</h2>
		</div>
	</div>
	<div class="container">
		<table class="table table-bordered table-striped nanum table-hover" id="followTable">
			<!-- <table border="1"> -->
			<thead>
				<tr>
					<th>아이디</th>
					<th>날짜</th>
					<th>언팔로우</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${followingList}" var="followingList">
					<tr>
						<td><a href="/videoboard/videoBoardList?accountId=${follwingList.followAccountId}">${followingList.followAccountId}</a></td>
						<td><fmt:formatDate value="${followingList.reg_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>
							<button class="btn btn-warning btn-sm" id="followbtn${followingList.followAccountId}"
								onclick="fn_unfollow('${followingList.followAccountId}')">팔로우√</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<jsp:include page="../module/bottom.jsp" flush="false" />
	</div>
	<div id="followDiv">
	</div>
</body>
</html>
