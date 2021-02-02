<%@page import="com.sic.pdm.vo.mileage.MileageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<head>
<meta charset="UTF-8">
<title>주문/결제 페이지</title>
<style type="text/css">
	div{
/* 		text-align: center; */
	}
	table{
		margin: auto; 
	margin-top:10px; 
	margin-bottom: 50px;
	}
	.total{
		margin: auto;
		margin-bottom: 100px;
		width: 60%;
	}
	.del1{
		text-align: center;
	}
	.delth{
		width: 100px;
	}
	td{
		margin: auto;
		width: 100px;
	}
	#th{
	background-color : beige;
	text-align:center; 
	color:#8A6F24; 
	height: 30px;
	width: 30px;
	
	/* 	background-color: beige; */
	/* 	text-align: center; */
	/* 	height: 70px; */
	/* 	width: 100px; */
	}
	#th1{
		background-color : beige;
		text-align:center; 
		color:black; 
		height: 50px;
		width: 50px;
		font-size: 30px;
	}
	.th{
	margin : auto;
		background-color : beige;
		text-align:center; 
		color:#8A6F24; 
		width:600px;
		height: 50px;
	}
	#total{
		margin : auto;
		width:600px;
		height: 50px;
	}
	
	#th2{
		margin : auto;
		background-color : beige;
		text-align:center; 
		color:#8A6F24; 
		width:600px;
		height: 50px;
	}
	
	#th3{
		margin : auto;
		background-color : beige;
		text-align:center; 
		color:#8A6F24; 
		width : 50px;
		height: 50px;
	}
	.del{
		text-align: center;
	color: beige;
	background-color: #8A6F24;
	border: 2px solid #8A6F24;
	padding: 2px 2px;
	border-radius: 8px;
/* 	transition-duration: 0.4s; */
 	 cursor: pointer;
	}
	
	.next{
	margin : auto;
		text-align: center;
	color: beige;
	background-color: #8A6F24;
	border: 2px solid #8A6F24;
	padding: 15px 15px;
	border-radius: 8px;
 	transition-duration: 0.4s; 
 	 cursor: pointer;
	}
	.button1 {
 	 background-color: #8A6F24; 
 	 color: beige; 
 	 border: 2px solid #8A6F24;
	}
	.button1:hover {
  	background-color: beige;
  	color: #8A6F24;
	}
	
	
/* 	input { */
/* 	width: 300px; */
	
/* } */

</style>
</head>

<script type="text/javascript">
   
   
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
                   document.getElementById("roadaddr2").value = addr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById("addr2").focus();
               }
           }).open();
       }
</script>
<%@ include file="./header.jsp" %>
<body>
<div class="total">
<form action="#" method="post" id="frm">
<div id="container">
	<h1 style="padding: 20px;">주문 / 결제</h1>
	<hr><br><br>
	<h2 style="padding: 10px;">상품 정보</h2>
<input type="hidden" id="onum" name="onum" value="${bvo.onum}">
<table class="table table-bordered">
<!--    <thead> -->
<!--    <tr> -->
<!--       <th>제품정보</th> -->
<!--       <th>지점명</th> -->
<!--       <th>수량</th> -->
<!--       <th>제품금액</th> -->
<!--    </tr> -->
<!--    </thead> -->
   <tbody>
      <c:forEach var="order" items="${list}" varStatus="vs">
      <input type="hidden" name="odnum" value="${order.odnum}">
   <tr>
      <th id="th1" class="asdf" rowspan="4">${order.iname}</th>
   </tr>
   <tr>
   		<th id="th">지점명</th>
      <td>${order.store}</td>
   </tr>
   <tr>
   		<th id="th">수량</th>
      <td>${order.odstock} 개</td>      
   </tr>
   <tr>
   		<th id="th">가격</th>
      <td>
      
         <span id="price">
         <c:set var="odto" value="${order.odstock}"/>
         <c:set var="rdto" value="${order.oprice*odto}"/>
         <c:out value="${rdto}"/> 
         </span>
         <span>원</span>
      </td>   
   </tr>
         <c:set var="sum" value="${sum+rdto}"/> 
      </c:forEach>
      
      
   </tbody>
</table>

</div>
   
<div>
   <h2 style="padding: 10px;">배송지 정보</h2>
</div>

<div class="del1">
<table>
	<tr>
	<th id="th2" class="delth"><input type="radio" name="radio" id="r2" value="0" checked><label for="r2">배송 X</label></th>
	<th id="th2" class="delth"><input type="radio" name="radio" id="r1" value="1" ><label for="r1">배송</label></th>
  	</tr>
</table>
</div>

<div id="content" class="del2">
<table>
	<tr>
  		<th id="th2"><input type="radio" id="r3" name="raddr" value="1" checked><label for="r3">기본 배송지</label></th>
  		<th id="th2">
  			<input type="radio" id="r4" name="raddr" value= "2"><label for="r4">신규 배송지</label>
   			<input type="button" class="del button1" value="배송지 목록" onclick="selectOne()">
   		</th>
   	</tr>
