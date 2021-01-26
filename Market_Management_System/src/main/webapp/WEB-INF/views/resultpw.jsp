<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
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
<body>
<script type="text/javascript">
function passchk(){
	var pw = document.getElementById("pw");
	var passwordchk = document.getElementById("passwordchk");
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$/;
	var regExp = /\s/g;
	var rtn = false;
	if(pw.value==""||passwordchk.value==""){
		alert("변경하실 비밀번호를 입력해주세요");
		return rtn;
	}else if(!pwReg.test(pw.value) || regExp.test(pw.value)){
		alert("비밀번호는 영어와 숫자 포함 8~20자 만 입력할 수 있습니다.");
		return rtn;
	}else if(pw.value!=passwordchk.value){
		alert("비밀번호가 일치하지 않습니다.");
		return rtn;
	}else{
		rtn = true;
	}
	return rtn;
}
</script>
<div id="container">
<form action="./findpwform.do" method="post" onsubmit="return passchk()">
<input type="hidden" value="${findid}" name="id">
<h3 style="text-align: center; margin-bottom: 30px;">새 비밀번호 입력</h3>
<table>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" id="pw" name="pw" placeholder="새 비밀번호를 입력해주세요" maxlength="20">
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td>
			<input type="password" id="passwordchk" name="passwordchk" placeholder="비밀번호 확인" maxlength="20">
		</td>
	</tr>
</table>
<p style="color: red" id="passwordchk">비밀번호는 영어와 숫자 포함 8~20자 만 입력할 수 있습니다.</p>
<input class="btn btn-warning" type="submit" value="비밀번호 수정">
</form>
</div>
</body>
</html>