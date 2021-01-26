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
<form action="#" method="post" id="frm">
<div id="container">
<input type="hidden" id="onum" name="onum" value="${bvo.onum}">
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
      <input type="hidden" name="odnum" value="${order.odnum}">
   <tr>
      <td class="asdf">${order.iname}</td>
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

</div>
<div>
   <h2>
   <span>총 주문 금액:</span>
   <span id="total"><c:out value="${sum}"/> </span>원
   </h2>
</div>
   </form>
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
      <input type="button" value="다음으로 " onclick="payment()">
   </div>


</body>
<%@ include file="./footer.jsp" %>
<script type="text/javascript">

function payment(){

   var price = $("#total").text();
   console.log(price);
   var frm = document.getElementById("frm");
   if($("input[name=raddr]:checked").val() == "1"){
         
//       location.href = "./payment.do?price="+price;
      frm.action = "./payment.do";
      frm.submit();

         
   }
   
   var dname = $("#dname").val();
   console.log(dname);
   
//    location.href = "./payment.do?price="+price;
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