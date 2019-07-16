<%@page import="com.good.dto.AccountsVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../module/header.jsp" flush="false"/>
</head>
<body>


<div class="container" style="font-family: 'Nanum Gothic', sans-serif;">
    <form id="commentForm" name="commentForm" method="post">
	
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span>&nbsp;&nbsp;&nbsp;<span id="cCnt"></span>
            </div>
            <hr style="2px dashed">
            <div>
            	<c:if test="${login.email != null }">

				<div class="table input-group">
					<div class="col-1">
						<img src="<spring:url value='/image/${login.picture}'/>" class=" mx-auto rounded-circle" width="40px" height="40px"/>
					</div>
                    <textarea class="col-10" style='resize:none;' rows="3" cols="20" id="object" name="object" placeholder="댓글을 입력하세요"></textarea>
					<button onClick="fn_comment('${row.boardId }'); return false;" class="col-1 pull-right btn btn-primary btn-lg" style="text-align:center;">등록</button>
				</div>
				</c:if>
            </div>
        </div>
        
        <input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />
        <input type="hidden" id="boardClass" name="boardClass" value="videocomment" />
        <c:if test="${login ne null}">
	        <input type="hidden" id="loginAccountId" name="loginAccountId" value="${login.accountId }" />        
        </c:if>
        <c:if test="${login eq null}">
	        <input type="hidden" id="loginAccountId" name="loginAccountId" value="-1" />        
        </c:if>        
    </form>
</div>


<div class="container" style="font-family: 'Nanum Gothic', sans-serif;">
	<div id="commentList">
		<div class="text-center">
			<div class="spinner-border" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
</div>
	
<script src="/resources/js/reply.js"></script>  
 
</body>
</html>