<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<title>${row.subject}- 팁 - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false" />
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
			url : "/tipstar/starload",
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
			url : "/tipstar/insertVideoStarPro",
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
			url : "/tipstar/updateVideoStarPro",
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
	</script>
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	
	<!-- 배너 -->
	<div class="form-group">
		<div class="col-sm-12" style="background-image:url('/resources/images/tipboard/tipboard.jpg'); background-position:50% 20%; background-size:100%; font-family: 'Noto Serif KR', sans-serif; color:Peru; padding-top:130px; padding-bottom:5%"  >
			<h1 align="center" style="font-size:50px; letter-spacing:10px"><strong>편집 Tip</strong></h1>
			<h4 align="center"><br>나만의 편집 팁을 공유하세요.</h4>
		</div>
	</div>

	<!-- 게시글 상세정보 -->
	<div class="container">
	<script>
		
		//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 noticeboardcontroller 의 deleteVideoBoardPro 메서드 호출
		$(function(){
			$('#deletebtn').click(function(){
				if(confirm("정말 삭제하시겠습니까?")){
					self.location.href = "${path}/tipboard/deleteTipBoardPro?boardId=${row.boardId}";
				}
			});
		});
	</script>
		<div class="col-12" style="margin-left:3%; margin-right:3%; margin-top:3%; margin-bottom:1%">
			<h3><strong style="color:Brown ">[${row.categoryName}]</strong>&nbsp;&nbsp;${row.subject }</h3>
		</div>
		<div class="row">
			<div class="col-6 row" align="left" style="margin-top:2%">
				<div style="margin-left:12%">
					<strong style="color:Brown ">작성자</strong>
				</div>
				<div class="dropright" style="margin-left:12%">
					<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer">
						<img src="<spring:url value='/image/${row.picture}'/>" class=" mx-auto rounded-circle" width="30px" height="30px" />
						&nbsp;${row.nickname}
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#" onclick="messagePopup();">
							<i class="far fa-envelope"></i>&nbsp;&nbsp;쪽지 보내기
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
			</div>

			<div class="col-4" align="right" style="margin-top:2%">
				<strong style="color:Brown ">조회수</strong>&nbsp;&nbsp;&nbsp;${row.viewCount }&nbsp;&nbsp;
			</div>
			<div class="col-2" align="right" style="margin-top:2%">
				<strong style="color:Brown ">게시일</strong>&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${row.reg_date}" pattern="yyyy. MM. dd." />
			</div>
				
		</div>
		<hr>
		<div class="col-11" style="margin-left:4%; margin-top:4%; margin-bottom:4%">
			<pre style="white-space:pre-wrap">${row.object}</pre>
		</div>
		<hr>
		<div align="center" style="color:Brown ">
			<i class="far fa-list-alt" onclick="location.href='/tipboard/tipBoardList'" style="cursor: pointer;">&nbsp;목록으로</i>
			<c:choose>
				<c:when test="${login.accountId eq row.accountId}">
					&nbsp;|&nbsp;&nbsp;<i class="far fa-edit" onclick="location.href='/tipboard/update.do?boardId=${row.boardId}'" style="cursor: pointer;">&nbsp;수정</i>&nbsp;|&nbsp;
					<i class="far fa-trash-alt" id="deletebtn" style="cursor: pointer;">&nbsp;삭제</i>
				</c:when>
				<c:when test="${login.authority >= auth }">
					&nbsp;|&nbsp;&nbsp;<i class="far fa-edit" onclick="location.href='/tipboard/update.do?boardId=${row.boardId}'" style="cursor: pointer;">&nbsp;수정</i>&nbsp;|&nbsp;
					<i class="far fa-trash-alt" id="deletebtn" style="cursor: pointer;">&nbsp;삭제</i>
				</c:when>
			</c:choose>
		</div>
		<br>
	</div>
	<div class="container-fluid">
		<div id="listReply">
			<jsp:include page="../tipboard/tipBoardReply.jsp" flush="false"/>
		</div>
	</div>
	<br>
	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
