<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>

<body>
<form id="findid" action="./resultid.do" method="post">
<input type="text" id="username" name="name" placeholder="이름을 입력해 주세요"><br>
<input type="text" id="inputPhoneNumber" name="phone" placeholder="핸드폰 번호를 입력해주세요"/> <!-- 전화번호 입력칸 -->
<input type="button" id="sendPhoneNumber" value='전송'/><br> <!-- 위의 전화번호로 인증메세지 전송버튼 -->
<input type="text" id="inputCertifiedNumber"> <!-- 인증번호 적는칸 -->
<input type="button" id="checkBtn" value="확인"> <!-- 인증번호 확인 버튼 -->
</form>
<div class="time"></div> <!-- 타이머 시간 표시 -->
<div id="nodata" style="color: red;">${nodata}</div>
<script>
window.onload = function(){
	var inputCertifiedNumber = document.getElementById("inputCertifiedNumber");
	var checkBtn = document.getElementById("checkBtn");
	inputCertifiedNumber.style.display = "none";
	checkBtn.style.display = "none";
}
var nodata = document.getElementById("nodata");
var username = document.getElementById("username");
var findid = document.getElementById("findid");
var timer = null;		// 타이머
var isRunning = false;	// 타이머 동작 확인용 변수
        $('#sendPhoneNumber').click(function(){
        	let regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
            let phoneNumber = $('#inputPhoneNumber').val();
            nodata.style.display = "none";
            if(username.value == ""){
            	alert("이름을 입력해 주세요");
            	username.focus;
            }else if(!regExp.test(phoneNumber)){
            	alert("-를 재외한 휴대폰번호 11자리를 확인해 주세요");
            	phoneNumber.focus;
            }else{
            inputCertifiedNumber.style.display = "block";
            checkBtn.style.display = "block";
            alert('인증번호 발송 완료!');
            var display = $('.time');
        	var leftSec = 180;
        	// 남은 시간
        	// 이미 타이머가 작동중이면 중지
        	if (isRunning){
        		clearInterval(timer);
        		display.html("");
        		startTimer(leftSec, display);
        	}else{
        		startTimer(leftSec, display);
        		
        	}

            var docum = document.getElementById("checkBtn").disabled;
            $.ajax({
                type: "POST",
                url: "./sendSMS.do",
                data: {"phoneNumber" : phoneNumber}, // 핸드폰 값이 넘어감
                success: function(res){ // 인증번호 값이 넘어옴
                    $('#checkBtn').click(function(){
                    	if($('#inputCertifiedNumber').val()=='') {
                    		alert('값을 입력하세요.');
                    	} else if(isRunning && $.trim(res) ==$('#inputCertifiedNumber').val()){
                            // 타이머가 활성화 되어있고 값이 정확히 입력되었을 때
                    		alert('인증성공!'+'휴대폰 인증이 정상적으로 완료되었습니다.'+'success');
							clearInterval(timer);
			        		display.html("");
			        		findid.submit();
                        }else{
                        	if(isRunning) {
                        		// 타이머가 활성화 되어있고 인증번호가 틀렸을때
	                        	alert('인증번호가 맞지 않습니다.');
                        	} else {
                        		// 타이머가 활성화 되어 있지 않을때
	                        	alert('시간이 초과되었습니다.');
                        	}
                        }
                    })
                }
            })
        }
    });
//--------------------타이머
        

            
        function startTimer(count, display) {
            		var minutes, seconds;
                    timer = setInterval(
        function () {
                    minutes = parseInt(count / 60, 10);
                    seconds = parseInt(count % 60, 10);
             
                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;
             
                    display.html(minutes + ":" + seconds);
             
                    // 타이머 끝
                    if (--count < 0) {
            	     clearInterval(timer);
            	     alert("시간초과");
            	     display.html("시간초과");
            	     $('#checkBtn').attr("disabled","disabled");
            	     isRunning = false;
                    }
                }, 1000);
                     isRunning = true;
        }
</script>
</body>
</html>