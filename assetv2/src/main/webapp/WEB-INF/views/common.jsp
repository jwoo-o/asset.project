<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GIOSIS MANAGER</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<!--<meta name="viewport" content="width=device-width, initial-scale=1">-->

<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/jquery.form.js" type="text/javascript"></script>
<script src="js/jquery.session.js" type="text/javascript"></script>
<script src="js/jquery.serializeObject.js" type="text/javascript"></script>
<style type="text/css">
body {
	background: #ecf0f5;
}
.m-tabs {
	display: flex;
	flex-wrap: wrap;
	line-height: 20px;
	width: 100%;
	font-size: 13px;
}

.m-tabs .mtab {
	float: left;
	text-align: center;
	padding: 7px 15px;
	background-color: #D3D3D3;
	border-right: 1px solid #fff;
}

.m-tabs .mtab a {
	font-weight: 500;
	color: #fff;
}

.m-tabs .active {
	background-color: #3C8DBC;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header with-border">
						<h3 class="box-title">
							<strong>Common</strong>
						</h3>
					</div>
					<div class="m-tabs">
						<div class="mtab" >
							<a data-link="common">Common</a>
						</div>
						<div class="mtab">
							<a data-link="dept">Dept</a>
						</div>
					</div>
					<!-- /.box-header -->
						
						<!-- /content -->
						<div class="box-body">
							<div class="panel-body">
									<div class="form-group">
										<div class="search-group col-md-8 col-sm-12 col-xs-12">
											<div class="form-inline search_div" id="common_search_div">
												<form class="form-horizontal" id="common_search_form" onsubmit="return false">
													<select class="form-control" name="keyword" id="common_keyword">
														<option value="GRP_C_NM">그룹코드명</option>
														<option value="GRP_C">그룹코드</option>
													</select> <input type="text" class="form-control" name="search">
												</form>
											</div>
											<div class="form-inline search_div" id="dept_search_div" style="display: none">
												<form class="form-horizontal" id="dept_search_form" onsubmit="return false">
													<select class="form-control" name="keyword" id="dept_keyword">
														<option value="dept_nm">부서명</option>
														<option value="country">사업국가</option>
														<option value="emp_nm">부서장</option>
													</select> <input type="text" class="form-control" name="search">
												</form>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="text-right">
											<button type="button" class="btn btn-default" id="btnReg">
												<i class="fa fa-pencil"></i> 등록
											</button>
											<button type="button" class="btn btn-primary" id="btnSrch">검색</button>
										</div>
									</div>
							</div>
							<table class="table table-hover text-sm">
								<thead id="common_thead" style="display: none">
									<tr>
										<td class="tdBack" align="center"><strong class="list_title">그룹코드</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">그룹코드명</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">업무영역</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">설명</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">최종변경일</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">편집</strong></td>
									</tr>
								</thead>
								<thead id="dept_thead" style="display: none">
									<tr>
										<td class="tdBack" align="center"><strong class="list_title">부서코드</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">부서명</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">사업국가</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">상위부서명</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">부서장</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">최종변경일</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">편집</strong></td>
									</tr>
								</thead>
								<tbody id="data_view_tbody">
								</tbody>
							</table>
						</div>
						<div class="text-center" style="margin-bottom: 50px;">
							<button type="button" class="btn btn-default" id="btnNext">다음</button>
						</div>
						<!-- /content -->
					</div>
				</div>
			</div>
	</section>
	
	<script type="text/javascript">
	var row = 1;
	var url = "/common/search/proc";
	var linkUrl = "common";
	var country_val = new Array();
    var country_data = new Array();    
    '<c:forEach items="${common.country}" var="country">'
    	country_data.push("${country.cName}");
    	country_val.push("${country.cCode}");
    '</c:forEach>'
	function dataSearch(url){
		var data;
		if(linkUrl=="common"){
			data = $("#common_search_form").serializeObject();
		}else{
			data = $("#dept_search_form").serializeObject();
		}		
		data.next = row;
		var dataStr = JSON.stringify(data);
		 	
		 	$.ajax({
		 		url:url,
		 		contentType:'application/json; charset=utf-8',
		 		dataType:'json',
		 		method:'post',
		 		data:dataStr
		 	}) .done(function (data) {
		 		var tag = '';
		 		if(data.msg=='0001'){
		 			var list = data.list;
		 			if(list.length>0){
		 				if(linkUrl=="common"){
		 					var grpC = '';
				 			$.each(list, function(i, elt) {
			                     tag += '<tr>';
			                     $.each(elt, function(key, val) {
			                    	
			                    	 if(key=='grpC')
			                    		 grpC = val;
			                     	tag += '<td align="center">'+val+'</td>'
			                     })
			                     tag += '<td align="center"><a href="/common/register?grpC='+grpC+'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i></a></td></tr>';
			               })			
						}else{
							var dept_no = '';
							var emp_no = '';
							$.each(list, function(i, elt) {
			                     tag += '<tr>';
			                     tag += '<td align="center">'+elt.dept_no+'</td>';
			                     if(elt.org_nm!="CEO" && elt.org_nm!="Country")
			                     	tag += '<td align="center">'+elt.dept_nm+' '+elt.org_nm+'</td>';           	
			                     else
			                    	 tag += '<td align="center">'+elt.dept_nm+'</td>';
			                    	 
			                     if(elt.dept_nm!="CEO")
			                     	tag += '<td align="center">'+elt.country+'</td>';
			                     else
			                    	 tag += '<td align="center"></td>';
			                    	 
			                     if(elt.dept_nm=="CEO"){
			                    	 tag += '<td align="center"></td>';  
			                     } else if(elt.org_nm=="Country" || elt.mgr_org_nm=="Country"){
			                    	 tag += '<td align="center">'+elt.dept_mgr_nm+'</td>';
			                     } else{
			                    	 tag += '<td align="center">'+elt.dept_mgr_nm+' '+elt.mgr_org_nm+'</td>';
			                     }       	  
			                     tag += '<td align="center">'+elt.emp_nm+'</td>';
			                     tag += '<td align="center">'+elt.lstMdfDtm+'</td>';
			                     tag += '<td align="center"><a href="/dept/register?dept_no='+elt.dept_no+'&emp_no='+elt.emp_no+'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i></a></td></tr>';
			                     
			               })
						}			
			 		}else{
			 			tag += '<tr height="18"><td align="center" colspan="8">NO DATA</td></tr>';
			 		}
		 			$("#data_view_tbody").append(tag);
		 			if(data.next>row){
		 				row++;
		 				$("#btnNext").removeAttr("disabled");
		 			}else{
		 				$("#btnNext").attr("disabled", true);
		 			}
		 		}else{
		 			alert(data.msg);
		 		}  
            })
            .fail(function (e) {
            	if(e.status == 401){
            		modify.close();
            		onErrorFunc(e);
            		
            	}
            });
	}
	
		$(function () {
			$(".search_div").hide();
			
			if($(location).attr("pathname").indexOf("common")==-1){
				
				url = "/dept/search/proc";	
				$("#common_thead").hide();
				$("#dept_thead").show();
				$("strong:first").html("department");
				$("#dept_search_div").show();
				linkUrl = "dept";
				$(".mtab a").eq(1).parent().addClass("active");
			 	
				
			}else{
				$("#common_thead").show();
				$("strong:first").html("common");
				$("#common_search_div").show();
				$(".mtab a").eq(0).parent().addClass("active");
				
			}
			
			dataSearch(url);
			
			$("#dept_keyword").on('change',function(){
				$(this).next().remove();
				var keyword = $(this).val();
				var select = $("<select id='dept_search' name ='search' class='form-control'></select>");
				var input = $('<input id="dept_search" name ="search" type="text" class="form-control" />');
				if(keyword=='country'){
					
					'<c:forEach items="${common.country}" var="country">'
			    		$(select).append("<option value='${country.cCode}'>${country.cName}</option>");				
			    	'</c:forEach>'
					$("#dept_search_form").append(select);
				}else{
					$("#dept_search_form").append(input);
					
					
				}		
			})
			
			
			$(".mtab a").on('click', function() {
				
				if(!$(this).parent().hasClass("active")){
					row = 1;
					linkUrl = $(this).data("link");
					$(".search_div").hide();
					if(linkUrl=="common"){
						url = "/common/search/proc";			
						$("#dept_thead").hide();
						$("#common_thead").show();
						$("strong:first").html("common");
						$("#common_search_div").show();
					}else{
						url = "/dept/search/proc";	
						$("#common_thead").hide();
						$("#dept_thead").show();
						$("strong:first").html("department");
						$("#dept_search_div").show();
			
					}
					$(".mtab").removeClass("active");
					$(this).parent().addClass("active");
				 	$("#data_view_tbody").empty();
				 	dataSearch(url);
				}
				
			 	
			})
			
			$("#btnSrch").on('click', function() {
			 	$("#data_view_tbody").empty();
			 	row = 1;
			 	dataSearch(url);
			 	
			})
			
			$("#btnReg").on('click', function() {
				if(linkUrl=="common"){
			   		location.href='/common/register';
				}else{
					location.href='/dept/register';
				}
			})
			$("#btnNext").on('click', function() {
				dataSearch(url);
				
			})
						
			
		})
		
	</script>
</body>
</html>