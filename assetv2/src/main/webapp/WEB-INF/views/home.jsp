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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/js/common.js" type="text/javascript"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/js/jquery.form.js" type="text/javascript"></script>
    <script src="js/jquery.session.js" type="text/javascript"></script>
    <script src="js/jquery.serializeObject.js" type="text/javascript"></script>
    <script src="/js/home.js" type="text/javascript"></script>
    <script type="text/javascript">
	    
	    
		$(function(){
	    	
	    	if("${mgr.auth}"==0){
	 			$("#requestBt").remove();
	 			$("#setCommon").remove();
	 		}
	    	if("${mgr.dCode}"!=7){
	    		$("#calendar").hide();
	    	}
	    	
	    	
	    })
    		



    </script>
    <title>GIOSIS</title>
    <style type="text/css">
		body{
			background: #ecf0f5;
		}
		#calendar:hover {
			background-color: #172d44;
		}
		
		#calendar:visited {
			background-color: #172d44;
}
	</style>
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
	            <li style="padding-top: 15px; padding-bottom: 15px; padding-right:10px">
	              	<span class="hidden-xs"><font color="white"><c:out value="${mgr.division }"></c:out></font></span>
	              </li>
	              <li style="padding-top: 1px">
	                <a href="#" id="myPage"title="My page"><span ><font color="white"><c:out value="${mgr.mName }"></c:out></font></span></a>
	            </li>
	            <li style="padding-top: 2px">
	                <a id="assetChart"  title="인원 및 자산 현황"><span class="fa fa-pie-chart na" style="color: white; font-size:large;"></span></a>
	            </li>
	            <li>
	                <a id="calendar" title="입사 예정"><span class="glyphicon glyphicon-calendar na" style="color: white; font-size:large;"></span></a>
	            </li>
	            <li>
	                <a id="seatSearch" title="설정"><span class="glyphicon glyphicon-map-marker na" style="color: white; font-size:large;"></span></a>
	            </li>
	            <li>
	                <a id="empSearch"  title="사원 검색"><span class="glyphicon glyphicon-user na" style="color: white; font-size:large;"></span></a>
	            </li>
             	<li>
	                <a id="setCommon" title="설정"><span class="glyphicon glyphicon-cog na" style="color: white; font-size:large;"></span></a>
	            </li>
            	<li>
                	<a href="/" id="logout_bt"  title="Log out"><span class="glyphicon glyphicon-log-out na" style="color: white; font-size:large;"></span></a>
              	</li>
             </ul>
           </div>
         </nav>
   	  </header>
		<section class="content"> 
			<div class="row">
				<div class="col-md-12">
				
					<!-- Search Div -->
					<div class="box" style="min-width: 1200px;">
						<div class="box-header with-border">
							<h3 class="box-title"><strong>Search</strong></h3>
						</div><!-- /.box-header -->
							
						<div class="box-body">
							<form id="asset_search">
							<input type='hidden' name='sort' id='sort'>
							<input type='hidden' name='key' id='key'>
							<table class="table table-bordered text-sm">
						       <tbody><tr height="18">
						      		<td class="tdBack" style="width: 13%;">&nbsp;<strong class="list_title">구매일</strong></td>
						            <td align="left" style="width: 16%;">&nbsp;
						               <input type="text"  size="5" id="datepicker" name="start_dt"  autocomplete="off">~
								       <input type="text"  size="5" id="datepicker1" name="end_dt" autocomplete="off">
						            </td>
						            <td class="tdBack" style="width: 13%;">&nbsp;<strong class="list_title">사용자</strong></td>
						            <td align="left" style="width: 17%;">&nbsp;
						              	<input type="text" class="TextBox w_date" size="10" id="userName" name="userName">
						            </td>
						            <td class="tdBack" style="width: 13%;">&nbsp;<strong class="list_title">자산번호</strong></td>
						            <td align="left" style="width: 20%;">&nbsp;
						              	<input type="text" class="TextBox w_date" size="10" id="assetNo" name="assetNo">
						            </td>
						            <td align="center" rowspan="3" style="padding-top:40px;"><input type="button" class="btn bg-navy btn-sm" id="searchBt" name="searchBt" value="Search" alt="Search"></td>
						       </tr>
						      	<tr>
						      	   <td class="tdBack" align="left">&nbsp;<strong class="list_title">종류</strong></td>
						           <td align="left" >&nbsp;
						              	<select class="SelectBox" id="category" name="category">
						              		<option value="">All</option>
						              		<c:forEach var="category" items="${common.category }">
						              			<option value="${category.cCode }">${category.cName}</option>
						              		</c:forEach>
									        	 
										</select>
									</td>
									<td class="tdBack" align="left">&nbsp;<strong class="list_title">직위</strong></td>
						            <td align="left">&nbsp;
						              	<select class="SelectBox" id="position" name="position"> 
						              	<option value="">All</option>
						              	<c:forEach var="position" items="${common.position }">
						              			<option value="${position.cCode }">${position.cName}</option>
						              	</c:forEach>
						              	
						              	
						              	</select>
						             </td>
						           	<td class="tdBack" align="left">&nbsp;<strong class="list_title">부서</strong></td>
							        <td align="left" >&nbsp; 
							             <select class="SelectBox" id="division" name="division"> 
								            <option value="">All</option>
						              		<c:forEach var="division" items="${common.division }">
						              			<option value="${division.cCode }">${division.cName}</option>
						              		</c:forEach> 	
							             </select>
							        </td>
						      	</tr>
						      	<tr>
						           <td class="tdBack" align="left">&nbsp;<strong class="list_title">상태</strong></td>
						           <td align="left" >&nbsp;&nbsp;<select class="SelectBox" id="status" name="status">
						           				<option value="">All</option>
								              	<c:forEach var="status" items="${common.status }">
						              				<option value="${status.cCode }">${status.cName}</option>
						              			</c:forEach> 
							             </select></td>
							       <td class="tdBack" align="left">&nbsp;<strong class="list_title">교체시기</strong></td>
						           <td align="left">&nbsp;&nbsp;<select class="SelectBox" id="re_time" name="re_time"> 
								              	
							             </select></td>
							        <td class="tdBack" align="left">&nbsp;<strong class="list_title">참고사항</strong></td>
							        <td align="left">&nbsp; 
							             <input type="text" class="TextBox w_date" id="note" name="note">
							        </td>
						      	</tr>
						      </tbody></table>
						      </form>
							<br>
						    <br>
						    
						</div>
					</div><br>
					
						<div class="box" style="min-width: 1200px;">
							  
							  
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