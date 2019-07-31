<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	position: static;
	color: black;
	display: block;
	width: 90px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
.navbar {
	background-color:white;
	box-shadow: 0 1px 1px 0 rgba(0,0,0,0.50);
	text-align: center;
}
.navitem {
    margin-left: auto;
    margin-right: auto;
    padding-left: 227px;
}
.navbar a{
	text-decoration:none;
	color: black;
}
.navbar a:hover{
	color: black;
}
.navbar button:hover{
	color: black;
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
	background-color: white;
	text-align: center;
	box-shadow: 0 1px 1px 0 rgba(0,0,0,0.50);
}
.submenu a{
	color: black;
	width: 120px;
}
.submenu li {
	display: inline-block;
	color: black;
	width: 120px;
}
.submenu a:hover {
	color: black;
}
.topMenuLi:hover .submenu {
	height: 30px;
}
ul{
list-style: none;
}
</style>


<nav class="navbar fixed-top navbar-expand-lg" style="box-shadow: none; min-height: 50px;">
	<div class="container" style="margin-left: 0px; margin-right: 0px; max-width: 100%;">
		<div class="collapse navbar-collapse row center justify-content-between" id="navbarResponsive">
			<ul class="navbar-nav row justify-content-between center navitem">
				<li class="nav-item">
					<a class="nav-link" href="/adminView"><strong>계정관리</strong></a>
				</li>
				<li class="nav-item topMenuLi">
					<a class="nav-link" href="#"><strong>카테고리 관리</strong></a>
					<ul class="submenu">
						<li>
							<a class="submenuLink" href="/adminCategory?category=notice">공지 카테고리</a>
						</li>
						<li>
							<a class="submenuLink" href="/adminCategory?category=video">영상공유 카테고리</a>
						</li>
						<li>
							<a class="submenuLink" href="/adminCategory?category=tip">팁 카테고리</a>
						</li>
						<li>
							<a class="submenuLink" href="/adminCategory?category=recruit">구인구직 카테고리</a>
						</li>
					</ul>
				</li>
			</ul>
			<ul>
				<li>
					<a class="nav-link" href="/"><strong>메인페이지로 돌아가기</strong></a>
				</li>
			</ul>
		</div>
	</div>
</nav>