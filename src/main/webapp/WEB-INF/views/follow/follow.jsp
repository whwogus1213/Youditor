<%@page import="com.good.dto.AccountsVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../module/header.jsp" flush="false" />


</head>
<body>
	<form id="followingForm" name="followingForm" method="post">
		<c:if test="${login.accountId ne row.accountId}">
			<button class="btn btn-primary btn-sm"
				onclick="fn_following('${row.accountId}')">팔로우</button>
		</c:if>
	</form>

	<script type="text/javascript">
		// 팔로잉
		function fn_following(accountId) {
			alert(accountId);

			var json = {
				"followAccountId" : accountId
			}
			$.ajax({
				type : "POST",
				url : "/follow/insert",
				//data:$("#followingForm").serialize()
				data : json,
				//dataType : : "json",
				success : function(data) {
					alert("성콩");
				},
				error : function(data) {
					alert("에러");
				}
			});
		}
	</script>
</body>
</html>

