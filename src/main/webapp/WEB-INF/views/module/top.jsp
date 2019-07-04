<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#topMenu {
	height: 30px;
	width: 850px;
	position: relative; /* [추가] 하위 메뉴 시작 지점을 메뉴와 동일하게 설정하기 위함 */
}
#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}
#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	-position: relative; /* [삭제] 해당 li 태그 내부의 top/left 포지션 초기화 */
} .menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration:none;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum;
}
.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: white;
}
.topMenuLi:hover .menuLink {
/* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: red;
	background-color: #4d4d4d;
}
.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px;
}
.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d;
	background-color: white;
	border: solid 1px black;
	margin-right: -1px;
}
.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute;
	height: 0px;
	overflow: hidden;
	transition: height .2s;
	-webkit-transition: height .2s;
	-moz-transition: height .2s;
	-o-transition: height .2s;
	width: 770px; /* [변경] 가로 드랍다운 메뉴의 넓이 */
	left: 0; /* [추가] 가장 왼쪽으로 하위 메뉴 위치 설정 */
}
.submenu li {
	display: inline-block;
}
.topMenuLi:hover .submenu {
	height: 32px;
}
.submenuLink:hover {
	color: red;
	background-color: #dddddd;
}
</style>
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
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             	 카테고리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/videoboard/videoBoardList?category=0">전체</a>
              <a class="dropdown-item" href="/videoboard/videoBoardList?category=1">게임</a>
              <a class="dropdown-item" href="/videoboard/videoBoardList?category=2">먹방</a>
              <a class="dropdown-item" href="/videoboard/videoBoardList?category=3">일상</a>
              <a class="dropdown-item" href="/videoboard/videoBoardList?category=4">모터</a>
              <a class="dropdown-item" href="/videoboard/videoBoardList?category=5">스포츠</a>
              <a class="dropdown-item" href="/videoboard/videoBoardList?category=6">예능</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">구인구직</a>
          </li>
				<li class="nav-item"><a class="nav-link" href="#">영상편집팁</a></li>

				<c:if test="${login.accountId ne null }">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 팔로우 </a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="/follow/followingList">팔로잉</a>
							<a class="dropdown-item" href="/follow/followerList">팔로워</a>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/accounts/logout">로그아웃</a></li>
				</c:if>
				<c:if test="${login.accountId eq null }">
					<li class="nav-item"><a class="nav-link"
						href="/accounts/login.do">로그인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/accounts/join.do">회원가입</a></li>
				</c:if>
			</ul>
      </div>
    </div>
  </nav>
