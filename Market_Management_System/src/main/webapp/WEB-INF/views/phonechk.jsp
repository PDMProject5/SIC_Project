<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 인증</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
#container{
	width: 450px;
	margin: 0 auto;
}
input[type="text"]{
	border-radius: 8px;
}
p{
	text-align:left;
	font-size: small;
}
</style>
</head>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>

<body>
<h3 style="text-align: center;">휴대폰 인증</h3>
<div id="container">
<input type="text" id="inputPhoneNumber" maxlength="11" placeholder="휴대폰 번호를 입력해 주세요."/> <!-- 전화번호 입력칸 -->
<input class="btn btn-warning" type="button" id="sendPhoneNumber" value='전송'/><br> <!-- 위의 전화번호로 인증메세지 전송버튼 -->
<input type="text" id="inputCertifiedNumber"> <!-- 인증번호 적는칸 -->
<input class="btn btn-warning" type="button" id="checkBtn" value="확인"> <!-- 인증번호 확인 버튼 -->
<input class="btn btn-success" type="button" value="사용하기" id="use" onclick="usephone()">
</div>
<script>
window.onload = function(){
	var inputCertifiedNumber = document.getElementById("inputCertifiedNumber");
	var checkBtn = document.getElementById("checkBtn");
	var sendPhoneNumber = document.getElementById("sendPhoneNumber");
	inputCertifiedNumber.style.display = "none";
	checkBtn.style.display = "none";
	document.getElementById("use").style.display = "none";
}
        $('#sendPhoneNumber').click(function(){
        	let regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{4}-?[0-9]{4}$/;
            let phoneNumber = $('#inputPhoneNumber').val();
            if(!regExp.test(phoneNumber)){
            	alert("-를 제외한 올바른 휴대폰 번호를 입력해주세요");
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
                    $('#checkBtn').click(function(){
                    	if($('#inputCertifiedNumber').val()=='') {
                    		alert('값을 입력하세요.');
                    	} else if($.trim(res) ==$('#inputCertifiedNumber').val()){
                    		alert('인증성공!'+'휴대폰 인증이 정상적으로 완료되었습니다.'+'success');
			        		checkBtn.style.display = "none";
			        		document.getElementById("use").style.display = "block";
                        }else if($.trim(res) !=$('#inputCertifiedNumber').val()){
                        	alert('인증번호가 맞지 않습니다.');
                        }
                    });
                }
            });
        }
    });
       function usephone(){
    	   opener.document.getElementById("phone").value = document.getElementById("inputPhoneNumber").value
    		close();
       }
</script>
</body>
</html>