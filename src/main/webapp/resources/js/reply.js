/**
 * 댓글 스크립트
 */

var boardId = $("#boardId").val();
var boardClass=$("#boardClass").val();
var loginAccountId = $("#loginAccountId").val();
var loginPicture = $("#loginPicture").val();
//console.log(loginAccountId);


function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('.');
}

/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){

	$(".textInput").bind('focus', function(event) {
    	var html = "";
    	html += "<button onClick='fn_commentCancel(); return false;' class='btn btn-outline-light' style='text-align:center;'><span style='color: black;'>취소</span></button>";
    	html += "<button id='fn_commentBtn' onClick='fn_comment(\"${row.boardId}\"); return false;' class='btn btn-outline-primary' style='text-align:center;' disabled='disabled'>등록</button>";
    	$('.textInputBtn').html(html);
    });
	
	$('.textInput').keyup(function(e){
		var textInputVal = $('.textInput').val();
		if(textInputVal.trim() === '') {
			$('#fn_commentBtn').attr('disabled','disabled');
			$('#fn_commentBtn').attr('class','btn btn-outline-primary');
			return;
		} else {
			$('#fn_commentBtn').removeAttr('disabled');
			$('#fn_commentBtn').attr('class','btn btn-primary');
		}
	});
	
//	console.log(boardId);
    getCommentList();
    console.log("댓글 리스트 로딩완료");
});

function fn_commentCancel(){
	$('.textInput').val('');
	$('.textInputBtn').html('');
}


