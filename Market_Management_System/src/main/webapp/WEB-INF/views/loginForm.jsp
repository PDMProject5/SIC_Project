<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="./header.jsp" %>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function login(){
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		var sellerlogin = document.getElementById("sellerlogin");
		var rtn = false;
		if(id==""){
			alert("아이디를 입력해주세요");
			return rtn;
		}else if(pw==""){
			alert("비밀번호를 입력해 주세요");
			return rtn;
		}else if(sellerlogin.checked == false){
			$.ajax({
				url:"./loginchk.do",
	    		type:"post",
	    		data:{"id":id,"pw":pw},
	    		async: false,
	    		success:function(msg){
	    			var judgment = document.getElementById("judgment");
	    			if(msg == ""){
	    				alert("아이디와 비밀번호를 확인해주세요");
					}else if(msg != ""){
						judgment.value = "user";
						rtn = true;
					}
	    		},
	    			
	    		error:function(request,status,error){
	    	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	    	       }
			});
		}
		else if(sellerlogin.checked == true){
			$.ajax({
				url:"./sellerloginchk.do",
	    		type:"post",
	    		data:{"sellerid":id,"sellerpw":pw},
	    		async: false,
	    		success:function(msg){
	    			var judgment = document.getElementById("judgment");
	    			if(msg == ""){
	    				alert("아이디와 비밀번호를 확인해주세요");
					}else if(msg != ""){
						judgment.value = "seller";
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
			<form action="./login.do" method="post" onsubmit="return login()">
				<input type="hidden" id="judgment" name="judgment">
				<table border="1">
					<tr>
						<td>
							<label>아이디</label>
						</td>
						<td>
							<input type="text" name="id" id="id" placeholder="ID">
						</td>
						<td rowspan="3">
							<input type="submit" value="로그인">
						</td>
					</tr>
					<tr>
						<td>
							<label>비밀번호</label>
						</td>
						<td>
							<input type="password" name="pw" id="pw" placeholder="Password">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" id="sellerlogin" name="sellerlogin">
								<label for="sellerlogin">
								판매자 로그인
								</label>
						</td>
					</tr>
				</table>
			</form>
			<div>
				<button onclick="location.href='./singUp.do'">회원가입</button>
				<button onclick="window.open('./findid.do','아이디 찾기','width=500px, height=500px')">아이디 찾기</button>
				<button onclick="window.open('./findpw.do','비밀번호 찾기','width=500px, height=500px')">비밀번호 찾기</button>
			</div>
<%@ include file="./footer.jsp" %>
</body>
</html>