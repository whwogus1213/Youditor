/**
 * 댓글 스크립트
 */

var boardId = $("#boardId").val();
var boardClass=$("#boardClass").val();
var loginAccountId = $("#loginAccountId").val();
console.log(loginAccountId);
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
			"boardId" : boardId,
			"object" : object,
			"replyCommentId" : commentId,
			"boardClass" : boardClass
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
	console.log(boardId);
    getCommentList();
    console.log("댓글 리스트 로딩완료");
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
 
function getCommentList(){

	var json = {
			"boardId" : boardId,
			"boardClass" : boardClass
			}
	
	$.ajax({
        type:"POST",
        url : "/reply/listAll",
//         dataType : "application/json; charset=utf-8",
        data : json,
//         contentType: "application/json; charset=UTF-8", 
		async : false,
        success : function(data){
           var html = "";
           var updel = "";
           var cCnt = data.length;
//           <%
//           	AccountsVO vo = null;
//           vo = (AccountsVO)session.getAttribute("login");
//           	int saId = -1;
//           	if(vo != null){
//	           	saId = vo.getAccountId();
//           	}
//           %>
           
           var sessionAccountId = -1;
           
           if(loginAccountId != -1) {
        	   sessionAccountId = loginAccountId;
           }
           
//            var sessionAccountId = ${sessionScope.login};
           if(data.length > 0){

               
               for(i=0; i<data.length; i++){
                   html += "<div class='row' style='margin-top: 40px;' id = "+data[i].commentId+">";
                   html += "<div class='col-1' align='center'>";
            	   html += "<img src=\"";
            	   html += "/image/"+ data[i].picture;
            	   html += "\" class=\" mx-auto rounded-circle\" width=\"40px\" height=\"40px\"/>";
                   html += "<strong><h6>"+data[i].nickname+"</h6></strong></div>";
                   html += "<div class='col-11'><h4>"+data[i].object+"</h4></div>";
                   if(sessionAccountId > 0){
                       
                       /* 답글의 답글달기 */
                       html += "<div class='offset-1 col-2' align='left'>";
                       html += "<button class='btn btn-xs btn-link' onclick = 'rereplyForm("+data[i].commentId+", "+data[i].accountId+", "+data[i].replyCommentId+"); return false;' style='color:#777777; font-size:smaller'>답글</button>";
                       html += "</div>";
                       if(sessionAccountId == data[i].accountId){
                    	   html += "<div class='col-9' align='right'>";
    	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyUpdateForm("+data[i].commentId+", "+ data[i].accountId+", \""+data[i].object+"\")' style='color:#777777; font-size:smaller'>수정</button>|";
    	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyDelete("+data[i].commentId+")' style='color:#777777; font-size:smaller'>삭제</button>";
    	                   html += "</div>";
    	               } else {
    	            	   html += "<div class='col-9' align='right'></div>";
        	               }
    	               
                       html += "<div class='col-12' id=rereplyDiv"+data[i].commentId+">";
                       html += "</div>";
                       
                   } else {
                	   html += "<br>";
                   }
                       
                   html += "</div>";
                   
                   


                   /* 대댓글이 있는지 체크후 처리 */
                   var isReJson = {
                           "boardId" : data[i].boardId,
                           "commentId" : data[i].commentId,
                           "boardClass" : boardClass
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
           	               html += "<div class='row'>";
     	                   html += "<div class='offset-1 col-11' align='left'>";
     	                   html += "<button id='reCommentListBtn"+data[i].commentId+"' class='btn btn-xs btn-link' onclick = 'reGetCommentList("+data[i].commentId+"); return false;' style='color:#777777; font-size:smaller' value='1'>답글 보기 ▼</button>";
     	                   html += "</div>";
     	                   html += "</div>";
     	                   html += "<div id='reCommentList"+data[i].commentId+"'>";
     	                   html += "</div>";

               	            }
           	        },
           	        error:function(request,status,error){
           	       }
           	        
           	    });
                   

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
			"replyCommentId" : commentId,
			"boardClass" : boardClass
			};
	if($("#reCommentListBtn"+commentId).val() == 1) {
	$.ajax({
        type:"POST",
        url : "/reply/reList",
        data : json,
		async : false,
        success : function(data){
            $("#reCommentListBtn"+commentId).html('답글 숨기기 ▲');
            $("#reCommentListBtn"+commentId).val(0);
            console.log("버튼 벨류값 : " + $("#reCommentListBtn"+commentId).val());
            var html="";
            var cCnt = data.length;

            var sessionAccountId = loginAccountId;
        	if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div id = "+data[i].commentId+" style='margin-top: 10px;'>";
                    html += "<div class='row'>";
                    html += "<div class='offset-1 col-1'>";
                    html += "<h5><strong>"+data[i].nickname+"</strong></h5>";
                    html += "</div>";
                    html += "<div class='col-10'><h5>" + data[i].object + "</h5></div>";

                    
                    if(sessionAccountId == data[i].accountId){
                 	   html += "<div class='col-12' align='right'>";
 	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyUpdateForm("+data[i].commentId+", "+ data[i].accountId+", \""+data[i].object+"\"); return false;' style='color:#777777; font-size:smaller'>수정</button>|";
 	                   html += "<button class='btn btn-xs btn-link' onclick = 'replyDelete("+data[i].commentId+"); return false;' style='color:#777777; font-size:smaller'>삭제</button>";
 	                   html +="</div>";
 	               } else {
 	            	  html += "<div class='col-12'>";

 	 	               }
                html += "</div>";
  		      	html += "</div>";
                }
        	}
        	/* 대댓글 추가 */
        	$("#reCommentList"+commentId).html(html);
        }
    });
	} else {
		 $("#reCommentListBtn"+commentId).html('답글 보기 ▼');
         $("#reCommentListBtn"+commentId).val(1);
         $("#reCommentList"+commentId).html('');

		}              
}
	
/* 대댓글 추가 폼 */
function rereplyForm(commentId, accountId, replyCommentId) {
var html = "";
html += "<textarea class='offset-1 col-11' style='resize: none;' rows='2' cols='30' id='reObject"+commentId+"' name='reObject"+commentId+"' placeholder='댓글을 입력하세요'></textarea>";
html += "<a href='#' onClick='fn_recommentCancel("+commentId+"); return false;' class='col-1 offset-10 btn btn-default' style='text-align:center;'>취소</a>";
html += "<a href='#' onClick='fn_recomment("+commentId+", "+accountId+", "+replyCommentId+"); return false;' class='col-1 btn pull-right btn-primary' style='text-align:center;'>등록</a>";
$("#commentList #rereplyDiv"+commentId).html(html);

}



function replyUpdateForm(commentId, accountId, object){
	var html = "";
	
	html += "<textarea class='offset-1 col-11' style='resize:none;' rows='2' cols='30' id='upObject"+commentId+"' name='upObject"+commentId+"'>"+object+"</textarea>";
	html += "<button onClick='replyUpdateCancel("+commentId+"); return false;' class='offset-10 col-1 btn btn-dafault' style='text-align:center;'>취소</button>";
	html += "<button onClick='replyUpdate("+commentId+"); return false;' class='col-1 btn pull-right btn-warning' style='text-align:center;'>수정</button>";
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
			"object" : object,
			"boardClass" : boardClass
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
			"object" : object,
			"boardClass" : boardClass
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