/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(boardId){
	$('#inputGroup').attr('style','display:none');
	$('.loadingSpin').html("<div class='spinner-border text-primary' role='status'><span class='sr-only'>Loading...</span></div>");
    $.ajax({
        type:'POST',
        url : "/reply/insert",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data == "success")
            {
                $("#object").val("");
                $('.textInputBtn').html('');
                $('.loadingSpin').html('');
                $('#inputGroup').removeAttr('style');
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
           var list_template;
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
            	   list_template = $($('.list_template').clone());
            	   
            	   list_template.find('.listTable').attr('id',data[i].commentId);
            	   list_template.find('.listImage').attr('src',data[i].picture);
            	   list_template.find('.listNickname').html(data[i].nickname);

            	   list_template.find('.listDate').html(formatDate(data[i].reg_date));
            	   list_template.find('.listObject').html(data[i].object);
            	   
                   if(sessionAccountId > 0){
                       
                       /* 답글의 답글달기 */
                	   list_template.find('.listRereply').attr("onclick","rereplyForm("+data[i].commentId+", "+data[i].accountId+", "+data[i].replyCommentId+"); return false;");

                	   if(sessionAccountId == data[i].accountId){
                    	   list_template.find('.listEdit').attr("onclick","replyUpdateForm("+data[i].commentId+", "+ data[i].accountId+", \""+data[i].object+"\"); return false;");
                    	   list_template.find('.listRemove').attr("onclick","replyDelete("+data[i].commentId+"); return false;");
                    	   
    	               } else {
    	            	   list_template.find('.listER').html('');
        	               }
    	               
    	               html += list_template.html();
    	               html += "<div class='col-11 offset-1' id=rereplyDiv"+data[i].commentId+">";
                       html += "</div>";
                       
                   } else {
                	   
                	   list_template.find('.listRereply').parent().parent().html('');
	            	   list_template.find('.listER').html('');

                	   
                	   html += list_template.html();
                   }
                       

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
           	            if(check >= 1) {
           	            	/* 대댓글 있는 경우 펼치기 */
           	               html += "<div class='row' style='margin-bottom: -30px;'>";
     	                   html += "<div class='offset-1 col-11' align='left'>";
     	                   html += "<button id='reCommentListBtn"+data[i].commentId+"' class='btn btn-xs' onclick = 'reGetCommentList("+data[i].commentId+"); return false;' style='color:#222; font-size:smaller; padding-left: 0px; border-left: 0px; margin-left: -3px;' value='"+check+"'>답글 "+check+"개 보기 <i class='fas fa-angle-down'></i></button>";
     	                   html += "</div>";
     	                   html += "</div>";
     	                   html += "<div id='reCommentList"+data[i].commentId+"' class='offset-1 col-11'>";
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
	var tempVal = $("#reCommentListBtn"+commentId).val();
	if($("#reCommentListBtn"+commentId).val() > 0) {
	$.ajax({
        type:"POST",
        url : "/reply/reList",
        data : json,
		async : false,
        success : function(data){
            $("#reCommentListBtn"+commentId).html("답글 숨기기 <i class='fas fa-angle-up'></i>");
            tempVal= -tempVal;
            $("#reCommentListBtn"+commentId).val(tempVal);
            console.log("버튼 벨류값 : " + $("#reCommentListBtn"+commentId).val());
            var html="";
            var cCnt = data.length;

            var sessionAccountId = loginAccountId;
        	if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                	
                	
                	list_template = $($('.list_template').clone());
             	   
                	list_template.find('.listTable').attr('id',data[i].commentId);
                	list_template.find('.listTable').attr('style',"margin-bottom: -20px; margin-top: 30px; margin-left: -25px;");
                	list_template.find('.listImage').attr('src',data[i].picture);
                	list_template.find('.listNickname').html(data[i].nickname);
                	list_template.find('.listDate').html(formatDate(data[i].reg_date));
                	list_template.find('.listObject').html(data[i].object);

                    if(sessionAccountId == data[i].accountId){
                    	
                    	list_template.find('.listEdit').attr("onclick","replyUpdateForm("+data[i].commentId+", "+ data[i].accountId+", \""+data[i].object+"\"); return false;");
                    	list_template.find('.listRemove').attr("onclick","replyDelete("+data[i].commentId+"); return false;");
                 	   
 	               } else {
 	            	  list_template.find('.listER').html('');
 	 	           }
                    
                    list_template.find('.listRereply').parent().parent().html('');
                   html += list_template.html();
                }
        	}
        	/* 대댓글 추가 */
        	$("#reCommentList"+commentId).html(html);
        }
    });
	} else {
 		 tempVal= -tempVal;
		 $("#reCommentListBtn"+commentId).html("답글 "+tempVal+"개 보기 <i class='fas fa-angle-down'></i>");
         $("#reCommentListBtn"+commentId).val(tempVal);
         $("#reCommentList"+commentId).html('');

		}              
}
	
/* 대댓글 추가 폼 */
function rereplyForm(commentId, accountId, replyCommentId) {
	
	var html = "";
	

//	html += "<textarea class='offset-1 col-11' style='resize: none;' rows='2' cols='30' id='reObject"+commentId+"' name='reObject"+commentId+"' placeholder='댓글을 입력하세요'></textarea>";
//	html += "<a href='#' onClick='fn_recommentCancel("+commentId+"); return false;' class='col-1 offset-10 btn btn-default' style='text-align:center;'>취소</a>";
//	html += "<a href='#' onClick='fn_recomment("+commentId+", "+accountId+", "+replyCommentId+"); return false;' class='col-1 btn pull-right btn-primary' style='text-align:center;'>등록</a>";

	html += "<div id='inputGroup' class='table input-group' style='margin-left: -30px;'>";
	html += "<div class='col-1' style='text-align: center; padding-top: 7px;'>";
	html += "<img src='/image/"+loginPicture+"'class='mx-auto rounded-circle' width='40px' height='40px'/>";
	html += "</div>";	
	html += "<div class='col-11' style='margin: 0; padding: 0;'>";
	html += "<textarea class='col-12 textInput' style='resize:none;' rows='1' cols='20' id='reObject"+commentId+"' name='object' maxlength='100' placeholder='댓글을 입력하세요'></textarea>";
	html += "<span class='focus-border'></span>";
    html += "</div>";    
    html += "<div class='offset-10 col-2' style='padding-right: 0; padding-top: 5px; text-align: right;'>";
    html += "<button onClick='fn_recommentCancel("+commentId+"); return false;' class='btn btn-outline-light' style='text-align:center;'><span style='color: black;'>취소</span></button>";
    html += "<button onClick='fn_recomment("+commentId+", "+accountId+", "+replyCommentId+"); return false;' class='btn btn-outline-primary' style='text-align:center;'>등록</button>";
 	html += "</div>";
 	html += "</div>";

 	$("#commentList #rereplyDiv"+commentId).html(html);

}



function replyUpdateForm(commentId, accountId, object){
	console.log("replyUpdateForm 펑션 진입");
	var html = "";
	
//	html += "<textarea class='offset-1 col-11' style='resize:none;' rows='2' cols='30' id='upObject"+commentId+"' name='upObject"+commentId+"'>"+object+"</textarea>";
//	html += "<button onClick='replyUpdateCancel("+commentId+"); return false;' class='offset-10 col-1 btn btn-dafault' style='text-align:center;'>취소</button>";
//	html += "<button onClick='replyUpdate("+commentId+"); return false;' class='col-1 btn pull-right btn-warning' style='text-align:center;'>수정</button>";
	
	html += "<div id='inputGroup' class='table input-group'>";
	html += "<div class='col-1' style='text-align: center; padding-top: 7px;'>";
	html += "<img src='/image/"+loginPicture+"'class='mx-auto rounded-circle' width='40px' height='40px'/>";
	html += "</div>";	
	html += "<div class='col-11' style='margin: 0; padding: 0;'>";
	html += "<textarea class='col-12 textInput' style='resize:none;' rows='1' cols='20' id='upObject"+commentId+"' name='object' maxlength='100'>"+object+"</textarea>";
	html += "<span class='focus-border'></span>";
    html += "</div>";    
    html += "<div class='offset-10 col-2' style='padding-right: 0; padding-top: 5px; text-align: right;'>";
    html += "<button onClick='replyUpdateCancel("+commentId+"); return false;' class='btn btn-outline-light' style='text-align:center;'><span style='color: black;'>취소</span></button>";
    html += "<button onClick='replyUpdate("+commentId+"); return false;' class='btn btn-outline-warning' style='text-align:center;'>수정</button>";
 	html += "</div>";
 	html += "</div>";
	
	
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