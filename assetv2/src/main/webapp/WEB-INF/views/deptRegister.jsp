<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GIOSIS MANAGER</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<!--<meta name="viewport" content="width=device-width, initial-scale=1">-->

<link href="/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/js/common.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/jquery.form.js"
	type="text/javascript"></script>
<script src="/js/jquery.session.js"
	type="text/javascript"></script>
<script
	src="/js/jquery.serializeObject.js"
	type="text/javascript"></script>
<style type="text/css">
body {
	background: #ecf0f5;
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
							<strong>Dept Register</strong>
						</h3>
					</div>
					<div class="box-body">
						<div class="col-md-6 col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">부서</div>

								<div class="panel-body">
									<form class="form-horizontal form-label-left" id="formInput"
										method="post">
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dmnNm">조직 구조</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<select class="form-control" name="country" id="country">
													<option value="">Select</option>
						              				<c:forEach var="organization" items="${common.organization }">
						              					<option value="${organization.cCode }">${organization.cName}</option>
						              				</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dept_nm">부서명</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<input type="hidden" id="dept_no" name="dept_no">
												<input type="text" class="form-control" id="dept_nm" required="required" name="dept_nm">
												<c:choose>
													<c:when test="${empty map.dept}">
														<input type="hidden" id="status" name="status" value="C"/>					
													</c:when>
													<c:otherwise>
														<input type="hidden" id="status" name="status" value="U">
													</c:otherwise>
						 						</c:choose>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dmnNm">사업국가</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<select class="form-control" name="country" id="country">
						              				<c:forEach var="country" items="${common.country }">
						              					<option value="${country.cCode }">${country.cName}</option>
						              				</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dept_mgr_no">상위부서</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<input type="text" class="form-control" name="dept_mgr_no" id="dept_mgr_no" required="required" value="">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="emp_no">부서장</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<input type="text" class="form-control col-md-7 col-xs-12"
													name="emp_no" value="" id="emp_no">
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="button-group pull-right">
								<button type="button" class="btn btn-default" name="btnCan"
									id="btnCan" onclick="location.href='/common'">
									<i class="fa fa-list-ul"></i> 목록
								</button>
								<button type="button" class="btn btn-danger" name="btnDl"
									id="btnDl" style="display: none;">
									<i class="fa fa-close"></i> 삭제
								</button>
								<button type="button" class="btn btn-primary" name="btnUpd"
									id="btnUpd">
									<i class="fa fa-check"></i> 저장
								</button>
							</div>
						</div>


						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="panel panel-default">
								<div class="panel-heading">하위부서</div>
								<form class="form-horizontal form-label-left">
									<table class="table table-hover table-condensed">
										<colgroup>
											<col width="15px">
											<col width="5%">
											<col width="40%">
											<col width="40%">
										</colgroup>
										<thead>
											<tr>
												<th>부서코드</th>
												<th></th>
												<th>부서명</th>
												<th>부서장</th>
											</tr>
										</thead>
										<tbody id="tableBody">
											<c:forEach var="data" items="${map.subDept}">
												<tr onclick="location.href='/dept/register?dept_no=${data.dept_no}'">
													<td></td>
															<td><p class="form-control-static">${data.dept_no}</p></td>
															<td><p class="form-control-static">${data.dept_nm}</p></td>
															<td><p class="form-control-static">${data.emp_nm}</p></td>

												</tr>					
											</c:forEach>											
										</tbody>
									</table>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	$(function () {
		
		$("#wkC").val("${map.cmcdGrpm.wkC }").prop("selected", true);
		
		if("${map.cmcdGrpm}"!=''){
			$("#btnDl").show();
		}
		
		
		$("#btnUpd").on('click', function() {
			if($("#dept_nm").val()=="" || $("#emp_no").val()==""){
				alert("부서명과 부서장은 필수 사항입니다.");
				return false;
			}
			var data = $("#formInput").serializeObject(),dataStr = JSON.stringify(data);
			$.ajax({
				url:"<c:url value='/dept/register/proc'/>",
				contentType:"application/json; charset=utf-8",
				dataType:"json",
				method:"post",
				data:dataStr
			}).done(function(data) {
			 
				if(data.msg=="0001"){
					$("#status").val("U");
					$("#btnDl").show();
					$("#dept_no").val(data.dept.dept_no);
					alert("Request Success");
				}else{
					alert(data.msg);
				}
			}).fail(function(e) {
				if(e.status == 401){
            		onErrorFunc(e);
            	}	
			})
		});
		$("#btnDl").click(function() {
			var data = $("#dept_no").val();
			
			$.ajax({
				url:"<c:url value='/dept/delete/proc'/>",
				contentType:"application/json; charset=utf-8",
				dataType:"json",
				method:"post",
				data:data
			}).done(function(data) {
			 
				if(data.msg=="0001"){
					alert("Request Success");
					location.href='/common'
				}else{
					alert(data.msg);
				}
			}).fail(function(e) {
				if(e.status == 401){
            		onErrorFunc(e);
            	}	
			})
			
		})
				
	})
</script>
</html>