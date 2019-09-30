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

<link href="/css/style.css"rel="stylesheet" type="text/css">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/css/jquery.tagit.css" rel="stylesheet" type="text/css">


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/js/common.js"type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/jquery.form.js"type="text/javascript"></script>
<script src="/js/jquery.session.js"type="text/javascript"></script>
<script src="/js/jquery.serializeObject.js"type="text/javascript"></script>
<script src="/js/tag-it.js" type="text/javascript"></script>
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
										method="post" onsubmit="return false">
										<input type="hidden" id="dept_no" name="dept_no">
										<input type="hidden" id="status" name="status" value="C"/>
										<input type="hidden" id="mgr_org_nm" name="mgr_org_nm">	
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
												for="dmnNm">조직 구조</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<select class="form-control" name="org_no" id="org">
													<option value="">선택</option>
						              				<c:forEach var="organization" items="${common.organization }">
						              					<option value="${organization.cCode }">${organization.cName}</option>
						              				</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dept_nm">부서명</label>
											<div class="col-md-4 col-sm-4 col-xs-5">
												
												<input type="text" class="form-control" id="dept_nm" required="required" name="dept_nm">
															
											</div>
											<div class="col-md-4 col-sm-4 col-xs-5">
												<input type="text" class="form-control" id="org_nm" required="required" name="org_nm" readonly>
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dept_mgr_no">상위부서</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<div class="input-col"><ul id="dept_mgr_no" class="auto"></ul></div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="emp_no">부서장</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<div class="input-col"><ul id="emp_no" class="auto"></ul></div>
											</div>
										</div>
										<div class="form-group" style="display: none" id="color_div">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="seatColor">좌석 색상<br>(한국오피스 전용)</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<select class="form-control" id="seatColor" name="color">
												<option value="">선택하세요</option>
												<c:forEach var="color" items="${common.color }">
						              					<option value="${color.cCode }"data-color="${color.cName}" style=background:${color.cName} >${color.cCode }</option>
						              			</c:forEach>
											</select>
											</div>
										</div>
										
									</form>
								</div>
							</div>
							<div class="button-group pull-right">
								<button type="button" class="btn btn-default" name="btnCan"
									id="btnCan" onclick="location.href='/dept'">
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
										<colgroup >
											<col width="15%">
											<col width="60%">
											<col width="25%">
										</colgroup>
										<thead>
											<tr>
												<td align="center"><b>부서코드</b></td>
												<td align="center"><b>부서명</b></td>
												<td align="center"><b>부서장</b></td>
											</tr>
										</thead>
										<tbody id="tableBody" align="center">
											<c:forEach var="data" items="${map.subDept}">
												<tr onclick="location.href='/dept/register?dept_no=${data.dept_no}'">
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
function getUrlParams() {
    var params = {};
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    return params;
}
var isRun = false;

	$(function () {
		var mgr_dept_data = [];
		var emp_data = [];
		

		$.dataSearchProc = function(data){
			var dataStr = JSON.stringify(data);
			$.ajax({
		        method: 'POST',
		        url: "/dept/mgrSearch/proc",
		        dataType: "json",
		        data:dataStr,
		      	contentType:"application/json; charset=UTF-8"
		     }).done(function(data) {
		    	 
		    	if(data.msg=="0001"){
		    		
		    		if(data.list.length>0){
		    			$.each(data.list, function(i, elt) {
		    				if(mgr_dept_data.length>0){
		    					if(mgr_dept_data[0].value!=elt.dept_no){
		    						
		    						if(elt.org_nm=="CEO" || elt.org_nm=="Country"){
				    					mgr_dept_data.push({"label":elt.dept_nm,"value":elt.dept_no,"mgr_org_nm":elt.org_nm});
				    				}else{
				    					mgr_dept_data.push({"label":elt.dept_nm+" "+elt.org_nm,"value":elt.dept_no});
				    				}

		    					}
		    				}else{
		    					if(elt.org_nm=="CEO" || elt.org_nm=="Country"){
			    					mgr_dept_data.push({"label":elt.dept_nm,"value":elt.dept_no,"mgr_org_nm":elt.org_nm});
			    				}else{
			    					mgr_dept_data.push({"label":elt.dept_nm+" "+elt.org_nm,"value":elt.dept_no});
			    				}
		    				}
						})
		    		}else{
		    			if(mgr_dept_data.length==0){
		    				alert("등록 할 수 있는 상위부서가 없습니다");
		    			}
		    			
		    		}
		    		if(data.emp_list.length>0){
		    			$.each(data.emp_list, function(i, elt) {	
		    				emp_data.push({"label":elt.name,"value":elt.empNo});
			        	})	        	
		    		}else{
		    			if(emp_data.length==00){
		    				alert("등록/수정 할 부서장이 없습니다.");
		    			}
		    			
		    		}
		    		
		    	}else{
		    		alert(data.msg);
		    	}
		     })
		     .fail(function(e) {
				if (e.status == 401) {
					onErrorFunc(e);
				}
			})
		}
		
		
		$("#org").on('change', function() {
			mgr_dept_data.length = 0;
			emp_data.length = 0;
			//$("#dept_mgr_no").tagit("removeAll");
			var org_nm = $("#org option:selected").text();
			if(org_nm=="선택"){
				org_nm = "";
			}
			else if(org_nm=="CEO"){
				alert("CEO는 선택할수 없습니다");
				$("#org").val("").prop("selected",true);
				$("#org_nm").val("");
				return false;
			}else{
				var data = {"org_no":$("#org").val(),"country":$("#country").val()}
				$.dataSearchProc(data);
		        $("#org_nm").val(org_nm);
			}

		})
		

		$("#dept_mgr_no").tagit({

					allowSpaces : true,
					tagSource : mgr_dept_data,
					availableTags : mgr_dept_data,
					showAutocompleteOnFocus : true,
					autocomplete : {
						delay : 0,
						minLength : 0,
						readOnly : true,
						autoFocus : true,
						source : mgr_dept_data,
						focus : function(event, ui) {
							return false;
						},
						select : function(event,ui){
							
							if(ui.item.mgr_org_nm!=undefined){
								$("#mgr_org_nm").val(ui.item.mgr_org_nm);
							}
							
							
							$("#dept_mgr_no").tagit("createTag",ui.item.label,ui.item.value);
							return false;
							
							
						}
					},
					beforeTagAdded : function(event, ui) {
						// do something special
						var mgr_nm = ui.tagLabel;

						if (mgr_nm == ""){		
							return false;
						}else if(mgr_dept_data.findIndex(i => i.value==mgr_nm)==-1){
							alert("상위부서가 확인이 되지 않습니다");
							$("#dept_mgr_no input").val("").focus();
							return false;
						}
						if(mgr_nm==2){
							$("#color_div").show();
						}	
						$("#dept_mgr_no input[type=text]").attr("disabled", true);
						
					},
					afterTagAdded : function(event, ui) {
						$("#dept_mgr_no").tagit({
							showAutocompleteOnFocus : false
						})
						
					},
					afterTagRemoved : function(event, ui) {
						// do something special
						$("#dept_mgr_no input[type=text]").attr("disabled", false);
						$("#color_div").hide();
						$("#seatColor").val("");
						$("#dept_mgr_no").tagit({
							showAutocompleteOnFocus : true
						})
					}
				})
				$("#emp_no").tagit({
				
					allowSpaces: true,
					tagSource: emp_data,
					//availableTags: emp_data,
					showAutocompleteOnFocus: true,
					autocomplete: {
						delay: 0,
						minLength:1,
						readOnly:true,
						autoFocus: true,
						source: emp_data,
						focus: function(event, ui){
							return false;
						}	
					},
					beforeTagAdded : function(event, ui) {
						// do something special
						var mgr_nm = ui.tagLabel;
						if (mgr_nm == ""){
							return false;
						}else if(mgr_nm.indexOf("G")!=0){
							alert("잘못된 사원번호를 입력하셨습니다");
							$("#emp_no input").val("").focus();
							return false;
							
						}					
						
					},
					afterTagAdded: function (event,ui) {
						$("#emp_no input[type=text]").attr("disabled", true);
					},
					afterTagRemoved : function(event, ui) {
						// do something special
						$("#emp_no input[type=text]").attr("disabled", false);
						
					}
				})
		
				if(window.location.search!=""){
					var data = getUrlParams(), dataStr = JSON.stringify(data);
					$.ajax({
						method: 'POST',
		                url: "/dept/dtl/proc",
		                dataType: "json",
		                data:dataStr,
		              	contentType:"application/json; charset=UTF-8"
					}).done(function(data) {
					 
						if(data.msg=="0001"){
							var dept = data.dept;
							var sub_dept = data.sub_dept;
							var data = {"org_no":dept.org_no,"country":dept.country}
							$.dataSearchProc(data);
							if(dept.dept_mgr_nm!=null){
								
								if(dept.mgr_org_nm=="Country" || dept.mgr_org_nm=="CEO"){
		        					mgr_dept_data.push({"label":dept.dept_mgr_nm,"value":dept.dept_mgr_no,"mgr_org_nm":dept.mgr_org_nm});
		        				}else {
		        					mgr_dept_data.push({"label":dept.dept_mgr_nm+" "+dept.mgr_org_nm,"value":dept.dept_mgr_no});
		        				}
							}
							
							emp_data.push({"label":dept.emp_nm,"value":dept.emp_no});
							if(dept.dept_mgr_no==2){
								$("#color_div").show();
								$("#seatColor").val(dept.color).prop("selected",true);
							}
							
							$("#country").val(dept.country).prop("selected",true);
							$("#country").find("option").each(function() {
							    if(this.value != dept.country) {
							    	$(this).remove();
							    }
							});

							$("#org").val(dept.org_no).prop("selected",true);
							
							$("#dept_nm").val(dept.dept_nm);
							$("#dept_no").val(dept.dept_no);
							$("#status").val("U");
							if(dept.emp_nm!=null && dept.emp_nm!=''){
								$("#emp_no").tagit("createTag",dept.emp_nm,dept.emp_no);
								
							}
							if(dept.mgr_org_nm != null){
								
								if(dept.mgr_org_nm=="CEO" || dept.mgr_org_nm=="Country"){
									$("#dept_mgr_no").tagit("createTag",dept.dept_mgr_nm,dept.dept_mgr_no);
								}else{
									$("#dept_mgr_no").tagit("createTag",dept.dept_mgr_nm+" "+dept.mgr_org_nm,dept.dept_mgr_no);
									
								}
								
							}
							
							if(dept.org_nm !="Country" && dept.org_nm != "CEO" && dept.org_nm != "Unit"){
								$("#org_nm").val(dept.org_nm);
								$("#org").find("option").each(function() {
								    if(this.value < 1) {
								    	$(this).remove();
								    }
								    if(this.value==""){
								    	$(this).remove();
								    }
								});
								$("#btnDl").show();
							}else{
								$("input:text").attr("readOnly", true);
								
								$("#dept_mgr_no .tagit-close").hide();
								$("#emp_no input:text").attr("readOnly", false);
								$("#org").find("option").each(function() {
								    if(this.value != dept.org_no) {
								    	$(this).remove();
								    }
								});
								if(dept.org_nm=="Unit"){
									$("#btnDl").show();
									$("#org_nm").val(dept.org_nm);
									$("#dept_nm").attr("readOnly", false);
								}else{
									$("#btnDl").hide();
								}
								
								
								
							}
							
									
							
							if(sub_dept!=''){
								var tag = '';
								$.each(sub_dept, function(i, elt) {
								 
									tag+= '<tr onclick=location.href="/dept/register?dept_no='+elt.dept_no+'&emp_no='+elt.emp_no+'">';					
									tag+= '<td><p class="form-control-static">'+elt.dept_no+'</p></td>'; 
									tag+= '<td><p class="form-control-static">'+elt.dept_nm+' '+elt.org_nm+'</p></td>'; 
									tag+= '<td><p class="form-control-static">'+elt.emp_nm+'</p></td></tr>'; 
								})
								
							}else{
								tag = '<tr height="18"><td align="center" colspan="4">NO DATA</td></tr>'
							}
							$("#tableBody").append(tag);
						}else{
							alert(data.msg);
						}
						
					}).fail(function(e) {
						if (e.status == 401) {
							onErrorFunc(e);
						}
					})
				}		
				
				

		$("#btnUpd").on('click', function() {
			if($("#status").val()=="C"){
				
				if ($("#dept_nm").val() == "" || $("#dept_mgr_no").tagit("assignedTags")[0] == undefined || $("#country").val()=="") {
					alert("사업국가,부서명,상위부서는 필수 사항입니다.");
					return false;
				}
				
			}else{
				
				if($("#org").val()>1){
					
					if($("#dept_mgr_no").tagit("assignedTags")[0] == undefined){
						alert("상위부서는 필수 사항입니다.");
						return false;
					}
				}
			}
			
			if(isRun == true){
    			return;
    		}
    		isRun = true;
    		
			var data = $("#formInput").serializeObject()
			data.dept_mgr_no = $("#dept_mgr_no").tagit("assignedTags")[0];
			data.emp_no = $("#emp_no").tagit("assignedTags")[0];
			var dataStr = JSON.stringify(data);
			$.ajax({
				url : "<c:url value='/dept/register/proc'/>",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				method : "post",
				data : dataStr
			}).done(function(data) {

				if (data.msg == "0001") {
					alert("Request Success");
					if($("#status").val()=="C"){
						$("#status").val("U");
						$("#btnDl").show();
						$("#dept_no").val(data.dept.dept_no);
					}else{
						location.reload();
					}
					
				} else {
					alert(data.msg);
				}
				isRun = false;
			}).fail(function(e) {
				if (e.status == 401) {
					onErrorFunc(e);
				}
			})
		});
		$("#btnDl").click(function() {
			if(isRun == true){
    			return;
    		}
    		isRun = true;
			var data = {"dept_no":$("#dept_no").val()},dataStr = JSON.stringify(data);

			$.ajax({
				url : "<c:url value='/dept/delete/proc'/>",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				method : "post",
				data : dataStr
			}).done(function(data) {

				if (data.msg == "0001") {
					alert("Request Success");
					location.href = '/dept'
				} else {
					alert(data.msg);
				}
				isRun = false;
			}).fail(function(e) {
				if (e.status == 401) {
					onErrorFunc(e);
				}
			})

		})

	})
</script>
</html>