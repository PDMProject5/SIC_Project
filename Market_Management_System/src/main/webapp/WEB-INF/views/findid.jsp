<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
#container{
	width: 450px;
	margin: 0 auto;
}
input[type="text"]{
	border-radius: 8px;
}
</style>
</head>
<body>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>

<body>
<div id="container">
<h3 style="text-align: center; margin-bottom: 50px;">아이디 찾기</h3>
<form id="findid" action="./resultid.do" method="post">
<input type="text" id="username" name="name" placeholder="이름을 입력해 주세요"><br>
<input type="text" id="inputPhoneNumber" name="phone" placeholder="핸드폰 번호를 입력해주세요" maxlength="11"/> <!-- 전화번호 입력칸 -->
<input class="btn btn-warning" type="button" id="sendPhoneNumber" value='전송'/><br> <!-- 위의 전화번호로 인증메세지 전송버튼 -->
<input type="text" id="inputCertifiedNumber" maxlength="4"> <!-- 인증번호 적는칸 -->
<input class="btn btn-warning" type="button" id="checkBtn" value="확인"> <!-- 인증번호 확인 버튼 -->
</form>
<div id="nodata" style="color: red;">${nodata}</div>
</div>
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
var sendPhoneNumber = document.getElementById("sendPhoneNumber");
        $('#sendPhoneNumber').click(function(){
        	let regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{4}-?[0-9]{4}$/;
            let phoneNumber = $('#inputPhoneNumber').val();
            nodata.style.display = "none";
            if(username.value == ""){
            	alert("이름을 입력해 주세요");
            	username.focus();
            }else if(!regExp.test(phoneNumber)){
            	alert("-를 재외한 휴대폰번호 11자리를 확인해 주세요");
            	phoneNumber.focus();
            }else{
            	inputCertifiedNumber.style.display = "block";
                checkBtn.style.display = "block";
                sendPhoneNumber.style.display = "none";
            	alert('인증번호 발송 완료!');
            $.ajax({
                type: "POST",
                url: "./sendSMS.do",
                data: {"phoneNumber" : phoneNumber}, // 핸드폰 값이 넘어감
                success: function(res){ // 인증번호 값이 넘어옴
                    inputCertifiedNumber.style.display = "block";
                    checkBtn.style.display = "block";
                    $('#checkBtn').click(function(){
                    	if($('#inputCertifiedNumber').val()=='') {
                    		alert('값을 입력하세요.');
                    	}else if($.trim(res) ==$('#inputCertifiedNumber').val()){
                            // 타이머가 활성화 되어있고 값이 정확히 입력되었을 때
                    		alert('인증성공!'+'휴대폰 인증이 정상적으로 완료되었습니다.'+'success');
			        		findid.submit();
                        }else if($.trim(res) !=$('#inputCertifiedNumber').val()){
                        	alert("인증번호가 맞지 않습니다.");
                        }
                    });
                }
            });
        }
    });
</script>
</body>
</html>