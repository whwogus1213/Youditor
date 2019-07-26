<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${CatName } 카테고리 관리 - YouDitorAdmin</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<script>
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	// 카테고리 소속 게시물들의 카테고리 옮기기 버튼
	function moveCatBtn(category, categoryId) {
		var moveTo = $("#moveTo" + categoryId).val();
		var moveData = {"category": category, "categoryId": categoryId, "moveTo": moveTo};
		
		if(confirm("정말로 게시물들을 옮기시겠습니까?")) {
			$.ajax({
		        async : true,
				url : "/adminMoveCatPro",
				type : "POST",
				data : moveData,
				success : function(result){
					if(result == 1) {
						location.replace('/adminCategory?category=' + category);
					} else {
						alert("옮기기 실패");
						location.replace('/adminCategory?category=' + category);
					}
				}
			});
		} else {
			alert("옮기기 실패");
			location.replace('/adminCategory?category=' + category);
		}
	}
	
	// 카테고리 소속 게시물들의 카테고리를 옮기고서 카테고리를 지우는 버튼
	function delCatBtn(category, categoryId) {
		var moveTo = $("#moveTo" + categoryId).val();
		var deleteData = {"category": category, "categoryId": categoryId, "moveTo": moveTo};

		if(confirm("정말로 게시물들을 옮기시고 카테고리를 삭제하시겠습니까?")) {
			$.ajax({
				url : "/adminDelCatPro",
				type : "POST",
				data : deleteData,
				success : function(result){
					if(result == 1) {
						location.replace('/adminCategory?category=' + category);
					} else {
						alert("삭제 실패");
						location.replace('/adminCategory?category=' + category);
					}
				}
			});
		} else {
			alert("삭제 실패");
			location.replace('/adminCategory?category=' + category);
		}
	}

	// 카테고리 수정 버튼
	function editCatBtn(category, categoryId) {
		var editData = undefined;
		var catId = $("#CatId" + categoryId).val();
		var catName = $("#CatName" + categoryId).val();
		var catEditAuth = $("#CatEditAuth" + categoryId).val();
		var catViewAuth = $("#CatViewAuth" + categoryId).val();
		if(parseInt(catEditAuth) < parseInt(catViewAuth)) {
			catEditAuth = catViewAuth;
		}
		if(category == "video") {
			var catPic = $("#CatPic" + categoryId).val();
			editData = {"category": category, "categoryId": categoryId, "catId": catId, "catName": catName, "catPic": catPic, "catEditAuth": catEditAuth, "catViewAuth": catViewAuth};
		} else {
			editData = {"category": category, "categoryId": categoryId, "catId": catId, "catName": catName, "catEditAuth": catEditAuth, "catViewAuth": catViewAuth};
		}
		
		if(confirm("정말로 수정하시겠습니까?")) {
			$.ajax({
				url : "/adminEditCatPro",
				type : "POST",
				data : editData,
				success : function(result){
					if(result == 1) {
						location.replace('/adminCategory?category=' + category);
					} else {
						alert("수정 실패");
						location.replace('/adminCategory?category=' + category);
					}
				}
			});
		}
	}

	// 새로운 카테고리 만들기
	function newCatBtn() {
		d
	}
	</script>
