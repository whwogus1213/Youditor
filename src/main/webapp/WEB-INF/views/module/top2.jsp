<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">

/* The sidebar menu */
.sidenav {
  height: 100%; /* Full-height: remove this if you want "auto" height */
  width: 230px; /* Set the width of the sidebar */
  position: fixed; /* Fixed Sidebar (stay in place on scroll) */
  z-index: 1; /* Stay on top */
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
	padding-left: 10%;
}
.accounts {
	padding-left: 50%;
}
.submenuLink:hover {
	color: #C4C6C8;
	text-decoration: none;
}
</style>


<!-- Side navigation -->
<div class="sidenav" id="mySidebar">
	<div align="right">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
	</div>
	<div align="center">
		<c:if test="${login.accountId ne null }">
			<jsp:include page="../chat/chattingview.jsp" flush="false"/>
		</c:if>
		<c:if test="${login.accountId eq null }">
			<h5>로그인 이후<br>채팅이<br>가능합니다.</h5>
			<hr>
			<h6><a href="accounts/login.do">로그인</a></h6>
			<h6>or</h6>
			<h6><a href="accounts/join.do">회원가입</a></h6>
		</c:if>
	</div>
</div>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
		<a class="navbar-brand" href="/">YouDitor</a>
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
					<a class="nav-link" href="#">팁</a>
				</li>
				<li class="nav-item topMenuLi">
					<a class="nav-link" href="#">구인구직</a>
					<ul class="submenu hire">
						<li>|</li>
						<li><a class="submenuLink" href="#">구인</a></li>
						<li>|</li>
						<li><a class="submenuLink" href="#">구직</a></li>
						<li>|</li>
					</ul>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<c:if test="${login.accountId ne null }">
					<li class="nav-item topMenuLi">
						<a class="nav-link" href="#">회원기능</a>
						<ul class="submenu accounts">
							<li>|</li>
							<li><a class="submenuLink" href="/follow/followingList">팔로잉</a></li>
							<li>|</li>
							<li><a class="submenuLink" href="/follow/followerList">팔로워</a></li>
							<li>|</li>
							<li><a class="submenuLink" href="/follow/modAccount.do">회원정보수정</a></li>
							<li>|</li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/accounts/logout">로그아웃</a>
					</li>
				</c:if>
				<c:if test="${login.accountId eq null }">
					<li class="nav-item">
						<a class="nav-link" href="/accounts/login.do">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/accounts/join.do">회원가입</a>
					</li>
				</c:if>
			</ul>
		</div>
		<button class="openbtn" onclick="openNav()">Chat</button>  
		<script>
		function openNav() {
		  document.getElementById("mySidebar").style.width = "230px";
		  document.getElementById("main").style.marginLeft = "190px";
		}
		
		function closeNav() {
		  document.getElementById("mySidebar").style.width = "0";
		  document.getElementById("main").style.marginLeft= "0";
		}
		</script>
	</div>
</nav>