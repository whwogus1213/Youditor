<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link href="/resources/css/chat.css" rel="stylesheet">

<style type="text/css">

/* The sidebar menu */
.sidenav {
  height: 100%; /* Full-height: remove this if you want "auto" height */
  width: 0px; /* Set the width of the sidebar */
  position: fixed; /* Fixed Sidebar (stay in place on scroll) */
  z-index: 20; /* Stay on top */
  top: 55px; /* Stay at the top */
  right: 0;
  background-color: #ddd; /* Black */
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 20px;
}

/* The navigation menu links */
.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
  color: #f1f1f1;
}

/* Style page content */
.main {
  margin-left: 160px; /* Same as the width of the sidebar */
  padding: 0px 10px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidebar (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	position: static;
	color: #9A9DA0;
	text-decoration:none;
	display: block;
	width: 90px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px;
}
.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute;
	height: 0px;
	overflow: hidden;
	transition: height .2s;
	-webkit-transition: height .2s;
	-moz-transition: height .2s;
	-o-transition: height .2s;
	/* width: 5; /* [변경] 가로 드랍다운 메뉴의 넓이 */
	left: 0; /* [추가] 가장 왼쪽으로 하위 메뉴 위치 설정 */
	right: 0;
	background-color: #343A40;
	text-align: center;
}
.submenu li {
	display: inline-block;
}
.topMenuLi:hover .submenu {
	height: 32px;
}
.category {
	
}
.hire {
	padding-left: 0%;
}

.messageMain {
	padding-left: 44%;
}
.accounts {
	padding-left: 50%;
}
.submenuLink:hover {
	color: #C4C6C8;
	text-decoration: none;
}
@media (min-width: 576px){
.col-sm-3 {
    max-width: 100%;
}
}
@media (min-width: 576px){
.form-inline .form-control {
    width: 280px;
}
}
.form-control2{
	padding-top: 20px;
}
.button-style{
	background-color: #343A40;
	border: 0px;
}
.modal-title {
    margin-left: 20px;
}
.modal-header .close {
    margin: -1rem -1rem -1rem 10px;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#pwd').keypress(function(event) {
			// var keycode = (event.keyCode ? event.keyCode : event.which);
			var keycode = event.keyCode;
			// enter를 쳤을 때 keycode가 13이다
			console.log(keycode);
			if (keycode == '13') {
				DoLogin();
			}

			event.stopPropagation();
		});
});

	function DoLogin() {
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		if(email.length == 0) { alert("이메일를 입력해 주세요."); $("#email").focus(); return; }
		if(pwd.length == 0) { alert("비밀번호를 입력해 주세요."); $("#pwd").focus(); return; }
	$("#frm").submit();
}
</script>

<!-- Trigger the modal with a button -->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header"><h4 class="modal-title">로그인</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="frm" method="post" action="${path}/accounts/login.do">
		<div class="form-inline">
			<h2 align="center">&nbsp;</h2>
			<label class="control-label col-sm-3">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="email"
					name="email" maxlength="30" placeholder="Enter ID">
			</div>
		</div>
		<br>
		<div class="form-inline">
			<h2 align="center">&nbsp;</h2>
			<label class="control-label col-sm-3">비밀번호</label>
			<div class="col-sm-3 form-control2">
				<input type="password" class="form-control" id="pwd"
					name="pwd" maxlength="20" placeholder="Enter Password"><br>
				<a href="/accounts/resetPassword.do">비밀번호를 잊어버리셨습니까?</a>
			</div>
		</div>
		<h2 align="center">&nbsp;</h2>
		<div class="form-group">
			<h2 align="center">&nbsp;</h2>
			<div class="col-sm-offset-2 col-sm-12" align="center">
<!-- 				<button type="button" class="btn btn-primary"
					onclick="memberInsertCheckForm(this.form)">
				로그인</button> -->
				<button type="button" class="btn btn-primary" onclick="DoLogin();">
					로그인
				</button>
			</div>
		</div>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- Side navigation -->
<div class="sidenav" id="mySidebar"  style="padding: 0; margin-top: 7px; border-radius: 10px;">
	<div align="center">
		<c:if test="${login.accountId ne null }">
			<jsp:include page="../chat/chattingview.jsp" flush="false"/>
		</c:if>
		<c:if test="${login.accountId eq null }">
<!-- 			<h5>로그인 이후<br>채팅이<br>가능합니다.</h5> -->
<!-- 			<hr> -->
<!-- 			<h6><a href="accounts/login.do">로그인</a></h6> -->
<!-- 			<h6>or</h6> -->
<!-- 			<h6><a href="accounts/join.do">회원가입</a></h6> -->
			
			<div class="chat_window">
    			<div class="top_menu">
        			<div class="title">유디터(<span id='sessionCnt'></span>)</div>
    			</div>
    			<ul class="messages"></ul>
    			<div class="bottom_wrapper clearfix">
					<p style="font-size: 10px;margin-bottom: 3px;text-align: left;font-weight: 300;">${login.nickname}</p>
	       			<div class="message_input_wrapper">
			            <input class="message_input" disabled="disabled" placeholder="로그인후 사용가능.."/>
        			</div>
    			</div>
			</div>
			
		</c:if>
	</div>