</head>
<body>
<jsp:include page="./adminTop.jsp" flush="false"/>
<div class="container">
	<h1>${CatName } 카테고리 관리</h1>
	<h5>관리권한은 열람권한보다 낮을 수 없습니다.<br>관리권한을 열람권한보다 낮은 값을 주면 자동으로 열람권한과 같은 값을 가집니다.</h5>
	<table class="table table-borderd table-striped nanum table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<c:if test="${CatName eq 'video' }">
					<th>헤더이미지</th>
				</c:if>
				<th>관리권한</th>
				<th>열람권한</th>
				<th>수정</th>
				<th>전부 ~로</th>
				<th>옮기기/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${CategoryInfo }" var="CatInfo">
				<form name="editFormCatNum${CatInfo.categoryId }" method="POST" id="abcd${CatInfo.categoryId }"><tr>
					<th>
						<c:choose>
							<c:when test="${CatInfo.categoryId == 99 }">
								<input type="text" name="CatId" id="CatId${CatInfo.categoryId }" value="${CatInfo.categoryId }" style="width: 100px;" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" name="CatId" id="CatId${CatInfo.categoryId }" value="${CatInfo.categoryId }" style="width: 100px;">
							</c:otherwise>
						</c:choose>
					</th>
					<td>
						<c:choose>
							<c:when test="${CatInfo.categoryId == 99 }">
								<input type="text" name="CatName" id="CatName${CatInfo.categoryId }" value="${CatInfo.categoryName }" style="width: 100px;" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" name="CatName" id="CatName${CatInfo.categoryId }" value="${CatInfo.categoryName }" style="width: 100px;">
							</c:otherwise>
						</c:choose>
					</td>
					<c:if test="${CatName eq 'video' }">
						<td width="210">
							<c:choose>
								<c:when test="${CatInfo.categoryId == 99 }">
									<a href="#" onclick="window.open('/resources/images/videoList/${CatInfo.categoryPicture }', 'popUpWindow','height=500, width=700, left=100, top=100, resizable=yes, scrollbars=yes, toolbar=yes, menubar=no, location=no, directories=no, status=yes'); return false;">
										${CatInfo.categoryPicture }
									</a>
								</c:when>
								<c:otherwise>
									<input type="file" name="CatPic" id="CatPic${CatInfo.categoryId }" style="width: 200px;"><br>
									<a href="#" onclick="window.open('/resources/images/videoList/${CatInfo.categoryPicture }', 'popUpWindow','height=500, width=700, left=100, top=100, resizable=yes, scrollbars=yes, toolbar=yes, menubar=no, location=no, directories=no, status=yes'); return false;">
										${CatInfo.categoryPicture }
									</a>
								</c:otherwise>
							</c:choose>
						</td>
					</c:if>
					<td>
						<c:choose>
							<c:when test="${CatInfo.categoryId == 99 }">
								<select name="CatEditAuth" id="CatEditAuth${CatInfo.categoryId }" disabled>
									<c:choose>
										<c:when test="${CatInfo.editAuthority eq 4 }">
											<option value="4" selected>커뮤니티매니저</option>
											<option value="5">사이트관리자</option>
										</c:when>
										<c:when test="${CatInfo.editAuthority eq 5 }">
											<option value="4">커뮤니티매니저</option>
											<option value="5" selected>사이트관리자</option>
										</c:when>
									</c:choose>
								</select>
							</c:when>
							<c:otherwise>
								<select name="CatEditAuth" id="CatEditAuth${CatInfo.categoryId }">
									<c:choose>
										<c:when test="${CatInfo.editAuthority eq 4 }">
											<option value="4" selected>커뮤니티매니저</option>
											<option value="5">사이트관리자</option>
										</c:when>
										<c:when test="${CatInfo.editAuthority eq 5 }">
											<option value="4">커뮤니티매니저</option>
											<option value="5" selected>사이트관리자</option>
										</c:when>
									</c:choose>
								</select>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${CatInfo.categoryId == 99 }">
								<select name="CatViewAuth" id="CatViewAuth${CatInfo.categoryId }" disabled>
									<c:choose>
										<c:when test="${CatInfo.viewAuthority eq 3 }">
											<option value="3" selected>일반회원</option>
											<option value="4">커뮤니티매니저</option>
											<option value="5">사이트관리자</option>
										</c:when>
										<c:when test="${CatInfo.viewAuthority eq 4 }">
											<option value="3">일반회원</option>
											<option value="4" selected>커뮤니티매니저</option>
											<option value="5">사이트관리자</option>
										</c:when>
										<c:when test="${CatInfo.viewAuthority eq 5 }">
											<option value="3">일반회원</option>
											<option value="4">커뮤니티매니저</option>
											<option value="5" selected>사이트관리자</option>
										</c:when>
									</c:choose>
								</select>
							</c:when>
							<c:otherwise>
								<select name="CatViewAuth" id="CatViewAuth${CatInfo.categoryId }">
									<c:choose>
										<c:when test="${CatInfo.viewAuthority eq 3 }">
											<option value="3" selected>일반회원</option>
											<option value="4">커뮤니티매니저</option>
											<option value="5">사이트관리자</option>
										</c:when>
										<c:when test="${CatInfo.viewAuthority eq 4 }">
											<option value="3">일반회원</option>
											<option value="4" selected>커뮤니티매니저</option>
											<option value="5">사이트관리자</option>
										</c:when>
										<c:when test="${CatInfo.viewAuthority eq 5 }">
											<option value="3">일반회원</option>
											<option value="4">커뮤니티매니저</option>
											<option value="5" selected>사이트관리자</option>
										</c:when>
									</c:choose>
								</select>
							</c:otherwise>
						</c:choose>
					</td>
					<td width="100">
						<c:choose>
							<c:when test="${CatInfo.categoryId == 99 }">
								<button class="btn btn-xs btn-warning" onclick="editCatBtn('${CatName }', '${CatInfo.categoryId }');" disabled>수정</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-xs btn-warning" onclick="editCatBtn('${CatName }', '${CatInfo.categoryId }'); return false;">수정</button>
							</c:otherwise>
						</c:choose>
					</td>
					<td width="80">
						<select name="moveTo" id="moveTo${CatInfo.categoryId }" style="width: 90px;">
							<c:forEach items="${CategoryInfo }" var="where">
								<c:if test="${where.categoryId ne CatInfo.categoryId }">
									<option value="${where.categoryId }">${where.categoryName }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td width="150">
						<button class="btn btn-xs btn-warning" onclick="moveCatBtn('${CatName }', '${CatInfo.categoryId}'); return false;">옮기기</button>
						<c:if test="${CatInfo.categoryId ne 99 }">
							<button class="btn btn-xs btn-danger" onclick="delCatBtn('${CatName }', '${CatInfo.categoryId}'); return false;">옮기고 삭제</button>
						</c:if>
					</td>
				</tr></form>
			</c:forEach>
		</tbody>
		<tfoot>
			<form name="newCatForm" method="POST"><tr>
				<th>
					<input type="text" name="newCatId" id="newCatId" placeholder="categoryId" style="width: 100px;"><br>
					중복된 값은<br>
					가질 수<br>
					없습니다.
				</th>
				<td><input type="text" name="newCatName" id="newCatName" placeholder="Enter Name" style="width: 100px;"></td>
				<c:if test="${CatName eq 'video' }">
					<td width="210px">
						<input type="file" name="newCatPic" id="newCatPic" style="width: 200px;"><br>
						<a href="#">미리보기</a>
					</td>
				</c:if>
				<td>
					<select name="newEditAuth">
						<option value="4" selected>커뮤니티매니저</option>
						<option value="5">사이트관리자</option>
					</select>
				</td>
				<td>
					<select name="newViewAuth">
						<option value="3" selected>일반회원</option>
						<option value="4">커뮤니티매니저</option>
						<option value="5">사이트관리자</option>
					</select>
				</td>
				<td></td>
				<td></td>
				<td width="150">
					<button type="button" class="btn btn-xs btn-success" onclick="newCatBtn();">추가</button>
				</td>
			</tr></form>
		</tfoot>
	</table>
</div>
</body>
</html>
