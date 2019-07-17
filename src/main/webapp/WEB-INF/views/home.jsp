<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/module/header2.jsp" %>

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
<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>
  <style>
  footer{
  clear: both;
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
							html += "<h4 class='card-header'>영상 제목</h4>";
							html += "<div class='card-body'>";
							html += "<img width='100%' height='20%' src='"+data[i].youtubeLink+"'></img>";
							html += "</div>";
							html += "<div class='card-footer'>";
							html += "<table>"
							html += "<tr>"
							///////////////////////////////////////////////////////////////////////
							if(data[i].starCount == 5 ){
								html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
								html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
								html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
								html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
								html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
								}
								else if(4 < data[i].starCount < 5){
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									if(data[i].starCount+0.99 > 5){

										html += "<td class='fas fa-star-half-alt' style='color: #ffd400;'></td>";
									}else{
										html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
									}
								else if(3 < data[i].starCount < 4){
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									if(data[i].starCount+0.99 > 4){
										html += "<td class='fas fa-star-half-alt' style='color: #ffd400;'></td>";
									}else{
										html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
								else if(2 < data[i].starCount < 3){
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									if(data[i].starCount+0.99 > 5){

										html += "<td class='fas fa-star-half-alt' style='color: #ffd400;'></td>";
									}else{
										html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
								else if(1 < data[i].starCount < 2){
									html += "<td class='fas fa-star' style='color: #ffd400; margin: 0;'></td>";
									if(data[i].starCount+0.99 > 5){

										html += "<td class='fas fa-star-half-alt' style='color: #ffd400;'></td>";
									}else{
										html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
								else if(0 < data[i].starCount < 1){
									if(data[i].starCount+0.99 > 5){

										html += "<td class='fas fa-star-half-alt' style='color: #ffd400;'></td>";
									}else{
										html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									html += "<td class='far fa-star' style='color: #ffd400;'></td>";
									}
							///////////////////////////////////////////////////////////////////////
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
						html += "<a href='#'><img class='card-img-top' src='"+data[i].picture+"' alt='' width='80' height='200'></a>";
						html += "<div class='card-body'>";
						html += "<h4 class='card-title'>";
						html += "<a href='#'>"+data[i].nickname+"</a>";
						html += "</h4>";
						html += "<p class='card-text'>"+data[i].footer+"</p>";
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
  </script>
</head>

<body>

  <jsp:include page="./module/top2.jsp" flush="false"/>
 	<!-- 페이지 내용 시작 -->
 	
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
  	
  </div>
  <jsp:include page="./module/bottom.jsp" flush="false"/>


  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
