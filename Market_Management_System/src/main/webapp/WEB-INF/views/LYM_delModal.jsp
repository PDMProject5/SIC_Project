<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<!-- Modal content-->
<!-- 			<div id="modal" class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 					<h4 class="modal-title">배송지 목록</h4> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
					<form action="#" class="form-margin" method="post" id="delSelect">
						<table id="del" class="table table-bordered">
				<thead>	
	
					<tr>
						<th rowspan="3">배송지</th>
						<th>주소</th>
						<th>연락처</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${del}" varStatus="vs">		
						<tr>
							<td>	
								<strong>${dto.dname}</strong>
								<c:if test="${dto.addrflag eq 'Y' }">
									(기본배송지)
								</c:if>
								

							</td>
							<td>${dto.roadaddr}(${dto.addr})</td>
							<td>${dto.phone}</td>
							
							<td>
								<input class="btn-success btn btn-primary" type="button" id="dnum" name="dnum" value="선택" onclick="selectOne(${dto.dnum})">
							</td>
						</tr>
					</c:forEach>
						
				</tbody>		
			</table>
					</form>
<!-- 				</div> -->
			<div>
				<input type="button" onclick="closeSel()" value="닫기">
				<input type="hidden" id="dname2">
				<input type="hidden" id="roadaddr2">
				<input type="hidden" id="addr2">
				<input type="hidden" id="phone2">
			</div>


</body>
<script type="text/javascript">
function selectOne(val){
	ajaxSelect(val);
	
	

}

var ajaxSelect = function(val){
	$.ajax({
		url : './selectOne.do',
		method : 'post',
		data:"dnum="+val,
		dataType : 'json',
		success : function(v){
			console.log(v.dnum,v.dname, v.roadaddr, v.addr, v.phone)
			window.opener.document.getElementById("dname2").value = v.dname;
			window.opener.document.getElementById("roadaddr2").value = v.roadaddr;
			window.opener.document.getElementById("addr2").value = v.addr;
			window.opener.document.getElementById("phone2").value = v.phone;
			window.opener.document.getElementById("r4").checked = true;
			window.opener.document.getElementById("newaddr").style.display="block";
			window.opener.document.getElementById("defaultaddr").style.display="none";
			window.close();

			},
		error : function(){
			alert("에러입니다.");
		}
		
	});
}

function closeSel(){
	close();
}

</script>
</html>