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

<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.session.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.serializeObject.js"
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
							<strong>Common Register</strong>
						</h3>
					</div>
					<div class="box-body">
						<div class="col-md-6 col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">공통그룹코드</div>

								<div class="panel-body">
									<div id="alert-message-left"></div>
									<form class="form-horizontal form-label-left" id="formInput"
										method="post">
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dmnId">그룹코드<span class="required">*</span></label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<input type="hidden" id="grpC" name="grpC" value="${map.cmcdGrpm.grpC}">
												<c:choose>
													<c:when test="${empty map.cmcdGrpm}">
														<input type="hidden" id="vldStC" name="vldStC" value="C"/>
														<input type="text" class="form-control" id="tGrpC" required="required">
													</c:when>
													<c:otherwise>
														<input type="hidden" id="vldStC" name="vldStC" value="U">
														<p class="form-control-static">${map.cmcdGrpm.grpC }</p>
													</c:otherwise>
						 						</c:choose>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dmnNm">그룹코드명<span class="required">*</span></label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<input type="text" class="form-control" name="grpCNm" required="required" value="${map.cmcdGrpm.grpCNm }">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="dmnDvC">업무코드</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<select class="form-control" name="wkC" id="wkC">
													<option value="AS">자산</option>
													<option value="CM">공통</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-5"
												for="datypNm">설명</label>
											<div class="col-md-8 col-sm-8 col-xs-7">
												<input type="text" class="form-control col-md-7 col-xs-12"
													name="grpCExpl" value="${map.cmcdGrpm.grpCExpl }">
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="button-group pull-right">
								<button type="button" class="btn btn-default" name="btnCan"
									id="btnCan" onclick="history.go(-1)">
									<i class="fa fa-list-ul"></i> 목록
								</button>
								<button type="button" class="btn btn-danger" name="btnDl"
									id="btnDl" style="display: none;">
									<i class="fa fa-close"></i> 삭제
								</button>
								<button type="button" class="btn btn-success" name="btnUpd"
									id="btnUpd">
									<i class="fa fa-check"></i> 저장
								</button>
							</div>
						</div>


						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="panel panel-default">
								<div class="panel-heading">세부코드</div>
								<div class="panel-body">
									<div class="text-right" id="btnValidGroup">
									
										<button type="button" class="btn btn-default" id="btnAddRow">
											<i class="glyphicon glyphicon-plus"></i>
										</button>
										<button type="button" class="btn btn-default" id="btnDlRow">
											<i class="glyphicon glyphicon-minus"></i>
										</button>
										<button type="button" class="btn btn-default" id="btnUp">
											<i class="glyphicon glyphicon-arrow-up"></i>
										</button>
										<button type="button" class="btn btn-default" id="btnDown">
											<i class="glyphicon glyphicon-arrow-down"></i>
										</button>
									</div>
								</div>
								<form class="form-horizontal form-label-left">
									<table class="table table-hover table-condensed">
										<colgroup>
											<col width="50px">
											<col width="10%">
											<col width="30%">
											<col width="50%">
										</colgroup>
										<thead>
											<tr>
												<th>선택</th>
												<th></th>
												<th>세부코드<span class="required">*</span></th>
												<th>세부코드명<span class="required">*</span></th>
											</tr>
										</thead>
										<tbody id="tableBody">
											<c:forEach var="data" items="${map.cmcdDtlm}">
												<tr>
													<td><input type="checkbox"><input type="hidden"
																name="vldStC" value=""></td>
															<td><p></p></td>
															<td><p class="form-control-static">${data.dtlC}</p> <input
																type="hidden" name="dtlC" value="${data.dtlC}"></td>
															<td><input type="text" class="form-control"
																required="required" name="dtlCNm" value="${data.dtlCNm}"></td>
												</tr>
									
											</c:forEach>
											
										</tbody>
									</table>
								</form>

							</div>
							<div class="button-group pull-right">
								<button type="button" class="btn btn-default" name="btnSearch"
									id="btnReSearch">
									<i class="fa fa-refresh"></i> 초기화
								</button>
								<button type="button" class="btn btn-success" name="btnSv"
									id="btnSvSubC">
									<i class="fa fa-check"></i> 저장
								</button>
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
		 	if($("#vldStC").val()=="C"){
				$("#grpC").val($("#tGrpC").val());
		 	}else if($("#vldStC").val()=="U"){
		 		$("#grpC").val($("#vldStC").next().html())
		 	}
			var data = $("#formInput").serializeObject(),dataStr = JSON.stringify(data);
			$.ajax({
				url:"<c:url value='/common/write/proc'/>",
				contentType:"application/json; charset=utf-8",
				dataType:"json",
				method:"post",
				data:dataStr
			}).done(function(data) {
			 
				if(data.msg=="0001"){
					if($("#vldStC").next().is("input")){
						$("#vldStC").val("U");
						$("#vldStC").after('<p class="form-control-static">'+$("#tGrpC").val()+'</p>');
						$("#tGrpC").remove();
						$("#btnDl").show();
					}
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
			alert($("#vldStC").next().html());
			var data = {"grpC":$("#vldStC").next().html()},dataStr = JSON.stringify(data);
			
			$.ajax({
				url:"<c:url value='/common/delete/proc'/>",
				//contentType:"application/json; charset=utf-8",
				dataType:"json",
				method:"post",
				data:dataStr
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
		
		$("#btnAddRow").on('click', function() {
			var tag = '<tr><td><input type="checkbox"><input type="hidden"name="vldStC" value="C"></td><td><p></p></td><td><input type="text" class="form-control"required="required" name="dtlC"></td><td><input type="text" class="form-control"required="required" name="dtlCNm"></td></tr>'
			$("#tableBody").append(tag);
		})
		
		$("#btnDlRow").on('click', function() {
			
			var chks = $("#tableBody tr").children().find("input:checked");
		
		 	if(chks.length>0){
				$.each(chks, function(i, elt) {
			 		if($(this).next().val()=="C"){
			 	 		$(this).parent().parent().remove();	
			 		}else{
			 			$(this).next().val("D");
			 			$(this).parent().next().find("p:first-child").html("삭제");
			 			
			 			$(this).removeAttr("checked");
						$(this).attr("disabled", "disabled");
			 		}
			 	})
			}else{
				alert("선택된 코드가 없습니다");
			}
		})
				/**
		 * 위로 버튼 클릭 이벤트
		 */
		$("#btnUp").on("click", function() {
			var chks = $("#tableBody tr").children().find("input:checked");
			if (chks.length == 1) {
				$(chks).each(function(i, el) {
					var $tr = $(el).closest('tr'); // 클릭한 버튼이 속한 tr 요소
					var $st = $tr.children().find("input[name='vldStC']");
					if ($st.val() == "") {
						$st.val("U");
					}
					$st = $tr.prev().children().find("input[name='vldStC']");
					if ($st.val() == "") {
						$st.val("U");
					}
					$tr.prev().before($tr);
				});
			} else {
				alert("대상을 한건씩 선택하여 이동하십시오.");
			}
		});
	
		/**
		 * 아래로 버튼 클릭 이벤트
		 */
		$("#btnDown").on("click", function() {
			var chks = $("#tableBody tr").children().find("input:checked");
			if (chks.length == 1) {
				$(chks).each(function(i, el) {
					var $tr = $(el).closest('tr'); // 클릭한 버튼이 속한 tr 요소
					var $st = $tr.children().find("input[name='vldStC']");
					if ($st.val() == "") {
						$st.val("U");
					}
					$st = $tr.next().children().find("input[name='vldStC']");
					if ($st.val() == "") {
						$st.val("U");
					}
					$tr.next().after($tr);
	
				});
			} else {
				alert("대상을 한건씩 선택하여 이동하십시오.");
			}
		});
		
		
		$("#btnSvSubC").on('click', function() {
		 
			var grpC = $("#grpC").val();
			var data = [],func = 0;
			$("#tableBody tr").each(function(i, elt) {
			 
				var colums = $(this).children();
				var texts = colums.find("input[type='text']");
				$(texts).each(function(idx, e) {
				 
					if($(this).val()==''){
						$(this).css("background-color","yellow");
						func++;
					}
				});
				
				data.push({grpC:grpC,
					vldStC:$(colums).find("input[name='vldStC']").val(),
					dtlC:$(colums).find("input[name='dtlC']").val(),
					dtlCNm:$(colums).find("input[name='dtlCNm']").val()
				});
			});
			if(grpC==''){
				alert("그룹코드를 먼저 등록하십시오.");
				return false;
			}
			if(func>0){
				alert("세부코드와 세부코드명은 필수 입력 항목입니다.");
				return false;
			}
			
			$.ajax({
		   		url : "<c:url value='/common/subWrite/proc'/>"
				, method : "post"
		   		, dataType : "json"
		   		, data : JSON.stringify(data)
		   		, contentType : "application/json; charset=UTF-8"
			})
			.done(function(code){
				if(code.msg=="0001"){
					alert("Request Success");
					
				}else{
					alert(code.msg);
				}
			});
		})
		$("#tableBody").on("change","input[type='text']",function() {
			var vldStC = $(this).parent().parent().children().find("input[name='vldStC']");
			if ($(vldStC).val() == "") {
				$(vldStC).val("U");
			}
			$(this).css("background-color", "#FFFFFF");
		});
		
	})
</script>
</html>