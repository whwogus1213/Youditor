<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/module/header.jsp" %>

<%@ page session="true" %>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>YouditoR</title>
  <!-- Custom styles -->
  <link href="/resources/css/modern-business.css" rel="stylesheet">
  <style>
  footer{
  clear: both;
  }
  .jy {
 	 width: 48%;
 	 float: left;
 	 margin-right: 2%;
 	 text-overflow: ellipsis;
  }
  .jy2 {
 	 width: 48%;
 	 float: left;
 	 margin-right: 2%;
 	 margin-top: 40px;
  }
  .table th, .table td {
    border-top: 0 solid #dee2e6; 
}
 @media (min-width:476px){.container{max-width: 240px;}}
 @media (min-width:576px){.container{max-width: 300px;}}
 @media (min-width:768px){.container{max-width: 440px;}}
 @media (min-width:992px){.container{max-width: 640px;}}
 @media (min-width:1080px){.container{max-width: 800;}}
 @media (min-width:1200px){.container{max-width: 925px;}}
 @media (min-width:1400px){.container{max-width: 1100px;}}
/*  .container { */
/*     float: left; */
/* } */
#title-st, #title-st:hover{
	font-size: 25px;
    font-weight: bold;
    color: #000;
    text-decoration: none;
}
.best {
    font-size: 17px;
    font-weight: bold;
    color: #ef5350;
}
.card-header{
	font-size: 17px;
    font-weight: bold;
}
.span-st{
    font-size: 12px;
}
#sub-st, #sub-st:hover{
	font-size: 17px;
    font-weight: bold;
    color: #000;
    text-decoration: none;
}
#top-st{
	font-size: 25px;
    font-weight: bold;
    color: #000;
}
a {
    color: #000;
}
a:hover {
	color: #000;
}
.rcbtn{
	height: 40px;
	padding-bottom: auto;
}
  </style>
  <script>
  $(function() {
	  var result = '${result}';
		  if(result == 'loginOK'){
				alert('로그인 되었습니다.');
			}
		  if(result == 'loginNO'){
				alert('아이디나 비밀번호를 다시 확인하여 주세요.');
			}
		  if(result == 'authorityNO'){
				alert('해당 권한이 부족합니다.');
			}
		  if(result == 'updateOK'){
				alert('회원정보가 수정되었습니다.');
			}
  $.ajax({
			type : "POST",
			url : "/videostar/StarList",
			success : function(data) {

				var html = "";
				
				if(data.length > 0) {
					for(var i = 0; i < data.length; i++){
						if(i < 3){
							html += "<div class='col-lg-4 mb-4'>";
							html += "<div class='card h-100'>";
							html += "<h4 class='card-header'>"
							html += "<a href='/videoboard/videoBoardView?boardId="+data[i].boardId+"'>"+data[i].subject+"</a></h4>";
							html += "<div class='card-body'>";
							html += "<a href='/videoboard/videoBoardView?boardId="+data[i].boardId+"'>";
							if(data[i].youtubeLink.length > 31){
								html += "<img width='100%' height='20%' src='https://img.youtube.com/vi/" + data[i].youtubeLink.substring(32) + "/mqdefault.jpg'></img></a>";
							}else{
								html += "<img width='100%' height='20%' src='https://img.youtube.com/vi/" + data[i].youtubeLink.substring(17) + "/mqdefault.jpg'></img></a>";
							}
							html += "</div>";
							html += "<div class='card-footer'>";
							html += "<i class='far fa-clock'></i>";
							html += "<span class='span-st'>"+data[i].reg_date+"</span>";
							html += "<span style='float: right;'>"
							html += "<i class='far fa-eye' aria-hidden='true'></i>";
							html += "<span class='span-st'>"+data[i].viewCount+"</span>";
							html += "</span>"
							html += "<table>"
							html += "<tr>"
							///////////////////////////
							html += "</table>"
							html += "</tr>"
							html += "</div>";
							html += "</div>";
							html += "</div>";
						}
					}
				}

				$("#top3-1").html(html);
				getAccountsRankList();
				getNoticeNew();
				getTipNew();
				getRecruit1();
				getRecruit2();
			},
			error : function(data) {
				alert('불러오기 실패');
			}
			
		});
  
});
function getAccountsRankList(){
	$.ajax({
		type : "POST",
		url : "/accounts/accountsList",
		success : function(data) {

			var html = "";

			if(data.length > 0) {
				for(var i = 0; i < 3; i++){
					if(i < 3){
						html += "<div class='col-lg-4 col-sm-6 portfolio-item'>";
						html += "<div class='card h-100'>";
						html += "<img class='card-img-top' src='/image/"+data[i].picture+"' alt='' width='80' height='200'/>";
						html += "<div class='card-body'>";
						html += "<h4 class='card-title'>";
						html += "<div class='dropright'>";
						html += "<a data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='cursor: pointer'>"+data[i].nickname+"</a>";
						html += "<div class='dropdown-menu'>";
						html += "<a class='dropdown-item' href='/videoboard/videoBoardList?searchType=nickname&keyword="+data[i].nickname+"'>";
						html += "<i class='fab fa-youtube'></i>&nbsp;&nbsp;영상 더보기";
						html += "</a>";
						html += "<a class='dropdown-item' href='#'>";
						html += "<i class='far fa-envelope'></i>&nbsp;&nbsp;쪽지 보내기";
						html += "</a>";
						html += "<a class='dropdown-item' href='#'>";
						html += "<i class='far fa-heart'></i>&nbsp;&nbsp;팔로우하기";
						html += "</a>";
						html += "</h4>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
						
									
						
					}else{
						html += "<div class='col-lg-4 col-sm-6 portfolio-item'>";
						html += "<div class='card h-100'>";
						html += "<a href='#'><img class='card-img-top' src='/resources/images/member1.jpg' alt='' width='80' height='200'></a>";
						html += "<div class='card-body'>";
						html += "<h4 class='card-title'>";
						html += "<a href='#'>편집자 아이디</a>";
						html += "</h4>";
						html += "<p class='card-text'>편집자 설명</p>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
					}
				}
			}

			$("#top3-2").html(html);

		},
		error : function(data) {
			alert('불러오기 실패');
		}
	});
}

