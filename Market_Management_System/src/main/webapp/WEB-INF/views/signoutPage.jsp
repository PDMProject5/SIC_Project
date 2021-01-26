<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<%@ include file="./header.jsp" %>
<style type="text/css">
#container{
	width: 450px;
	text-align: center;
	margin: 0 auto;
}
input[type="password"]{
	width: 100%;
	border-radius: 8px;
}
input[type="button"]{
	width: 90%;
	height: 100%;
}
</style>
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
<div id="container">
<h1 style="color: orange; text-align: center; margin-bottom: 180px;">회원탈퇴</h1>
<form action="./signoutuser.do" method="post" onsubmit="return signoutuser()">
	<div>
		<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해 주세요">
	</div>
	<div>
		<input style="margin-top: 100px;" class="btn btn-warning" type="submit" value="확인">
	</div>
</form>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>