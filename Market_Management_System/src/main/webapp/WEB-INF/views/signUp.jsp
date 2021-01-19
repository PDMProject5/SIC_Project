<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
p{
	margin-bottom: 0px;
	margin-top: 0px;
}
</style>
</head>
<script type="text/javascript" src="./js/login.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
<form action="./newSingup.do" method="post" onsubmit="return singup()">
	<h1>회원가입</h1>
	<div>
		<input type="text" id="id" name="id" placeholder="ID" readonly="readonly">
		<input type="button" value="중복확인" onclick="idchk()">
		<p style="color: red" id="idchk">아이디를 입력해 주세요</p>
	</div>
	<div>
		<input type="text" name="name" id="username" placeholder="Name">
		<p style="color: red" id="namechk">이름을 입력해 주세요</p>
	</div>
	<div>
		<input type="password" id="pw" name="pw" placeholder="Password" maxlength="20">
		<p style="color: red" id="passwordchk">비밀번호는 영어와 숫자를 조합한8~20자리만 입력할 수 있습니다.</p>
	</div>
	<div>
		<input type="password" id="pwchk" name="pwchk" placeholder="PasswordCheck" maxlength="20">
		<p style="color: red;" id="passchk">비밀번호가 일치하지 않습니다.</p>
	</div>
	<div>
		<input type="text" id="roadaddr" name="roadaddr"  placeholder="주소" readonly="readonly">
		<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
		<p style="color: red;" id="roadaddrchk">도로명 주소를 입력해 주세요</p>
		<input type="text" id="addr" name="addr" placeholder="상세주소">
		<p style="color: red;" id="addrchk">상세 주소를 입력해 주세요</p>
	</div>
	<div>
		<input type="text" id="phone" name="phone" placeholder="Phone" readonly="readonly">
		<input type="button" value="휴대폰 인증" onclick="phonechk()">
		<p style="color: red;" id="phonechk">휴대폰 번호를 입력해 주세요</p>
	</div>
	<div>
		<input type="checkbox" id="marketing" name="marketing">
			<label for="marketing">
				개인정보 및 마케팅 수신 동의
			</label>
		<p style="color: red;" id="marketingchk">개인정보 및 마케팅 수신 동의 체크박스를 체크해주세요</p>
	</div>
	<div>
		<input type="button" value="뒤로가기" onclick="main()">
		<input type="submit" value="회원가입">
	</div>
</form>
</body>
</html>