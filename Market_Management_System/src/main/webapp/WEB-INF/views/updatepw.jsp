<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function pwchk(){
		var nowpw = document.getElementById("nowpw").value;
		var modifypw = document.getElementById("modifypw").value;
		var modifypwchk = document.getElementById("modifypwchk").value;
		var rtn = false;
		if(nowpw==""){
			alert("현재 비밀번호를 입력해주세요");
			return rtn;
		}else if(modifypw==""||modifypwchk==""){
			alert("변경하실 비밀번호를 입력해주세요");
			return rtn;
		}else if(nowpw == modifypw){
			alert("현재 비밀번호와 다른 비밀번호를 입력해 주세요");
		}else if(nowpw!=""&&modifypw!=""&&modifypwchk!=""){
			$.ajax({
				url:"./nowpwcheck.do",
	    		type:"post",
	    		data:{"pw":nowpw},
	    		async: false,
	    		success:function(msg){
	    			var modifypw = document.getElementById("modifypw").value;
	    			var modifypwchk = document.getElementById("modifypwchk").value;
	    			var pwReg = /^[a-z]+[a-z0-9]{7,19}$/g;
	    			var regExp = /\s/g;
	    			if(msg==""){
	    				alert("현재 비밀번호를 확인해 주세요");
	    				return rtn;
	    			}else if(modifypw!=modifypwchk){
	    				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	    				return rtn;
	    			}else if(!pwReg.test(modifypw) || regExp.test(modifypw)){
	    				alert("비밀번호는 영어와 숫자 포함 8~20자 만 입력할 수 있습니다.");
	    			}else if(msg!=""&&modifypw==modifypwchk){
	    				alert("비밀번호가 수정됬습니다.");
	    				rtn = true;
	    			}
	    		},
	    		error:function(request,status,error){
	    	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	    	       }
			});
		}
		return rtn;
	}
</script>
<body>
<form action="./modifypw.do" method="post" onsubmit="return pwchk()">
	<table>
		<tr>
			<td>현재 비밀번호</td>
			<td>
				<input type="password" id="nowpw" name="nowpw">
			</td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
			<td>
				<input type="password" id="modifypw" name="modifypw">
			</td>
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
			<td>
				<input type="password" id="modifypwchk" name="modifypwchk">
			</td>
		</tr>
	</table>
	<input type="submit" value="변경하기">
</form>
</body>
</html>