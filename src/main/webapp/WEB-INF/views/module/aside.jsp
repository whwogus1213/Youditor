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
		
	});
	</script>
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
