<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편집 팁 - 작성 - YouditoR</title>
<jsp:include page="./../module/header.jsp" flush="false"/>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/tipboard/tipboard.jpg'); background-position:50% 20%; background-size:100%; font-family: 'Noto Serif KR', sans-serif; color:Peru; padding-top:130px; padding-bottom:5%"  >
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>편집 Tip</strong></h1>
			<h4 align="center"><br>나만의 편집 팁을 공유하세요.</h4>
		</div>
	</div>
	
	<div class="container">
		<div align="right" >
			<br>
        	<c:choose>
        		<c:when test="${row ne null }">
					<h1 style="color:Brown; font-family: 'Noto Serif KR'">편집 Tip 수정</h1>
        		</c:when>
        		<c:otherwise>
					<h1 style="color:Brown; font-family: 'Noto Serif KR'">편집 Tip 작성</h1>
        		</c:otherwise>
        	</c:choose>
		</div>
		<hr>
		<br>
	    <form class="form-horizontal" method="post" name="tipWriteForm">
	    	<div class="form-inline">
	        	<label class="control-label col-sm-2"><strong style="color:brown">제목</strong></label>
	        	<div class="col-sm-8">
	        		<c:choose>
	        			<c:when test="${row ne null }">
	        				<input type="text" class="form-control" name="subject" id="subject" maxlength="50" placeholder="Enter Title" style="width:100%" value="${row.subject }">
	        				<input type="hidden" name="boardId" id="boardId" value="${row.boardId }">
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" class="form-control" name="subject" id="subject" maxlength="50" placeholder="Enter Title" style="width:100%">
	        			</c:otherwise>
	        		</c:choose>
	        	</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:brown">카테고리</strong></label>
				<div class="col-sm-3">
					<select class="browser-default custom-select" name="categoryId" id="categoryId" style="width: 190px">
						<c:forEach items="${tCatList}" var="CatList">
							<c:choose>
								<c:when test="${CatList.categoryId == 99 }">
									<c:if test="${login.authority >= CatList.editAuthority }">
										<c:choose>
											<c:when test="${row.categoryId == CatList.categoryId }">
												<option value="${CatList.categoryId }" selected>${CatList.categoryName }</option>
											</c:when>
											<c:otherwise>
												<option value="${CatList.categoryId }">${CatList.categoryName }</option>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${row.categoryId == CatList.categoryId }">
											<option value="${CatList.categoryId }" selected>${CatList.categoryName }</option>
										</c:when>
										<c:otherwise>
											<option value="${CatList.categoryId }">${CatList.categoryName }</option>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-2"><strong style="color:brown">작성자</strong></label>
		        <div class="col-sm-3">
	        		<c:choose>
	        			<c:when test="${row ne null }">
	        				<input type="text" class="form-control" maxlength="50" value="${row.nickname}" readonly>
							<input type="hidden" class="form-control" name="accountId" id="accountId" maxlength="50" value="${row.accountId}" style="display:none" readonly>
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" class="form-control" maxlength="50" value="${login.nickname}" readonly>
							<input type="hidden" class="form-control" name="accountId" id="accountId" maxlength="50" value="${login.accountId}" style="display:none" readonly>
	        			</c:otherwise>
	        		</c:choose>
		        </div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2"><strong style="color:brown">내용</strong></label>
				<div class="col-sm-3">
	        		<c:choose>
	        			<c:when test="${row ne null }">
	        				<textarea rows="10" cols="100" name="object" id="object"><c:out value="${row.object }"/></textarea>
	        			</c:when>
	        			<c:otherwise>
	        				<textarea rows="10" cols="100" name="object" id="object"></textarea>
	        			</c:otherwise>
	        		</c:choose>
				</div>
			</div>
			<br>
			<div class="col-sm-11" align="right">
        		<c:choose>
        			<c:when test="${row ne null }">
        				<button type="button" class="btn btn-link" onclick="updateBtn();"><strong style="color:Brown;"><i class="fas fa-file-upload"></i>&nbsp;&nbsp;수정하기</strong></button>
        			</c:when>
        			<c:otherwise>
        				<button type="button" class="btn btn-link" onclick="insertBtn();"><strong style="color:Brown;"><i class="fas fa-file-upload"></i>&nbsp;&nbsp;올리기</strong></button>|
        			</c:otherwise>
        		</c:choose>
				<script type="text/javascript">
				function insertBtn() {
					var accountId = $("#accountId").val();
					var categoryId = $("#categoryId").val();
		  			var subject = $("#subject").val();
		  			var object = $("#object").val();

		  			if (subject.length == 0) {
						alert("제목을 입력해 주세요.");
						$("#subject").focus();
						return;
					}
					if (object.length == 0) {
						alert("내용을 입력해 주세요.");
						$("#object").focus();
						return;
					}
			  		
					document.tipWriteForm.action = "/tipboard/insertTipBoardPro";
					document.tipWriteForm.method = "POST";
					document.tipWriteForm.submit();
				}
				
				function updateBtn() {
					var subject = $("#subject").val();
					var object = $("#object").val();
					if (subject.length == 0) {
						alert("제목을 입력해 주세요.");
						$("#subject").focus();
						return;
					}
					if (object.length == 0) {
						alert("내용을 입력해 주세요.");
						$("#object").focus();
						return;
					}

					document.tipWriteForm.action = "/tipboard/updateTipBoardPro";
					document.tipWriteForm.method = "POST";
					document.tipWriteForm.submit();
				}
				</script>
			
	       <button type="reset" class="btn btn-link"><strong style="color:Brown;"><i class="fas fa-undo-alt"></i>&nbsp;&nbsp;초기화</strong></button>&nbsp;|
	       <button type="button" class="btn btn-link" onclick="location.href='/tipboard/tipBoardList?num=1'"><strong style="color:Brown;"><i class="fas fa-backspace"></i>&nbsp;&nbsp;뒤로 가기</strong></button>
	       </div>
			<br>
		</form>
	</div>
</body>
<jsp:include page="../module/bottom.jsp" flush="false" />
</html>
