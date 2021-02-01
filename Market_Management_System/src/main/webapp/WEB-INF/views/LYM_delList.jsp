<%@page import="com.sic.pdm.vo.del.DelVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./js/delList2.js"></script>
<style type="text/css">

#frm{
	margin: auto; 
	width: auto;
 	text-align: center;
}

#del{
		margin: auto; 
		width: auto;
 	text-align: center; 
	margin-top:10px; 
	margin-bottom: 10px;
	border: solid 1px black;
	}
	
#modelDel{
	margin: auto; 
	width: 600px;
 	text-align: center; 
	margin-top:10px; 
	margin-bottom: 10px;
	border: solid 1px black;
	
}

#roadaddr{
	width: 220px;
}
input[type=text]{
	width: 300px;
}

#findaddr{
	width: 80px;
}

th{
	
	background-color : beige;
	text-align: center; 
 	color:#8A6F24;  
 	height: 70px; 
 	width: 100px; 
 	font-size: 20px;
}

td{
	text-align: center;
}


/* #regB{ */

/* 	margin-left: 45%; */
/* 	margin-bottom: 50px; */
	
/* } */
</style>
<title>배송지 목록 확인</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%@ include file="./header.jsp" %>
<body>

	<div id="container">
	<form action="#" method="post" id="frm" name="frm" onsubmit="return chkbox();">
		<h2>배송지 목록</h2>
		<div class="panel-group" id="accordion">
			<table id="del" class="table table-bordered">
				<thead>	
	
					<tr>
						<th rowspan="3" style="text-align: center;">배송지</th>
						<th colspan="2" style="text-align: center;">주소</th>
						<th style="text-align: center;">연락처</th>
						<th colspan="2" style="text-align: center;">수정·삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${lists}" varStatus="vs">		
						<tr>
							<td colspan="2">	
								<strong>${dto.dname}</strong>
								<c:if test="${dto.addrflag eq 'Y' }">
									<br>(기본배송지)
								</c:if>
								

							</td>
							<td>${dto.roadaddr}(${dto.addr})</td>
							<td>${dto.phone}</td>
							
							<td>
								<input class="btn-success btn btn-primary" type="button" value="수정" onclick="modify(${dto.dnum})">
								<input class="btn-success btn btn-primary" type="button" value="삭제" onclick="deleteDel(${dto.dnum})">
								<input type="hidden" id="dvo" value="${dvo.dnum}">
							</td>
						</tr>
					</c:forEach>
				</tbody>		
			</table>
<div id="regB">
	<input class="btn-info btn btn-primary" type="button" value="등록하기" onclick="insertForm()">
</div>
		</div>
	</form>
</div>

<div id="modify" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">배송지 수정</h4>
				</div>
				<div class="modal-body">
					<form action="#" class="form-margin" method="post" id="frmModify"></form>
				</div>
				
			</div>

		</div>
	</div>

</body>
<%@ include file="./footer.jsp" %>
<script type="text/javascript">
    
function insertForm(){
		var rowCount = $('#del >tbody >tr').length;
		if(rowCount >= '3'){
			alert("배송지 등록 최대 갯수를 초과했습니다.");
		}else{
			
			location.href="./insertForm.do";
		}
}

function deleteDel(val){
	var dvo = document.getElementById("dvo").value;
	var con = confirm("정말 삭제하시겠습니까?");
	console.log(dvo);
	if(con){
		if(dvo == val){
			alert("기본 배송지는 삭제할 수 없습니다.");
			return false;
		}else{
			location.href="./deleteDel.do?dnum="+val;
			alert("삭제되었습니다.");
		}
	}
}

</script>

</html>