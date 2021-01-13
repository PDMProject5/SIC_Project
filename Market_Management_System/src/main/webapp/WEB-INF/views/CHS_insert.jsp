<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title >Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>
<script type="text/javascript">

	function backBtn() {
		
		history.back();
		
	}
</script>
</head>
<body>
	<form enctype="multipart/form-data" method="post" action = "./insertCoupon.do">
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
				<td><div class="select_img"><img src="" /></div></td>
			</tr>
			<tr>
				<th>쿠폰금액</th>
				<td><input type="text" id="coupon" name="coupon" min="1"></td>
			</tr>
			<tr>
				<th>쿠폰종류</th>
				<td><input type="checkbox" id = "cdstate" name="cdstate" value = "A" checked="checked">차감금액</td>
				<td><input type="checkbox" id = "cdstate" name="cdstate" value = "B">할인율</td>
			</tr>
			<tr>
				<td><input type = "submit" value = "전송"></td>
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