function getNoticeNew(){
	$.ajax({
		type : "POST",
		url : "/noticeboard/newNotice",
		success : function(data) {

			var html = "";
			
			

			if(data.length > 0) {
				for(var i = 0; i < data.length; i++){
					if(i < 5){
						html += "<tr>";
						html += "<td>"+(i+1)+"</td>";
						html += "<td>"+data[i].categoryName+"</td>";
						if(data[i].subject.length < 10){
							html += "<td align='left' style='padding-left: 30px; cursor: pointer;'><a href='/noticeboard/noticeBoardView?boardId="+data[i].boardId+"'>"+data[i].subject+"</a></td>";
							}else{
								html += "<td align='left' style='padding-left: 30px; cursor: pointer;'><a href='/noticeboard/noticeBoardView?boardId="+data[i].boardId+"'>"+data[i].subject.substr(0, 9)+'..'+"</a></td>";
								
							}
						
						html += "<td>"+data[i].nickname+"</td>";
						html += "<td>"+data[i].mod_date+"</td>";
						html += "<td>"+data[i].viewCount+"</td>";
						html += "</tr>";
					}else{
						html += "<div class='col-lg-4 col-sm-6 portfolio-item'>";
						html += "<div class='card h-100'>";
						html += "<a href='#'><img class='card-img-top' src='/resources/images/nothing.jpg' alt='' width='80' height='200'></a>";
						html += "<div class='card-body'>";
						html += "<h4 class='card-title'>";
						html += "<a href='#'>편집자 아이디</a>";
						html += "</h4>";
						html += "<p class='card-text'>편집자 설명</p>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
					}
				}
			}

			$("#newNotice").html(html);

		},
		error : function(data) {
			alert('불러오기 실패');
		}
	});
}
function getTipNew(){
	$.ajax({
		type : "POST",
		url : "/tipboard/newTip",
		success : function(data) {

			var html = "";

			if(data.length > 0) {
				for(var i = 0; i < data.length; i++){
					if(i < 5){
						html += "<tr>";
						html += "<td>"+(i+1)+"</td>";
						html += "<td>"+data[i].categoryName+"</td>";
						if(data[i].subject.length < 10){
							html += "<td align='left' style='padding-left: 30px; cursor: pointer;'><a href='/tipboard/tipBoardView?boardId="+data[i].boardId+"'>"+data[i].subject+"</a></td>";
							}else{
								html += "<td align='left' style='padding-left: 30px; cursor: pointer;'><a href='/tipboard/tipBoardView?boardId="+data[i].boardId+"'>"+data[i].subject.substr(0, 9)+'..'+"</a></td>";
							}
						
						html += "<td>"+data[i].nickname+"</td>";
						html += "<td>"+data[i].mod_date+"<fmt:formatDate value="+data[i].mod_date+"pattern='yyyy-MM-dd' /></td>";
						html += "<td>"+data[i].viewCount+"</td>";
						html += "</tr>";
					}else{
						html += "<div class='col-lg-4 col-sm-6 portfolio-item'>";
						html += "<div class='card h-100'>";
						html += "<a href='#'><img class='card-img-top' src='/resources/images/member1.jpg' alt='' width='80' height='200'></a>";
						html += "<div class='card-body'>";
						html += "<h4 class='card-title'>";
						html += "<a href='#'>편집자 아이디</a>";
						html += "</h4>";
						html += "<p class='card-text'>편집자 설명</p>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
					}
				}
			}

			$("#newTip").html(html);

		},
		error : function(data) {
			alert('불러오기 실패');
		}
	});
}
function getRecruit1(){
	$.ajax({
		type : "POST",
		url : "/recruitboard/newRecruit1",
		success : function(data) {

			var html = "";
			
			

			if(data.length > 0) {
				for(var i = 0; i < data.length; i++){
					if(i < 5){
						html += "<tr class='rcbtn'>";
						html += "<td>"+(i+1)+"</td>";
						html += "<td class='rcbtn'><button type='button' class='btn btn-info btn-sm' disabled>구인</button></td>";
						if(data[i].subject.length < 10){
							html += "<td align='left' style='padding-left: 30px; cursor: pointer;'><a href='/recruitboard/recruitBoardView?boardId="+data[i].boardId+"'>"+data[i].subject+"</a></td>";
							}else{
								html += "<td align='left' style='padding-left: 30px; cursor: pointer;'><a href='/recruitboard/recruitBoardView?boardId="+data[i].boardId+"'>"+data[i].subject.substr(0, 9)+'..'+"</a></td>";
							}
						
						html += "<td>"+data[i].nickname+"</td>";
						html += "<td>"+data[i].reg_date+"</td>";
						html += "<td>"+data[i].viewCount+"</td>";
						html += "</tr>";
					}else{
						html += "<div class='col-lg-4 col-sm-6 portfolio-item'>";
						html += "<div class='card h-100'>";
						html += "<a href='#'><img class='card-img-top' src='/resources/images/member1.jpg' alt='' width='80' height='200'></a>";
						html += "<div class='card-body'>";
						html += "<h4 class='card-title'>";
						html += "<a href='#'>편집자 아이디</a>";
						html += "</h4>";
						html += "<p class='card-text'>편집자 설명</p>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
					}
				}
			}

			$("#newRecruit1").html(html);

		},
		error : function(data) {
			alert('불러오기 실패');
		}
	});
}
function getRecruit2(){
	$.ajax({
		type : "POST",
		url : "/recruitboard/newRecruit2",
		success : function(data) {

			var html = "";
			
			

			if(data.length > 0) {
				for(var i = 0; i < data.length; i++){
					if(i < 5){
						html += "<tr  class='rcbtn'>";
						html += "<td>"+(i+1)+"</td>";
						html += "<td><button type='button' class='btn btn-secondary btn-sm' disabled>구직</button></td>";
						if(data[i].subject.length < 10){
							html += "<td align='left' style='padding-left: 30px; cursor: pointer;'><a href='/recruitboard/recruitBoardView?boardId="+data[i].boardId+"'>"+data[i].subject+"</a></td>";
							}else{
								html += "<td align='left' style='padding-left: 30px; cursor: pointer;'><a href='/recruitboard/recruitBoardView?boardId="+data[i].boardId+"'>"+data[i].subject.substr(0, 9)+'..'+"</a></td>";
							}
						
						html += "<td>"+data[i].nickname+"</td>";
						html += "<td>"+data[i].reg_date+"</td>";
						html += "<td>"+data[i].viewCount+"</td>";
						html += "</tr>";
					}else{
						html += "<div class='col-lg-4 col-sm-6 portfolio-item'>";
						html += "<div class='card h-100'>";
						html += "<a href='#'><img class='card-img-top' src='/resources/images/member1.jpg' alt='' width='80' height='200'></a>";
						html += "<div class='card-body'>";
						html += "<h4 class='card-title'>";
						html += "<a href='#'>편집자 아이디</a>";
						html += "</h4>";
						html += "<p class='card-text'>편집자 설명</p>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
					}
				}
			}

			$("#newRecruit2").html(html);

		},
		error : function(data) {
			alert('불러오기 실패');
		}
	});
}
  </script>
