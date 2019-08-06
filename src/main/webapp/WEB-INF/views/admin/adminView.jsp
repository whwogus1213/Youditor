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
	// 이전 버튼
	function fn_prev(page, rangeSize, searchType, keyword, orderBy, orderType) {
		var page = parseInt((page - 1) / rangeSize) * rangeSize;
		var url = "${pageContext.request.contextPath}/adminView?";
		
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}

		if(orderBy != null) {
			url = url + "&orderBy=" + orderBy + "&orderType=" + orderType;
		}
		
		location.href = url;
	}
	
	//페이지 번호 클릭
	function fn_pagination(page, searchType, keyword, orderBy, orderType) {
		var url = "${pageContext.request.contextPath}/adminView?";
	
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}

		if(orderBy != null) {
			url = url + "&orderBy=" + orderBy + "&orderType=" + orderType;
		}
		
		location.href = url;
	}
	
	//다음 버튼 이벤트
	function fn_next(page, rangeSize, searchType, keyword, orderBy, orderType) {
		var page = ((parseInt((page - 1) / rangeSize) + 1) * rangeSize) + 1;
		var url = "${pageContext.request.contextPath}/adminView?";
	
		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		
		if(orderBy != null) {
			url = url + "&orderBy=" + orderBy + "&orderType=" + orderType;
		}
		
		location.href = url;
	}
	
	// 검색버튼 이벤트
	$(function(){
		$('#keyword').keypress(function(e) {
	
			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			if (keycode == '13') {
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/adminView?";

				if($('#keyword').val() != null && $('#keyword').val().length != 0) {
					url = url + "searchType=" + $('#searchType').val();
					url = url + "&keyword=" + $('#keyword').val();
					
					var orderBy = "${pagination.orderBy}";
					var orderType = "${pagination.orderType}";
					
					if(orderBy != null) {
						url = url + "&orderBy=" + orderBy + "&orderType=" + orderType;
					}
		
					location.href = url;
					console.log(url);
				} else {
					return;
				}
				
			}
			e.stopPropagation();
		});
	});
	
	// 검색
	function searchBtn(orderBy, orderType) {
		var url = "${pageContext.request.contextPath}/adminView?";

		if($('#keyword').val() != null && $('#keyword').val().length != 0) {

			url = url + "searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
			
			if(orderBy != null) {
				url = url + "&orderBy=" + orderBy + "&orderType=" + orderType;
			}
			
			location.href = url;
		} else {
			return;
		}
	}

	// 컬럼별 순서대로 버튼
	function sortBtn(searchType, keyword, orderBy, orderType) {
		var url = "${pageContext.request.contextPath}/adminView?";
		
		if(keyword != null && keyword.length != 0) {
			url = url + "searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			url = url + "&orderBy=" + orderBy + "&orderType=" + orderType;
		} else {
			url = url + "orderBy=" + orderBy + "&orderType=" + orderType;
		}
		
		location.href = url;
	}

	// 계정 수정 버튼
	function modAccountBtn(accountId) {
		var url = "${pageContext.request.contextPath}/adminAccount?";
		url = url + "accountId=" + accountId;

		location.href = url;
	}
	</script>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
