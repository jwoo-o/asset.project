<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Preview</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/preview_css.css">
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