<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비디오게시판- YouditoR</title>
<jsp:include page="../module/header.jsp" flush="false"/>
<!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false" />
	<div class="form-group">
		<div class="col-sm-12">
			<h2 align="center">&nbsp;</h2>
			<h1 align="center">oo</h1>
			<h2 align="center">&nbsp;</h2>
		</div>
		<h5 align="center">ㅇㅇ유투버의 편집영상을 감상할 수 있습니다</h5>
		<h2 align="center">&nbsp;</h2>
	</div>
		
	<div class="container">
    	<!-- Marketing Icons Section -->
    	<div class="row">
			<c:forEach items="${VideoBoardList}" var="VideoBoardList">
     		 <div class="col-lg-4 mb-4">
        		<div class="card h-100">
        			<div align="center">
         				<h5 class="card-header"><a href="/videoboard/videoBoardView?boardId=${VideoBoardList.boardId}">${VideoBoardList.subject}</a></h5>
        			</div>
          			<div class="card-body" align="center">
						<script>
							var e = '${VideoBoardList.youtubeLink}';
							var eArray  = e.split('/');
							var youtubeID;
							for( var i in eArray ) {
								youtubeID = eArray[i];
							}
							if(youtubeID.length >11){
								eArray = youtubeID.split("=");
								youtubeID = eArray[1];
								youtubeID = youtubeID.substr(0,11);
							}
							//document.write('<p>' + youtubeID + '</p>');
							document.write('<img width="300" height="200" src="https://img.youtube.com/vi/' + youtubeID + '/mqdefault.jpg"></img>');
						</script>
          			</div>
          			<div class="card-footer" align="center">
						<table class="table nanum table-hover">
							<thead>
								<tr>
									<th><div align="center">작성자</div></th>
									<th><div align="center">작성일</div></th>
									<th>조회수</th>
								</tr>
							</thead>
								<tr>
									<td><div align="center">${VideoBoardList.accountId}</div></td>
									<td><div align="center"><fmt:formatDate value="${VideoBoardList.reg_date}"
											pattern="yyyy-MM-dd" /></div></td>
									<td><div align="right">${VideoBoardList.viewCount }</div></td>
								</tr>
							<tbody>
							
							</tbody>
						</table>
          			</div>
        		</div>
      		</div>
			</c:forEach>
      	</div>
      </div>
	<h2 align="center">&nbsp;</h2>
	<div class="col-sm-9" align="right">
		<button type="button" class="btn btn-primary" onclick="location.href='/videoboard/write.do' ">유투브 올리기</button>
	</div>
	<h2 align="center">&nbsp;</h2>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>