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
	<title>유저 일람 - YouDitorAdmin</title>
	<jsp:include page="../module/header.jsp" flush="false" />
	<script type="text/javascript">
	/*function authorUp(accountId, authority){
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
	}*/
	
	// 이전 버튼
	/*function fn_prev(page, range, rangeSize, searchType, keyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/adminView";
	
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}*/
	// 이전 버튼
	function fn_prev(page, rangeSize, searchType, keyword) {
		var page = parseInt((page - 1) / rangeSize) * rangeSize;
		var url = "${pageContext.request.contextPath}/adminView?";
	
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}
	
	//페이지 번호 클릭
	/*function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/adminView";
	
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}*/
	//페이지 번호 클릭
	function fn_pagination(page, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/adminView?";
	
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}
	
	//다음 버튼 이벤트
	/*function fn_next(page, range, rangeSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/adminView";
	
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}*/
	//다음 버튼 이벤트
	function fn_next(page, rangeSize, searchType, keyword) {
		var page = ((parseInt((page - 1) / rangeSize) + 1) * rangeSize) + 1;
		var url = "${pageContext.request.contextPath}/adminView?";
	
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}
	
	// 검색버튼 이벤트
	/*$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/adminView";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
	
		location.href = url;
		console.log(url);
	});*/
	
	// 검색버튼 이벤트
	$(function(){
		$('#keyword').keypress(function(e) {
	
			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			if (keycode == '13') {
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/adminView?";
				
				url = url + "searchType=" + $('#searchType').val();
				url = url + "&keyword=" + $('#keyword').val();
	
				location.href = url;
				console.log(url);
			}
			e.stopPropagation();
		});
	});
	
	// 검색
	function searchBtn(searchType, keyword) {
		var url = "${pageContext.request.contextPath}/adminView?";
		
		url = url + "searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		
		location.href = url;
	}

	function modAccountBtn(accountId) {
		var url = "${pageContext.request.contextPath}/adminAccount?";
		url = url + "accountId=" + accountId;

		location.href = url;
	}
	</script>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
<jsp:include page="./adminTop.jsp" flush="false"/>
<div class="container" style="max-width: 85%;"><br/>
	<h1>회원정보관리</h1>
	<table class="table table-borderd table-striped nanum table-hover">
		<thead>
			<tr>
				<th>계정번호</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>등록일자</th>
				<th>마지막 수정일자</th>
				<th>마지막 로그인일자</th>
				<th>권한등급</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td style="width: 100px;">${list.accountId}</td>
					<td>${list.nickname}</td>
					<td>${list.email}</td>
					<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${list.mod_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${list.newLogin_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td style="width: 100px;">${list.authority}</td>
					<td>
						<button class="btn btn-xs btn-warning" onclick="modAccountBtn('${list.accountId}');">수정</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 검색 시작 -->
	<div class="col-12">
		<!-- 페이징 -->
		<div class="p1 pagination col-12" style="display: block; text-align: center; margin-bottom: 10px;">
			<ul>
				<c:if test="${pagination.prev}">
					<a href="#" onclick="fn_prev('${pagination.page}', '${pagination.rangeSize}',
					'${pagination.searchType}', '${pagination.keyword}'); return false;"><li>◀</li></a>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<a class="<c:out value="${pagination.page == idx ? 'is-active' : ''}"/>" href="#"
					onclick="fn_pagination('${idx}', '${pagination.searchType}', 
					'${pagination.keyword}'); return false;">
						<li>${idx}</li></a>
				</c:forEach>
				<c:if test="${pagination.next}">
					<a href="#" onclick="fn_next('${pagination.page}', '${pagination.rangeSize}',
					'${pagination.searchType}', '${pagination.keyword}'); return false;"><li>▶</li></a>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 -->

		<!-- 검색 -->
		<div class="input-group col-12" style="padding-top: 6px;" align="right">
			<div class="col-3" align="right" style="padding-right: 0px;">
				<select class="form-control form-control-sm" name="searchType" id="searchType" style="width: 66.6%">
					<option value="email">이메일</option>
					<option value="nickname">닉네임</option>
				</select>
			</div>
			<div class="col-6" align="right" style="padding-right: 0px; padding-left: 5px;">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" style="float: left;">
			</div>

			<div class="col-1" style="padding-left: 0px;text-align: center;padding-right: 0px;padding-top: 5px;">
				<i class="fas fa-search" id="btnSearch" style="cursor:" onclick="searchBtn('${categoryInfo.categoryId }',
				'${pagination.searchType}', '${pagination.keyword}'); return false;"></i>
			</div>

			<div class="col-2" align="right" style="padding-left: 0px; padding-right: 5px;">
				
			</div>
		</div>
		<!-- 검색 -->
	</div>
	<!-- 페이징, 검색 끝 -->
</div>
</body>
</html>
