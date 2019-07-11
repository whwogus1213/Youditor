<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>  <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

  <title>${row.subject } - 구인구직 - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>


</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>

	<!-- 게시글 상세정보 -->
	<div class="container">
	<script>
		
		//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 noticeboardcontroller 의 deleteVideoBoardPro 메서드 호출
		$(function(){
			$('#deletebtn').click(function(){
				if(confirm("정말 삭제하시겠습니까?")){
					self.location.href = "${path}/recruitboard/delete?boardId=${row.boardId}";
				}
			});
		});
	</script>
		<div align="center">
			<br><br>
			<h1>구인 구직</h1>
			<br><br>
		</div>
		<hr>
		<br>
		<h1>${row.subject }</h1>
		<br>
		<div align="right">
			<div class="form-inline">
				<div class="col-sm-8" align="right">
					<h4>작성자 ${row.nickname }</h4>
				</div>
				<div class="col-sm-4" align="right">
					<h4><c:if test="${row.categoryId eq 1}">일할분을 찾습니다.</c:if></h4>
					<h4><c:if test="${row.categoryId eq 2}">직장 구합니다.</c:if></h4>
				</div>
			</div>
			<div class="form-inline">
				<div class="col-sm-8" align="right">
					<h4>작성 일시 <fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd" /></h4>
				</div>
				<div class="col-sm-4" align="right">
					<h4>조회수 ${row.viewCount }</h4>
				</div>
			</div>
			<div class="form-inline">
				<div class="col-sm-4 offset-4" align="right">
					<h4>급 여   ${row.fee}</h4>
				</div>
			</div>
		</div>
		<hr>
		<br>
		<h2>${row.object }</h2>
		<br>
		<hr>
		<div align="center">
			<button type="button" class="btn btn-primary" onclick="location.href='/recruitboard/recruitBoardList' ">목록으로</button>
			<c:if test="${login.accountId eq row.accountId}">
			<button type="button" class="btn btn-success" onclick="location.href='/recruitboard/updateRecruitBoard?boardId=${row.boardId}' ">수정</button>
			<button class="btn btn-danger" id="deletebtn">삭제</button>
			</c:if>
		</div>
		<br>
	</div>
	
	<div id="listReply">
		<jsp:include page="../recruitboard/recruitBoardReply.jsp" flush="false"/>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
