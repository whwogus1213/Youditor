<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
		ul {
		    padding-inline-start: 10px;
		}
		li {
		    list-style: none;
		}
		.aside{
			margin: 20px;
			width: 200px;
			height: 100%;
			border: 1px solid black;
			float: left;
			background-color: #777;
			border: solid 3px rgb(52, 61, 70,0.5);;
		}
		#best { display: none; }
		#weekbest { display: none; }
        #bestbtn { 
            width: 100px; height: 30px;
            line-height: 30px;
            text-align: center;

            box-sizing: border-box;
            border: 1px solid black;

            background: black;
            color: white;
         }
         #best:checked ~ #bestbtn1 {
         	background: white;
            color: black;
         }
         #weekbest:checked ~ #bestbtn2 {
         	background: white;
            color: black;
         }
         .tab_item1 {
         	display: none;
         }
         .tab_item2 {
         	display: none;
         }
        #best ~ .tab_item1 { display: none; }
        #weekbest ~ .tab_item2 { display: none; }
         
        #best:checked ~ .tab_item1 { display: block; }
        #weekbest:checked ~ .tab_item2 { display: block; }
        
        #bestbtn1 {
        	float: left;
            border: 0.1px solid black;
            background-color: yellowgreen;
        }
        #bestbtn2 {
        	float: left;
            border: 0.1px solid black;
            background-color: blue;
        }
        .table .thead-dark th {
	    color: rgb(255, 255, 255);
	    background-color: rgb(52, 61, 70);;
		border: 2px solid #FFFFFF;
		}
		label {
	    text-align: center;
		}
</style>
<script type="text/javascript">
		$(function(){
		$.ajax({
			type : "POST",
			url : "/videostar/StarList",
			success : function(data) {
				//$("#star").html(data);
				alert('불러오기 성공');
			},
			error : function(data) {
				alert('불러오기 실패');
			}
		});
		var $win = $(window); 
		var top = $(window).scrollTop();
		
		/*사용자 설정 값 시작*/
		var speed = 400;		//따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
		var easing = 'linear';
		var $layer = $('.float_sidebar'); //레이어 셀렉팅
		var layerTopOffset = 0; //레이어 높이 상한선, 단위:px
		$layer.css('position', 'relative').css('z-index', '1');
		/* 사용자 설정 값 끝*/
		
		//스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
		if (top > 0)
			$win.scrollTop(layerTopOffset+top);
		else
			$win.scrollTop(0);
		
		//스크롤 이벤트가 발생하면
		$(window).scroll(function(){
			yPosition = $win.scrollTop() - 300; //이부분을 조정해서 화면에 보이도록 맞추세요
			if (yPosition < 0)
			{
				yPosition = 0;
			}
			$layer.animate({"top":yPosition}, {duration:speed, easing:easing, queue:false})
		});
	});
	</script>

<div class="float_sidebar">
	<div class="aside">
	(임시 ->)게시물 랭킹
	<input id="best" type="radio" name="tab" checked="checked" />
    <input id="weekbest" type="radio" name="tab"  />
    <section class="buttons">
		<label id="bestbtn1" for="best">★best20★</label>
		<label id="bestbtn2" for="weekbest">☆weekbest20☆</label>
    </section>
	<div class="tab_item1">
        <ul class="item1">
        	<c:forEach items="${starList}" var="starList">
            <li><a href="/videoboard/videoBoardView?boardId=${starList.star}">${starList.boardId}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="tab_item2">
        <ul class="item2">
            <li><a href="#">CSS3 Transition</a></li>
            <li><a href="#">CSS3 Animation</a></li>
            <li><a href="#">CSS3 Border</a></li>
            <li><a href="#">CSS3 Box</a></li>
        </ul>
	</div>
	</div>
</div>
