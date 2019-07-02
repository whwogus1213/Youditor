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
	<jsp:include page="../module/header.jsp" flush="false"/>
</head>
<body>


<div class="container">
    <form id="commentForm" name="commentForm" method="post">
	
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
               
            </div>
            <div>
            	<c:if test="${login.email != null }">
                <div class="table input-group">           
                    <textarea style="width: 1000px" rows="3" cols="30" id="object" name="object" placeholder="댓글을 입력하세요"></textarea>
                    <br>
                    <div>
                         <a href='#' onClick="fn_comment('${row.boardId }')" class="btn pull-right btn-success" style="height:100%; width:110px; text-align:center; line-height:65px;">등록</a>
                    </div>
				</div>
				</c:if>
            </div>
        </div>
        
        <input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />        
    </form>
</div>


<div class="container">
<div class="row">
	<div class="col-md-12">
        	<div id="commentList">
        	</div>
    </div>

    
    
    
</div>
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
	console.log(${row.boardId});
    getCommentList();
    console.log("로딩완료");
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    console.log($("#boardId").val());
    $.ajax({
        type:"POST",
        url : "/reply/listAll",
//         dataType : "application/json; charset=utf-8",
        data:$("#boardId"),
//         contentType: "application/json; charset=UTF-8", 
        success : function(data){
           var html = "";
           var updel = "";
           var cCnt = data.length;
           <%
           	AccountsVO vo = null;
           vo = (AccountsVO)session.getAttribute("login");
           	int saId = -1;
           	if(vo != null){
	           	saId = vo.getAccountId();
           	}
           %>
           var sessionAccountId = <%=saId%>;
//            var sessionAccountId = ${sessionScope.login};
           if(data.length > 0){
               
               for(i=0; i<data.length; i++){
                   
                   html += "<div id = "+data[i].commentId+">";
                   html += "<div><table class='table'><h6><strong>"+data[i].nickname+"</strong></h6>";
                   html += data[i].object;
                   html += "<div class='row'>";
                   if(sessionAccountId > 0){
                       html += "<div class='col-sm-2' align='left'>";
                       html += "<button class='btn btn-xs btn-link' onclick = 'replyUpdateForm("+data[i].commentId+")' style='color:#777777; font-size:smaller'>답글</button>|";
                       html +="</div>";
                   } else {
                	   html += "<br>";
                   }
                       
                   if(sessionAccountId == data[i].accountId){
                	   html += "<div class='col-sm-10' align='right'>";
	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyUpdateForm("+data[i].commentId+", "+ data[i].accountId+", \""+data[i].object+"\")' style='color:#777777; font-size:smaller'>수정</button>|";
	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyDelete("+data[i].commentId+")' style='color:#777777; font-size:smaller'>삭제</button>";
	                   html +="</div>";
	               }
                   html +="</div>";
                   html += "<tr><td></td></tr>";
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


function replyUpdateForm(commentId, accountId, object){
	var html = "";
	
	$("#commentList #"+commentId).css("border","1px dashed black");
	html += "<div class='input-group'><div>";
	html += "<textarea style='width: 1000px' rows='3' cols='30' id='upObject"+commentId+"' name='upObject"+commentId+"'>"+object+"</textarea>";
	html += "</div><div>";
	html += "<button onClick='replyUpdate("+commentId+")' class='btn pull-right btn-success' style='height:93%; width:108px; text-align:center; line-height:65px;'>수정</button>";
	html += "</div></div>";
	$("#commentList #"+commentId).html(html);	
}

function replyUpdate(commentId){
	var object = $("#upObject"+commentId).val();
	var json = {
			"commentId" : commentId,
			"object" : object
			};
	$.ajax({
		type:'POST',
		url : "/reply/update",
		data: json,
		success : function(data){
			alert("수정되었습니다.");
			getCommentList();
		}
	        
	});
}


function replyDelete(commentId, object){
	console.log(commentId);
	console.log(object);
	
	var json = {
			"commentId" : commentId,
			"object" : object
			};
	$.ajax({
		type:'POST',
		url : "/reply/delete",
		data:json,
		success : function(){
			alert("삭제되었습니다.");
			getCommentList();
		}
	        
	});
}


 
</script>
 
</body>
</html>