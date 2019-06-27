<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>YouditoR</title>

	<jsp:include page="../module/header.jsp" flush="false"/>



<script type="text/javascript">

function authorUp(accountId, authority){
	var json = {
			"accountId" : accountId,
			 "authority" : authority
			};
	console.log(json);
	$.ajax({
		url:"admin/authorUp",
		type:"post",
		data:json,
		success : function(){
// 				alert("권한을 증가하였습니다.");
				location.reload();
			}


		});
}
function authorDown(accountId, authority){
	var json = {
			"accountId" : accountId,
			 "authority" : authority
			};
	console.log(json);
	$.ajax({
		url:"admin/authorDown",
		type:"post",
		data:json,
		success : function(){
// 				alert("권한을 감소하였습니다.");
				location.reload();
			}


		});
}

</script>

</head>

<body>
	<div class="container">
		<h1>adminView</h1>
		<table class="table table-borderd table-striped nanum table-hover">
		<thead>
			<tr>
				<th>계정번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>닉네임</th>
				<th>등록일자</th>
				<th>권한등급</th>
				<th>권한변경</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.accountId}</td>
				<td>${list.email}</td>
				<td>${list.pwd}</td>
				<td>${list.nickname}</td>
				<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${list.authority}</td>
				<td>
					<button class="btn btn-xs btn-success authorUp" onclick="authorUp(${list.accountId},${list.authority})">UP</button>
					<button class="btn btn-xs btn-danger authorDown" onclick="authorDown(${list.accountId},${list.authority})">DOWN</button>
				</td>
<!-- 				<td><span class="glyphicon glyphicon-arrow-up" aria-hidden="true"> </span></td> -->

			</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
</body>

</html>
