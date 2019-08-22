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
<style type="text/css">
	.pass{
		font-weight: 600;
		
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		
		var $opener = $(window.opener.document);
		var list = window.opener.calendar_list
		$("#contents").html($opener.find("#content").val().replace(/(?:\r\n|\r|\n)/g, '<br/>').replace(/(?:\t)/g, '&nbsp;&nbsp;&nbsp;'));
		var type = $opener.find("#type").val();
		
		if(type=="ip"){
			$("#ip-table").show();
			var tag ='';
			$.each(list, function(i, elt) {
			 tag += '<tr>'
			 +'<td class="colum-data">'+(i+1)+'</td>'
			 +'<td class="colum-data">'+elt.divNm+'</td>'
			 +'<td class="colum-data">'+elt.mgr+'</td>'
			 +'<td class="colum-data">'+elt.name+'</td>'
			 +'<td class="colum-data">'+elt.id+'</td>'
			 +'<td class="colum-data">'+elt.ext+'</td></tr>';
			})
			$("#ip-tbody").append(tag);
		}
		if(type=="emp_ctf" || type=="document"){
			$("#footer-img").attr("src", "https://i.imgur.com/KBszhhn.png").show();
		}
		if(type=="delivery"){
			$("#footer-img").attr("src", "https://i.imgur.com/HvKuBZH.png").show();
		}
		if(type=="pass"){
			$("#pass-table").show();
			$("#pass_date").html( $opener.find("#entry_date").val()+" "+$opener.find("input[name=entry_time]:checked").val());
			$("#pass_id").html("${mgr.division} ${mgr.mName} ${mgr.office_number}");
			$("#footer-img").attr("src", "https://i.imgur.com/vWyiymx.png").show();
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
	<td style="padding: 50px 0;">
	
		<div class="wrapper">
		<h4>
				<span id="contents">
				
				</span>
				
		</h4><br>		
		<!-- 문제됨 -->	
		<table class="ip-table" style="display: none;" id="ip-table">
			<!--  <tr>
				<td class="colum-name" style="width: 8%">No</td>
				<td class="colum-name" style="width: 35%">부서</td>
				<td class="colum-name" style="width: 15%">관리자</td>
				<td class="colum-name" style="width: 15%">입사자</td>
				<td class="colum-name" style="width: 17%">ID</td>
				<td class="colum-name" style="width: 10%">EXT</td>
			</tr>
			-->
			<tr>
				<td class="colum-name" style="background:#B7DEE8;width: 8%;">No</td>
				<td class="colum-name" style="background:#B7DEE8;width: 35%;">부서</td>
				<td class="colum-name" style="background:#B7DEE8;width: 15%;">관리자</td>
				<td class="colum-name" style="background:#B7DEE8;width: 15%;">입사자</td>
				<td class="colum-name" style="background:#B7DEE8;width: 16%;">ID</td>
				<td class="colum-name" style="background:#B7DEE8;width: 11%;">EXT</td>
			</tr>
			<tbody id="ip-tbody">
				
			</tbody>
		</table>
		<table style="WIDTH: 560px;font-family:'Malgun Gothic';  display: none" id="pass-table">
			<tr><td style="text-align: center; font-weight: 600; font-size: 15px;" colspan="2" class="pass">- 아 래 -</td></tr>
			<tr><td style="text-align: center; font-weight: 600; font-size: 15px;" width=17% class="pass">일&nbsp;&nbsp;&nbsp;&nbsp;시 &nbsp;&nbsp;: </td><td class="pass" style="font-weight: 600; font-size: 15px;" id="pass_date"></td></tr>
			<tr><td style="text-align: center; font-weight: 600; font-size: 15px;" class="pass">출근장소 : </td><td class="pass"  style="font-weight: 600; font-size: 15px;">서울시 강남구 테헤란로 129(강남N타워)3층</td></tr>
			<tr><td style="text-align: center; font-weight: 600; font-size: 15px;" class="pass">연 락 처 &nbsp;: </td><td class="pass"  style="font-weight: 600; font-size: 15px;" id="pass_id"></td></tr>
			<tr><td style="text-align: center; font-weight: 600; font-size: 15px;"rowspan='4' class="pass">제출서류 : </td><td class="pass"  style="font-weight: 600; font-size: 15px;">주민등록등본1통 / 통장사본 / 최종학력 졸업증명서 /</td></tr>
			<tr><td class="pass"  style="font-weight: 600; font-size: 15px;">자격증(어학,기타자격증)사본 / 건강보험자격득실확인서(경력자) /</td></tr>
			<tr><td class="pass"  style="font-weight: 600; font-size: 15px;">경력증명서(경력자) / 비자,여권사본(외국 국적자) /</td></tr>
			<tr><td class="pass"  style="font-weight: 600; font-size: 15px;">전직장원천징수영수증(경력자)</td></tr>
		</table>
			
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