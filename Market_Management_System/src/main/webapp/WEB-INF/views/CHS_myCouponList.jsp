<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	#container{
		width: 70%;
		height: 70%;
		margin: 0 auto;
		margin-bottom: 5%;
	}
	#couponList{
		margin: 20px;
		margin-left: 60px;
		float: left;
	}
	h3{
		text-align: center;
	}
	#btn{
		width: 20%;
		height: 200px;
		margin-left: 600px;
		margin-top: 700px;
	}
	#btn_back{
		text-align:center;
		color: #8A6F24;
		background-color: beige;
		height: 50px;
		width: 100px;
		margin-bottom: 30px;
	}
	
	img {
		width: 150px;
		height: 100px;
	}
</style>
<script type="text/javascript">

	function backBtn() {
		history.back();
	}
	
</script>
</head>
<%@ include file="./header.jsp" %>
<body>
	<div id = "container">
		<c:choose>
			<c:when test="${not empty cbList}">
				<h3>${id}님의 쿠폰 내역 조회</h3>
				<c:forEach items="${cbList}" var="cbList">
					<div id = "couponList">
						<div>
							<img src="${pageContext.request.contextPath}${cbList.cthumbimg}">
						</div>
						<div>
							${cbList.cnotify}
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h1>현재 보유중인 쿠폰이 없습니다.</h1>
				<br />
			</c:otherwise>
		</c:choose>
	</div>
	<div id = "btn">
		<input type="button" id="btn_back" value="뒤로가기" onclick="backBtn()">
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>