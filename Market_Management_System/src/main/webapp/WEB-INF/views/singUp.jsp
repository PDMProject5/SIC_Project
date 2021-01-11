<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript" src="./js/login.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
<form action="./newSingup.do" method="post" onsubmit="return singup()">
	<h1>회원가입</h1>
	<div>
		<input type="text" id="id" name="id" placeholder="ID" readonly="readonly">
		<input type="button" value="중복확인" onclick="idchk()">
	</div>
	<div>
		<input type="text" name="name" id="name" placeholder="Name">
	</div>
	<div>
		<input type="password" id="pw" name="pw" placeholder="Password">
		<p style="color: red" id="passwordchk">비밀번호는 영어와 숫자 포함 8~20자 만 입력할 수 있습니다.</p>
	</div>
	<div>
		<input type="password" id="pwchk" name="pwchk" placeholder="PasswordCheck">
		<p style="color: red" id="passchk">비밀번호가 일치하지 않습니다.</p>
	</div>
	<div>
		<input type="text" id="roadaddr" name="roadaddr"  placeholder="주소" readonly="readonly">
		<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
		<input type="text" id="addr" name="addr" placeholder="상세주소">
	</div>
	<div>
		<input type="text" id="phone" name="phone" placeholder="Phone" readonly="readonly">
		<input type="button" value="휴대폰 인증" onclick="phonechk()">
	</div>
	<div>
		<input type="checkbox" id="marketing" name="marketing">
			<label for="marketing">
				개인정보 및 마케팅 수신 동의
			</label>
	</div>
	<div>
		<input type="button" value="뒤로가기" onclick="main()">
		<input type="submit" value="회원가입">
	</div>
</form>
</body>
</html>