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
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 아임포트 라이브러리 추가 : iamport.payment.js -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	function cpchk(){
		window.open("./coupon.do","쿠폰 사용","width=500px, height=500px");
	}

	function miles(){
		opener.document.getElementById("mileage").value = document.getElementById("mileage").value
	}
	
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
<body>
<div id="container">

<form action="#" method="post">
<table class="table table-bordered">
	<thead>
	<tr>
		<th>제품정보</th>
		<th>지점명</th>
		<th>수량</th>
		<th>제품금액</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="order" items="${list}" varStatus="vs">
	<tr>
		<td>${order.iname}</td>
		<td>${order.store}</td>
		<td>${order.odstock} 개</td>		
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
</form>
</div>
<div>
	<h2>
	<span>총 주문 금액:</span>
	<span><c:out value="${sum}"/> </span>원
	</h2>
</div>
<div>
	<h2>배송여부</h2>
</div>
<div style="width:200px;">
  <input type="radio" name="radio" id="r2" value="0" checked><label for="r2">배송 X</label>
  <input type="radio" name="radio" id="r1" value="1" ><label for="r1">배송</label>
</div>

<div id="content">
  <input type="radio" id="r3" name="raddr" value="1" checked><label for="r3">기본 배송지</label>
  <input type="radio" id="r4" name="raddr" value= "2"><label for="r4">신규 배송지</label>
	<input type="button" value="배송지 목록" onclick="selectOne()">
</div>  

 	<div id="defaultaddr">
     	<strong class="cell_title">배송지명 : </strong>   
        <input type="text" id="dname" name="dname" value="${vo.dname}" maxlength="150" readonly><br>       
     
         <strong>도로명 주소 : </strong>
         <input type="text" id="roadaddr" name="roadaddr" value="${vo.roadaddr}" readonly><br>
		<strong>상세 주소 : </strong>			
         <input type="text" id="addr" name="addr" value="${vo.addr}" readonly><br>
     
		<strong>전화번호 : </strong>			
        <input type="text" id="phone" name="phone" maxlength="11" value="${vo.phone}" readonly><br>
	</div>

	 <div id="newaddr">
     	<strong class="cell_title">배송지명 : </strong>   
        <input type="text" id="dname2" name="dname2" maxlength="150"><br>       
     
         <strong>도로명 주소 : </strong>
         <input type="text" id="roadaddr2" name="roadaddr" readonly="readonly">
         <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
		<strong>상세 주소 : </strong>			
         <input type="text" id="addr2" name="addr"><br>
     
		<strong>전화번호 : </strong>			
        <input type="text" id="phone2" name="phone" maxlength="11"><br>
	</div>
	

<div>
	<h2>결제</h2>
	<hr>
	<strong style="margin: 24px; ">쿠폰 적용 </strong>
		<input type="text" id="coupon" name="coupon" readonly >
		<input type="button" value="할인 쿠폰" onclick="cpchk()">
	<br>
	<strong style="margin: 10px; text-align: center;">마일리지 적용 </strong>
		<input type="text" id="mileages" name="mileages">
		<input type="button" value="전체 적용" id="apply" onclick="miles(${mil.id})">
		<p id="mileage">보유 마일리지 금액 : ${mil.mmoney}</p>
	
</div>
<div>
	<h2>
	<span>총 결제 금액:</span>
	<span id="rmoney"><c:out value="${sum}"/> </span>원
	</h2>
	<table>
		<tbody>
			<tr>
				<th>할인금액 : </th>
				<td></td>
			</tr>
		</tbody>
	</table>
</div>

<div>
	<input class="btn-success btn btn-primary" type="button" value="결제하기" id="check_module">
</div>


</body>
<script type="text/javascript">



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

function miles(val){
	ajaxmiles(val);
}

var ajaxmiles = function(val){
	$.ajax({
		url : './mileageaply.do',
		method : 'post',
		data : "id="+val,
		success : function(m){
// 			console.log(m)
			document.getElementById("mileages").value = m;
			
		},
		error : function(){
			alert("에러");
		}
	});
}


$("#check_module").click(function () {
    var IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init('imp60827137'); // 'imp60827137' 대신 부여받은 "가맹점 식별코드"를 사용
    IMP.request_pay({ // param
        pg: 'kakao', // 카카오
        /*
        'kakao':카카오페이,
        html5_inicis':이니시스(웹표준결제)
        'nice':나이스페이
        'jtnet':제이티넷
        'uplus':LG유플러스
        'danal':다날
        'payco':페이코
        'syrup':시럽페이
        'paypal':페이팔
        */
        pay_method: 'card',
        /*
        'samsung':삼성페이,
        'card':신용카드,
        'trans':실시간계좌이체,
        'vbank':가상계좌,
        'phone':휴대폰소액결제
        */
        merchant_uid: 'merchant_' + new Date().getTime(), // 주문번호(merchant_uid) 생성하기
        //IMP.request_pay를 호출하기 전에 여러분의 서버에 주문 정보를 전달(데이터베이스에 주문정보 INSERT)하고 서버가 생성한 주문 번호를 param의 merchant_uid속성에 지정
        name: 'CU',
        amount: ${sum},
        <%--             buyer_email: '<%=vo.getEmail()%>', --%>
        buyer_name: '${vo.id}',
       	buyer_tel: ${vo.phone},
<%--             buyer_addr: '<%=vo.getAddress()%>', --%>
        buyer_postcode: '123-456'
//         m_redirect_url: 'https://admin.iamport.kr/payments/complete'
    }, function (rsp) { // callback
        console.log(rsp);
        if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;          // 결제 성공 시 로직,
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
        } else {
            var msg = '결제에 실패하였습니다.';                      // 결제 실패 시 로직,
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
        /*
           function (rsp) { // callback
            if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
              // jQuery로 HTTP 요청
              jQuery.ajax({
                  url: "https://www.myservice.com/payments/complete", // 가맹점 서버
                  method: "POST",
                  headers: { "Content-Type": "application/json" },
                  data: {
                      imp_uid: rsp.imp_uid,
                      merchant_uid: rsp.merchant_uid
                  }
              }).done(function (data) {
                // 가맹점 서버 결제 API 성공시 로직
              })
            } else {
              alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
            }
        */
    });
});



</script>


</html>