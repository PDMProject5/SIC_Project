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
	
	function backBtn() {

		history.back();

	}
	
	function insertCoupon() {
		
		alert("쿠폰등록");

		var cnotify = document.getElementById("cnotify");
		var coupon = document.getElementById("coupon");
		var fileext = document.getElementById("cImg").value;
		fileext = fileext.slice(fileext.indexOf(".")+1).toLowerCase();
		var maxSize = 2*1024*1024; // 2MB
		var regexp = /^[1-9]*$/;
		var frm = document.getElementById("frm");
		
		if( cnotify.value == "undefined" || cnotify.value == null || cnotify.value == "") {
			alert("쿠폰 내용을 입력해 주세요.");
			cnotify.focus();
			return false;
		}else if (fileext == ""){
			alert ("파일을 첨부하여 주세요.");
			return false;
		} else if (fileext !="jpg" && fileext !="png") {
			alert("이미지 파일(jpg ,png)만 등록 가능합니다.");
			return false;
		} else if ($('#cImg').val() != ""){
			var size = document.getElementById("cImg").files[0].size;
				if( size > maxSize) {
					alert("첨부파일은 2MB 이내로 등록 가능합니다.");
					return false;
				}
// 		} else if (coupon.value == ""){
// 			alert("쿠폰 금액을 입력하여 주세요.");
// 			coupon.focus();
// 			return false;
// 		} else if (!regexp.test(coupon)) {
// 			alert ("쿠폰 금액의 첫자리는 1부터 입력이 가능합니다.");
// 			coupon.focus();
// 			return false;
// 		}
		else {
			alert("쿠폰이 등록되었습니다.");
			frm.submit();
		}
	}

</script>
</head>
<body>
	<div id="insertCouponForm">
		<form id = "frm" enctype="multipart/form-data" method="post"
			action="./insertCoupon.do">
			<table>
				<tr>
					<th>쿠폰내용</th>
					<td><input type="text" id="cnotify" name="cnotify"></td>
				</tr>
				<tr>
					<th>파일업로드</th>
					<td><input type="file" id="cImg" name="file"></td>
				</tr>
				<tr>
					<td>
						<div class="select_img">
							<img src="" />
						</div>
					</td>
				</tr>
				<tr>
					<th>쿠폰금액</th>
					<td><input type="text" id="coupon" name="coupon" min="1"></td>
				</tr>
				<tr>
					<th>쿠폰종류</th>
					<td><input type="radio" id="cdstate" name="cdstate" value="A">차감금액</td>
					<td><input type="radio" id="cdstate" name="cdstate" value="B">할인율</td>
				</tr>
				<tr>
					<td><input type="button" id = "btn_submit" value="전송" onclick = "insertCoupon()"></td>
					<td><input type="button" id ="btn_back" value="뒤로가기" onclick = "backBtn()"></td>
				</tr>
			</table>
			<script>
				// 	파일 첨부시 이미지 미리보기
				$("#cImg").change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(250).height(250);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
			</script>
		</form>
	</div>
</body>
</html>