</head>

<body style="background-color: #fff;">

  <jsp:include page="./module/top2.jsp" flush="false"/>
 	<!-- 페이지 내용 시작 -->
 	<header>
	    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	      <ol class="carousel-indicators">
	        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	      </ol>
	      <div class="carousel-inner" role="listbox">
	
	        <div class="carousel-item active" style="background-image: url('../resources/images/main_img1.jpg'); background-position:50% 36%;">
	          <div class="carousel-caption d-none d-md-block">
	            <h3 style="color:black">YouditoR은 무슨 뜻인가요?</h3>
	            <p style="color:black">YouditoR 는 Youtube와 Editor의 합성어입니다.</p>
	          </div>
	        </div>
	
	        <div class="carousel-item" style="background-image: url('../resources/images/main_img2.jpg');  background-position:50% 60%;">
	          <div class="carousel-caption d-none d-md-block">
	            <h3 style="color:black">YouditoR은 어떤 곳인가요?</h3>
	            <p style="color:black">YouditoR은 Youtube 편집자들을 위한 커뮤니티입니다.</p>
	          </div>
	        </div>
	
	        <div class="carousel-item" style="background-image: url('../resources/images/main_img3.jpg');  background-position:50% 60%;">
	          <div class="carousel-caption d-none d-md-block">
	            <h3 style="color:white">YouditoR에서는 무엇을 할 수 있나요?</h3>
	            <p style="color:white">다양한 YouditoR들과 당신의 결과물에 대해 토론하고 Creator와 협업할 수 있습니다.</p>
	          </div>
	        </div>
	      </div>
	      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	        <span class="carousel-control-prev-icon" aria-hidden="false"></span>
	        <span class="sr-only">Previous</span>
	      </a>
	      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	        <span class="carousel-control-next-icon" aria-hidden="false"></span>
	        <span class="sr-only">Next</span>
	      </a>
	    </div>
	  </header>
