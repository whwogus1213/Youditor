<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
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
<jsp:include page="../module/header.jsp" flush="false" />
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

// 이전 버튼
function fn_prev(page, range, rangeSize, searchType, keyword) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = "${pageContext.request.contextPath}/adminView";

	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/adminView";

	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize, searchType, keyword) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	var url = "${pageContext.request.contextPath}/adminView";

	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;
}

// 검색버튼 이벤트
$(document).on('click', '#btnSearch', function(e) {
	e.preventDefault();
	var url = "${pageContext.request.contextPath}/adminView";
	url = url + "?searchType=" + $('#searchType').val();
	url = url + "&keyword=" + $('#keyword').val();

	location.href = url;
	console.log(url);
});

</script>
</head>
<body>
<div class="container">
	<h1>adminView</h1>
	<table class="table table-borderd table-striped nanum table-hover">
		<thead>
			<tr>
				<th>계정번호</th>
				<th>이메일</th>
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
					<td>${list.nickname}</td>
					<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${list.authority}</td>
					<td>
						<button class="btn btn-xs btn-success authorUp"
							onclick="authorUp(${list.accountId},${list.authority})">UP</button>
						<button class="btn btn-xs btn-danger authorDown"
							onclick="authorDown(${list.accountId},${list.authority})">DOWN</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 -->
	<div id="paginationBox">
		<ul class="pagination" style="display: table; margin-left: auto; margin-right: auto;">
			<c:if test="${pagination.prev}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}',
					'${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">Previous</a>
				</li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}',
					'${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}',
					'${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 페이징 -->
	<hr>
	<!-- 검색 -->
	<div class="row input-group">
		<div class="col-sm-2"></div>
		<div class="col-sm-2" align="right">
			<select class="form-control form-control-sm" name="searchType" id="searchType" style="width: 66.6%">
				<option value="email">이메일</option>
				<option value="nickname">닉네임</option>
			</select>
		</div>
		<div class="col-sm-4" align="right">
			<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
		</div>
		<div class="col-sm-1">
			<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
		</div>
		<div class="col-sm-3" align="center"></div>
	</div>
	<!-- 검색 -->

</div>
<br>
<jsp:include page="./../module/bottom.jsp" flush="false" />
</body>

</html>
