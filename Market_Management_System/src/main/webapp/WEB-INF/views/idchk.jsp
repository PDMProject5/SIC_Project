<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
</head>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
<script type="text/javascript">
onload = function(){
	document.getElementById("use").style.display = "none";
}
function duplicate(){
	var id = document.getElementById("id").value;
	var idReg = /^(?=.*^[a-zA-Z])(?=.*[0-9]).{5,20}$/;
	if(id == ""){
		alert("아이디를 입력해 주세요");
	}else if(!idReg.test(id)) {
        alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
        $('#log').css({'display':'block', 'color':'black'});
        $('#log').html("<span style='color: red;'>&#42;</span>아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
        document.getElementById("use").style.display = "none";
    }else{
    	$.ajax({
    		url:"./duplicate.do",
    		type:"post",
    		data:"id="+id,
    		async: true,
    		success:function(msg){
    			if(msg == ""){
    				$('#log').html('사용가능한 아이디 입니다.');
					$('#log').css('color','green');
					document.getElementById("log").style.display = "block";
					document.getElementById("use").style.display = "block";
				}else if(msg != ""){
					document.getElementById("log").style.display = "block";
					$('#log').html('사용불가능한 아이디 입니다.');
					$('#log').css('color','red');
					document.getElementById("use").style.display = "none";
				}
    		},
    			
    		error:function(request,status,error){
    	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
    	       }
    	});
    }
}
function useid(){
	opener.document.getElementById("id").value = document.getElementById("id").value
	close();
}
</script>
<body>
<form action="">
	<h1>아이디 중복체크</h1>
	<div>
	<input type="text" id="id" name="id" placeholder="ID">
	<input type="button" value="중복 확인" onclick="duplicate()">
	<p id="log"><span style="color: red;">&#42;</span>아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.</p>
	</div>
	<div>
	<input type="button" value="사용하기" id="use" onclick="useid()">
	</div>
</form>
</body>
</html>