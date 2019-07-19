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
 .container {
    float: left;
}
  </style>
  <script>
  $(function() {
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
							html += "<h4 class='card-header'>"+data[i].subject+"</h4>";
							html += "<div class='card-body'>";
							html += "<img width='100%' height='20%' src='"+data[i].youtubeLink+"'></img>";
							html += "</div>";
							html += "<div class='card-footer'>";
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
						html += "<a href='#'><img class='card-img-top' src='/image/"+data[i].picture+"' alt='' width='80' height='200'></a>";
						html += "<div class='card-body'>";
						html += "<h4 class='card-title'>";
						html += "<a href='#'>"+data[i].nickname+"</a>";
						html += "</h4>";
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
						html += "<td>"+data[i].categoryId+"</td>";
						html += "<td align='left' style='padding-left: 30px; cursor: pointer;' onclick='location.href='/noticeboard/noticeBoardView?boardId="+data[i].boardId+"''>"+data[i].subject+"</td>";
						html += "<td>"+data[i].nickname+"</td>";
						html += "<td><fmt:formatDate value="+data[i].mod_date+"pattern='yyyy-MM-dd' /></td>";
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
						html += "<td>"+data[i].categoryId+"</td>";
						html += "<td align='left' style='padding-left: 30px; cursor: pointer;' onclick='location.href='/noticeboard/noticeBoardView?boardId="+data[i].boardId+"''>"+data[i].subject+"</td>";
						html += "<td>"+data[i].nickname+"</td>";
						html += "<td><fmt:formatDate value="+data[i].mod_date+"pattern='yyyy-MM-dd' /></td>";
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
	            <h3 style="color:black">YouDitor은 무슨 뜻인가요?</h3>
	            <p style="color:black">YouDitor 는 Youtube와 Editor의 합성어입니다.</p>
	          </div>
	        </div>
	
	        <div class="carousel-item" style="background-image: url('../resources/images/main_img2.jpg');  background-position:50% 60%;">
	          <div class="carousel-caption d-none d-md-block">
	            <h3 style="color:black">YouDitor은 어떤 곳인가요?</h3>
	            <p style="color:black">YouDitor은 Youtube 편집자들을 위한 커뮤니티입니다.</p>
	          </div>
	        </div>
	
	        <div class="carousel-item" style="background-image: url('../resources/images/main_img3.jpg');  background-position:50% 60%;">
	          <div class="carousel-caption d-none d-md-block">
	            <h3 style="color:white">YouDitor에서는 무엇을 할 수 있나요?</h3>
	            <p style="color:white">다양한 YouDitor들과 당신의 결과물에 대해 토론하고 Creator와 협업할 수 있습니다.</p>
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
	  
  <jsp:include page="./module/aside.jsp" flush="false"/>
  <div class="container">

    <h1 class="my-4">핫한 편집 영상</h1><hr/>

    <!-- Marketing Icons Section -->
    <div class="row" id="top3-1">
      
	</div><hr/>
    <!-- /.row -->

    <!-- 편집자 프로필 -->
    <h2>이번주 편집자 탑3</h2><hr/>

    <div class="row" id="top3-2">
      
      

    <!-- /.row -->
  	</div><hr/>
  	<div class="jy">
  		<h2>최신 공지사항</h2><hr/>
  		<div id="notice">
  			<table class="table table-striped nanum table-hover">
			<!-- <table border="1"> -->
			<thead align="center">
				<tr>
					<th style="width: 10%;">번호</th>
					<th style="width: 10%;">분류</th>
					<th style="width: 40%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 20%;">작성일</th>
					<th style="width: 10%;">조회수</th>
				</tr>
			</thead>
			<tbody align="center" id="newNotice">
			</tbody>
		</table>
  		</div>
  	</div>
  	<div class="jy">
  		<h2>최신 TIP 게시판</h2><hr/>
  		<div id="tip">
  			<table class="table table-striped nanum table-hover">
				<!-- <table border="1"> -->
				<thead align="center">
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 10%;">분류</th>
						<th style="width: 40%;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 20%;">작성일</th>
						<th style="width: 10%;">조회수</th>
					</tr>
				</thead>
				<tbody align="center" id="newTip">
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
