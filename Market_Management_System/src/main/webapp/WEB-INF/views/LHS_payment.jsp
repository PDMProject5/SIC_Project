<%@page import="com.sic.pdm.vo.mileage.MileageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 아임포트 라이브러리 추가 : iamport.payment.js -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
function cpchk(){
	var price = document.getElementById("price").innerHTML 
	if(price == 0){
		alert("쿠폰을 적용할 수 없습니다.");
	
	}else{
		
		window.open("./coupon.do","쿠폰 사용","width=500px, height=500px");
	}
	
}

</script>
<%@ include file="./header.jsp" %>
<body>
<form action="#" id="frm" method="post">
	<input id="roadaddr" name="roadaddr" type="hidden" value="${delvo.roadaddr}">
	<input id="addr" name="addr" type="hidden" value="${delvo.addr}">
	<input id="oprice" type="hidden" value="${price}">
	<div>
	<h2>결제</h2>
	<hr>
	<strong style="margin: 24px; ">쿠폰 적용 </strong>
		<input type="text" id="coupon" name="coupon" readonly >
		<input type="hidden" id="cseq" name="cseq">
		<input type="button" value="할인 쿠폰" onclick="cpchk()">
	<br>
	<strong style="margin: 10px; text-align: center;">마일리지 적용 </strong>
		<input type="text" id="mmoney" name="mileages" onkeyup="javascript:keyevent(this);">
		<input type="hidden" id="id" name="id">
		<input type="button" value="전체 적용" id="apply" onclick="miles(${mil.id})">
		<p >보유 마일리지 금액 : <a id="mileage">${mil.mmoney}</a></p>
	
</div>
<div>
	<h2>
	<span >총 결제 금액 : <span id="price">${price}</span>원</span>
<%-- 	<input type="hidden" name="saleamt" value="${price}"> --%>
	</h2>
	<table>
		<tbody>
			<tr>
				<th>할인금액  : <span id="distotal">${distotal}</span></th>
<%-- 				<td><input type="hidden" name="discountamt" value="${distotal}"> </td> --%>
			</tr>
		</tbody>
	</table>

</div>

<br>
<div>
	<input class="btn-success btn btn-primary" type="button" id="check_module" value="결제하기" >
</div>
</form>
</body>
<%@ include file="./footer.jsp" %>
<script type="text/javascript">
var roadaddr = document.getElementById("roadaddr").value;
var addr = document.getElementById("addr").value;
console.log(roadaddr);
console.log(addr);

// 마일리지 숫자만 입력하게
$("#mmoney").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^0-9]/gi,''));
});

// 마일리지 찍히는거  
function keyevent() {
    var keycode = document.getElementById("mmoney").value;
	var mile = Number($("#mileage").text());
	
	if(keycode > mile){
		alert("보유하신 마일리지 금액을 초과했습니다.");
		return document.getElementById("mmoney").value = mile;
	}else{		
		return document.getElementById("mmoney").value = keycode;
	}
	
}


// 결제 가격, 할인 가격 계산 
function sum(){
	keyevent();
	var price = Number($("#oprice").val());
	var mile = Number($("#mileage").val());
	var coupon = Number($("#coupon").val());
	var oprice = price - mile - coupon;
	
	console.log(price);
	console.log(mile);
	console.log(coupon);
	console.log(oprice);
	$("#price").html = oprice;
	$("#distotal").html = mile + coupon; 
}



// function miles(val){
// 	var price = document.getElementById("price").innerHTML;
// 	if(price == 0){
// 		alert("마일리지를 적용할 수 없습니다.");
// 	}else{
// 		ajaxmiles(val);
// 	}
// }

var ajaxmiles = function(val){
	$.ajax({
		url : './mileageaply.do',
		method : 'post',
		data : "id="+val,
		success : function(m){
// 			console.log(m)
			document.getElementById("mmoney").value = m;
			var mm = document.getElementById("price").innerHTML;
			var miles = document.getElementById("distotal").innerHTML;
			
			if(mm < m){
			document.getElementById("price").innerHTML=0;
			document.getElementById("distotal").innerHTML=0;
			document.getElementById("mmoney").value=mm;
			
			
			}else{
				document.getElementById("id").value = m.id; 
				document.getElementById("price").innerHTML = mm-m;
				document.getElementById("distotal").innerHTML = +miles+m;
				
			}
			
			
			
		},
		error : function(){
			alert("에러");
		}
	});
}


$("#check_module").click(function () {
	sum();
	var p = $('#price').text();
	var frm = document.getElementById("frm");
	console.log(p)
// 	if(p==0){
// 		alert("결제가 완료되었습니다.");
// 		frm.action = "./orderupdate.do";
//         frm.submit();
// 	}
//     var IMP = window.IMP; // 생략해도 괜찮습니다.
//     IMP.init('imp60827137'); // 'imp60827137' 대신 부여받은 "가맹점 식별코드"를 사용
//     IMP.request_pay({ // param
//         pg: 'kakao', // 카카오 
//         pay_method: 'card',    
//         merchant_uid: 'merchant_' + new Date().getTime(), // 주문번호(merchant_uid) 생성하기
//         //IMP.request_pay를 호출하기 전에 여러분의 서버에 주문 정보를 전달(데이터베이스에 주문정보 INSERT)하고 서버가 생성한 주문 번호를 param의 merchant_uid속성에 지정
//         name: 'CU',
//         amount: p,
//         buyer_name: '${vo.id}',
//        	buyer_tel: '${vo.phone}',
//         buyer_postcode: '123-456'
// //         m_redirect_url: 'https://admin.iamport.kr/payments/complete'
//     }, function (rsp) { // callback
//         console.log(rsp);
//         if (rsp.success) {
//             var msg = '결제가 완료되었습니다.';
//             msg += '고유ID : ' + rsp.imp_uid;
//             msg += '상점 거래ID : ' + rsp.merchant_uid;          // 결제 성공 시 로직,
//             msg += '결제 금액 : ' + rsp.paid_amount;
//             msg += '카드 승인번호 : ' + rsp.apply_num;
//             frm.action = "./orderupdate.do";
//             frm.submit();
//         } else {
//             var msg = '결제에 실패하였습니다.';                      // 결제 실패 시 로직,
//             msg += '에러내용 : ' + rsp.error_msg;
            
//         }
//         alert(msg);
        
//     });
});

</script>
</html>