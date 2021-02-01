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
         html += "<input type='hidden' id='dnum' name='dnum' value='"+v.dnum+"' />";
         html += "<input type='hidden' id='id' name='id' value='"+v.id+"'/>";
         html += "<input type='hidden' id='flag' name='flag' value='"+v.addrflag+"' />";
            
    
         html += "<table id='modelDel' class='tbl_delivery_info'>";
         html += "  <tbody>";
         html += " <tr>";
         html += "<th class='cell_title' style='text-align: center;'>배송지명</th>";
	     html += "<td><input type='text' id='dname' name='dname' value='"+v.dname+"' maxlength='150'>";
	     html += "</td></tr>";
	     html += "<tr><th class='cell_title' style='text-align: center;'>도로명 주소</th>";
	     html += "<td><input type='text' id='roadaddr' name='roadaddr' value='"+v.roadaddr+"' readonly='readonly'>";
	     html += "<input type='button' id='findaddr' onclick='sample6_execDaumPostcode()' value='주소 찾기'><br>";
	     html += "</td></tr>";				
	     html += "<tr><th style='text-align: center;'>상세 주소</th>";			
	     html += "<td class='cell_title'>";  
	     html += "<input type='text' id='addr' name='addr' value='"+v.addr+"'>";
	     html += "</td></tr>";
	     html += "<tr><th class='cell_title' style='text-align: center;'>전화번호</th>";			
	     html += "<td>";  
	     html += "<span><input type='text'  id='phone' name='phone' maxlength='11' value='"+v.phone+"'></span>";
	     html += "</td></tr>";      
	
	     html += "<tr><th style='text-align: center;'>기본배송지</th>";
	     html += "<td><input type='checkbox' id='addrchk' name='addrchk'>기본 배송지로 설정</td></tr>";
	     html += "<input type='hidden' id='addrflag' name='addrflag'>";
	     html += "<div class='modal-footer'>";
	     html += "</tbody></table>";
	     html += "</div>";
	   
	     html += "<div style='margin-left: 43%;'>";
	     html += "<div><input class='btn btn-success' type='button' value='수정' onclick='update()'/>";
	     html += "<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>";
	     html += "</div></div>";
		 $('#frmModify').html(html);
		    
		},
		error: function(){
			alert("잘못된 요청입니다.");
		}
	});
}

function update(){

	var frm = document.getElementById('frmModify');
	
	
	var dname = $('#dname').val();
	var roadaddr = $('#roadaddr').val();
	var addr = $('#addr').val();
	var phone = $('#phone').val()
	
	var flagchk = $('#flag').val();
	console.log(flagchk);
	
	
	if($("input[name='addrchk']").is(":checked") == true){
		$("input[name='addrflag']").val('Y');
	}else{
		$("input[name='addrflag']").val('N');
	}
	
	var addrflag = $('#addrflag').val();
	
	console.log(addrflag);
	
	if(flagchk == 'N' && addrflag=='Y'){
		frm.action = './modify2.do';
	}else{
		frm.action = './modify.do';
		
	}
	
	var phonechk = document.getElementById("phone").value;
	var phonereg = /^\d{10,11}$/g;
	
	if(dname == ''|| roadaddr == '' || addr == '' || phone == ''){
		alert("필수 값을 입력해 주세요.");
	}else if(!phonereg.test(phonechk)){
		alert("정확한 휴대폰 번호를 입력해 주세요.");
	}
	
//	flagchk 가 n 일때 1) 기본 배송지 선택안함 그대로 유지  2) 기본배송지 선택  다른거 다 n 이것만 y변경
	
	else if(flagchk == 'Y' && addrflag == 'N' ){
		alert("기본 배송지는 1개 존재해야 합니다.");
	}else{
		frm.submit();				
	}
	
}

