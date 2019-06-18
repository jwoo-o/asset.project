<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	body{
			background: #ecf0f5;
		}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- Main content -->
	<section class="content" >
		<div class="row" >
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header with-border">
						<h3 class="box-title">
							<strong>Common Register</strong>
						</h3>
					</div>
					<!-- /.box-header -->

						<!-- /content -->
						<div class="box-body">
							<div class="panel-body">
								<form class="form-horizontal" id="searchForm">
									<div class="form-group">
										<div class="search-group col-md-8 col-sm-12 col-xs-12">
											<div class="form-inline">
												<select class="form-control" name="keyword">
													<option value="GRP_C_NM">도메인한글명</option>
													<option value="GRP_C">도메인ID</option>
												</select> <input type="text" class="form-control" name="search">
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
								</form>
							</div>
							<table class="table table-hover text-sm">
								<thead>
									<tr>
										<td class="tdBack" align="center"><strong class="list_title">그룹코드명</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">그룹코드</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">업무영역</strong></td>
										<td class="tdBack" align="center"><strong class="list_title">설명</strong></td>
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
	function dataSearch(){
		
		var data = $("#searchForm").serializeObject()
		data.next = row;
		var dataStr = JSON.stringify(data);
		 	
		 	$.ajax({
		 		url:'/common/search/proc',
		 		contentType:'application/json; charset=utf-8',
		 		dataType:'json',
		 		method:'post',
		 		data:dataStr
		 	}) .done(function (data) {
		 		var tag = '';
		 		if(data.msg=='0001'){
		 			var list = data.list;
		 			if(list.length>0){
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
			 			tag += '<tr height="18"><td align="center" colspan="6">NO DATA</td></tr>';
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
			
	
			$("#btnSrch").on('click', function() {
			 	$("#data_view_tbody").empty();
			 	row = 1;
			 	dataSearch();
			 	
			})
			$("#btnReg").on('click', function() {
			   location.href='/common/register';
			})
			$("#btnNext").on('click', function() {
			 		
				dataSearch();
				
			})
			
			
			dataSearch();
		})
		
	</script>
</body>
</html>