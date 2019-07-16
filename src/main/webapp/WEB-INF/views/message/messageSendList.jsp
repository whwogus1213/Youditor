<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>보낸 메세지 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<!-- Custom styles -->
	<link href="/resources/css/modern-business.css" rel="stylesheet">
	<script>
		// 이전 버튼
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";
	
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
	
		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";
	
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
	
		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";
	
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
	
		// 검색버튼 이벤트
		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();
			var url = "${pageContext.request.contextPath}/noticeboard/noticeBoardList";
			url = url + "?searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
	
			location.href = url;
			console.log(url);
		});
		
		//게시글을 삭제 했을시 삭제했다고 경고창이 떳다가 사라지는 기능
		var result = '${result}';
		$(function(){
			if(result === 'deleteOK'){
				$('#deleteOK').removeClass('hidden');
				$('#deleteOK').removeAttr("style");
				$('#deleteOK').fadeOut(2000);
			}
		})
	</script>
</head>
<body>
<jsp:include page="../module/top2.jsp" flush="false"/>
<div align="center">
	<div class="col-sm-12">
		<h2 align="center">&nbsp;</h2>
		<h1 align="center">보낸 메세지</h1>
		<h2 align="center">&nbsp;</h2>
	</div>
	<div>
		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/message/messageReceiveList' ">받은 메세지 보기</button>
		&nbsp;|&nbsp;
		<button type="button" class="btn btn-sm btn-success" onclick="location.href='/message/messageSendList' ">보낸 메세지 보기</button>
	</div>
</div>
<hr>
<div class="container" align="center">
	<table class="table table-striped table-hover">
		<thead class="thead-dark">
			<tr>
				<th scope="col"><div style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:100px; height: 100%">받는이</div></th>
				<th scope="col"><div style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:400px; height: 100%">제목</div></th>
				<th scope="col"><div style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:100px; height: 100%">보낸 날짜</div></th>
				<th scope="col"><div style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:100px; height: 100%">읽은 날짜</div></th>
				<th scope="col">
					<input type="checkbox" name="allCheck" id="allCheck" />
					<script>
					$("#allCheck").click(function(){
						var chk = $("#allCheck").prop("checked");
						if(chk) {
							$(".chBox").prop("checked", true);
						} else {
							$(".chBox").prop("checked", false);
						}
					});
					</script>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${MessageSendList }" var="MessageSendList">
				<tr>
					<td>${MessageSendList.nickname}</td>
					<td>
						<a href="/message/messageSendView?messageId=${MessageSendList.messageId}">${MessageSendList.subject}</a>
					</td>
					<td><fmt:formatDate value="${MessageSendList.send_date}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${empty MessageSendList.read_date }">
							unread
						</c:if>
						<c:if test="${not empty MessageSendList.read_date}">
							<fmt:formatDate value="${MessageSendList.read_date}" pattern="yyyy-MM-dd" />
						</c:if>
					</td>
					<td>
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox" data-messageId="${MessageSendList.messageId }">
							<script>
							$(".chBox").click(function(){
								$("#allCheck").prop("checked", false);
							});
							</script>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 -->
	<div id="paginationBox">
		<ul class="pagination" style="display:table; margin-left:auto; margin-right: auto;">
			<c:if test="${pagination.prev}">
				<li class="page-item">
					<a class="page-link" href="#"
					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
				</li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#"
					onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item">
					<a class="page-link" href="#"
					onClick="fn_next('${pagination.range}', '${pagination.range}',
					'${pagination.rangeSize}')">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 페이징 -->
	<hr>
	<!-- 검색 -->
	<div class="row input-group">
		<div class="col-sm-2" align="center">
			<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/message/write.do' ">메세지 쓰기</button>
		</div>
		<div class="col-sm-2" align="right">
			<select class="form-control form-control-sm" name="searchType" id="searchType" style="width:66.6%">
				<option value="subject">제목</option>
				<option value="object">본문</option>
				<option value="accountId">보낸이</option>
			</select>
		</div>
		<div class="col-sm-4" align="right" >
			<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" >
		</div>
		<div class="col-sm-1">
			<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
		</div>
		<div class="col-sm-3 delBtn" align="center">
			<button class="btn btn-sm btn-primary selectHideBtn" name="selectHideBtn" id="selectHideBtn">지우기</button>
			<script>
			$("#selectHideBtn").click(function(){
				var chArr = new Array();
				
				$("input[class='chBox']:checked").each(function(){
					chArr.push($(this).attr("data-messageId"));
				});
	
				if(chArr.length < 1) {
					alert("체크된 항목이 없습니다.")
				} else {
					var confirm_val = confirm("정말 삭제하시겠습니까?");
					
					if(confirm_val) {
						$.ajax({
							url : "/message/hideSendMessage",
							type : "post",
							data : { chBox : chArr },
							success : function(result){
								if(result == 1) {
									location.href='/message/messageSendList';
								} else {
									alert("삭제 실패");
								}
							}
						});
					}
				}				
			});
			</script>
		</div>
	</div>
	<!-- 검색 -->
</div>
<br>
<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>