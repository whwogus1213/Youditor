<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>  <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

  <title>${row.subject } - 팁 - YouDitor</title>
<jsp:include page="../module/header.jsp" flush="false"/>

  <!-- Custom styles -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
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
		.star_rating a.on {color:#FF0000;}
		.star_rating a.mouseon {color:#FF0000;}
	</style>
	<script type="text/javascript">

	/* 평가 점수(1~5) 전역변수  */
	var star=-1;
	var star_db;
	
	$(function(){
		if(${sessionScope.login != null}) {
			
			fn_followbtn();
			getStarload();
		
		var json = {
			"boardId":${row.accountId},
			"accountId":${login.accountId}
		};
		$.ajax({
			type : "POST",
			url : "/tipstar/starload",
			data : json,
			success : function(data) {
				$("#star").html(data);
			},
			error : function(data) {
				//alert("에러123123213");
			}
		});
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
		<div align="center">
			<br><br>
			<h1>편집 팁</h1>
			<br><br>
		</div>
		<hr>
		<br>
		<h1>${row.subject }</h1>
		<br>
		<input type="hidden" id="boardId" name="boardId" value="${row.boardId }" />
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
		<div align="right">
			<div class="form-inline">
				<div class="col-sm-10" align="right">
					<h4>작성자 ${row.accountId }</h4>
				</div>
				<div class="col-sm-2" align="right">
					<h4>카테고리 ${row.categoryId}</h4>
				</div>
			</div>
			<div class="form-inline">
				<div class="col-sm-10" align="right">
					<h4>작성 일시 <fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd" /></h4>
				</div>
				<div class="col-sm-2" align="right">
					<h4>조회수 ${row.viewCount }</h4>
				</div>
			</div>
		</div>
		<hr>
		<br>
		<h2>${row.object }</h2>
		<br>
		<hr>
		<div align="center">
			<button type="button" class="btn btn-primary" onclick="location.href='/tipboard/tipBoardList' ">목록으로</button>
			<c:if test="${login.accountId eq row.accountId}">
			<button type="button" class="btn btn-success" onclick="location.href='/tipboard/updateTipBoard.do?boardId=${row.boardId}' ">수정</button>
			<button class="btn btn-danger" id="deletebtn">삭제</button>
			</c:if>
		</div>
		<br>
	</div>
	
	<div id="listReply">
		<jsp:include page="../tipboard/tipBoardReply.jsp" flush="false"/>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>

</body>
</html>
