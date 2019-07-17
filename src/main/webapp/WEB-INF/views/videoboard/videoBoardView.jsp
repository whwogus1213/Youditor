<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>${row.subject}-YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<style>
.dropdown-button {
	background-color: #FFDAB9;
	padding: 8px;
	font-size: 15px;
	border: none;
}
.dropdown {
	position: relative;
	display: inline-block;
}
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #ffffff;
	min-width: 75px;
	padding: 5px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.dropdown-content a {
	color: black;
	padding: 8px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {background-color: #f8f9fa;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropdown-button {background-color: #ffffff;}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #FF0000;
}

.star_rating a.mouseon {
	color: #FF0000;
}
</style>
<script type="text/javascript">
	$('.dropdown').on('mouseenter mouseleave click tap', function() {
	  $(this).toggleClass("open");
	});

	/* 평가 점수(1~5) 전역변수  */
	var star=-1;
	var star_db;
	
	$(function(){
		if(${sessionScope.login != null}) {
			fn_followbtn();
			getStarload();
		}
	});

	$(function(){
		$( ".star_rating a" ).click(function() {
		     $(this).parent().children("a").removeClass("on");
		     $(this).addClass("on").prevAll("a").addClass("on");
		     var index = $(".starqq").index(this);
		     index++;
		     
		     star = index;

		     if(star_db != star) {
				$("#ratingbtn").removeAttr("style");
			 }

		     return false;
		});

		$(".starqq").hover(function(){
			$(this).prevAll().addClass("mouseon");
			$(this).addClaoss("mouseon");
		}, function(){
			$(this).prevAll().removeClass("mouseon");
			$(this).removeClass("mouseon");	
		});
	});

	/* star 점수 DB에서 읽어오기 */
	function getStarload(){
		var json = {
			"boardId":${row.boardId},
			"accountId":${login.accountId}
		};
		$.ajax({
			type : "POST",
			url : "/videostar/starload",
			data : json,
			success : function(data) {
				console.log("starload star점수 : " + data);
				star_db = data;
				$("#star").html(data);
				$(".star_rating a:lt("+data+")").addClass("on");
				var html = "";
				if(data == 0) {
					html += "<button id ='ratingbtn' class='btn btn-info btn-sm' style='visibility:hidden' onclick='fn_rating("+${row.boardId}+"); return false;'>평가하기</button>";
				} else {
					html += "<button id ='ratingbtn' class='btn btn-warning btn-sm' style='visibility:hidden' onclick='fn_ratingupdate("+${row.boardId}+"); return false'>평가바꾸기</button>";
				}
				$("#ratingBtnDiv").html(html);
			},
			error : function(data) {
				alert("starload 에러");
			}
		});
	}
	
	// 평점 처음 등록
	function fn_rating(boardId) {
		var json = {
				"star" : star,
			"boardId" : boardId
		};
		$.ajax({
			type : "POST",
			url : "/videostar/insertVideoStarPro",
			data : json,
			success : function(data) {
				if (data == "success2") {
					getStarload();
				}
			},
			error : function(data) {
				alert("fn_rating 에러");
			}
		});
	}
	
	// 평점 업데이트
	function fn_ratingupdate(boardId) {
		var json = {
				"star" : star,
			"boardId" : boardId
		}
		$.ajax({
			type : "POST",
			url : "/videostar/updateVideoStarPro",
			data : json,
			success : function(data) {
				if (data == "updatesuccess") {
					console.log("성공");
					getStarload();
				}
			},
			error : function(data) {
				alert("fn_ratingupdate 에러");
			}
		});
	}

	// 팔로우 추가
	function fn_following(accountId) {
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

	// 팔로우 삭제
	function fn_unfollow(accountId) {
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
</script>
</head>
<body>
<jsp:include page="../module/top2.jsp" flush="false" />

<!-- Trigger the modal with a button -->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
  	<jsp:include page="../module/messageSendModule.jsp" flush="false" />
  </div>
 </div>

	<!-- 게시글 상세정보 -->
	<div align="center" style="background-color: black; padding-top: 60px">
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
			/*
			$(function(){
				$('#deletebtn').click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						self.location.href = "${path}/videoboard/deleteVideoBoardPro?boardId=${row.boardId}";
					}
				});
			});
			*/
			$(function(){
				
				$('#notraiting').click(function(){
						alert('로그인 후 이용해 주세요.');
						
				});
			});
			
		</script>
	</div>
	<!-- <h1>${row.boardId }</h1> -->
	<div class="container" style="font-family: 'Nanum Gothic', sans-serif;">
		<br>
		<h2>${row.subject }</h2>
		<span style="line-height: 30%"><br></span>
		<h5>${row.object }</h5>
		<br>
		<h6 style="color:gray"> 조회수&nbsp;&nbsp; ${row.viewCount }</h6>
		
		
        <input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />
        <div class="input-group">
			<c:if test="${login.email ne null}">
	        	<c:if test="${login.accountId ne row.accountId}">
						<p class="star_rating">
						    <a class = "starqq" href="#">★</a>
						    <a class = "starqq" href="#">★</a>
						    <a class = "starqq" href="#">★</a>
						    <a class = "starqq" href="#">★</a>
						    <a class = "starqq" href="#">★</a>
						</p>
						<div id='ratingBtnDiv'>
						</div>
				</c:if>
			</c:if>
		<c:if test="${login.email eq null}">
				로그인 후 평가 가능
			</c:if>
        </div>
		<h5 align="right">등록일 &nbsp;&nbsp; <fmt:formatDate value="${row.reg_date}" pattern="yyyy년 MM월 dd일  HH:mm:ss" /></h5>
		<c:if test="${login.email ne null}">
			<c:if test="${login.accountId ne row.accountId}">

				<div align="right">
					<label>내가 평가한 점수</label> <span id="star"></span><span> 점</span>
				</div>
			</c:if>
		</c:if>
		<div align="right">총 점수 ${row.starCount}</div>
		<hr>
		<div class="dropdown">
			<h5 style="width: 150px;">
				<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor:pointer">
					<img src="<spring:url value='/image/${row.picture}'/>" class=" mx-auto rounded-circle" width="40px" height="40px" />
					<strong>&nbsp;&nbsp;${row.nickname}</strong>
				</a>
			</h5>
			<div class="dropdown-content">
				<a class="dropdown-item" href="/videoboard/videoBoardList?searchType=nickname&keyword=${row.nickname}">
					<i class="fab fa-youtube"></i>
					&nbsp;&nbsp;영상 더보기
				</a>
				<a class="dropdown-item" href="#">
					<i class="far fa-envelope"></i>
					&nbsp;&nbsp;<button type="button" class="btn-link" data-toggle="modal" data-target="#myModal">쪽지 보내기</button>
				</a>
			</div>
		</div>
		
		<br> <br>
		<h6>${row.footer }</h6>
		<%-- 	<h1>${row.youtubeLink }</h1> --%>
		<!-- 디자인 필요 -->
		<div align="right">
			<!-- 팔로우 버튼 -->
			<div id="followDiv"></div>

			<c:if test="${login.accountId eq row.accountId}">
				<button class="btn btn-warning btn-sm"
					onclick="location.href='/videoboard/updateVideoBoard.do?boardId=${row.boardId}'">수정</button>
				<button class="btn btn-danger btn-sm" id="deletebtn">삭제</button>
			</c:if>
		</div>
		<hr>
	</div>
	<div id="listReply">
		<jsp:include page="../videoboard/videoBoardReply.jsp" flush="false" />
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>