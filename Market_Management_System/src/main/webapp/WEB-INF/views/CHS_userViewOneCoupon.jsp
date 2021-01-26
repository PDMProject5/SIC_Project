<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<%@ include file="./header.jsp" %>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	img {
		width: 250px;
		height: 250px;		
	}
	table{
		width: 60%;
		margin: 30px auto;
		text-align: center;
	}
	tr{
		margin-top: 5px;
		margin-bottom: 5px;
	}
	td{
		height: 50px;
		width: 100px;
		
	}
	#container{
		width: 70%;
		height: 70%;
		margin: 0 auto;
	}
	#btn_getCoupon{
		color: #8A6F24;
		background-color: beige;
		height: 50px;
		width: 100px;
	}
	#btn_back{
		color: #8A6F24;
		background-color: beige;
		height: 50px;
		width: 100px;
	}
</style>
<link type="text/css" rel="stylesheet" href="./css/sweetalert.css">
<script type="text/javascript" src="./js/sweetalert.min.js"></script>
<script type="text/javascript">

	function backBtn() {
		history.back();
	}
	
	function getCouponBtn(cseq) {
		$.ajax({
			url:"./getCouponChk.do",
			type:"post",
			data:"cseq="+cseq,
			async: true,
			success:function(msg){
				if(msg == ""){
					swal({
				        title: "성공!", 
				        text: "성공적으로 수령하였습니다.", 
				        type: "success"
				        },
				       function(){
				        	location.href = "./getCoupon.do?cseq="+cseq;
					 });
				} else if(msg == "loginFail"){
					swal({
				        title: "회원이 아닙니다!", 
				        text: "쿠폰은 로그인 된 회원만 수령 가능합니다.", 
				        type: "warning"
				        },
				       function(){
				        	location.href = "./loginForm.do"
					 });
				} else {
					swal ("중복된 쿠폰입니다");
				}
			},
			error:function(request,status,error){
		        swal("쿠폰 수령 에러", "관리자에게 문의하세요"); // 실패 시 처리
		       }
		});
	}

</script>
</head>
<body>
	<div id="container">
	<table>
		<tr>
			<td><h2>쿠폰내용</h2></td>
			<td><h4>${ucv.cnotify}</h4></td>
		</tr>
		<tr>
			<td><img src="${pageContext.request.contextPath}${ucv.cthumbimg}" /></td>
		</tr>
		<tr>
			<td>
				<h2>쿠폰 지급 기간</h2>
			</td>
			<td>
				<h4>
					<fmt:parseDate var="startDate" value="${ucv.cdate}" pattern="yyyy-MM-dd" />
            		<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/>
           		</h4>
           		~
           		<h4>
            		<fmt:parseDate var="endDate" value="${ucv.clastdate}" pattern="yyyy-MM-dd" />
           			<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>
				</h4>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" id="btn_getCoupon" value="쿠폰 받기" onclick="getCouponBtn(${ucv.cseq})">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="btn_back" value="뒤로가기" onclick="backBtn()">
			</td>
		</tr>
	</table>
	</div>
</body>
<%@ include file="./footer.jsp" %>
</html>