</table>
</div>  

    <div id="defaultaddr" class="del3">
   	<table class="table table-bordered">
   		<tr>
   			<th id="th3" class="cell_title">배송지 명</th>
   			<td><input type="text" id="dname" name="dname" value="${vo.dname}" maxlength="150" readonly></td>
   		</tr>
   		<tr>
   			<th id="th3">도로명 주소</th>
   			<td><input type="text" id="roadaddr" name="roadaddr" value="${vo.roadaddr}" readonly></td>
   		</tr>
   		<tr>
   			<th id="th3">상세 주소 </th>
   			<td><input type="text" id="addr" name="addr" value="${vo.addr}" readonly></td>
   		</tr>
   		<tr>
   			<th id="th3">전화번호</th>
   			<td><input type="text" id="phone" name="phone" maxlength="11" value="${vo.phone}" readonly></td>
   		</tr>
   	</table>

   </div>
</form>

    <div id="newaddr" class="del3">
    	<table class="table table-bordered">
	   		<tr>
	   			<th id="th3" class="cell_title">배송지 명</th>
	   			<td><input type="text" id="dname2" name="dname" maxlength="150"></td>
	   		</tr>
	   		<tr>
	   			<th id="th3">도로명 주소</th>
	   			<td>
	   				<input type="text" id="roadaddr2" name="roadaddr" readonly="readonly">
	   				<input type="button" class="del button1" onclick="sample6_execDaumPostcode()" value="주소 찾기">
	   			</td>
	   		</tr>
	   		<tr>
	   			<th id="th3">상세 주소</th>
	   			<td><input type="text" id="addr2" name="addr"></td>
	   		</tr>
	   		<tr>
	   			<th id="th3">전화번호</th>
	   			<td><input type="text" id="phone2" name="phone" maxlength="11"></td>
	   		</tr>
   		</table>

   </div>
   
   <div>
	   <h2 style="padding: 10px;">총 주문 금액</h2>
	   <table >
	   <tbody>
	   	<tr>
	   		<th class="th">총 주문 금액</th>
	   		<td id="total"><h2><c:out value="${sum}"/>원</h2></td>
	   	</tr>
	   	</tbody>
	   </table>
	   
	</div>
   
   <div style="text-align: center; padding: ">
      <input type="button" class="next button1" value="다음으로 " onclick="payment()">
   </div>
</div>
</body>
<%@ include file="./footer.jsp" %>
<script type="text/javascript">

function payment(){

   var price = $("#total").text();
   console.log(price);
   var frm = document.getElementById("frm");
   	  
  		var dname = document.getElementById("dname2");
		var roadaddr = document.getElementById("roadaddr2");
		var phone = document.getElementById("phone2");
  		var phonereg = /^\d{10,11}$/;
  	if($("input[name=raddr]:checked").val() == "2"){
		
		if (dname.value == "" || roadaddr.value == "" || phone.value == "") {
			alert("필수 값을 입력해 주세요");
			return false;
		}else if(!phonereg.test(phone.value)){
			alert("정확한 휴대폰 번호를 입력해주세요.");
			return false;
		}
  	}
  		del();	
   		frm.action = "./payment.do";
		frm.submit();
		
      
}

// 배송x일때 배송정보와 배송지 입력값 구분 
function del(){
	if($("input[name=radio]:checked").val() == "0"){
		document.getElementById("dname").value = "";
		document.getElementById("roadaddr").value = "";
		document.getElementById("addr").value = "";
		document.getElementById("phone").value = "";
		
	}
	
	if($("input[name=raddr]:checked").val() == "2"){
		var dname = document.getElementById("dname2").value;
		var roadaddr = document.getElementById("roadaddr2").value;
		var addr = document.getElementById("addr2").value;
		var phone = document.getElementById("phone2").value;
		console.log(dname);
		console.log(roadaddr);
		
		document.getElementById("dname").value = dname;
		document.getElementById("roadaddr").value = roadaddr;
		document.getElementById("addr").value = addr;
		document.getElementById("phone").value = phone;
			  	
	}
}


$(document).ready(function(){
   
   $("#content").hide();
   $("#defaultaddr").hide();
   $("#newaddr").hide();
   
   
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=radio]").click(function(){
        if($("input[name=radio]:checked").val() == "1"){
            $("#content").show();
           $("#defaultaddr").show();
           $("#newaddr").hide();
        }else if($("input[name=radio]:checked").val() == "0"){
              $("#content").hide();
              $("#newaddr").hide();
              $("#defaultaddr").hide();             
        }
    });
    
    $("input:radio[id=r1]").click(function(){
       $("input:radio[id=r3]").prop('checked', true); 
    });
    
    $("input:radio[id=r4]").click(function(){
       $("#newaddr").show();
       $("#defaultaddr").hide();       
       $("#dname2").val("");
       $("#roadaddr2").val("");
       $("#addr2").val("");
       $("#phone2").val("");    
    })
    
    $("input:radio[name=raddr]").click(function(){
       if($("input[name=raddr]:checked").val() == "1"){
          $("#defaultaddr").show();
              $("#newaddr").hide();           
       }else if($("input[name=raddr]:checked").val() == "2"){
              $("#defaultaddr").hide();
              $("#newaddr").show();       
       }
    });
    
});

function selectOne(){
   window.open("./modalSel.do","배송지 목록","width=500px, height=700px");
}


</script>


</html>