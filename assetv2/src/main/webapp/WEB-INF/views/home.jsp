<%@page import="com.core.vo.ManagerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
	<title>GIOSIS MANAGER</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/js/jquery.form.js" type="text/javascript"></script>
    <script src="js/jquery.session.js" type="text/javascript"></script>
    <script src="js/jquery.serializeObject.js" type="text/javascript"></script>
    
    
    <title>GIOSIS</title>
    <style type="text/css">
		body{
			background: #ecf0f5;
		}
	</style>
	<script type="text/javascript">
		
		$(function(){
			
			var s = 'assetNo';
			var k = 'asc';
			$.years();
			
			$.datepicker.setDefaults({
				dateFormat:'yy-mm-dd'
				,showButtonPanel: true
				,changeYear: true //콤보박스에서 년 선택 가능
	            ,changeMonth: true //콤보박스에서 월 선택 가능          
				,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			})
			
			$("#datepicker").datepicker();
			$("#datepicker1").datepicker();
			
			$("#requestBt").click(function(){
				$.popup('/register');
			})
			
			
			$("#empSearch").click(function() {
				
				var popupX = (window.screen.width/2) - (600/2);
				var popupY = (window.screen.height/2) - (400/2);
				window.open('/empRgt','Employee Search','width=610,height=430,left='+popupX+',top='+popupY+'','_blank');
			})
			$("#myPage").click(function() {
				alert("성공")
			})
			
			$("input[type='text']").keypress(function(e){
    			if (e.which == 13) {
    				$.ajx(s,k);
    			}
    		});
			
			
			$("#searchBt").click(function() {
				
				$.ajx(s,k);
				
			})
			
			var tds = $("thead tr td");
			$(tds).click(function() {
				if(k=="asc")
					k = "desc";
				else if(k=="desc")
					k = "asc"
					
				if($("#view").find("tr").length>1){
					s = $(this).attr("data-value");
					$.ajx(s,k);
				}
			})
			$("#download").click(function() {
				if($("#view").find("tr").length>0){
					
					var sort = $("<input type='hidden' name='sort'>").val(s);
					var key = $("<input type='hidden' name='key'>").val(k);
					$("#asset_search").append(sort,key);
					$("#asset_search").serialize();
					$("#asset_search").attr("action", "/excelDownload");
					$("#asset_search").attr("method","post");
					$("#asset_search").submit();
					
					
				}
			})
	
			$.ajx = function(sort,key){
				
				var data = $("#asset_search").serializeObject() 
				data.sort=sort;
				data.key=key;
				var dataStr = JSON.stringify(data);
				
				$.ajax({
					url:"/list/proc",
					method: "post",
					dataType: "json",
					data : dataStr,
					contentType:"application/json; charset=UTF-8"
				}).done(function(data) {
					
					if(data.msg == "0001"){
						
						var list = data.list;
						$("#view").empty();
						if(list.length>0){
							$.each(list, function(i, elt) {
								var tr = $("<tr></tr>");
								$.each(elt, function(key, val) {
									if(key=="aNo"){
										var td = $("<td align='center'></td>").css({display:"none"}).html(val);
										$(tr).append(td);
									}else{
										var td = $("<td align='center'></td>").html(val);
										$(tr).append(td);
									}
								})
								$("#view").append(tr);
								$(tr).click(function() {
									var tds = $(this).find("td");
									var url = '/detail?aNo='+$(tds[0]).html();
									$.popup(url);
								})
							})
						}else{
							$("#view").append("<tr height='18'><td align='center' width='70' colspan='10'>NO DATA</td></tr>")
						}	
						
					}else{
						alert(data.msg);
					}
				}).fail(function(e) {
					if(e.status==401)
						location.href="/"
				})	
			}

		})
		
		$.years = function(){
			var date = new Date();
			var year = date.getFullYear();
			$("#re_time").append("<option value=''>년도</option>");
			for(var y=year;y<=(year+10);y++){
				$("#re_time").append("<option value='"+y+"'>"+y+"년"+"</option>");
			}
			
		}
		$.popup = function(url) {
			var popupX = (window.screen.width/2) - (600/2);
			var popupY = (window.screen.height/2) - (1000/2);

			window.open(url,'Asset Register','width=600,height=830,left='+popupX+',top='+popupY+'','_blank');
		}
	</script>
