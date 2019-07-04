<%@page import="com.good.dto.VideoStarVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>${row.subject} - YouDitor</title>
	<style>
		.star_rating {font-size:0; letter-spacing:-4px;}
		.star_rating a {
		    font-size:22px;
		    letter-spacing:0;
		    display:inline-block;
		    margin-left:5px;
		    color:#ccc;
		    text-decoration:none;
		}
		.star_rating a:first-child {margin-left:0;}
		.star_rating a.on {color:#777;}
	</style>

<jsp:include page="../module/header.jsp" flush="false"/>

<script type="text/javascript">
	// 팔로우 추가
	function fn_following(accountId) {
		//alert(accountId);
		var json = {
			"followAccountId" : accountId
		}
		$.ajax({
			type : "POST",
			url : "/follow/insert",
			//data:$("#followingForm").serialize(),
			data : json,
			//dataType : : "json",
			success : function(data) {
				if (data == "success") {
					//alert("성콩");
					console.log("성공");
					$('#followbtn').attr('class', 'btn btn-warning btn-sm');
					$('#followbtn').html('팔로잉√');
				}
			},
			error : function(data) {
				alert("에러");
			}
		});
	}
</script>


</head>
<body>
	<jsp:include page="../module/top.jsp" flush="false"/>
	
	<!-- 게시글 상세정보 -->

		<div align="center" style="background-color:black; padding-top:60px">
		<script>
		$(function(){
			$( ".star_rating a" ).click(function() {
			     $(this).parent().children("a").removeClass("on");
			     $(this).addClass("on").prevAll("a").addClass("on");
			     return false;
			});
		});
			var e = '${row.youtubeLink}';
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
			document.write('<iframe width="667" height="375" src="https://www.youtube.com/embed/' + youtubeID + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
		
			//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 videoboardcontroller 의 deleteVideoBoardPro 메서드 호출
			$(function(){
				$('#deletebtn').click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						self.location.href = "${path}/videoboard/deleteVideoBoardPro?boardId=${row.boardId}";
					}
				});
			});
			var result = '${result}';
					
			$(function(){
				$('#raiting').click(function(){
					alert('insert');
					self.location.href = "${path}/videostar/insertVideoStarPro?boardId=${row.boardId}";
						
				});
			});
			
			
			$(function(){
				
				$('#notraiting').click(function(){
						alert('로그인 후 이용해 주세요.');
						
				});
			});
			
			$(function(){
				
				$('#raitingupdate').click(function(){
						alert('update 하는 곳');
						if(result == '1'){
							self.location.href = "${path}/videostar/updateVideoStarPro1?boardId=${row.boardId}";
						}if(result == '2'){
							self.location.href = "${path}/videostar/updateVideoStarPro2?boardId=${row.boardId}";
						}if(result == '3'){
							self.location.href = "${path}/videostar/updateVideoStarPro3?boardId=${row.boardId}";
						}if(result == '4'){
							self.location.href = "${path}/videostar/updateVideoStarPro4?boardId=${row.boardId}";
						}if(result == '5'){
							self.location.href = "${path}/videostar/updateVideoStarPro5?boardId=${row.boardId}";
						}
				});
			});
			
			$(function(){
				$('#1').click(function(){
						alert('result 에 1번 값을 넣어보자');
					return result = 1;
				});
			});
			
			$(function(){
				$('#2').click(function(){
						alert('result 에 2번 값을 넣어보자');
					return result = 2;
				});
			});
			
			$(function(){
				$('#3').click(function(){
						alert('result 에 3번 값을 넣어보자');
					return result = 3;
				});
			});
			
			$(function(){
				$('#4').click(function(){
						alert('result 에 4번 값을 넣어보자');
					return result = 4;
				});
			});
			
			$(function(){
				$('#5').click(function(){
						alert('result 에 5번 값을 넣어보자');
					return result = 5;
				});
			});
			
			
		</script>
	</div>
	<!-- <h1>${row.boardId }</h1> -->
	<div class="container">
		<br>
		<h2> ${row.subject }</h2>
		<span style="line-height:30%"><br></span>
		<h5>${row.object }</h5>
		<br>
		<h6 style="color:gray"> 조회수&nbsp;&nbsp; ${row.viewCount }</h6>
		
			<p class="star_rating"> 평점
			    <a href="#" id="1">★</a>
			    <a href="#" id="2">★</a>
			    <a href="#" id="3">★</a>
			    <a href="#" id="4">★</a>
			    <a href="#" id="5">★</a>
			</p>
        <input type="hidden" id="boardId" name="boardId" value="${row.boardId }" /> 
			<c:if test="${login.email ne null}">
				<c:if test="${login.accountId  eq row.accountId}">
					<button id ="raitingupdate">업데이트 평가</button>
				</c:if>
				<c:if test="${login.accountId  ne row.accountId}">
					<button id ="raiting">처음 평가</button>
				</c:if>
			</c:if>
			<c:if test="${login.email eq null}">
				<button id ="notraiting">로그인 해라</button>
			</c:if>
		<h5 align="right">등록일 &nbsp;&nbsp; <fmt:formatDate value="${row.reg_date}" pattern="yyyy년 MM월 dd일  hh:mm:ss" /></h5>
		<div align="right">평가 점수 : ${row.starCount}</div>
		<hr>
		<h6><strong>${row.nickname }</strong><br><br>${row.footer }</h6>
		<%-- 	<h1>${row.youtubeLink }</h1> --%>
		<!-- 디자인 필요 -->
		<div align="right">
			<!-- 팔로우 버튼 -->
			<div id="followDiv">
				<c:if test="${login.accountId ne row.accountId}">
					<c:if test="${followCheck ne 1}">
						<button class="btn btn-primary btn-sm" id="followbtn" onclick="fn_following('${row.accountId}')">팔로우</button>
					</c:if>
					<c:if test="${followCheck ne 0}">
						<button class="btn btn-warning btn-sm" id="followbtn" onclick="fn_following('${row.accountId}')">팔로잉√</button>
					</c:if>
				</c:if>
			</div>
			<!-- 수정/삭제 버튼 -->
			<c:if test="${login.accountId eq row.accountId}">
				<button class="btn btn-warning btn-sm" onclick="location.href='/videoboard/updateVideoBoard.do?boardId=${row.boardId}'">수정</button>
				<button class="btn btn-danger btn-sm" id="deletebtn">삭제</button>
			</c:if>
		</div>
		<hr>
	</div>
	<div id="listReply">
		<jsp:include page="../videoboard/videoBoardReply.jsp" flush="false"/>
		
	</div>

	<jsp:include page="../module/bottom.jsp" flush="false"/>
 
</body>
</html>