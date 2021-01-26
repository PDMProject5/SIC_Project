<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="./header.jsp" %>
<style type="text/css">
p{
	margin-bottom: 0px;
	margin-top: 0px;
}
form{
	text-align: center;
}

.usm-join-box {
	height: 120px;
	margin-top: 3px;
	margin-bottom: 30px;
	padding: 10px;
	border: 1px solid #E1E1E3;
	overflow-y: scroll;
	background-color: #fff;
}
label {
	text-align: left;
}
#container{
	width: 750px;
	text-align: center;
	margin: 0 auto;
}
table{
	width: 60%;
	margin: 30px auto;
	text-align: center;
}
input[type="text"]{
	width: 100%;
	border-radius: 8px;
}
input[type="password"]{
	width: 100%;
	border-radius: 8px;
}
input[type="button"]{
	width: 90%;
	height: 100%;
}
th,td{
	padding-bottom: 2px;
	padding-top: 2px;
}
p{
	text-align: left;
}
</style>
</head>
<script type="text/javascript" src="./js/login.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
<div id="container">
<form action="./newSingup.do" method="post" onsubmit="return singup()">
	<h1>회원가입</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id" name="id" placeholder="ID" readonly="readonly">
			</td>
			<td>
				<input class="btn btn-warning" type="button" value="중복확인" onclick="idchk()">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p style="color: red;"id="idchk">아이디를 입력해 주세요</p>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="2">
				<input type="text" name="name" id="username" placeholder="Name" style="width: 100%">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p style="color: red" id="namechk">이름을 입력해 주세요</p>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td colspan="2">
				<input type="password" id="pw" name="pw" placeholder="Password" maxlength="20">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p style="color: red" id="passwordchk">비밀번호는 영어와 숫자를 조합한8~20자리만 입력할 수 있습니다.</p>
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td colspan="2">
				<input type="password" id="pwchk" name="pwchk" placeholder="PasswordCheck" maxlength="20">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p style="color: red;" id="passchk">비밀번호가 일치하지 않습니다.</p>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="roadaddr" name="roadaddr"  placeholder="주소" readonly="readonly">
			</td>
			<td>
				<input class="btn btn-warning" type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p style="color: red;" id="roadaddrchk">도로명 주소를 입력해 주세요</p>
			</td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td colspan="2">
				<input type="text" id="addr" name="addr" placeholder="상세주소">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p style="color: red;" id="addrchk">상세 주소를 입력해 주세요</p>
			</td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td>
				<input type="text" id="phone" name="phone" placeholder="Phone" readonly="readonly">
			</td>
			<td>
				<input class="btn btn-warning" type="button" value="휴대폰 인증" onclick="phonechk()">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p style="color: red;" id="phonechk">휴대폰 번호를 입력해 주세요</p>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: left;">
			<input type="checkbox" id="marketing" name="marketing">
				<label for="marketing">
					개인정보 및 마케팅 수신 동의
				</label>
			</td>
		</tr>
		<tr>
			<td colspan="1">
				<p style="color: red;" id="marketingchk">개인정보 및 마케팅 수신 동의 체크박스를 체크해주세요</p>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<div class="usm-join-box">
					<dl>
						<dt>
							<strong>개인정보보호법 제15조(개인정보의 수집·이용)에 의거 홈페이지 회원가입을 위한
								개인정보를 다음과 같이 수집·이용하고자 합니다.</strong><br>
						</dt>
						<dt>
							<strong>[개인정보의 수집 및 이용 목적]</strong>
						</dt>
						<dd>충청북도학교통합홈페이지는 다음과 같은 목적을 위하여 개인정보를 수집, 이용합니다.</dd>
						<dd>- 충청북도학교통합홈페이지 통합 회원관리</dd>
						<dd>- 제한적 본인 확인제에 따른 본인확인, 비밀번호 분실 시 본인확인 등</dd>
						<dd>- 개인식별, 부정이용 방지, 비인가 사용방지, 가입의사 확인</dd>
						<dd>- 만14세 미만 회원의 법정 대리인 동의여부 확인</dd>
						<dd>- 불만처리 등 민원처리, 공지사항 전달</dd>

						<dt>
							<strong>[개인정보 수집에 관한 사항]</strong>
						</dt>
						<dd>① 필수항목 : 이름, 아이디, 비밀번호, 학년반(학생), 본인확인인증정보, 14세미만 법정대리인
							인증정보</dd>
						<dd>② 선택항목 : 생년월일, 졸업년도(졸업생)</dd>

						<dt>
							<strong>[개인정보 보유 및 이용기간]</strong>
						</dt>
						<dd class="usm-clr-blue">귀하께서 입력하신 개인정보는 2년간 보유되며, 가입 후 매 2년이
							되는 시점에 회원의 동의에 의해 그 기간은 연장되며, 회원 탈퇴시 개인정보는 그 즉시 삭제됩니다.</dd>
						<dd class="usm-clr-blue">삭제 요청 및 홈페이지 탈퇴 시 까지의 개인정보는 회원으로 가입
							한 학교와 충청북도교육연구정보원 개인정보처리방침에 의거 보유 및 이용됩니다.</dd>
						<dd class="usm-clr-blue">다만, 탈퇴자의 아이디는 동일한 아이디의 중복 가입을 방지하기
							위해 보존하며, 기타 관계법령의 규정에 의하여 보존할 필요가 있는 경우 관계법령에 따릅니다.</dd>

						<dt>
							<strong>[개인정보 수집·이용에 대한 동의를 거부할 권리]</strong>
						</dt>
						<dd>귀하께서는 상기의 개인정보 수집 및 이용에 대하여 동의를 거부할 수 있습니다.</dd>
						<dd>필수항목의 경우 회원 가입 시 필요한 항목으로 동의 거부 시 회원가입이 제한되며, 선택 항목은 동의하지
							않아도 회원가입 및 서비스 거부를 하지 않습니다.(선택항목에 대하여 차후에 회원정보수정을 통하여 정보를 입력할 수
							있으며 입력된 항목은 동의를 한 것으로 간주 합니다.)</dd>
					</dl>
				</div>
			</td>
		</tr>
	</table>
		<input class="btn btn-warning" style="width: 150px; margin-right: 50px;" type="button" value="뒤로가기" onclick="main()">
		<input class="btn btn-warning" style="width: 150px;" type="submit" value="회원가입">
</form>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>