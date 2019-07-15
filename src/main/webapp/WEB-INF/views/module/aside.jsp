<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
ul {
	padding-inline-start: 10px;
}

li {
	list-style: none;
}

.aside {
	margin: 20px;
	width: 200px;
	height: 325px;
	float: left;
	background-color: #FFFFFF;
	border: solid 4px rgb(109, 109, 109);
}
.tab_item1 {
	display: none;
}
.tab_item2 {
	display: none;
}
#best1:checked ~ #bestbtn1 {
	background: white;
    color: black;
}
#best2:checked ~ #bestbtn2 {
	background: white;
    color: black;
}
#best3:checked ~ #bestbtn3 {
	background: white;
    color: black;
}
#best4:checked ~ #bestbtn4 {
	background: white;
    color: black;
}
#best1 { display: none; }
#best2 { display: none; }
#best3 { display: none; }
#best4 { display: none; }

#best1 ~ .tab_item1 { display: none; }
#best2 ~ .tab_item2 { display: none; }
#best3 ~ .tab_item3 { display: none; }
#best4 ~ .tab_item4 { display: none; }
 
#best1:checked ~ .tab_item1 { display: block; }
#best2:checked ~ .tab_item2 { display: block; }
#best3:checked ~ .tab_item3 { display: block; }
#best4:checked ~ .tab_item4 { display: block; }

		.table .thead-dark th {
		    color: rgb(255, 255, 255);
		    background-color: rgb(52, 61, 70);
		}
		label {
	    	text-align: center;
		}
		.table th {
		    color: rgb(109, 109, 109);
		}
		#best5 {
			color: #FFFFFF;
			background-color: rgb(52, 61, 70);
			text-align: center;
		}
		.table {
	    margin-bottom: 0rem;
		}
		.table td, .table th {
		    padding: .55rem;
		    
		}
</style>
<script type="text/javascript">
	$(function() {
		$.ajax({
			type : "POST",
			url : "/videostar/StarList",
			success : function(data) {

				var html = "";

				if(data.length > 0) {
					for(var i = 0; i < data.length; i++){
						html += "<tr onclick=\"location.href='/videoboard/videoBoardView?boardId="+data[i].boardId+"'\" style='cursor:pointer;'>";
						html += "<th scope='row'>"+(i+1)+"</th>";
						html += "<td>"+data[i].subject+"</td>";
						html += "<td>"+data[i].starCount+"</td>";
						html += "</tr>";
					}
				}

				$("#boardRank").html(html);
				getTipStar();
				getNoticeList();
				getAccountsList();
			},
			error : function(data) {
				alert('불러오기 실패');
			}
			
		});
		
		
			
		var $win = $(window);
		var top = $(window).scrollTop();

		/*사용자 설정 값 시작*/
		var speed = 400; //따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
		var easing = 'linear';
		var $layer = $('.float_sidebar'); //레이어 셀렉팅
		var layerTopOffset = 0; //레이어 높이 상한선, 단위:px
		$layer.css('position', 'relative').css('z-index', '1');
		/* 사용자 설정 값 끝*/

		//스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
		if (top > 0)
			$win.scrollTop(layerTopOffset + top);
		else
			$win.scrollTop(0);

		//스크롤 이벤트가 발생하면
		$(window).scroll(function() {
			yPosition = $win.scrollTop() - 400; //이부분을 조정해서 화면에 보이도록 맞추세요
			if (yPosition < 0) {
				yPosition = 0;
			}
			$layer.animate({
				"top" : yPosition
			}, {
				duration : speed,
				easing : easing,
				queue : false
			})
		});
	});
function getTipStar(){
	$.ajax({
		type : "POST",
		url : "/tipstar/StarList",
		success : function(data) {

			var html = "";

			if(data.length > 0) {
				for(var i = 0; i < data.length; i++){
						html += "<tr onclick=\"location.href='/tipboard/tipBoardView?boardId="+data[i].boardId+"'\" style='cursor:pointer;'>";
						html += "<th scope='row'>"+(i+1)+"</th>";
						html += "<td>"+data[i].subject+"</td>";
						html += "<td>"+data[i].starCount+"</td>";
						html += "</tr>";
				}
			}

			$("#tipBoardRank").html(html);

		},
		error : function(data) {
			alert('불러오기 실패');
		}
	});
}
function getNoticeList(){
	$.ajax({
		type : "POST",
		url : "/noticeboard/newNotice",
		success : function(data) {

			var html = "";

			if(data.length > 0) {
				for(var i = 0; i < data.length; i++){
						html += "<tr onclick=\"location.href='/noticeboard/noticeBoardView?boardId="+data[i].boardId+"'\" style='cursor:pointer;'>";
						html += "<th scope='row'>"+(i+1)+"</th>";
						html += "<td>"+data[i].subject+"</td>";
						html += "<td>"+data[i].nickname+"</td>";
						html += "</tr>";
				}
			}

			$("#noticeBoardRank").html(html);

		},
		error : function(data) {
			alert('불러오기 실패');
		}
	});
}
function getAccountsList(){
	$.ajax({
		type : "POST",
		url : "/accounts/accountsList",
		success : function(data) {

			var html = "";

			if(data.length > 0) {
				for(var i = 0; i < data.length; i++){
						html += "<tr onclick=\"location.href='videoboard/videoBoardList?searchType=nickname&keyword="+data[i].nickname+"'\" style='cursor:pointer;'>";
						html += "<th scope='row'>"+(i+1)+"</th>";
						html += "<td>"+data[i].nickname+"</td>";
						html += "</tr>";
				}
			}

			$("#accountsRank").html(html);

		},
		error : function(data) {
			alert('불러오기 실패');
		}
	});
}
</script>

<div class="container-fluid">

	<div class="float_sidebar">
		<div class="aside">
		<input id="best1" type="radio" name="tab" checked="checked" />
    	<input id="best2" type="radio" name="tab"  />
   		<input id="best3" type="radio" name="tab"  />
    	<input id="best4" type="radio" name="tab"  />
   
			<table class="table">
				<thead class="thead-dark">
					<div id="best5">top 5</div>
					<tr>
						<th colspan="1"><label id="bestbtn1" for="best1">전체</label></th>
						<th colspan="1"><label id="bestbtn2" for="best2">팁  </label></th>
						<th colspan="1"><label id="bestbtn3" for="best3">공지</label></th>
						<th colspan="1"><label id="bestbtn3" for="best4">유저</label></th>
					</tr>
				</table>
			<div class="tab_item1">
			<table class="table table-hover">
				<tbody id="boardRank">
					
				</tbody>
			</table>
			</div>
			
			<div class="tab_item2">
			<table class="table table-hover">
				<tbody id="tipBoardRank">
					
				</tbody>
			</table>
			</div>
			<div class="tab_item3">
			<table class="table table-hover">
				<tbody id="noticeBoardRank">
				</tbody>
			</table>
			</div>
			<div class="tab_item4">
			<table class="table table-hover">
				<tbody id="accountsRank">
				</tbody>
			</table>
			</div>

		</div>
	</div>
</div>