</head>
<body>
<jsp:include page="./adminTop.jsp" flush="false"/>
<div class="container" style="max-width: 85%;"><br/>
	<h1>회원정보관리</h1>
	<table class="table table-borderd table-striped nanum table-hover">
		<thead>
			<tr>
				<th>
					<c:choose>
						<c:when test="${pagination.orderBy eq 'accountId' }">
							<c:choose>
								<c:when test="${pagination.orderType eq 'DESC' }">
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'accountId', 'ASC');">계정번호<i class="fas fa-sort-numeric-down-alt"></i></a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'accountId', 'DESC');">계정번호<i class="fas fa-sort-numeric-down"></i></a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'accountId', 'DESC');">계정번호</a>
						</c:otherwise>
					</c:choose>
				</th>
				<th>
					<c:choose>
						<c:when test="${pagination.orderBy eq 'nickname' }">
							<c:choose>
								<c:when test="${pagination.orderType eq 'DESC' }">
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'nickname', 'ASC');">닉네임<i class="fas fa-sort-alpha-down-alt"></i></a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'nickname', 'DESC');">닉네임<i class="fas fa-sort-alpha-down"></i></a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'nickname', 'DESC');">닉네임</a>
						</c:otherwise>
					</c:choose>
				</th>
				<th>
					<c:choose>
						<c:when test="${pagination.orderBy eq 'email' }">
							<c:choose>
								<c:when test="${pagination.orderType eq 'DESC' }">
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'email', 'ASC');">이메일<i class="fas fa-sort-alpha-down-alt"></i></a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'email', 'DESC');">이메일<i class="fas fa-sort-alpha-down"></i></a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'email', 'DESC');">이메일</a>
						</c:otherwise>
					</c:choose>
				</th>
				<th>
					<c:choose>
						<c:when test="${pagination.orderBy eq 'reg_date' }">
							<c:choose>
								<c:when test="${pagination.orderType eq 'DESC' }">
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'reg_date', 'ASC');">등록일자<i class="fas fa-sort-numeric-down-alt"></i></a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'reg_date', 'DESC');">등록일자<i class="fas fa-sort-numeric-down"></i></a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'reg_date', 'DESC');">등록일자</a>
						</c:otherwise>
					</c:choose>
				</th>
				<th>
					<c:choose>
						<c:when test="${pagination.orderBy eq 'mod_date' }">
							<c:choose>
								<c:when test="${pagination.orderType eq 'DESC' }">
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'mod_date', 'ASC');">마지막 수정일자<i class="fas fa-sort-numeric-down-alt"></i></a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'mod_date', 'DESC');">마지막 수정일자<i class="fas fa-sort-numeric-down"></i></a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'mod_date', 'DESC');">마지막 수정일자</a>
						</c:otherwise>
					</c:choose>
				</th>
				<th>
					<c:choose>
						<c:when test="${pagination.orderBy eq 'newLogin_date' }">
							<c:choose>
								<c:when test="${pagination.orderType eq 'DESC' }">
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'newLogin_date', 'ASC');">마지막 로그인일자<i class="fas fa-sort-numeric-down-alt"></i></a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'newLogin_date', 'DESC');">마지막 로그인일자<i class="fas fa-sort-numeric-down"></i></a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'newLogin_date', 'DESC');">마지막 로그인일자</a>
						</c:otherwise>
					</c:choose>
				</th>
				<th>
					<c:choose>
						<c:when test="${pagination.orderBy eq 'authority' }">
							<c:choose>
								<c:when test="${pagination.orderType eq 'DESC' }">
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'authority', 'ASC');">권한등급<i class="fas fa-sort-numeric-down-alt"></i></a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'authority', 'DESC');">권한등급<i class="fas fa-sort-numeric-down"></i></a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="sortBtn('${pagination.searchType}', '${pagination.keyword }', 'authority', 'DESC');">권한등급</a>
						</c:otherwise>
					</c:choose>
				</th>
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
					<a href="#" onclick="fn_prev('${pagination.page}', '${pagination.rangeSize}', '${pagination.searchType}',
					'${pagination.keyword}', '${pagination.orderBy }', '${pagination.orderType }'); return false;"><li>◀</li></a>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<a class="<c:out value="${pagination.page == idx ? 'is-active' : ''}"/>" href="#"
					onclick="fn_pagination('${idx}', '${pagination.searchType}', '${pagination.keyword}',
					'${pagination.orderBy }', '${pagination.orderType }'); return false;">
						<li>${idx}</li></a>
				</c:forEach>
				<c:if test="${pagination.next}">
					<a href="#" onclick="fn_next('${pagination.page}', '${pagination.rangeSize}', '${pagination.searchType}',
					'${pagination.keyword}', '${pagination.orderBy }', '${pagination.orderType }'); return false;"><li>▶</li></a>
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
				<i class="fas fa-search" id="btnSearch" style="cursor:" onclick="searchBtn('${pagination.orderBy }', '${pagination.orderType }',); return false;"></i>
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
