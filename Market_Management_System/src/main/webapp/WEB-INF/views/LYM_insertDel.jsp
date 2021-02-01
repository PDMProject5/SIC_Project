<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

#container{
	margin: 30px auto;
	text-align: center;
}

#del{
	margin: 10px auto;
	
}

#delcap{
	margin-bottom: 50px;
}

</style>
<title>배송지 등록</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                var addr = ''; // 주소 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("roadaddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr").focus();
            }
        }).open();
    }
</script>




</head>
<%@ include file="./header.jsp" %>
<body>
<div id="container">
<h1 id="delcap">배송지 등록</h1>
	<form action="./insertDel.do" method="post">
		<table id="del" class="tbl_delivery_info">
                <tbody>
                <tr>
                    <th class="cell_title">배송지명</th>
                    <td>   
                    	<input type="text" id="dname" name="dname" value="" maxlength="150">
                    </td>
                </tr>
    
                <tr>
                    <th class="cell_title">도로명 주소</th>
                    <td>
                    	<input type="text" id="roadaddr" name="roadaddr" placeholder="도로명 주소" readonly="readonly">
					</td>
					<td>
						<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
					</td>
				</tr>
				
				<tr>
					<th>상세 주소</th>			
                     <td class="cell_title">  
                     	<input type="text" id="addr" name="addr" placeholder="상세주소">
                    </td>
                </tr>
                
                <tr>
					<th>전화번호</th>			
                     <td class="cell_title">  
                     	<input type="text" id="phone" name="phone" maxlength="11">
                    </td>
                </tr>      
             </tbody>
         </table>
         <input class="btn-success btn btn-primary" id="delb" type="button" value="등록" onclick="insertDel()">
         <input class="btn-success btn btn-primary" id="delb" type="button" value="취소" onclick="back()">
	</form>
</div>
</body>
<%@ include file="./footer.jsp" %>
<script type="text/javascript">
function insertDel(){
	
		var form = document.forms[0];
		var dname = document.getElementById("dname");
		var roadaddr = document.getElementById("roadaddr");
		var addr = document.getElementById("addr");
		var phone = document.getElementById("phone");
		var phonechk = document.getElementById("phone").value;
		var phonereg = /^\d{10,11}$/;
		
		if (dname.value == "" || roadaddr.value == "" || addr.value == "" || phone.value == "") {
			alert("필수 값을 입력해 주세요");
		}else if(!phonereg.test(phonechk)){
			alert("정확한 휴대폰 번호를 입력해주세요.");
		}else {
			form.submit();
		}
}

function back(){
	history.back(-1);
}
</script>

</html>