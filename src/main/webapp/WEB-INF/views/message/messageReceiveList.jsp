<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>받은 메세지 - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<link href="/resources/css/pagination.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<script>

	// 이전 버튼
	function fn_prev(page, rangeSize, searchType, keyword) {
		var page = parseInt((page - 1) / rangeSize) * rangeSize;
		var url = "${pageContext.request.contextPath}/message/messageReceiveList?";

		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/message/messageReceiveList?";

		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}
	

	//다음 버튼 이벤트
	function fn_next(page, rangeSize, searchType, keyword) {
		var page = ((parseInt((page - 1) / rangeSize) + 1) * rangeSize) + 1;
		var url = "${pageContext.request.contextPath}/message/messageReceiveList?";

		url = url + "page=" + page;
		if(keyword != null && keyword != "") {
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	}
		
	$(function(){
		$('#keyword').keypress(function(e) {

			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			if (keycode == '13') {
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/message/messageReceiveList?";
				url = url + "searchType=" + $('#searchType').val();
				url = url + "&keyword=" + $('#keyword').val();

				location.href = url;
				console.log(url);
			}
			e.stopPropagation();
		});
	});
</script>
<style type="text/css">
.p1 a.is-active {
	background-color:AntiqueWhite; color: DarkGoldenRod;
}
</style>
</head>
<body>
<jsp:include page="../module/top2.jsp" flush="false"/>

<!-- 배너 -->
<div class="form-group">
	<div class="col-sm-12" style="background-image:url('/resources/images/message/message.jpg'); background-position:50% 50%; background-size:100%; font-family: 'Poor Story', sans-serif; color:black; padding-top: 5%; padding-bottom:4%">
		<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>메세지 보관함</strong></h1>
		<h4 align="center"><br>다른 YouditoR와 메세지를 주고 받을 수 있습니다.</h4>
	</div>
</div>

<div class="container">
	<div class="row" style="font-family: 'Poor Story', sans-serif;">
		<div align="left" style="color:DarkGoldenRod; padding-top:1%">
				<h3 style="margin-bottom:0px; font-weight:600; cursor: pointer;" onclick="location.href='/message/messageReceiveList' ">&nbsp;&nbsp;받은 메세지 목록</h3>
		</div>
		<div align="left" style="padding-top:2%">
			<button type="button" class="btn btn-sm btn-link" onclick="location.href='/message/messageSendList' " style="color:GoldenRod;"><i class="fas fa-arrows-alt-h"></i>&nbsp;&nbsp;보낸 메세지 보기</button>
		</div>
	</div>
	<table class="table table-hover">
		<thead style="color:Peru">
			<tr>
				<th scope="col"><div style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:100px; height: 100%" align="center">보낸이</div></th>
				<th scope="col"><div style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:400px; height: 100%" align="center">제목</div></th>
				<th scope="col"><div style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:100px; height: 100%" align="center">보낸 날짜</div></th>
				<th scope="col"><div style="overflow:hidden; text-overflow: ellipsis; white-space:nowrap; width:100px; height: 100%" align="center">읽은 날짜</div></th>
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
			<c:forEach items="${MessageReceiveList }" var="MessageReceiveList">
				<tr>
					<td>
						<img src="<spring:url value='/image/${MessageReceiveList.picture}'/>" class=" mx-auto rounded-circle" 
										width="20px" height="20px"/>&nbsp;${MessageReceiveList.nickname}<br>	
					</td>
					<td>
						<a href="/message/messageReceiveView?messageId=${MessageReceiveList.messageId}" style="align:center; color:black">${MessageReceiveList.subject}</a>
					</td>
					<td><fmt:formatDate value="${MessageReceiveList.send_date}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${empty MessageReceiveList.read_date }">
							unread
						</c:if>
						<c:if test="${not empty MessageReceiveList.read_date}">
							<fmt:formatDate value="${MessageReceiveList.read_date}" pattern="yyyy-MM-dd" />
						</c:if>
					</td>
					<td>
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox" data-messageId="${MessageReceiveList.messageId }">
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
	<div class="p1 pagination col-12" style="display: block; text-align: center; margin-bottom: 10px;">
		<ul class="pagination" style="display:table; margin-left:auto; margin-right: auto;">
			<c:if test="${pagination.prev}">
				<a href="#" onclick="fn_prev('${pagination.page}', '${pagination.rangeSize}',
				'${pagination.searchType}', '${pagination.keyword}'); return false;"><li>◀</li></a>
			</c:if>
			
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<a class="<c:out value="${pagination.page == idx ? 'is-active' : ''}"/>" href="#"
				onclick="fn_pagination('${idx}', '${pagination.searchType}', '${pagination.keyword}'); return false;">
					<li>${idx}</li></a>
			</c:forEach>
			<c:if test="${pagination.next}">
				<a href="#" onclick="fn_next('${pagination.page}', '${pagination.rangeSize}',
				'${pagination.searchType}', '${pagination.keyword}'); return false;"><li>▶</li></a>
			</c:if>
		</ul>
	</div>
	<!-- 페이징 -->
	<hr>
	<!-- 검색 -->
	<div class="row input-group">
		<div class="col-sm-2" align="center">
			<button type="button" class="btn btn-sm" onclick="location.href='/message/write.do'" style="background-color:AntiqueWhite; color: DarkGoldenRod;"><i class="fas fa-edit"></i>&nbsp;&nbsp;메세지 쓰기</button>
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
			<button class="btn btn-sm" name="btnSearch" id="btnSearch" style="background-color:AntiqueWhite; color: DarkGoldenRod;">검색</button>
		</div>
		<div class="col-sm-3 delBtn" align="center">
			<button class="btn btn-sm selectHideBtn" name="selectHideBtn" id="selectHideBtn" style="background-color:AntiqueWhite; color: DarkGoldenRod;"><i class="fas fa-times"></i>&nbsp;&nbsp;지우기</button>
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
							url : "/message/hideReceivedMessage",
							type : "post",
							data : { chBox : chArr },
							success : function(result){
								if(result == 1) {
									location.href='/message/messageReceiveList';
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