</div>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" style="font-family: 'Nanum Gothic', sans-serif;">
    <div class="container">
		<a class="navbar-brand" href="/"><img src="/resources/images/main_logo.png" height="40px"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="/">홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/noticeboard/noticeBoardList">공지</a>
				</li>
				<li class="nav-item topMenuLi">
					<a class="nav-link" href="#">카테고리</a>
					<ul class="submenu category">
						<li>|</li>
						<li><a class="submenuLink" href="/videoboard/videoBoardList?category=0">전체</a></li>
						<li>|</li>
						<li><a class="submenuLink" href="/videoboard/videoBoardList?category=1">게임</a></li>
						<li>|</li>
						<li><a class="submenuLink" href="/videoboard/videoBoardList?category=2">먹방</a></li>
						<li>|</li>
						<li><a class="submenuLink" href="/videoboard/videoBoardList?category=3">일상</a></li>
						<li>|</li>
						<li><a class="submenuLink" href="/videoboard/videoBoardList?category=4">모터</a></li>
						<li>|</li>
						<li><a class="submenuLink" href="/videoboard/videoBoardList?category=5">스포츠</a></li>
						<li>|</li>
						<li><a class="submenuLink" href="/videoboard/videoBoardList?category=6">예능</a></li>
						<li>|</li>
					</ul>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/tipboard/tipBoardList">팁</a>
				</li>
				<li class="nav-item topMenuLi">
					<a class="nav-link" href="#">구인구직</a>
					<ul class="submenu hire">
						<li>|</li>
						<li><a class="submenuLink" href="/recruitboard/recruitBoardList?categoryId=1">구인</a></li>
						<li>|</li>
						<li><a class="submenuLink" href="/recruitboard/recruitBoardList?categoryId=2">구직</a></li>
						<li>|</li>
					</ul>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<c:if test="${login.accountId ne null }">
					<img src="<spring:url value='/image/${login.picture}'/>" class=" mx-auto rounded-circle" width="40px" height="40px"/>
					<li class="nav-item topMenuLi">
						<a class="nav-link" href="#">메세지</a>
						<ul class="submenu messageMain">
							<li>|</li>
							<li><a class="submenuLink" href="/message/messageReceiveList">받은 메세지</a></li>
							<li>|</li>
							<li><a class="submenuLink" href="/message/messageSendList">보낸 메세지</a></li>
							<li>|</li>
						</ul>
					</li>
					<li class="nav-item topMenuLi">
						<a class="nav-link" href="#">회원기능</a>
						<ul class="submenu accounts">
							<li>|</li>
							<li><a class="submenuLink" href="/follow/followingList">팔로잉</a></li>
							<li>|</li>
							<li><a class="submenuLink" href="/follow/followerList">팔로워</a></li>
							<li>|</li>
							<li><a class="submenuLink" href="/accounts/modAccount.do">회원정보수정</a></li>
							<li>|</li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/accounts/logout">로그아웃</a>
					</li>
				</c:if>
				<c:if test="${login.accountId eq null }">
					<li class="nav-item">
					<button type="button" class="nav-link button-style" data-toggle="modal" 
					data-target="#myModal">로그인</button></li>
					<li class="nav-item">
						<a class="nav-link" href="/accounts/join.do">회원가입</a>
					</li>
					
				</c:if>
			</ul>
		</div>
	</div>
	
	<!-- Chat 채팅 아이콘 -->
	<i id="chatBtn" class="far fa-comments" style="font-size: 1.8em; color: white; cursor: pointer;" onclick="openNav();"></i>
	  
	<script>
		function openNav() {
				 
			if(document.getElementById("mySidebar").getBoundingClientRect().width=="0"){
// 				 document.getElementById("mySidebar").style.width = "230px";
				$("#mySidebar").animate({width:"230px"},500,"swing");
				$("#chatBtn").animate({fontSize:"2.3em"},250,"linear",function(){
					$("#chatBtn").animate({fontSize:"1.8em"},250,"linear",function(){
						$("#chatBtn").attr("class","fas fa-comments");
					});
				});
				
			} else {
// 				document.getElementById("mySidebar").style.width = "0";
				$("#mySidebar").animate({width:"0px"},500,"swing");
				$("#chatBtn").animate({fontSize:"2.3em"},250,"linear",function(){
					$("#chatBtn").animate({fontSize:"1.8em"},250,"linear",function(){
						$("#chatBtn").attr("class","far fa-comments");
					});
				});
			}
		}
		
	</script>
</nav>

