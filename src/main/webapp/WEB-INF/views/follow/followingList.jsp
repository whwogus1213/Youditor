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
	$(function() {
		fn_followbtn();
	});

	//팔로우 삭제
	function fn_unfollow(followAccountId) {
		console.log("ㄷㄷ");
		var tr = $("#followbtn" + followAccountId).parent().parent();

		var json = {
			"followAccountId" : followAccountId
		}
		$.ajax({
			type : "POST",
			url : "/follow/delete",
			data : json,
			success : function(data) {
				if (data == "success1") {
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
</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h4 align="center">&nbsp;</h4>
			<h1 align="center">Following List</h1>
			<h4 align="center">${login.nickname}의 팔로잉</h4>
		</div>
	</div>
	<div class="container">
		<table class="table table-striped nanum table-hover"
			id="followTable">
			<!-- <table border="1"> -->
			<thead align="center">
				<tr>
					<th>닉네임</th>
					<th>맛팔</th>
					<th>언팔로우</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${followingList}" var="followingList">
					<tr>
						<td style="cursor: pointer;"
							onclick="location.href='/videoboard/videoBoardList?searchType=nickname&keyword=${followingList.nickname}'">
							${followingList.nickname}
						</td>
						<td>
							${followingList.check }
						</td>
						<td>
							<button class="btn btn-danger btn-sm" id="followbtn${followingList.followAccountId}"
							onclick="fn_unfollow('${followingList.followAccountId}')">언팔로우</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>