<div id="dologinform"></div>

<input type="hidden" id="whatboard" value="home">	  
  <jsp:include page="./module/aside.jsp" flush="false"/>
  <div class="container">
  <br/>
	<a href="/videoboard/videoBoardList" id="title-st">편집영상</a>
	<span class="best">BEST</span><hr/>

    <!-- Marketing Icons Section -->
    <div class="row" id="top3-1">
      
	</div><hr/>
    <!-- /.row -->

    <!-- 편집자 프로필 -->
    <span id="title-st">편집자</span>
	<span class="best">BEST</span><hr/>

    <div class="row" id="top3-2">
      
      

    <!-- /.row -->
  	</div><hr/>
  	<div class="jy">
  		<span class="best">NEW  </span><span id="top-st" >공지사항</span><hr/>
  		<div id="notice">
  			<table class="table table-striped nanum table-hover">
			<!-- <table border="1"> -->
			<thead align="center">
				<tr>
					<th style="width: 10%;">번호</th>
					<th style="width: 10%;">분류</th>
					<th style="width: 40%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 20%;"><i class="far fa-clock"></i></th>
					<th style="width: 10%;"><i class="far fa-eye" aria-hidden="true"></i></th>
				</tr>
			</thead>
			<tbody align="center" id="newNotice">
			</tbody>
		</table>
  		</div>
  	</div>
  	<div class="jy">
  		<span class="best">NEW  </span><span id="top-st">TIP 게시판</span><hr/>
  		<div id="tip">
  			<table class="table table-striped nanum table-hover">
				<!-- <table border="1"> -->
				<thead align="center">
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 10%;">분류</th>
						<th style="width: 40%;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 20%;"><i class="far fa-clock"></i></th>
						<th style="width: 10%;"><i class="far fa-eye" aria-hidden="true"></i></th>
					</tr>
				</thead>
				<tbody align="center" id="newTip">
				</tbody>
			</table>
  		</div>
  	</div>
  	<div class="jy2">
  		<span class="best">NEW  </span><span id="top-st">구인 게시판</span><hr/>
  		<div id="recruit1">
  			<table class="table table-striped nanum table-hover">
				<!-- <table border="1"> -->
				<thead align="center">
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 15%;">분류</th>
						<th style="width: 35%;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 20%;"><i class="far fa-clock"></i></th>
						<th style="width: 10%;"><i class="far fa-eye" aria-hidden="true"></i></th>
					</tr>
				</thead>
				<tbody align="center" id="newRecruit1">
				</tbody>
			</table>
  		</div>
  	</div>
  	<div class="jy2">
  		<span class="best">NEW  </span><span id="top-st">구직 게시판</span><hr/>
  		<div id="recruit2">
  			<table class="table table-striped nanum table-hover">
				<!-- <table border="1"> -->
				<thead align="center">
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 15%;">분류</th>
						<th style="width: 35%;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 20%;"><i class="far fa-clock"></i></th>
						<th style="width: 10%;"><i class="far fa-eye" aria-hidden="true"></i></th>
					</tr>
				</thead>
				<tbody align="center" id="newRecruit2">
				</tbody>
			</table>
  		</div>
  	</div>
  </div>
  <jsp:include page="./module/bottom.jsp" flush="false"/>


<!--   <script src="/resources/vendor/jquery/jquery.min.js"></script> -->
<!--   <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

</body>

</html>
