<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<script type="text/javascript">

$(function(){
	console.log("follow"+${row.boardId});
	console.log("follow"+${row.accountId});
    console.log("로딩완료");
});

	// 팔로잉
	function fn_following() {
// 		alert(accountId);

// 		var json = {
// 			"followAccountId" : accountId
// 		}
		$.ajax({
			type : "POST",
			url : "/follow2/insert",
			data:$("#followingForm").serialize(),
// 			data : json,
			// 				dataType : : "json",
			success : function(data) {
				if (data == "success") {
					alert("성콩");
					console.log("성공");
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
	<form id="followingForm" name="followingForm" method="post">
		<c:if test="${login.accountId ne row.accountId}">
			<button class="btn btn-primary btn-sm"
				onclick="fn_following()">팔로우</button>
		</c:if>
		
			<input type="hidden" id="followAccountId" name="followAccountId" value="${row.accountId}" />
			<input type="hidden" id="followerAccountId" name="followerAccountId" value="11" />
	</form>


</body>
</html>

