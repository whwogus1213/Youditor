<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(function(){
		if(${sessionScope.login != null}) {
			
		fn_followbtn();
		
		var json = {
			"boardId":${row.accountId},
			"accountId":${login.accountId}
		};
		$.ajax({
			type : "POST",
			url : "/videostar/starload",
			data : json,
			success : function(data) {
				$("#star").html(data);
			},
			error : function(data) {
			}
		});
		}
	});
	
	var star=-1;
	$(function(){
		$( ".star_rating a" ).click(function() {
		     $(this).parent().children("a").removeClass("on");
		     $(this).addClass("on").prevAll("a").addClass("on");
		     var index = $(".starqq").index(this);
		     index++;
		     star = index;
		     console.log(index+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			$('#raitingupdatebtn').removeAttr("style");
		     return false;
		});
	});

	// 팔로우 추가
	function fn_following(accountId) {
		//alert("추가");
				
		var json = {
			"followAccountId" : accountId
		}
		$.ajax({
			type : "POST",
			url : "/follow/insert",
			data : json,
			success : function(data) {
				if (data == "success") {
					fn_followbtn();
				}
			},
			error : function(data) {
				alert("에러");
			}
		});
	}
	

	// 평점 처음 등록
	function fn_raiting(boardId) {
		var json = {
				"star":star,
			"boardId" : boardId
		}
		console.log(star+"asdfasdfasdfasdf");
		$.ajax({
			type : "POST",
			url : "/videostar/insertVideoStarPro",
			//data:$("#followingForm").serialize(),
			data : json,
			//dataType : : "json",
			success : function(data) {
				if (data == "success2") {
					console.log("성공");
					$('#raitingbtn').attr('class', 'btn btn-warning btn-sm');
					$('#raitingbtn').html('평가√');
					$("#raitingbtn").attr('onclick', '').unbind('click');
					getStarload();
				}
			},
			error : function(data) {
				alert("에러");
			}
		});
	}
	// 평점 업데이트
	function fn_raitingupdate(boardId) {
		var json = {
				"star":star,
			"boardId" : boardId
		}
		console.log(star+"asdfasdfasdfasdf");
		$.ajax({
			type : "POST",
			url : "/videostar/updateVideoStarPro",
			data : json,
			//dataType : : "json",
			success : function(data) {
				if (data == "updatesuccess") {
					console.log("성공");
					$('#raitingupdatebtn').attr('class', 'btn btn-warning btn-sm');
					$('#raitingupdatebtn').html('평가√');
					$("#raitingupdatebtn").attr('onclick', '').unbind('click');
					getStarload();
					
				}
			},
			error : function(data) {
				alert("에러");
			}
		});
	}

	// 팔로우 삭제
	function fn_unfollow(accountId) {
		//alert("삭제");
		var json = {
			"followAccountId" : accountId
		}
		$.ajax({
			type : "POST",
			url : "/follow/delete",
			data : json,
			success : function(data) {
				if (data == "success1") {
					fn_followbtn();
				}
			},
			error : function(data) {
				alert("에러");
			}
		});
	}

	// 팔로우 버튼 변경
	function fn_followbtn() {
		if(${login.accountId != row.accountId}) {
			var loginId = ${login.accountId};
			var boardAccountId = ${row.accountId};
			var json = {
					"followAccountId" : boardAccountId,
					"followerAccountId" : loginId
				}
			$.ajax({
				type : "POST",
				url : "/follow/check",
				data : json,
				success : function(data) {
					if (data == 1) {
						var html = "<button class='btn btn-warning btn-sm' id='followbtn' onclick='fn_unfollow("+${row.accountId}+")'>팔로잉√</button>";			
					} else {
						var html = "<button class='btn btn-primary btn-sm' id='followbtn' onclick='fn_following("+${row.accountId}+")'>팔로우</button>";
					}
					$('#followDiv').html(html);
				},
				error : function(data) {
					alert("에러");
				}
			});

		}
	}
	function getStarload(accountId, boardId){
		var json = {
			"boardId":${row.accountId},
			"accountId":${login.accountId}
		};
		$.ajax({
			type : "POST",
			url : "/videostar/starload",
			data : json,
			success : function(data) {
				$("#star").html(data);
			},
			error : function(data) {
				alert("에러123123213");
			}
		});
		}
</script>


</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	<!-- 게시글 상세정보 -->

		<div align="center" style="background-color:black; padding-top:60px">
		<script>
		
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
				$('#deletebtn').click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						self.location.href = "${path}/videoboard/deleteVideoBoardPro?boardId=${row.boardId}";
					}
				});
			});
			$(function(){
				
				$('#notraiting').click(function(){
						alert('로그인 후 이용해 주세요.');
						
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
		
			
        <input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />
        	<c:if test="${login.accountId ne row.accountId}">
				<c:if test="${login.email ne null}">
					<c:if test="${starCheck ne 0}">
						<c:if test="${starSelect eq 1 }">
							<p class="star_rating">
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							</p>
						</c:if>
						<c:if test="${starSelect eq 2 }">
							<p class="star_rating">
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							</p>
						</c:if>
						<c:if test="${starSelect eq 3 }">
							<p class="star_rating">
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							</p>
						</c:if>
						<c:if test="${starSelect eq 4 }">
							<p class="star_rating">
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq" href="#">★</a>
							</p>
						</c:if>
						<c:if test="${starSelect eq 5 }">
							<p class="star_rating">
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							    <a class = "starqq on" href="#">★</a>
							</p>
						</c:if>
							<button id ="raitingupdatebtn" onclick="fn_raitingupdate('${row.boardId}')" style="visibility:hidden">업데이트 평가</button>
					</c:if>
					<c:if test="${starCheck eq 0}">
						<p class="star_rating">
						    <a class = "starqq" href="#">★</a>
						    <a class = "starqq" href="#">★</a>
						    <a class = "starqq" href="#">★</a>
						    <a class = "starqq" href="#">★</a>
						    <a class = "starqq" href="#">★</a>
						</p>
						<button id ="raitingbtn"  onclick="fn_raiting('${row.boardId}')">처음 평가</button>
					</c:if>
				</c:if>
			</c:if>
			<c:if test="${login.email eq null}">
				<button id ="notraiting">로그인 해라</button>
			</c:if>
		<h5 align="right">등록일 &nbsp;&nbsp; <fmt:formatDate value="${row.reg_date}" pattern="yyyy년 MM월 dd일  hh:mm:ss" /></h5>
		<div align="right"><label>내가 평가한 점수</label>
		<span id="star"></span><span> 점</span></div>
		<div align="right">총 점수 ${row.starCount}</div>
		<hr>
		<h6><strong>${row.nickname }</strong><br><br>${row.footer }</h6>
		<%-- 	<h1>${row.youtubeLink }</h1> --%>
		<!-- 디자인 필요 -->
		<div align="right">
			<!-- 팔로우 버튼 -->
			<div id="followDiv">
			
			</div>

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