</head>
	<body>
	
	<header class="main-header" style="background: #2a3f54">
       <!-- Logo -->
       <a href="./home" class="fixed logo" style="height: 53px; background-color: #172d44; ">
         <span style="color: white"><b>G</b><font size="2px;">iosis</font><b>R</b><font size="2px;">esource</font><b>M</b><font size="2px;">anagement</font></span>
       </a>
       
       <!-- Header Navbar -->
        <nav class="navbar">
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav bs-glyphicons">
             <!-- User Account Menu -->
	            <li style="padding-top: 19px; padding-bottom: 15px; padding-right:10px">
	              	<span class="hidden-xs"><font color="white"><c:out value="${mgr.division }"></c:out></font></span>
	              </li>
	              <li style="padding-top: 3px">
	                <a href="#" id="myPage" name="myPage" title="My page"><span ><font color="white"><c:out value="${mgr.mName }"></c:out></font></span></a>
	            </li>
	            <li>
	                <a href="#" id="empSearch" name="empSearch" title="사원 검색"><span class="glyphicon glyphicon-user na" style="color: white; font-size:large;"></span></a>
	            </li>
             
              
              	
            	<li>
                	<a href="/" id="logout_bt" name="logout_bt" title="Log out"><span class="glyphicon glyphicon-log-out na" style="color: white; font-size:large;"></span></a>
              	</li>
             </ul>
           </div>
         </nav>
   	  </header>
		<section class="content"> 
			<div class="row">
				<div class="col-md-12">
				
					<!-- Search Div -->
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title"><strong>Search</strong></h3>
						</div><!-- /.box-header -->
							
						<div class="box-body">
							<form id="asset_search">
							<table class="table table-bordered text-sm">
						       <tbody><tr height="18">
						      		<td class="tdBack" style="width: 13%;">&nbsp;<strong class="list_title">구매일</strong></td>
						            <td align="left" width="200">&nbsp;
						               <input type="text"  size="7" id="datepicker" name="start_dt" >~
								       <input type="text"  size="7" id="datepicker1" name="end_dt">
						            </td>
						            <td class="tdBack" style="width: 13%;">&nbsp;<strong class="list_title">사용자</strong></td>
						            <td align="left">&nbsp;
						              	<input type="text" class="TextBox w_date" size="10" id="userName" name="userName">
						            </td>
						            <td class="tdBack" style="width: 13%;">&nbsp;<strong class="list_title">자산번호</strong></td>
						            <td align="left">&nbsp;
						              	<input type="text" class="TextBox w_date" size="10" id="assetNo" name="assetNo">
						            </td>
						            <td align="center" width="80" rowspan="3" style="padding-top:40px;"><input type="button" class="btn bg-navy btn-sm" id="searchBt" name="searchBt" value="Search" alt="Search"></td>
						       </tr>
						      	<tr>
						      	   <td class="tdBack" align="left" width="80">&nbsp;<strong class="list_title">종류</strong></td>
						           <td align="left" width="120">&nbsp;
						              	<select class="SelectBox" id="category" name="category"> 
						              	
									        	 	<option value="">All</option>
									        	 	<option value="0">PC</option>
									        	 	<option value="1">MONITOR</option>
									        	 	<option value="2">MOBILE</option>
									        	 	<option value="3">NOTEBOOK</option>
										</select>
									</td>
									<td class="tdBack" align="left" style="width: 14%;">&nbsp;<strong class="list_title">직위</strong></td>
						            <td align="left" width="80">&nbsp;
						              	<select class="SelectBox" id="position" name="position"> 
						              	<option value="">All</option>
						              	<option value="0">Dispatched</option>
						              	<option value="1">Staff</option>
						              	<option value="2">Senior Staff</option>
						              	<option value="3">Manager</option>
						              	<option value="4">Senior Manager</option>
						              	<option value="5">General Manager</option>
						              	<option value="6">Director</option>
						              	<option value="7">Managing Director </option>
						              	<option value="8">C.E.O</option>
						              	
						              	</select>
						             </td>
						           	<td class="tdBack" align="left" width="80">&nbsp;<strong class="list_title">부서</strong></td>
							        <td align="left" width="80">&nbsp; 
							             <select class="SelectBox" id="division" name="division"> 
								              	<option value="" selected="">All</option>
								              	<option value="0">Corporate Development Division</option>
								              	<option value="1">Development Unit</option>
								              	<option value="2">FA Division</option>
								              	<option value="3">Fulfillment Operation Group</option>
								              	<option value="4">Global Biz Division</option>
								              	<option value="5">Global JP Group</option>
								              	<option value="6">Global P.Planning Division</option>
								              	<option value="7">KR GA & ER Division</option>
								              	<option value="8">KRSG Beauty & Fashion Division</option>
								              	<option value="9">Live10 Division</option>
								              	<option value="10">Platform Planning Division</option>
								              	<option value="11">SQM Division</option>
								              	<option value="12">Technology Unit</option>
								              	<option value="13">US & EU Biz Division</option> 	
							             </select>
							        </td>
						      	</tr>
						      	<tr>
						           <td class="tdBack" align="left" width="100">&nbsp;<strong class="list_title">상태</strong></td>
						           <td align="left" width="80" >&nbsp;<select class="SelectBox" id="status" name="status">
						           				<option value="" selected="">All</option>
								              	<option value="y">사용</option>
								              	<option value="s">보관</option>
												<option value="c">공용</option>
								              	<option value="d">폐기</option>
							             </select></td>
							        <td class="tdBack" align="left" width="100">&nbsp;<strong class="list_title">교체시기</strong></td>
						           <td align="left" width="80">&nbsp;<select class="SelectBox" id="re_time" name="re_time"> 
								              	
							             </select></td>
							        <td class="tdBack" align="left" width="80">&nbsp;<strong class="list_title">참고사항</strong></td>
							        <td align="left" width="80">&nbsp; 
							             <input type="text" class="TextBox w_date" size="32" id="note" name="note">
							        </td>
						      	</tr>
						      </tbody></table>
						      </form>
							<br>
						    <br>
						    
						</div>
					</div><br>
						
					<div class="box">
						  
						  
						  <div class="box-body">
						  <table align="right" style="width:100px;margin-bottom:10px;" class="no-bordered">					
									<tbody><tr><td align="right"><input type="button" class="btn bg-navy btn-sm" id="download" name="download" value="download" alt="New Request"></td></tr>
								</tbody></table>
						  
						  	<div id="searchResultDiv">
								<table class="table table-hover text-sm" style="table-layout: fixed" id="resultTable">
									<thead><tr height="35">
										<td class="tdBack" align="center" style="width:7%;"data-value="assetNo"><strong class="list_title">자산번호</strong></td>
										<td class="tdBack" align="center" style="width:5%;"data-value="category"><strong class="list_title">종류</strong></td>
										<td class="tdBack" align="center" style="width:5%;"data-value="status"><strong class="list_title">상태</strong></td>										
										<td class="tdBack" align="center" style="width:10%;" data-value="modelNm"><strong class="list_title">모델명</strong></td>										
										<td class="tdBack" align="center" style="width:7%;" data-value="userName"><strong class="list_title">사용자</strong></td>
										<td class="tdBack" align="center" style="width:8%;" data-value="position"><strong class="list_title">직위</strong></td>
										<td class="tdBack" align="center" style="width:12%;" data-value="division"><strong class="list_title">부서</strong></td>
										<td class="tdBack" align="center" style="width:8%;" data-value="buying"><strong class="list_title">구매일</strong></td>
										<td class="tdBack" align="center" style="width:7%;" data-value="mInch"><strong class="list_title">모니터크기</strong></td>	
										<td class="tdBack" align="center" style="width:15%;" data-value="note"><strong class="list_title">참고</strong></td>
									</tr>
									</thead>
									<tbody id="view">
										<tr height="18">
											<td align="center" width="70" colspan="10">NO DATA</td>
										</tr>
									
								</tbody></table><br><br>
								
								
								<table align="right" style="width:100px;margin-bottom:10px;" class="no-bordered">					
									<tbody><tr><td align="right"><input type="button" class="btn bg-navy btn-sm" id="requestBt" name="requestBt" value="New Request" alt="New Request"></td></tr>
								</tbody></table>
							</div><!--  list box end -->
						</div>
					</div>
				</div>
			</div>
	   </section>
	   
	</body>	
</html>