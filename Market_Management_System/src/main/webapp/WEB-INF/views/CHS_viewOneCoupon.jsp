<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>
<script type="text/javascript">

	function deleteCoupon(cseq) {
		var chk = confirm("쿠폰을 삭제 하시겠습니까?");
		if (chk) {
			location.href='./deleteCoupon.do?cseq='+cseq;
		}
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
			alert("쿠폰 내용을 입력해 주세요.");
			cnotify.focus();
			return false;
		} 
		if (fileext == "") {
			alert ("파일을 첨부하여 주세요.");
			return false;
		}
		if (fileext !="jpg" && fileext !="png") {
			alert("이미지 파일(jpg, png)만 등록 가능합니다.");
			return false;
		}
		if ($('#cImg').val() != "") {
			var size = document.getElementById("cImg").files[0].size;
			if( size > maxSize) {
				alert("첨부파일은 2MB 이내로 등록 가능합니다.");
				return false;
			}
		} 
		if($(':radio[name="cdstate"]:checked').length < 1){
		    alert('쿠폰 종류를 선택해주세요');                        
		    cdstate.focus();
		    return false;
		} 
		if ($(':radio[name="cdstate"]:checked').val() == "A"){
			if(!regexp.test(coupon.value)){
				alert ("차감 금액은  1 ~ 10000원까지 입력이 가능합니다.");
				return false;
			}
		} 
		if ($(':radio[name="cdstate"]:checked').val() == "B"){
			if(!perexp.test(coupon.value)){
				alert ("할인율은 첫자리는 1부터 99까지 입력이 가능합니다.");
				return false;
			}
		}
			frm.submit();
			alert("쿠폰이 성공적으로 등록되었습니다.");
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
<body>
	<form id = "frm" enctype="multipart/form-data" method="post" action = "./updateCoupon.do">
		<input type="hidden" id = "cseq" name = "cseq" value="${cv.cseq}">
		<table>
				<tr>
					<th>쿠폰내용</th>
					<td><input type="text" id="cnotify" name="cnotify" value = "${cv.cnotify}"></td>
				</tr>
				<tr>
					<th>파일업로드</th>
					<td>
					<input type="file" id="cImg" name="file">
					<input type="hidden" id="cthumbimg" value = "${cv.cthumbimg}">
					</td>
				</tr>
				<tr>
					<td>
						<div class="select_img">
							<img src="${pageContext.request.contextPath}${cv.cthumbimg}" />
						</div>
					</td>
				</tr>
				<tr>
					<th>쿠폰종류</th>
					<td><input type="radio" name="cdstate" id="cdstate" value="A" onchange="setDisplay()"><label for="r1">차감금액</label></td>
 					<td><input type="radio" name="cdstate" id="cdstate" value="B" onchange="setDisplay()"><label for="r2">할인율</label></td>
				</tr>
				<tr>
					<th>설정금액</th>
					<td><input type="text" id="coupon" name="coupon" min="1" value = "${cv.coupon}">원</td>
					<td>
						<div id="divWon">원</div>
						<div id="divPer">%</div>
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
							.width(500);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		</script>
	</form>
</body>
</html>