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
<link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Song+Myung|Jua|Cute+Font|Noto+Sans+KR|Black+Han+Sans|Gothic+A1|Hi+Melody|Nanum+Brush+Script|Do+Hyeon|Nanum+Gothic&display=swap" rel="stylesheet">
<link href="/resources/css/default.css" rel="stylesheet" type="text/css"/>
<link href="/resources/css/reply.css" rel="stylesheet">
</head>
<body>


<div class="container" style="font-family: 'Nanum Gothic', sans-serif;">
    <form id="commentForm" name="commentForm" method="post">
	
    <br><br>
        <div>
            <hr style="2px dashed;">
            <div style="margin-bottom: 20px;">
                <span><strong>댓글(</strong></span><span id="cCnt"></span><span><strong>)</strong></span>
            </div>
            <div>
            	<c:if test="${login.email != null }">
            	
            	<div class="input_template">
				<div class='loadingSpin' style="text-align: center;"></div>
				<div id='inputGroup' class="table input-group">
					<div class="col-1" style="text-align: center; padding-top: 7px;">
						<img src="<spring:url value='/image/${login.picture}'/>" class=" mx-auto rounded-circle" width="40px" height="40px"/>
					</div>
					<div class="col-11" style="margin: 0; padding: 0;">
	                    <textarea class="col-12 textInput" style='resize:none;' rows="1" cols="20" id="object" name="object" maxlength="100" placeholder="댓글을 입력하세요"></textarea>
    	                <span class="focus-border"></span>
					</div>
                    <div class='textInputBtn offset-10 col-2' style='padding-right: 0; padding-top: 5px; text-align: right;'>
<!-- 						<button onClick='fn_commentCancel(); return false;' class='btn btn-outline-light' style='text-align:center;'><span style='color: black;'>취소</span></button> -->
<%-- 						<button onClick='fn_comment("${row.boardId }"); return false;' class='btn btn-outline-primary' style='text-align:center;' disabled='disabled'>등록</button> --%>
                    </div>
				</div>
				</div>
				
				</c:if>
            </div>
        </div>
        
        <input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />
        <input type="hidden" id="boardClass" name="boardClass" value="videocomment" />
        <c:if test="${login ne null}">
	        <input type="hidden" id="loginAccountId" name="loginAccountId" value="${login.accountId }" />        
	        <input type="hidden" id="loginPicture" name="loginPicture" value="${login.picture}" />        
        </c:if>
        <c:if test="${login eq null}">
	        <input type="hidden" id="loginAccountId" name="loginAccountId" value="-1" />        
        </c:if>        
    </form>
</div>


<div class="container" style="font-family: 'Nanum Gothic', sans-serif;">
	<!-- 댓글 리스트 출력하는 곳 -->	
	<div id="commentList">
		<div class="text-center">
			<div class="spinner-border" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
</div>
	
<script src="/resources/js/reply.js" type="text/javascript"></script>  

</body>
</html>


<!-- 댓글 리스트 템플릿 -->
<div style='display:none;'>
		<div class="list_template">
			<table class="table table-borderless listTable" style="margin-bottom: 0px; margin-top: 30px;">
				<tr>
					<td rowspan="3" width="7%" style="padding-bottom: 0; padding-right: 3px; text-align: right;">
						<img src="/image/nothing.jpg" class="rounded-circle listIamge" width="40px" height="40px">
					</td>
					<td style="padding-bottom: 0">
						<span class="listNickname" style="font-size: 0.9em; font-weight: 900;">
						</span>
						<span class="listDate" style="font-size: 0.8em; color: #999;">
						</span>
					</td>
					
					<td rowspan="3" width="4%" style="padding-bottom: 0; padding-top: 7px;">
						<div class="dropdown listER">
          					<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor:pointer">
								<i class="fas fa-ellipsis-v" style="font-size: 1.3em; color: #999;"></i>
          					</a>
          					
          					<div class="dropdown-menu" style="min-width: 10px; min-height: 10px;">
          						<a class="dropdown-item listEdit" style="cursor: pointer;">
									<i class="fas fa-pen" style="color: #999; font-size: 0.8em;">&nbsp;&nbsp;수정</i>
								</a>
								<a class="dropdown-item listRemove" style="cursor: pointer;">
									<i class="fas fa-trash" style="color: #999; font-size: 0.8em;">&nbsp;&nbsp;삭제</i>
								</a>
							</div>
						</div>
					</td>
					
				</tr>
				
				<tr>
					<td style="padding-bottom: 0; padding-top: 7px;">
						<span class="listObject" style="font-family: 'Noto Sans KR'; text-overflow:ellipsis; overflow:hidden">
						</span>
					</td>
				</tr>
				<tr>
					<td style="padding-bottom: 0; color: #888;">
						<a class="listRereply" style="cursor: pointer;">
							답글
						</a>
					</td>
				</tr>
			</table>
		</div>
<div>
	<!-- 리스트 템플릿 끝 -->	