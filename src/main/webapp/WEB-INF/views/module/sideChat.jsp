<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
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
</style>

<!-- Side navigation -->
<div class="sidenav" align="center">
	<c:if test="${login.accountId ne null }">
		<jsp:include page="../chat/chattingview.jsp" flush="false"/>
	</c:if>
	<c:if test="${login.accountId eq null }">
		<h5>로그인 이후<br>채팅이<br>가능합니다.</h5>
		<hr>
		<a href="accounts/login.do"><h6>로그인</h6></a>
		<h6>or</h6>
		<a href="accounts/join.do"><h6>회원가입</h6></a>
	</c:if>
</div>