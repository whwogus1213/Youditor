<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style type="text/css">

/* The sidebar menu */
.sidenav {
  height: 97%; /* Full-height: remove this if you want "auto" height */
  width: 0px; /* Set the width of the sidebar */
  position: fixed; /* Fixed Sidebar (stay in place on scroll) */
  z-index: 2000; /* Stay on top */
  top: 55px; /* Stay at the top */
  right: 0;
  background-color: #ddd; /* Black */
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 20px;
}

/* The navigation menu links */
.sidenav a {
  padding: 6px 8px 6px 16px;
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
	display: block;
	width: 90px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
.navbar {
	background-color:white;
	box-shadow: 0 1px 1px 0 rgba(0,0,0,0.50);
}
.navbar a{
	text-decoration:none;
	color: #990033;
}
.navbar a:hover{
	color:#CC0033;
}
.navbar button:hover{
	color:#CC0033;
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
	background-color: white;
	text-align: center;
	box-shadow: 0 1px 1px 0 rgba(0,0,0,0.50);
}
.submenu a{
	color: #006666
}
.submenu li {
	display: inline-block;
	color: #006666
}
.submenu a:hover {
	color: #66CC99;
}
.topMenuLi:hover .submenu {
	height: 60px;
}
.notice {
	padding-right: 30%;
}
.category {
	padding-right: 5%;
}
.tip {
	padding-left: 10%;
}
.recruit {
	padding-left: 30%;
}
.hire {
	padding-left: 0%;
}

.messageMain {
	padding-left: 65%;
}
.accounts {
	padding-left: 75%;
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
.modal-body {
    padding-top: 60px;
}
#myModal2 {
    z-index: 1100;
}
.modal2 {
    width: 400px;
    margin-top: 100px;
}
.button-style3{
	background-color: #fff;
	border: 0;
	color: blue;
	margin-left: 130px;
}
#doPass1 {
	margin-left: 30px;
}
.passbtn-st{
	margin-left: 15px;
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
	var isCheckEmail = 0;
	function DosignUp() {
		var email = $("#emailqq").val();
		$.ajax({
			async: true,
			type: "POST",
			data: email,
			url: "/accounts/checkEmail.do",
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success: function (data) {
		        if(data.cnt == 1) {
					isCheckEmail = 1;
		        } else {
					alert("존재하지 않는 이메일입니다.");
					$("#emailqq").focus();
		        }
			}
		});
		var email = $("#emailqq").val();
		if(email.length == 0) {
			alert("이메일를 입력해 주세요.");
			$("#emailqq").focus();
			return;
		}
		if(isCheckEmail == 1) {
			$("#frm2").submit();
		}
	}
function DoPass() {
	alert("dfasf");
	var html = "";
		html += "<label class='label-st' float='left' width='10px;'>이메일</label>";
		html += "<input type='text' class='form-control' id='emailqq' name='email' maxlength='30' placeholder='Enter ID'>";
		html += "<button type='button' class='btn btn-primary passbtn-st' onclick='DosignUp();'>비번리셋</button>";
		$("#doPass1").html(html);
}
var isCheckEmail = 0;
function DosignUp() {
	var email = $("#emailqq").val();
	$.ajax({
		async: true,
		type: "POST",
		data: email,
		url: "checkEmail.do",
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		success: function (data) {
	        if(data.cnt == 1) {
				isCheckEmail = 1;
	        } else {
				alert("존재하지 않는 이메일입니다.");
				$("#emailqq").focus();
	        }
		}
	});
	var email = $("#emailqq").val();
	if(email.length == 0) {
		alert("이메일를 입력해 주세요.");
		$("#emailqq").focus();
		return;
	}
	if(isCheckEmail == 1) {
		//$("#frm").submit(); ->resetPasswordPro 로 이동하게 해야함
	}
}
</script>

<script src="https://kit.fontawesome.com/e83fabbb47.js"></script>

<c:if test="${login eq null }">
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
			</div>
			<button type="button" class="nav-link button-style3" onclick="location.href='${path }/email/senderpwd.do'">비밀번호를 잊어버리셨습니까?</button>
		</div></div>
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
    </div>

  </div>
</div>
</c:if>


<!-- Side navigation 채팅 chat chatting -->
<div class="sidenav" id="mySidebar"  style="padding: 0; margin-top: 1.6%; border-radius: 10px;">
	<div align="center">
			<jsp:include page="../chat/chattingview.jsp" flush="false"/>
	</div>
</div>
<script type="text/javascript">

</script>

<!-- 탑 메뉴  -->
<nav class="navbar fixed-top navbar-expand-lg fixed-top" style="box-shadow: none; min-height: 80px;">
    <div class="container" style="margin-left: 0px; margin-right: 0px; max-width: 100%;">
		<a class="navbar-brand" href="/"><img src="/resources/images/main_logo.png" style="height:40px"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse row justify-content-between" id="navbarResponsive" style="padding-left: 15%;">
			<ul class="navbar-nav row justify-content-between" style="font-size: 1.3em;font-family: 'Jua';font-weight: lighter; min-width: 60%; ">
				<li class="nav-item">
					<a class="nav-link" href="/"><strong>홈</strong></a>
				</li>
				<li class="nav-item topMenuLi">
					<a class="nav-link" href="/noticeboard/noticeBoardList"><strong>공지</strong></a>
					<ul class="submenu notice" style="box-shadow: none; margin-top: 10px;">
<!-- 						<li>|</li> -->
						<c:forEach items="${nCatList}" var="nCatList">
							<c:choose>
								<c:when test="${nCatList.viewAuthority == 3 }">
									<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" href="/noticeboard/noticeBoardList?categoryId=${nCatList.categoryId }">${nCatList.categoryName }</a></li>
<!-- 									<li>|</li> -->
								</c:when>
								<c:when test="${login.authority >= nCatList.viewAuthority }">
									<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" href="/noticeboard/noticeBoardList?categoryId=${nCatList.categoryId }">${nCatList.categoryName }</a></li>
<!-- 									<li>|</li> -->
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</li>
				<li class="nav-item topMenuLi">
					<a class="nav-link" href="/videoboard/videoBoardList"><strong>영상공유</strong></a>
					<ul class="submenu category" style="box-shadow: none; margin-top: 10px;;">
<!-- 						<li>|</li> -->
						<c:forEach items="${vCatList}" var="vCatList">
							<c:choose>
								<c:when test="${vCatList.viewAuthority == 3 }">
									<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" href="/videoboard/videoBoardList?categoryId=${vCatList.categoryId }">${vCatList.categoryName }</a></li>
<!-- 									<li>|</li> -->
								</c:when>
								<c:when test="${login.authority >= vCatList.viewAuthority }">
									<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" href="/videoboard/videoBoardList?categoryId=${vCatList.categoryId }">${vCatList.categoryName }</a></li>
<!-- 									<li>|</li> -->
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</li>
				<li class="nav-item topMenuLi">
					<c:if test="${login eq null }">
						<a class="nav-link" data-toggle="modal" data-target="#myModal" href="#myModal"><strong>팁</strong></a>
						<ul class="submenu tip" style="box-shadow: none; margin-top: 10px;;">
<!-- 							<li>|</li> -->
							<c:forEach items="${tCatList}" var="tCatList">
								<c:choose>
									<c:when test="${tCatList.viewAuthority == 3}">
										<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" data-toggle="modal" data-target="#myModal" href="#myModal">${tCatList.categoryName }</a></li>
<!-- 										<li>|</li> -->
									</c:when>
									<c:when test="${login.authority >= tCatList.viewAuthority }">
										<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" data-toggle="modal" data-target="#myModal" href="#myModal">${tCatList.categoryName }</a></li>
<!-- 										<li>|</li> -->
									</c:when>
								</c:choose>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${login ne null }">
						<a class="nav-link" href="/tipboard/tipBoardList"><strong>팁</strong></a>
						<ul class="submenu tip" style="box-shadow: none; margin-top: 10px;;">
<!-- 							<li>|</li> -->
							<c:forEach items="${tCatList}" var="tCatList">
								<c:choose>
									<c:when test="${tCatList.viewAuthority == 3 }">
										<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" href="/tipboard/tipBoardList?categoryId=${tCatList.categoryId }">${tCatList.categoryName }</a></li>
<!-- 										<li>|</li> -->
									</c:when>
									<c:when test="${login.authority >= tCatList.viewAuthority }">
										<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" href="/tipboard/tipBoardList?categoryId=${tCatList.categoryId }">${tCatList.categoryName }</a></li>
<!-- 										<li>|</li> -->
									</c:when>
								</c:choose>
							</c:forEach>
						</ul>
					</c:if>
				</li>
				<li class="nav-item topMenuLi">
					<c:if test="${login eq null }">
						<a class="nav-link" data-toggle="modal" data-target="#myModal" href="#myModal"><strong>구인구직</strong></a>
						<ul class="submenu recruit" style="box-shadow: none; margin-top: 10px;;">
<!-- 							<li>|</li> -->
							<c:forEach items="${rCatList}" var="rCatList">
								<c:choose>
									<c:when test="${rCatList.viewAuthority == 3 }">
										<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" data-toggle="modal" data-target="#myModal" href="#myModal">${rCatList.categoryName }</a></li>
<!-- 										<li>|</li> -->
									</c:when>
									<c:when test="${login.authority >= rCatList.viewAuthority }">
										<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" data-toggle="modal" data-target="#myModal" href="#myModal">${rCatList.categoryName }</a></li>
<!-- 										<li>|</li> -->
									</c:when>
								</c:choose>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${login ne null }">
						<a class="nav-link" href="/recruitboard/recruitBoardList"><strong>구인구직</strong></a>
						<ul class="submenu recruit" style="box-shadow: none; margin-top: 10px;;">
<!-- 							<li>|</li> -->
							<c:forEach items="${rCatList}" var="rCatList">
								<c:choose>
									<c:when test="${rCatList.viewAuthority == 3 }">
										<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" href="/recruitboard/recruitBoardList?categoryId=${rCatList.categoryId }">${rCatList.categoryName }</a></li>
<!-- 										<li>|</li> -->
									</c:when>
									<c:when test="${login.authority >= rCatList.viewAuthority }">
										<li><a style="font-size: 1em; margin: 0px 10px;" class="submenuLink" href="/recruitboard/recruitBoardList?categoryId=${rCatList.categoryId }">${rCatList.categoryName }</a></li>
<!-- 										<li>|</li> -->
									</c:when>
								</c:choose>
							</c:forEach>
						</ul>
					</c:if>
				</li>
			</ul>
			
			
			
			<!-- 두번째 ul -->
			<ul class="navbar-nav">
				<c:if test="${login.accountId ne null }">
					<a onclick="location.href='/videoboard/videoBoardList?searchType=nickname&keyword=${login.nickname}'" style="cursor: pointer;">
						<img src="<spring:url value='/image/${login.picture}'/>" class=" mx-auto rounded-circle" width="40px" height="40px"/>
					</a>
					<li class="nav-item topMenuLi">
						<a class="nav-link" href="#">
							<c:choose>		
								<c:when test="${mCount >= 1 }">		
									<i id="messageIcon" class="far fa-envelope">${mCount }</i>
								</c:when>		
								<c:otherwise>		
									<i class="far fa-envelope-open"></i>		
								</c:otherwise>		
							</c:choose>
							<strong>메세지</strong>
						</a>
						<ul class="submenu messageMain" style="box-shadow: none; margin-top: 10px;;">
							<li>|</li>
							<li><a class="submenuLink" href="/message/messageReceiveList"><i class="fas fa-inbox"></i>받은 메세지</a></li>
							<li>|</li>
							<li><a class="submenuLink" href="/message/messageSendList"><i class="far fa-paper-plane"></i>보낸 메세지</a></li>
							<li>|</li>
						</ul>
					</li>
					<li class="nav-item topMenuLi">
						<a class="nav-link" href="#">
							<c:choose>		
								<c:when test="${fCount >= 1 }">		
									<i class="far fa-heart">${fCount }</i>
								</c:when>		
								<c:otherwise>		
									<i class="fas fa-user-cog"></i>		
								</c:otherwise>		
							</c:choose>
							<strong>회원기능</strong>
						</a>
						<ul class="submenu accounts" style="box-shadow: none; margin-top: 10px;;">
							<li>|</li>
							<li><a class="submenuLink" href="/follow/followingList"><i class="fas fa-user-friends"></i>팔로잉</a></li>
							<li>|</li>
							<li><a class="submenuLink" href="/follow/followerList">
								<c:choose>		
									<c:when test="${fCount >= 1 }">		
										<i class="far fa-heart">${fCount }</i>		
									</c:when>		
									<c:otherwise>		
										<i class="fas fa-users"></i>		
									</c:otherwise>		
								</c:choose>
								팔로워
							</a></li>
							<li>|</li>
							<li><a class="submenuLink" href="/accounts/modAccount.do"><i class="fas fa-user-edit"></i>정보수정</a></li>
							<li>|</li>
							<c:if test="${login.authority >= 5 }">
								<li><a href="/admin"><i class="fas fa-toolbox"></i></a>
							</c:if>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/accounts/logout"><i class="fas fa-sign-out-alt"></i><strong>로그아웃</strong></a>
					</li>
				</c:if>
				<c:if test="${login.accountId eq null }">
					<li class="nav-item">
						<a data-toggle="modal" class="nav-link" data-target="#myModal" href="#myModal"><i class="fas fa-sign-in-alt"></i><strong>로그인</strong></a>
						<!-- <button type="button" class="nav-link" data-toggle="modal" 
						data-target="#myModal" style="background-color:white; border:0; color:#990033 "><strong>로그인</strong></button> -->
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/accounts/join.do"><i class="fas fa-user-plus"></i><strong>회원가입</strong></a>
					</li>
					
				</c:if>
			</ul>
		</div>
	</div>
	
	<!-- Chat 채팅 아이콘 -->
	<i id="chatBtn" class="far fa-comments" style="font-size: 1.8em; color:orange; cursor: pointer;" onclick="openNav();"></i>
	  
	<!-- 알람 div -->
	<div id="alarmPopup" style="position:fixed; top: 80%; display:none; z-index: 9999; position: absolute; padding: 10px; background-color: #323232; color: #f1f1f1; width: 250px; height: 60px; text-align: center;">
		<p style="vertical-align: middle; line-height: 40px;">
		</p>
	</div>
	
	  
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

