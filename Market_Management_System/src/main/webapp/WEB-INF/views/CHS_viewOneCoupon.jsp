<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{
		width: 750px;
		height: 750px;
		margin: 0 auto;
	}
	#frm{
	height: 600px;
	}
/* 	table{ */
/* 		width: 60%; */
/* 		margin: 30px auto; */
/* 		text-align: center; */
/* 	} */
/* 	tr{ */
/* 		margin-top: 5px; */
/* 		margin-bottom: 5px; */
/* 	} */
/* 	th,td{ */
/* 		height: 50px; */
		
/* 	} */
	
	  table {
        width: 500px;
        border-collapse: collapse;
        text-align: center;
        font-family: 'Trebuchet MS';
    }
    td, th {
        font-size: 10pt;
        border: 1px solid #98bf21;
        height: 30px;
    }
    th {
        background-color:#A7C942;
        color:#ffffff;
        font-family: Georgia;
    }
    tr.alt td {
        color:#000000;
        background-color:#EAF2D3;
    }

	
	input[type="text"]{
		width: 80%;
		border-radius: 8px;
	}
	
	input[type="button"]{
		width: 90%;
		height: 100%;
	}
	.select_img{
		text-align: center;
	}
	img {
		width: 300px;
		height: 300px;
	}
	#btn_update{
		color: #8A6F24;
		background-color: beige;
		height: 50px;
		width: 100px;
	}
	#btn_delete{
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>
<script type="text/javascript">

	function deleteCoupon(cseq) {
		var cseq = cseq;
		swal({
			  title: "쿠폰 삭제",
			  text: "쿠폰을 삭제하면 복구가 불가능 합니다.",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "취소",
			  confirmButtonText: "삭제",
			  closeOnConfirm: false
			},
			function(){
				location.href='./deleteCoupon.do?cseq='+cseq;
			});
		
	}
	
	function updateCoupon() {
		
		var cnotify = document.getElementById("cnotify");
		var coupon = document.getElementById("coupon");
		var cdstate = $('#cdstate');
		var fileext = document.getElementById("cImg").value;
		fileext = fileext.slice(fileext.indexOf(".")+1).toLowerCase();
		var maxSize = 2*1024*1024; // 2MB
		var regexp = /^([1-9]|[1-9][0-9]|[1-9][0-9][0-9]|[1-9][0-9][0-9][0-9]|[1-9][0-9][0-9][0-9][0-9])$/; // 차감금액
		var perexp = /^([1-9]|[1-9][0-9])$/; // 1~99 할인율
		var frm = document.getElementById("frm");
		
		if( cnotify.value == "undefined" || cnotify.value == null || cnotify.value == "") {
 			swal("쿠폰 내용을 입력해 주세요.");
			cnotify.focus();
			return false;
		} 
		if (fileext == "") {
			swal("파일을 첨부하여 주세요.");
			return false;
		}
		if (fileext !="jpg" && fileext !="png") {
			swal("정해진 확장자가 아닙니다.","이미지 파일(jpg, png)만 등록 가능합니다.");
			return false;
		}
		if ($('#cImg').val() != "") {
			var size = document.getElementById("cImg").files[0].size;
			if( size > maxSize) {
				swal("첨부파일은 2MB 이내로 등록 가능합니다.");
				return false;
			}
		} 
		if($(':radio[name="cdstate"]:checked').length < 1){
		    swal('쿠폰 종류를 선택해주세요');                        
		    cdstate.focus();
		    return false;
		} 
		if ($(':radio[name="cdstate"]:checked').val() == "A"){
			if(!regexp.test(coupon.value)){
				swal ("1~10000까지 입력이 가능합니다.");
				return false;
			}
		} 
		if ($(':radio[name="cdstate"]:checked').val() == "B"){
			if(!perexp.test(coupon.value)){
				swal ("1부터 99까지 입력이 가능합니다.");
				return false;
			}
		}
			frm.submit();
			swal("쿠폰이 성공적으로 수정되었습니다.");
			return true;
	}
	
	// 화면 로드시 divWon, divPer 숨김
	onload = function(){
		document.getElementById("divWon").style.display = "none";
		document.getElementById("divPer").style.display = "none";
	}
	
	// cdstate 라디오 버튼 선택시 값에 따라 보여주는  div가 다름.
	function setDisplay(){
	    if($(':radio[name="cdstate"]:checked').val() == "A"){
	    	$('#divWon').show();
	        $('#divPer').hide();
	    }
	    if ($(':radio[name="cdstate"]:checked').val() == "B"){
	    	$('#divWon').hide();
	        $('#divPer').show();
	    }
	}
	
	function backBtn() {
		history.back();
	}
	
</script>
</head>
<%@ include file="./header.jsp" %>
<body>
	<div id="container">
		<form id = "frm" enctype="multipart/form-data" method="post" action = "./updateCoupon.do">
			<input type="hidden" id = "cseq" name = "cseq" value="${cv.cseq}">
			<table>
					<tr>
						<th>쿠폰내용</th>
						<td colspan="2">
							<input type="text" id="cnotify" name="cnotify" value = "${cv.cnotify}">
						</td>
					</tr>
					<tr>
						<th>파일업로드</th>
						<td colspan="2">
						<input type="file" id="cImg" name="file">
						<input type="hidden" id="cthumbimg" value = "${cv.cthumbimg}">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="select_img">
								<img src="${pageContext.request.contextPath}${cv.cthumbimg}" />
							</div>
						</td>
					</tr>
					<tr>
						<th>쿠폰종류</th>
						<td>
							<input type="radio" name="cdstate" id="cdstate" value="A" onchange="setDisplay()"><label for="r1">차감금액</label>
	 						<input type="radio" name="cdstate" id="cdstate" value="B" onchange="setDisplay()"><label for="r2">할인율</label>
	 					</td>
					</tr>
					<tr>
						<th>설정금액</th>
						<td><input type="text" id="coupon" name="coupon" min="1" value = "${cv.coupon}"></td>
						<td>
							<div id="divWon"><h3>원</h3></div>
							<div id="divPer"><h3>%</h3></div>
						</td>
					</tr>
					<tr>
						<td>
							<input type = "button" id = "btn_update" value = "수정" onclick = "updateCoupon()">
						</td>
						<td>
							<input type = "button" id = "btn_delete" value = "삭제" onclick = "deleteCoupon(${cv.cseq})">
						</td>
						<td>
							<input type = "button" id = "btn_back" value = "뒤로가기" onclick = "backBtn()">
						</td>
					</tr>
			</table>
			<script>
					// 	파일 첨부시 이미지 미리보기
				$("#cImg").change(
					function() {
						if (this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result)
										.width(300).height(300);
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
			</script>
		</form>
	</div>
</body>
<%@ include file="./footer.jsp" %>
</html>