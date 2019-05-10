<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Preview</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
		
		html,
		body,
		h4 {
			padding: 0;
			margin: 0;
		}
		
		table,
		tbody,
		tr,
		td,
		img{
			padding: 0;
			margin:0;
			font-size:0;
		}
		
		table{
			border-collapse: collapse;
		}
		
		.mail_contents td {
			font-size: 18px; 
			padding: 50px 0;
			word-wrap:break-word;
			line-height:1.5rem;
			background: #f1f1f1;
		}
		
		.wrapper {
			width: 70%;
			margin: 0 auto;
		}
		
		.center {
			display: inline-block;
			width: 100%;
			text-align: center;
		}
		.divTable{
			display: table;
			width: 100%;
		}
		.divTableRow {
			display: table-row;
		}
		.divTableHeading {
			background-color: #EEE;
			display: table-header-group;
		}
		.divTableCell, .divTableHead {
			border: 2px solid black;
			display: table-cell;
			padding: 3px 10px;
		}
		.divTableHeading {
			background-color: #EEE;
			display: table-header-group;
			font-weight: bold;
		}
		.divTableFoot {
			background-color: #EEE;
			display: table-footer-group;
			font-weight: bold;
		}
		.divTableBody {
			display: table-row-group;
		}
		.colum-name{
			background:#B7DEE8;
			text-align: center;
			font-weight: 600;
		}
		.colum-data{
			text-align: center;
			font-weight: 500;
		}
	</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		
		var $opener = $(window.opener.document);
		var list = window.opener.calendar_list
		$("#contents").html($opener.find("#content").val().replace(/(?:\r\n|\r|\n)/g, '<br/>'));
		var type = $opener.find("#type").val();
		
		if(type=="ip"){
			$("#ip_table").show();
			var tag ='';
			$.each(list, function(i, elt) {
			 tag += '<div class="divTableRow">'
			 +'<div class="divTableCell colum-data">'+(i+1)+'</div>'
			 +'<div class="divTableCell colum-data">'+elt.divNm+'</div>'
			 +'<div class="divTableCell colum-data">'+elt.mgr+'</div>'
			 +'<div class="divTableCell colum-data">'+elt.name+'</div>'
			 +'<div class="divTableCell colum-data">'+elt.start+'</div></div>';
			})
			$(".divTableBody").append(tag)
		}
		if(type=="emp_ctf"){
			$("#footer-img").attr("src", "https://i.imgur.com/KBszhhn.png").show();
		}
		if(type=="delivery"){
			$("#footer-img").attr("src", "https://i.imgur.com/HvKuBZH.png").show();
		}
	})
</script>
</head>

<body>
<table>
	<tbody>
	
	<tr>
	<td><img src="http://dp.image-gmkt.com/dp2016/SG/design/interviewmail/qoo10_interviewmail_top.png"  alt="header" /></td>
	</tr>
	
	<tr class="mail_contents">
	<td>
	
		<div class="wrapper">
		<h4>
				<span id="contents">
				
				</span>
				
		</h4>		
		<!-- 문제됨 -->	
		<div class="divTable" style="display: none;" id="ip_table">
				<div class="divTableBody">
				<div class="divTableRow">
				<div class="divTableCell colum-name"  style="width: 10%">No</div>
				<div class="divTableCell colum-name" style="width: 35%">부서</div>
				<div class="divTableCell colum-name" style="width: 15%">관리자</div>
				<div class="divTableCell colum-name" style="width: 15%">입사자</div>
				<div class="divTableCell colum-name" style="width: 25%">입사예정일</div>
				</div>
				</div>
		</div>
				
			
		</div>		
	</td>
	
	</tr>
	<tr>
	<td><img id="footer-img" src="" alt="footer" style="display: none;"></td>
	</tr>
	</tbody>
	</table>
	
</body>
</html>