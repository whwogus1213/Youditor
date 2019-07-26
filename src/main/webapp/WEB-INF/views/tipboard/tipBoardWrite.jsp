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
	    <form class="form-horizontal" method="post" name="tipWriteForm">
	    	<div class="form-inline">
	        	<label class="control-label col-sm-2">제목</label>
	        	<div class="col-sm-3">
	        		<input type="text" class="form-control" name="subject" id="subject" maxlength="50" placeholder="Enter Title">
	        	</div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2">카테고리</label>
				<div class="col-sm-3">
	        		<select class="browser-default custom-select" name="categoryId" style="width:190px" id="categoryId">
		           		<option value="1">팁</option>
		           </select>
				</div>
			</div>
			<br>
			<div class="form-inline">
		        <label class="control-label col-sm-2">작성자</label>
		        <div class="col-sm-3">
					<input type="text" class="form-control" maxlength="50" value="${login.nickname}" readonly>
					<input type="text" class="form-control" name="accountId" id="accountId" maxlength="50" value="${login.accountId}" style="display:none" readonly>
		        </div>
			</div>
			<br>
			<div class="form-inline">
				<label class="control-label col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea rows="10" cols="100" name="object" id="object"></textarea>
				</div>
			</div>
			<br>
			<div class="col-sm-12" align="center">
			<button type="submit" id="submit" class="btn btn-success" onclick="insertBtn();">올리기</button>
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

					document.tipWriteForm.action = "/tipboard/updateTipBoardPro";
					document.tipWriteForm.method = "POST";
					document.tipWriteForm.submit();
				}
				</script>
			
	       <button type="reset" class="btn btn-warning">초기화</button>
	       <button type="button" class="btn btn-info" onclick="location.href='/tipboard/tipBoardList?num=1'">뒤로 가기</button>
	       </div>
			<br>
		</form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>
