<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="./css/ui.jqgrid.css" />
</head>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="./js/grid.locale-kr.js"></script>
<script type="text/javascript">
    jQuery.browser = {};
    (function () {
         jQuery.browser.msie = false;
         jQuery.browser.version = 0;
         if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
              jQuery.browser.msie = true;
              jQuery.browser.version = RegExp.$1;
         }
    })();
</script>
<script type="text/javascript" src="./js/jquery.jqGrid.min.js"></script>
<script type="text/javascript">
function tree(){
	var jsonData = $.ajax({
		url : "productTree.do",
		method : "get",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		async: false
	}).responseText;
	console.log(jsonData);
	var realJson = JSON.parse(jsonData);
	console.log(realJson);
	
	$("#jsTree").jstree({ 
		'plugins': ["wholerow", "dnd"],
		'core' : {
			'data' : realJson,
			'dataType' : 'json',
			'themes' : {
				"theme" : ["classic"]
			},
			"check_callback" : true
		}
	});
}

function makeTable(data){
	
	$("#jqGridRegist").jqGrid('clearGridData');
	
	var jsonData2 = $.ajax({
		url : "./insertGrid.do?mcode=" + data,
		method : "get",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		async: false
	}).responseText;
	console.log(jsonData2);
	var realGrid = JSON.parse(jsonData2);
	console.log(realGrid);
// 	realJson = JSON.parse(jsonData);
// 	console.log(realJson);
    
    
    for(var i = 0, max = realGrid.length; i <= max; i++){
    	$("#jqGridRegist").jqGrid('addRowData', i+1, realGrid[i]);
    }
    
    
	$("#jqGridMain").jqGrid('clearGridData');
	var sellerid = "admin01";
	var jsonAjaxData = {
			"mcode" : data,
			"sellerid" : "admin01"
	};
	console.log(jsonAjaxData);
	var jsonDataMain = $.ajax({
		url : "./productGridMain.do",
		method : "post",
		dataType : "json",
		traditional : true,
		data : jsonAjaxData,
		async: false
	}).responseText;
	console.log(jsonDataMain);
	var realGridMain = JSON.parse(jsonDataMain);
	console.log(realGridMain);
// 	realJson = JSON.parse(jsonData);
// 	console.log(realJson);
    
    
    for(var i = 0, max = realGridMain.length; i <= max; i++){
    	$("#jqGridMain").jqGrid('addRowData', i+1, realGridMain[i]);
    }
}

function productRegist(){
	var ids = $("#jqGridRegist").jqGrid('getGridParam', 'selarrrow');
	alert(ids);
	var codeArray = new Array(ids);
	var stockArray = new Array(ids);
	for(var i = 0; i < ids.length; i++){
		var rowObject = $("#jqGridRegist").getRowData(ids[i]);
		console.log(rowObject);
		alert(rowObject.stock);
// 		if(i == 0){
// 			result = rowObject.code
// 		}else{			
// 			result = result + "," + rowObject.code;
// 		}
		codeArray[i] = rowObject.code;
		stockArray[i] = rowObject.stock;
	}
		alert(codeArray);
		alert(stockArray);
		var data = {
				"code" : codeArray,
				"stock" : stockArray
		};
		console.log(data);
		
	$.ajax({
		url : "./productInsert.do",
		method : "post",
		datatype : 'json',
		traditional : true,
		data : data
	});
}

$(function(){
	$("#jsTree").on("select_node.jstree", function(e, data){
		if(data.node.parent != '#'){
		console.log(data);	
		makeTable(data.selected);
		}
	});
	
	// 재고 등록용 jqGrid
	$("#jqGridRegist").jqGrid({
		datatype: "json",
  		height : 250,
  		colNames : [ '재고코드', '재고명', '입고가', '수량' ],
		colModel:[
				{name:"code",index:"code"},
            	{name:"name",index:"name"},
            	{name:"price",index:"price"},
            	{name:"stock",index:"stock", editable: true, editrules:{number:true}}
               ],
        cellEdit: true,
        cellurl: "./",
		height: 450,
		caption:"재고 등록?",
    	multiselect : true
     });
	
	$("#jqGridMain").jqGrid({
		datatype: "json",
  		height : 250,
  		colNames : [ '제품명', 'ROTNUM', '입고가', '수량' ],
		colModel:[
				{name:"name",index:"name"},
				{name:"rotnum",index:"rotnum"},
            	{name:"price",index:"price"},
            	{name:"stock",index:"stock"}
               ],
		height: 450,
		caption:"재고 등록 Main"
     });
	
	$("#jqGridDetail").jqGrid({
		datatype: "json",
  		height : 250,
  		colNames : [ '제품코드', '제품명', '입고일', '유통기한', '수량', '폐기처리' ],
		colModel:[
				{name:"code",index:"code"},
            	{name:"name",index:"name"},
            	{name:"pdate",index:"pdate"},
            	{name:"lifetime",index:"lifetime"},
            	{name:"stock",index:"stock"},
            	{name:"dispose",index:"dispose"}
               ],
		height: 450,
		caption:"재고 목록 Detail"
     });
});

</script>
<body>
	사용자가 제품 볼때 제품명, 가격, 수량총합 보여줌 <br>
	<table>
		<c:forEach var="vo" items="${list}" varStatus="vs">
			<tr>
				<td>
				제품명 : <a href="./productDetail.do?iname=${vo.iname}">${vo.iname}</a>, 제품가격 : ${vo.oprice}, 제품수량: ${vo.stock}
				</td>	
			</tr>
		</c:forEach>
	</table>
	<br>
	카테고리 트리형식(재고등록 및 판매자 재고현황 볼때)
	<button onclick="tree()">보기</button>
	<div id="jsTree"></div>
	<br>
	<br>
	<div>
		<table id="jqGridRegist"></table>
		<div id="jqGridPager"></div>
		
		<button onclick="productRegist()">제품등록</button>
	</div>
	
	<div>
		<table id="jqGridMain"></table>
		<div id="jqGridPager2"></div>
	</div>
	
	<div>
		<table id="jqGridDetail"></table>
		<div id="jqGridPager3"></div>
	</div>
</body>
</html>