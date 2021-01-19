<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function passchk(){
	var pw = document.getElementById("pw");
	var passwordchk = document.getElementById("passwordchk");
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{7,20}$/;
	var rtn = false;
	if(pw.value==""||passwordchk.value==""){
		alert("변경하실 비밀번호를 입력해주세요");
		return rtn;
	}else if(!pwReg.test(pw.value)){
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
<form action="./findpwform.do" method="post" onsubmit="return passchk()">
<input type="hidden" value="${findid}" name="id">
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
<input type="submit" value="비밀번호 수정">
</form>
</body>
</html>