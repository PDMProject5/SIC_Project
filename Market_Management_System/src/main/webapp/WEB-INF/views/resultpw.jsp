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
function pwchk(){
	var pw = document.getElementById("password").value;
	var passwordchk = document.getElementById("passwordchk").value;
	var pwReg = /^[a-z]+[a-z0-9]{7,19}$/g;
	var rtn = false;
	if(pw==""||passwordchk==""){
		alert("변경하실 비밀번호를 입력해주세요");
		return rtn;
	}else if(!pwReg.test(pw)){
		alert("비밀번호는 영어와 숫자 포함 8~20자 만 입력할 수 있습니다.");
		return rtn;
	}else if(pw!=passwordchk){
		alert("비밀번호가 일치하지 않습니다.");
		return rtn;
	}else{
		rtn = true;
	}
	return rtn;
}
</script>
<form action="./findpwform.do" method="post" onsubmit="return pwchk()">
<input type="hidden" value="${findid}" name="id">
<table>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" id="pw" name="pw" placeholder="새 비밀번호를 입력해주세요">
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td>
			<input type="password" id="passwordchk" name="passwordchk" placeholder="비밀번호 확인">
		</td>
	</tr>
</table>
<p style="color: red" id="passwordchk">비밀번호는 영어와 숫자 포함 8~20자 만 입력할 수 있습니다.</p>
<input type="submit" value="비밀번호 수정">
</form>
</body>
</html>