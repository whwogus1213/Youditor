<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta name="description" content="">
	<meta name="author" content="">

	<style type="text/css">

	</style>

	<jsp:include page="../module/header.jsp" flush="false"/>
	
	<link href="/resources/css/join.css" rel="stylesheet">

	<title>회원 가입 - YouDitor</title>

</head>

<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
<div id="progress"></div>

<div class="center">
  <div id="register">

    <i id="progressButton" class="ion-android-arrow-forward next"></i>

    <div id="inputContainer">
      <input id="inputField" required autofocus />
      <label id="inputLabel"></label>
      <div id="inputProgress"></div>
    </div>

  </div>
</div>

	<jsp:include page="../module/bottom.jsp" flush="false"/>



<script type="text/javascript">
/**
 * 회원가입 javascript
 */

var questions = [
// 	  {question:"프로필 사진을 올려주세요", type: "file"},
	  {question:"이메일을 입력하세요", pattern: /^[^\s@]+@[^\s@]+\.[^\s@]+$/},
	  {question:"비밀번호를 입력하세요", type: "password"},
	  {question:"닉네임을 정해주세요"},
	  {question:"자신을 소개해주세요"},
	]

	$(function(){

	  var tTime = 100  // transition transform time from #register in ms
	  var wTime = 200  // transition width time from #register in ms
	  var eTime = 1000 // transition width time from inputLabel in ms

	  // init
	  // --------------
	  var position = 0

	  putQuestion()

	  progressButton.addEventListener('click', validate)
	  inputField.addEventListener('keyup', function(e){
	    transform(0, 0) // ie hack to redraw
	    if(e.keyCode == 13) {
		    if(position == 0) { // email 중복 체크
		    	$.ajax({
	  				async: true,
	  				type: "POST",
	  				data: inputField.value,
	  				url: "checkEmail.do",
	  				dataType : "json",
	  				contentType: "application/json; charset=UTF-8",
	  				success: function (data) {
	  			        if(data.cnt > 0) {
							var tempLabel = $($("#inputLabel").clone());
							
							inputLabel.innerHTML = "이미 존재하는 이메일"
							$("#inputLabel").css("color","red");
							setTimeout(function() {
								inputLabel.innerHTML = tempLabel.html();
								$("#inputLabel").css("color",tempLabel.css("color"));
							}, 1000)
								
							wrong();
							
	  			        } else {
	  			        	validate()
		  			    }
	  			        
	  				},
	  				error : function(error) {
	  					alert("error : " + error);
	  				}
	  			});
	  			
			} else if(position == 2){
				$.ajax({
	  				async: true,
	  				type: "POST",
	  				data: inputField.value,
	  				url: "checkNickname.do",
	  				dataType : "json",
	  				contentType: "application/json; charset=UTF-8",
	  				success: function (data) {
	  			        if(data.cnt > 0) {
							var tempLabel = $($("#inputLabel").clone());
							
							inputLabel.innerHTML = "이미 존재하는 닉네임"
							$("#inputLabel").css("color","red");
							setTimeout(function() {
								inputLabel.innerHTML = tempLabel.html();
								$("#inputLabel").css("color",tempLabel.css("color"));
							}, 1000)
							wrong();
	  						
	  			        } else {
	  						validate()
	  			        }
	  				},
	  				error : function(error) {
	  					alert("error : " + error);
	  				}
	  			});
			} else {
				validate()
			}
	    }
	  })

	  // functions
	  // --------------

	  // load the next question
	  function putQuestion() {
	    inputLabel.innerHTML = questions[position].question
	    inputField.value = ''
	    inputField.type = questions[position].type || 'text'  
	    inputField.focus()
	    showCurrent()
	  }
	  
	  // when all the questions have been answered
	  function done() {

		  $.ajax({
		        type:'POST',
		        url : "/accounts/insertAccountsPro",
		        data: {
						"email" : questions[0].value, 
						"pwd" : questions[1].value, 
						"nickname" : questions[2].value, 
						"footer" : questions[3].value, 
			        },
		        success : function(){

			        setTimeout(function() {
						window.location.href = "/";
			        }, 2000);
		        },
		        error:function(request,status,error){
			        alert("가입 실패");
			        window.location.href = "/";
		       }
		        
		    });

		  
		
	    // remove the box if there is no next question
	    register.className = 'close'
	    
	    // add the h1 at the end with the welcome text
	    var h1 = document.createElement('h1')
	    h1.appendChild(document.createTextNode('Welcome ' + questions[2].value + '!'))
	    h1.appendChild(document.createElement('br'));
	    h1.appendChild(document.createTextNode('이메일 인증후 가입이 완료됩니다.'))
	    setTimeout(function() {
	      register.parentElement.appendChild(h1)     
	      setTimeout(function() {h1.style.opacity = 1}, 50)
	    }, eTime)
	    
	  }

	  // when submitting the current question
	  function validate() {

	    // set the value of the field into the array
	    questions[position].value = inputField.value
	    
	    console.log(questions[position].value)

	    // check if the pattern matches
	    if (!inputField.value.match(questions[position].pattern || /.+/)) wrong()
	    else ok(function() {
	      
	      // set the progress of the background
	      progress.style.width = ++position * 100 / questions.length + 'vw'

	      // if there is a new question, hide current and load next
	      if (questions[position]) hideCurrent(putQuestion)
	      else hideCurrent(done)
	             
	    })

	  }

	  // helper
	  // --------------

	  function hideCurrent(callback) {
	    inputContainer.style.opacity = 0
	    inputProgress.style.transition = 'none'
	    inputProgress.style.width = 0
	    setTimeout(callback, wTime)
	  }

	  function showCurrent(callback) {
	    inputContainer.style.opacity = 1
	    inputProgress.style.transition = ''
	    inputProgress.style.width = '100%'
	    setTimeout(callback, wTime)
	  }

	  function transform(x, y) {
	    register.style.transform = 'translate(' + x + 'px ,  ' + y + 'px)'
	  }

	  function ok(callback) {
	    register.className = ''
	    setTimeout(transform, tTime * 0, 0, 10)
	    setTimeout(transform, tTime * 1, 0, 0)
	    setTimeout(callback,  tTime * 2)
	  }

	  function wrong(callback) {
	    register.className = 'wrong'
	    for(var i = 0; i < 6; i++) // shaking motion
	      setTimeout(transform, tTime * i, (i%2*2-1)*20, 0)
	    setTimeout(transform, tTime * 6, 0, 0)
	    setTimeout(callback,  tTime * 7)
	  }

	}())
</script>

</body>
</html>
