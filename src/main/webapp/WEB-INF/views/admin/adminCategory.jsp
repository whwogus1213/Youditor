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
	// 카테고리 소속 게시물들의 카테고리 옮기기 버튼
	function moveCatBtn(category, categoryId) {
		var moveTo = $("#moveTo" + categoryId).val();
		var moveData = {"category": category, "categoryId": categoryId, "moveTo": moveTo};

		if(confirm("정말로 게시물들을 옮기시겠습니까?")) {
			$.ajax({
				url : "/adminMoveCatPro",
				type : "POST",
				data : moveData,
				success : function(result){
					if(result == 1) {
						location.href='/adminCategory?category=' + category;
					} else {
						alert("옮기기 실패");
						return;
					}
				}
			});
		} else {
			return;
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
						location.href='/adminCategory?category=' + category;
					} else {
						alert("삭제 실패");
						return;
					}
				}
			});
		} else {
			return;
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
		editData = {"category": category, "categoryId": categoryId, "catId": catId, "catName": catName, "catEditAuth": catEditAuth, "catViewAuth": catViewAuth};

		if(confirm("정말로 수정하시겠습니까?")) {
			alert("들어옴");
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

	function newPictureBtn(categoryId) {
		var newCatPic = $("#CatPic" + categoryId).val();

		if(newCatPic != null && newCatPic != "") {
			event.preventDefault();

			var form = $('#newPicForm' + categoryId)[0];

			var data = new FormData(form);

			$.ajax({
				type: "POST",
				enctype: 'multipart/form-data',
				url: "/adminNewCatPicPro",
				data: data,
				processData: false,
				contentType: false,
				cache: false,
				success: function(result){
					if(result == 1) {
						location.replace('/adminCategory?category=video');
					} else {
						alert("추가 실패");
						return false;
					}
				}
			});
		}
	}
	
	// 새로운 카테고리 만들기
	function newCatBtn(category) {
		var newCatId = $("#newCatId").val();
		var newCatName = $("#newCatName").val();
		if(newCatId.length == 0) { alert("카테고리 번호를 입력해 주세요."); $("#newCatId").focus(); return; }
		if(newCatName.length == 0) { alert('카테고리 이름을 입력해주세요.'); $("#newCatName").focus(); return; }
		var newForm = $("#newCatForm")[0];

		var newData = new FormData(newForm);

		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "/adminAddCatPro",
			data: newData,
			processData: false,
			contentType: false,
			cache: false,
			success: function(result){
				if(result == 1) {
					location.replace('/adminCategory?category=' + category);
				} else {
					alert("수정 실패");
					return false;
				}
			}
		});
	}
	</script>
</head>
<body>
<jsp:include page="./adminTop.jsp" flush="false"/>
<div class="container" style="max-width: 85%;"><br/><br/><br/>
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
				<th>게시물수</th>
				<th>전부 ~로</th>
				<th>옮기기/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${CategoryInfo }" var="CatInfo">
				<tr>
					<th>
						<c:choose>
							<c:when test="${CatInfo.categoryId == 99 }">
								<input type="text" name="CatId" id="CatId${CatInfo.categoryId }" value="${CatInfo.categoryId }" style="width: 90px;" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" name="CatId" id="CatId${CatInfo.categoryId }" value="${CatInfo.categoryId }" style="width: 90px;">
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
					<td>
						<c:choose>
							<c:when test="${CatInfo.categoryId == 99 }">
								<button class="btn btn-xs btn-warning" onclick="editCatBtn('${CatName }', '${CatInfo.categoryId}');" disabled>수정</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-xs btn-warning" onclick="editCatBtn('${CatName }', '${CatInfo.categoryId}');">수정</button>
							</c:otherwise>
						</c:choose>
					</td>
					<c:if test="${CatName eq 'video' }">
						<td width="250px" height="90px">
							<c:choose>
								<c:when test="${CatInfo.categoryId == 99 }">
									<a href="#" onclick="window.open('/resources/images/videoList/${CatInfo.categoryPicture }', 'popUpWindow','height=500, width=700, left=100, top=100, resizable=yes, scrollbars=yes, toolbar=yes, menubar=no, location=no, directories=no, status=yes'); return false;">
										${CatInfo.categoryPicture }
									</a>
								</c:when>
								<c:otherwise>
								<form id="newPicForm${CatInfo.categoryId }" method="POST" action="${path}/adminNewCatPicPro">
									<a href="#" onclick="window.open('/image/videoboard/${CatInfo.categoryPicture }', 'popUpWindow','height=500, width=700, left=100, top=100, resizable=yes, scrollbars=yes, toolbar=yes, menubar=no, location=no, directories=no, status=yes'); return false;">
										${CatInfo.categoryPicture }
									</a><br>
									<input type="hidden" name="categoryId" id="categoryId${CatInfo.categoryId }" value="${CatInfo.categoryId }">
									<input type="file" name="CatPic" id="CatPic${CatInfo.categoryId }" style="width: 240px;"><br>
									<button type="button" id="newPicBtn" onclick="newPictureBtn('${CatInfo.categoryId }')">올리기</button>
								</form>
								</c:otherwise>
							</c:choose>
						</td>
					</c:if>
					<td>
						<c:forEach items="${CatCount }" var="CatCount">
							<c:if test="${CatCount.catId eq CatInfo.categoryId }">
								<c:out value="${CatCount.catCount }"/>
							</c:if>
						</c:forEach>
					</td>
					<td>
						<select name="moveTo" id="moveTo${CatInfo.categoryId }" style="width: 90px;">
							<c:forEach items="${CategoryInfo }" var="where">
								<c:if test="${where.categoryId ne CatInfo.categoryId }">
									<option value="${where.categoryId }">${where.categoryName }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td>
						<button class="btn btn-xs btn-warning" onclick="moveCatBtn('${CatName }', '${CatInfo.categoryId}'); return false;">옮기기</button>
						<c:if test="${CatInfo.categoryId ne 99 }">
							<button class="btn btn-xs btn-danger" onclick="delCatBtn('${CatName }', '${CatInfo.categoryId}'); return false;">옮기고삭제</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<form name="newCatForm" id="newCatForm" method="POST"><tr>
				<th>
					<input type="text" name="newCatId" id="newCatId" placeholder="categoryId" style="width: 100px;"><br>
					중복된 값은<br>
					가질 수<br>
					없습니다.
				</th>
				<td><input type="text" name="newCatName" id="newCatName" placeholder="Enter Name" style="width: 100px;"></td>
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
				<c:if test="${CatName eq 'video' }">
					<td>헤더이미지는 카테고리를<br>추가하신 후에 넣어주세요.</td>
				</c:if>
				<td></td>
				<td></td>
				<td>
					<input type="hidden" name="board" id="board" value="${CatName }">
					<button type="button" class="btn btn-xs btn-success" onclick="newCatBtn('${CatName }'); return false;">추가</button>
				</td>
			</tr></form>
		</tfoot>
	</table>
</div>
</body>
</html>
