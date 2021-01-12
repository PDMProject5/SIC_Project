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
	
	$("#jqGrid").jqGrid('clearGridData');
	
	var jsonData2 = $.ajax({
		url : "./productGrid.do?mcode=" + data,
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
    	$("#jqGrid").jqGrid('addRowData', i+1, realGrid[i]);
    }
}

$(function(){
	$("#jsTree").on("select_node.jstree", function(e, data){
		if(data.node.parent != '#'){
		console.log(data);	
		makeTable(data.selected);
		}
	});
	
	$("#jqGrid").jqGrid({
     datatype: "json",
  	height : 250,
  	colNames : [ '재고명', '입고가' ],
     colModel:[
               {name:"name",index:"name"},
               {name:"price",index:"price"}
               ],
     height: 450,
     caption:"재고 목록?"
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
		<table id="jqGrid"></table>
		<div id="jqGridPager"></div>
	</div>
	
	<div>
		<table id="jqGrid2"></table>
		<div id="jqGridPager2"></div>
	</div>
</body>
</html>