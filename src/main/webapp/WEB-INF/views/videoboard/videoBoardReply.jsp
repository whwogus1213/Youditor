<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../module/header.jsp" flush="false"/>
</head>
<body>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
        <div>
            <div>
                <span><strong>Comments</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;<span id="cCnt"></span>
            </div>
            <div>
                <div class="table input-group">           
                    <textarea style="width: 1000px" rows="3" cols="30" id="object" name="object" placeholder="댓글을 입력하세요"></textarea>
                    <br>
                    <div>
                         <a href='#' onClick="fn_comment('${row.boardId }')" class="btn pull-right btn-success" style="height:100%; width:110px; text-align:center; line-height:65px;">등록</a>
                    </div>
				</div>
            </div>
        </div>
        <input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(boardId){
    
    $.ajax({
        type:'POST',
        url : "/reply/insert",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data == "success")
            {
                $("#object").val("");
                getCommentList();
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:"POST",
        url : "/reply/listAll",
//         dataType : "application/json; charset=utf-8",
        data:$("#commentForm").serialize(),
//         contentType: "application/json; charset=UTF-8", 
        success : function(data){
           var html = "";
           var cCnt = data.length;
           
           if(data.length > 0){
               
               for(i=0; i<data.length; i++){
                   html += "<div>";
                   html += "<div><table class='table'><h6><strong>"+data[i].nickname+"</strong></h6>";
                   html += data[i].object + "<tr><td></td></tr>";
                   html += "</table></div>";
                   html += "</div>";
               }
               
           } else {
               
               html += "<div>";
               html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
               html += "</table></div>";
               html += "</div>";
               
           }
           
           $("#cCnt").html(cCnt);
           $("#commentList").html(html);
       }


    
    });
}
 
</script>
 
</body>
</html>