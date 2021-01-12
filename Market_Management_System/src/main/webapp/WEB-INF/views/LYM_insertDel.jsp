<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 등록</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
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
<body>
<h1>배송지 등록</h1>
<div id="container">
	<form action="./insertDel.do" method="post">
		<table class="tbl_delivery_info">
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
                     	<input type="text" id="phone" name="phone" maxlength="3">
                     	<input type="text" id="phone" name="phone" maxlength="4">
                     	<input type="text" id="phone" name="phone" maxlength="4">
                    </td>
                </tr>      
             </tbody>
         </table>
         <input class="btn-success btn btn-primary" type="button" value="등록" onclick="insertDel()">
         <input class="btn-success btn btn-primary" type="button" value="취소" onclick="back()">
	</form>
</div>
</body>
<script type="text/javascript">
function insertDel(){
	
		var form = document.forms[0];
		var dname = document.getElementById("dname");
		var roadaddr = document.getElementById("roadaddr");
		var addr = document.getElementById("addr");
		var phone = document.getElementById("phone");
		
		
		if (dname.value == "" || roadaddr.value == "" || addr.value == "" || phone.value == "") {
			alert("필수 값을 입력해 주세요");
		} else {
			form.submit();
		}
}

function back(){
	history.back(-1);
}
</script>

</html>