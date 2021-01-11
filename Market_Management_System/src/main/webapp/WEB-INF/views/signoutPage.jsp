<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function signoutuser(){
		var pw = document.getElementById("pw").value;
		var rtn = false;
		if(pw==""){
			alert("비밀번호를 입력해주세요");
			return rtn;
		}else{
			$.ajax({
				url:"./signoutuserchk.do",
	    		type:"post",
	    		data:{"pw":pw},
	    		async: false,
	    		success:function(msg){
	    			if(msg==""){
	    				alert("비밀번호를 확인해 주세요");
	    				return rtn;
	    			}else{
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
<form action="./signoutuser.do" method="post" onsubmit="return signoutuser()">
	<div>
		<input type="password" id="pw" name="pw">
	</div>
	<div>
		<input type="submit" value="확인">
	</div>
</form>
</body>
</html>