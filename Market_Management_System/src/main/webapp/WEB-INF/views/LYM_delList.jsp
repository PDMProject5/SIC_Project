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
<script type="text/javascript" src="./js/delList.js"></script>
<title>배송지 목록 확인</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

<h2><a>${id}님 환영합니다.</a></h2>


${lists}
	<div id="container">
	<form action="#" method="post" id="frm" name="frm" onsubmit="return chkbox();">
		<div class="panel-group" id="accordion">
			<table id="del" class="table table-bordered">
				<thead>	
	
					<tr>
						<th rowspan="3">배송지</th>
						<th>주소</th>
						<th>연락처</th>
						<th>수정·삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${lists}" varStatus="vs">		
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
								<input class="btn-success btn btn-primary" type="button" value="수정" onclick="modify(${dto.dnum})">
								<input class="btn-success btn btn-primary" type="button" value="삭제" onclick="deleteDel(${dto.dnum})">
							</td>
						</tr>
					</c:forEach>
						
				</tbody>		
			</table>
		</div>
	</form>
</div>
<div>
	<input class="btn-info btn btn-primary" type="button" value="등록하기" onclick="insertForm()">
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
	var con = confirm("정말 삭제하시겠습니까?");
	if(con){
		location.href="./deleteDel.do?dnum="+val;
	}
}


</script>

</html>