<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function delCatBtn(categoryId) {
	var category = getParameterByName("category");
	var moveTo = $("#moveTo").val();
	var url = "${pageContext.request.contextPath}/adminDelCat?category=" + category + "&categoryId=" + categoryId + "&moveTo=" + moveTo;

	location.href = url;
}
</script>
</head>
<body>
<jsp:include page="./adminTop.jsp" flush="false"/>
<div class="container">
	<h1>회원정보관리</h1>
	<table class="table table-borderd table-striped nanum table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<c:if test="${CategoryInfo.categoryPicture ne null }">
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
			<c:forEach items="${CategoryInfo}" var="CategoryInfo">
				<tr>
					<th>${CategoryInfo.categoryId }</th>
					<td>${CategoryInfo.categoryName }</td>
					<c:if test="${CatInfo.categoryPicture ne null }">
						<td>${CatInfo.categoryPicture }</td>
					</c:if>
					<td>${CategoryInfo.editAuthority }</td>
					<td>${CategoryInfo.viewAuthority }</td>
					<td><button class="btn btn-xs btn-warning" onclick="editCatBtn('${CategoryInfo.categoryId}');">수정</button></td>
					<td>
						<select name="moveTo">
							<c:forEach items="${CategoryInfo }" varStatus="where">
								<c:if test="${where.categoryId != CatInfo.categoryId }">
									<option value="${where.categoryId }">${where.categoryName }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td>
						<button class="btn btn-xs btn-warning" onclick="moveCatBtn('${CategoryInfo.categoryId}');">옮기기</button>
						<button class="btn btn-xs btn-danger" onclick="delCatBtn('${CategoryInfo.categoryId}');">옮기고 삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th>
					<select name="newCatId">
						<c:forEach var="i" begin="1" end="98">
							<c:forEach items="${CategoryInfo }" varStatus="used">
								<c:if test="${i != used.categoryId }">
									<option value="${i }">${i }</option>
								</c:if>
							</c:forEach>
						</c:forEach>
					</select>
				</th>
				<td><input type="text" name="newCatName" id="newCatName" placeholder="Enter Category Name"></td>
				<c:if test="${CatInfo.categoryPicture ne null }">
					<td>
						<input type="file" name="newCatPic" id="newCatPic"><br>
						<a href="#">미리보기</a>
					</td>
				</c:if>
				<td>
					<select name="editAuth">
						<option value="4" selected>커뮤니티매니저</option>
						<option value="5">사이트관리자</option>
					</select>
				</td>
				<td>
					<select name="viewAuth">
						<option value="3" selected>일반회원</option>
						<option value="4">커뮤니티매니저</option>
						<option value="5">사이트관리자</option>
					</select>
				</td>
				<td></td>
				<td></td>
				<td>
					<button type="button" class="btn btn-xs btn-success" onclick="newCatBtn();">추가</button>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
</body>
</html>
