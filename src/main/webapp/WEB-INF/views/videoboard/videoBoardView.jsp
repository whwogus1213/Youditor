<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>${row.subject}-YouDitor</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/resources/vendor/bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
<style>
i {
	cursor: pointer;
	padding-top: 5px;
}

.fa-heart {
	border: 0;
	outline: 0;
	background-color: #ffffff;
}

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
			$(this).addClass("mouseon");
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
					html += "<button id ='ratingbtn' class='btn btn-sm' style='visibility:hidden' onclick='fn_rating("+${row.boardId}+"); return false;'>확인</button>";
				} else {
					html += "<button id ='ratingbtn' class='btn btn-sm' style='visibility:hidden' onclick='fn_ratingupdate("+${row.boardId}+"); return false'>확인</button>";
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
					/* 웹소켓으로 팔로우 알람 */
	 				var sendText = {};
	 				sendText.from = "followAlarm";
	 				sendText.text = String(accountId);
	 				sock.send(JSON.stringify(sendText));
	 				console.log(tempcheck);
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
						var html = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='fas fa-heart' id='followbtn' onclick='fn_unfollow("+${row.accountId}+")' style='color: red;'>Follow</i>";
					} else {
						var html = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='far fa-heart' id='followbtn' onclick='fn_following("+${row.accountId}+")' style='color: black;'>Follow</i>";
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
	<!-- 게시글 상세정보 -->
	<div align="center" style="background-color: black; padding-top: 5.5%">
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
			document.write('<iframe width="854" height="480" src="https://www.youtube.com/embed/' + youtubeID + '?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
		
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
	<div class="container" style="font-family: 'Nanum Gothic', sans-serif; width: 65%;">
		<br>
		<input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />
		
		<div class="row">
			<h2 class="col-9">${row.subject }</h2>
			<div class="col-3" align="right">
				게시일 : <fmt:formatDate value="${row.reg_date}" pattern="yyyy. MM. dd." />
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">${row.object }</div>
		</div>
		
		<div class="row" style="height: 36px;">
			<div class="input-group col-4">
				<font style="padding-top: 6px; padding-right: 15px;">평점 ${row.starCount}</font>
				<c:if test="${login.email ne null}">
					<c:if test="${login.accountId ne row.accountId}">
						<p class="star_rating">
							<a class="starqq" href="#">★</a> <a class="starqq" href="#">★</a>
							<a class="starqq" href="#">★</a> <a class="starqq" href="#">★</a>
							<a class="starqq" href="#">★</a>
						</p>
						<div id='ratingBtnDiv'></div>
					</c:if>
				</c:if>
				<c:if test="${login.email eq null}">
					<font style="padding-top: 6px; padding-right: 15px;">로그인 후 평가 가능</font>
				</c:if>
				
			</div>
			<div class="col-4 offset-4" align="right">
				<i class="far fa-list-alt" onclick="location.href='/videoboard/videoBoardList?categoryId='+${row.categoryId}" style="cursor: pointer;">목록으로</i>&nbsp;&nbsp;
				<c:choose>
					<c:when test="${login.accountId eq row.accountId}">
						<i class="far fa-edit" onclick="location.href='/videoboard/update.do?boardId=${row.boardId}'" style="cursor: pointer;">
							수정
						</i>&nbsp;
						<i class="far fa-trash-alt" id="deletebtn" style="cursor: pointer;">삭제&nbsp;&nbsp;</i>
					</c:when>
					<c:when test="${login.authority >= auth }">
						<i class="far fa-edit" onclick="location.href='/videoboard/update.do?boardId=${row.boardId}'" style="cursor: pointer;">
							수정
						</i>&nbsp;
						<i class="far fa-trash-alt" id="deletebtn" style="cursor: pointer;">삭제&nbsp;&nbsp;</i>
					</c:when>
				</c:choose>
				<font style="color: gray; font-size: 14px;">조회수&nbsp;${row.viewCount }회</font>
			</div>
		</div>
		
		<hr style="margin-top: 0px;">

		<!-- 작성자 정보 -->
		<div class="row">
			<div class="dropright" style="padding-left: 18px">
				<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer">
					<img src="<spring:url value='/image/${row.picture}'/>" class=" mx-auto rounded-circle" width="30px" height="30px" />
						<strong>&nbsp;${row.nickname}</strong>
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item"
						href="/videoboard/videoBoardList?searchType=nickname&keyword=${row.nickname}">
						<i class="fab fa-youtube"></i>&nbsp;&nbsp;영상 더보기
					</a> <a class="dropdown-item" href="#" onclick="messagePopup();"> <i
						class="far fa-envelope"></i>&nbsp;&nbsp;쪽지 보내기
					</a>
					<script type="text/javascript">
					function messagePopup() {
						var nickname = "${row.nickname }";
						var win = window.open("/message/writePopup.do?nickname=" + nickname, "_blank", 
								"width=650, height=470, left=200, top=200, location=no, menubar=no, resizble=no, scrollbars=no, status=no, titlebar=no, toolbar=no");
					}
					</script>
				</div>
			</div>
			<!-- 팔로우 버튼 -->
			<div id="followDiv" style="padding-top: 1px;"></div>
		</div>
		<br>
		<h6>${row.footer}</h6>
	</div>
	
	<!-- 댓글 -->
	<div class="container-fluid">
		<div id="listReply">
			<jsp:include page="../videoboard/videoBoardReply.jsp" flush="false" />
		</div>
	</div>
	
	<br>
	<br>
	<jsp:include page="../module/bottom.jsp" flush="false" />
</body>
</html>