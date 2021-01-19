onload = function(){
	document.getElementById("idchk").style.display = "none";
	document.getElementById("namechk").style.display = "none";
	document.getElementById("passchk").style.display = "none";
	document.getElementById("roadaddrchk").style.display = "none";
	document.getElementById("addrchk").style.display = "none";
	document.getElementById("phonechk").style.display = "none";
	document.getElementById("marketingchk").style.display = "none";
}

function idchk(){
	window.open("./idchk.do","아이디 중복 검사","width=500px, height=500px");
}

function singup(){
	var id = document.getElementById("id").value;
	var username = document.getElementById("username").value;
	var pw = document.getElementById("pw").value;
	var pwchk = document.getElementById("pwchk").value;
	var roadaddr = document.getElementById("roadaddr").value;
	var addr = document.getElementById("addr").value;
	var phone = document.getElementById("phone").value;
	var marketing = document.getElementById("marketing").checked;
	var passwordchk = document.getElementById("passwordchk");
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{7,20}$/;
	document.getElementById("idchk").style.display = "none";
	document.getElementById("namechk").style.display = "none";
	document.getElementById("passwordchk").style.display = "none";
	document.getElementById("passchk").style.display = "none";
	document.getElementById("roadaddrchk").style.display = "none";
	document.getElementById("addrchk").style.display = "none";
	document.getElementById("phonechk").style.display = "none";
	document.getElementById("marketingchk").style.display = "none";
	if(id==""){
		document.getElementById("idchk").style.display = "block";
		return false;
	}else if(username==""){
		document.getElementById("namechk").style.display = "block";
		return false;
	}else if(pw==""||!pwReg.test(pw)){
		document.getElementById("passwordchk").style.display = "block";
		return false;
	}else if(pw != pwchk){
		document.getElementById("passchk").style.display = "block";
		return false;
	}else if(roadaddr==""){
		document.getElementById("roadaddrchk").style.display = "block";
		return false;
	}else if(addr==""){
		document.getElementById("addrchk").style.display = "block";
		return false;
	}
	else if(phone==""){
		document.getElementById("phonechk").style.display = "block";
		return false;
	}
	else if(marketing == false){
		document.getElementById("marketingchk").style.display = "block";
		return false;
	}else{
		alert("회원가입이 완료되었습니다.");
		return true;
	}
}



function phonechk(){
	window.open("./phonechk.do","휴대폰 인증","width=500px, height=500px");
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
            
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("roadaddr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr").focus();
        }
    }).open();
}



function main(){
	location.href = "./main.do";
}