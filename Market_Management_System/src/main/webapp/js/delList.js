function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("roadaddr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr").focus();
        }
    }).open();
}

function modify(val){
	ajaxModify(val);
	$('#modify').modal();
}

var ajaxModify = function(val){
	$.ajax({
		url : './modifyForm.do',
		method : 'post',
		data:"dnum="+val,
		dataType : 'json',
		success : function(v){
			console.log(v.dnum, v.id,v.dname, v.roadaddr, v.addr, v.phone, v.addrflag)
		 html = "<div class='form-group'>";
         html += "<input type='hidden' value='"+v.dnum+"' name='dnum'/>";

            
         /* html += "<div class='form-group'>";
         html += "<label for='title'>배송지명</label>";
         html += "<input class='form-control' type='text' id='dname' name='dname' value='"+v.dname+"' required/>";
         html += "</div>"
            
         html += "<div class='form-group'>";
         html += "<label for='content'>도로명주소</label>";
         html += "<textarea class='form-control' row='5' id='roadaddr' name='roadaddr' required>"+v.roadaddr+"</textarea>";
         html += "</div>";   
         
         html += "<div class='form-group'>";
         html += "<label for='content'>상세주소</label>";
         html += "<textarea class='form-control' row='5' id='addr' name='addr' required>"+v.addr+"</textarea>";
         html += "</div>";   
         
         html += "<div class='form-group'>";
         html += "<label for='content'>휴대폰번호</label>";
         html += "<span row='5' id='phone' name='phone' maxlength='3' required>";
         html += "<input class='form-control' id='phone' name='phone' maxlength='4' required></span>";
         
         html += "</span>";
         html += "</div>";   
         
         html += "<div class='form-group'>";
         html += "<label for='content'>기본배송지로 설정</label>";
         html += "<input type='checkbox' id='addrflag'>";
         html += "</div>";  */
         
         
         

         html += "<table class='tbl_delivery_info'>";
         html += "  <tbody>";
         html += " <tr>";
      html += "<th class='cell_title'>배송지명</th>";
      html += "<td><input type='text' id='dname' name='dname' placeholder='배송지명' maxlength='150'>";
      html += "</td></tr>";
      html += "<tr><th class='cell_title'>도로명 주소</th>";
      html += "<td><input type='text' id='roadaddr' name='roadaddr' placeholder='도로명 주소' readonly='readonly'>";
      html += "<input type='button' onclick='sample6_execDaumPostcode()' value='주소 찾기'><br>";
      html += "</td></tr>";				
      html += "<tr><th>상세 주소</th>";			
      html += "<td class='cell_title'>";  
      html += "<input type='text' id='addr' name='addr' placeholder='상세주소'>";
      html += "</td></tr>";
      html += "<tr><th class='cell_title'>전화번호</th>";			
      html += "<td>";  
      html += "<span><input type='text' style='width: 50px;' id='phone' name='phone' maxlength='3'></span>";
      html += "<span>&nbsp;-&nbsp;</span>";
      html += "<span><input type='text' style='width: 60px;' id='phone' name='phone' maxlength='4'></span>";
      html += "<span>&nbsp;-&nbsp;</span>";
      html += "<span><input type='text' style='width: 60px;' id='phone' name='phone' maxlength='4'></span>";
      html += "</td></tr>";      

      html += "<tr><th>기본배송지로 설정</th></tr>";
      html += "<td><input type='checkbox' id='addrflag'></td>";
      html += "<div class='modal-footer'>";
      html += "</tbody></table>";
      html += "</div>";
      html += "<input class='btn btn-success' type='button' value='수정' onclick='update()'/>";
      html += "<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>";
      html += "</div>";
		    $('#frmModify').html(html);
		    
		},
		error: function(){
			alert("잘못된 요청입니다.");
		}
	});
}

function update(){

	var frm = document.getElementById('frmModify');
	frm.action = './modify.do';
	var dname = $('#dname').val();
	if(dname == ''){
		alert("배송지명은 필수입니다.");
	}else{
		frm.submit();
	}
}