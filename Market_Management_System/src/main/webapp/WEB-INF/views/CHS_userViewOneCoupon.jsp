<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	#container{
		width: 80%;
		height: 100%;
		margin: 0 auto;
	}
	#userViewOneCoupon{
		text-align: center;
		width: 50%;
		height: 500px;
		margin-top: 60px;
		margin-bottom: 100px;
		margin-left: 20%;
		margin-right: 20%;
		border-radius: 25px;
 		border: 2px solid black;
	}
	#userViewOneCNotify{
	
	}
	#userViewOneCThumbimg{
	
		margin-top: 100px;
	
	}
	#userViewOneCDate{
		margin-top: 50px;
		margin-bottom: 20px;
	}
	#userViewOneCBtn{
		margin-top: 50px;
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
	
	img {
		width: 150px; 
		height: 100px;
	}
	
	@media screen and (max-width: 768px) {
		#userViewOneCoupon{
			text-align: center;
		}
		
		img {
			width: 150px; 
			height: 100px;
		}
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
<%@ include file="./header.jsp" %>
<body>
	<div id="container">
		<div id = "userViewOneCoupon">
			<div id ="userViewOneCThumbimg">
				<h3>쿠 폰</h3>
				<img src="${pageContext.request.contextPath}${ucv.cthumbimg}" />
			</div>
			<div id ="userViewOneCDate">
				<h2>쿠폰 지급 기간</h2>
				<h4>
					<fmt:parseDate var="startDate" value="${ucv.cdate}" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
					~
					<fmt:parseDate var="endDate" value="${ucv.clastdate}" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
				</h4>
			</div>
			<div id ="userViewOneCBtn">
				<input type="button" id="btn_getCoupon" value="쿠폰 받기" onclick="getCouponBtn(${ucv.cseq})">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="btn_back" value="뒤로가기" onclick="backBtn()">
			</div>
		</div>
	</div>
</body>
<%@ include file="./footer.jsp" %>
</html>