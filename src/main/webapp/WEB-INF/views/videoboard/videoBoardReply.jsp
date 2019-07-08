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

<%-- 	<jsp:include page="../module/header.jsp" flush="false"/> --%>

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>


<div class="container">
    <form id="commentForm" name="commentForm" method="post">
	
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span>&nbsp;&nbsp;&nbsp;<span id="cCnt"></span>
            </div>
            <hr style="2px dashed">
            <div>
            	<c:if test="${login.email != null }">

				<div class="row">
					<div class="col-sm-1">
						<h4>${login.nickname}</h4>
					</div>
                    <textarea class="col-sm-11" style='resize:none;' rows="3" cols="20" id="object" name="object" placeholder="댓글을 입력하세요"></textarea>
					<a href='#' onClick="fn_comment('${row.boardId }'); return false;" class="col-sm-offset-10 col-sm-1 btn pull-right btn-primary btn-lg" style="text-align:center;">등록</a>
				</div>
				</c:if>
            </div>
        </div>
        
        <input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />        
    </form>
</div>


<div class="container">
	<div id="commentList">
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

/* 대댓글 취소 */
function fn_recommentCancel(commentId) {
	$("#commentList #rereplyDiv"+commentId).html('');
	
}


/* 대댓글 등록하기 */
function fn_recomment(commentId, acccountId, replyCommentId, object) {
	var object = $("#reObject"+commentId).val();
	var json = {
// 			"accountId" : accountId,
			"boardId" : ${row.boardId},
			"object" : object,
			"replyCommentId" : commentId
			};
	
   		$.ajax({
      		type : 'POST',
	        url : "/reply/reInsert",
	        data : json,
	        success : function(data){
	            if(data == "success")
	            {
	            	$("#commentList #rereplyDiv"+commentId).html('');
	                getCommentList();
	            }
	        },
	        error:function(request,status,error){
		        alert("댓글등록 실패");
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

	$.ajax({
        type:"POST",
        url : "/reply/listAll",
//         dataType : "application/json; charset=utf-8",
        data:$("#boardId"),
//         contentType: "application/json; charset=UTF-8", 
		async : false,
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
                   
                   html += "<div class='row' id = "+data[i].commentId+">";
                   html += "<div class='col-sm-1'><h4><strong>"+data[i].nickname+"</strong></h4></div>";
                   html += "<div class='col-sm-11'><h4>"+data[i].object+"</h4></div>";
                   
                   if(sessionAccountId > 0){
                       
                       /* 답글의 답글달기 */
                       html += "<div class='col-sm-offset-1 col-sm-2' align='left'>";
                       html += "<button class='btn btn-xs btn-link' onclick = 'rereplyForm("+data[i].commentId+", "+data[i].accountId+", "+data[i].replyCommentId+"); return false;' style='color:#777777; font-size:smaller'>답글</button>";
                       html +="</div>";
                       if(sessionAccountId == data[i].accountId){
                    	   html += "<div class='col-sm-9' align='right'>";
    	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyUpdateForm("+data[i].commentId+", "+ data[i].accountId+", \""+data[i].object+"\")' style='color:#777777; font-size:smaller'>수정</button>|";
    	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyDelete("+data[i].commentId+")' style='color:#777777; font-size:smaller'>삭제</button>";
    	                   html +="</div>";
    	               } else {
    	            	   html += "<div class='col-sm-9' align='right'></div>";
        	               }
                       html += "<div id=rereplyDiv"+data[i].commentId+">";
                       html += "</div>";
                       
                   } else {
                	   html += "<br>";
                   }
                       
                   
                   


                   /* 대댓글이 있는지 체크후 처리 */
                   
                   var isReJson = {
                           "boardId" : data[i].boardId,
                           "commentId" : data[i].commentId
                           };
                   $.ajax({
                 		type : 'POST',
           	       		url : "/reply/isReReply",
           	        	data : isReJson,
           	        	async : false,
           	        	success : function(check){
               	        	console.log("대댓글 체크 : "+check);
           	            if(check == 1) {
           	            	/* 대댓글 있는 경우 펼치기 */
     	                   html += "<div class='col-sm-offset-1 col-sm-11' align='left'>";
     	                   html += "<button class='btn btn-xs btn-link' onclick = 'reGetCommentList("+data[i].commentId+"); return false;' style='color:#777777; font-size:smaller'>답글 보기 ▼</button>";
     	                   html += "</div>";
     	                   html += "<div id='reCommentList"+data[i].commentId+"'>";
     	                   html +="</div>";

               	            }
           	        },
           	        error:function(request,status,error){
           	       }
           	        
           	    });
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
           
           html += "<br>";
           $("#cCnt").html(cCnt);
           $("#commentList").html(html);
       }


    
    });
}

function reGetCommentList(commentId){
	var json = {
			"replyCommentId" : commentId
			};
	$.ajax({
        type:"POST",
        url : "/reply/reList",
        data : json,
		async : false,
        success : function(data){
            var html="";
            var cCnt = data.length;

            var sessionAccountId = <%=saId%>;
        	if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div id = "+data[i].commentId+">";
                    html += "<div class='col-sm-offset-1 col-sm-1'>";
                    html += "<h5><strong>"+data[i].nickname+"</strong></h5>";
                    html += "</div>";
                    html += "<div class='col-sm-10'><h5>" + data[i].object + "</h5></div>";
                    html += "<br>";
                        
                    if(sessionAccountId == data[i].accountId){
                 	   html += "<div class='col-sm-12' align='right'>";
 	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyUpdateForm("+data[i].commentId+", "+ data[i].accountId+", \""+data[i].object+"\"); return false;' style='color:#777777; font-size:smaller'>수정</button>|";
 	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyDelete("+data[i].commentId+"); return false;' style='color:#777777; font-size:smaller'>삭제</button>";
 	                   html +="</div>";
 	               }
                }
        	}
        	/* 대댓글 추가 */
        	$("#reCommentList"+commentId).html(html);
        }
    });
                    
}
	
/* 대댓글 추가 폼 */
function rereplyForm(commentId, accountId, replyCommentId) {
var html = "";
html += "<textarea class='col-sm-offset-1 col-sm-11' rows='2' cols='30' id='reObject"+commentId+"' name='reObject"+commentId+"' placeholder='댓글을 입력하세요'></textarea>";

html += "<a href='#' onClick='fn_recommentCancel("+commentId+"); return false;' class='col-sm-1 col-sm-offset-10 btn btn-default' style='text-align:center;'>취소</a>";
html += "<a href='#' onClick='fn_recomment("+commentId+", "+accountId+", "+replyCommentId+"); return false;' class='col-sm-1 btn pull-right btn-primary' style='text-align:center;'>등록</a>";


$("#commentList #rereplyDiv"+commentId).html(html);

}



function replyUpdateForm(commentId, accountId, object){
	var html = "";
	
	html += "<textarea class='col-sm-offset-1 col-sm-11' style='resize:none;' rows='2' cols='30' id='upObject"+commentId+"' name='upObject"+commentId+"'>"+object+"</textarea>";
	html += "<button onClick='replyUpdateCancel("+commentId+"); return false;' class='col-sm-offset-10 col-sm-1 btn btn-dafault' style='text-align:center;'>취소</button>";
	html += "<button onClick='replyUpdate("+commentId+"); return false;' class='col-sm-1 btn pull-right btn-warning' style='text-align:center;'>수정</button>";
	$("#commentList #"+commentId).html(html);	
}

/* 수정 취소버튼 클릭시 */
function replyUpdateCancel(commentId) {
	getCommentList();
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