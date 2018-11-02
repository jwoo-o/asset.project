<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GIOSIS MANAGER</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/js/jquery.form.js" type="text/javascript"></script>
    <script src="/js/jquery.session.js" type="text/javascript"></script>
    <script src="/js/jquery.serializeObject.js" type="text/javascript"></script>
    <script type="text/javascript">
		
		$(function(){
			
			var assetNo;
			//var mInch = $('<tr height="22" id="inch"><td class="tdBack" align="left" width="15%"><strong class="list_title">종류</strong></td><td align="left">&nbsp;<select class="SelectBox" id="mInch" name="mInch"><option value="">선택하세요</option><option value="0">none</option><option value="1">17인치</option><option value="2">19인치</option><option value="3">24인치</option><option value="4">27인치</option></select></td></tr>');
			var url='/register/proc';
			if("${vo.assetNo}"!=""){
				
				$("#category").val("${vo.category}").prop("selected", true);
				$("#status").val("${vo.status}").prop("selected", true);
				$("#position").val("${vo.position}").prop("selected", true);
				$("#division").val("${vo.division}").prop("selected", true);
				
				$("#assetForm").find("input").prop('readonly',true);
				$("#category option").not(":selected").remove();
				$("#buying").prop('disabled','disabled');
				if("${vo.category}"=="1"){
					$("#inch").show();
					$("#mInch").val("${vo.mInch}").prop("selected", true);
					$("#mInch option").not(":selected").remove();
				}
				url = '/update/proc' 
			}
			$("#category").change(function() {
				var category = $("#category option:selected").val();
				if(category=='1'){
					$("#inch").show();
				}else{
					$("#inch").hide();
				}
				if(category==''){
					$("#assetNo").val("");
				}else{
					$.ajax({
						url:"/assetNoSearch/proc",
						dataType:"json",
						method:"post",
						data:category,
						contentType:"application/json; charset=UTF-8"
					}).done(function(data) {
						if(data.msg=="0001")
							$("#assetNo").val(data.assetNo);
						else
							alert(data.msg);
					})
				}
			})
			
			
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
			
			$("#buying").datepicker();
			
			$("#deleteBt").click(function() {
				var url = "/delete/proc";
				if($("#status").val()=="d"){
					var result = confirm('Are you sure?'); 
					
					if(!result) { 
						return false;	
					} else {
						url = "/deleteY/proc";
					}
				}
				
				var data = {"aNo":"${vo.aNo }"}, dataStr = JSON.stringify(data);
				
				$.ajax({
					url:url,
					method:"post",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					data:dataStr
				}).done(function(data) {
					if(data.msg="0001"){
						alert("Request Success");
						window.close();
						$("#searchBt", opener.document).click();
					}else{
						alert(data.msg);
					}
				})
			})
			
			$("#requestBt").click(function() {
				if(!$.frmchk()){
					alert("자산정보를 입력하세요");
				}else{
					var data = $("#assetForm").serializeObject();
					data.userName = $("#userName").val();
					data.position = $("#position").val();
					data.division = $("#division").val();
					data.empNo = $("#empNo").val();
					data.note = $("#note").val();
					
					var dataStr = JSON.stringify(data);
					
					
					$.ajax({
						url:url,
						method:"post",
						dataType:"json",
						data:dataStr,
						contentType:"application/json; charset=UTF-8"
					}).done(function(data) {
						if(data.msg=="0001"){
							alert("Request Success");
							window.close();
							$("#searchBt", opener.document).click();
						}else{
							alert(data.msg);
						}
							
					}).fail(function(e) {
						if(e.status==401)
							alert("세션이 만료되어 입력에 실패하였습니다. 다시로그인 하세요");
							opener.parent.location.reload();
							window.close();
					})
				}
			})
			
			$("#empBt").click(function() {
				
					$.empSearch();
					
			})
			$("#userName").keypress(function(e) {
				if(e.which==13)
					$.empSearch();
			})
			
			$.empSearch = function(){
				
				var data = {"userName":$("#userName").val()};
				var dataStr = JSON.stringify(data);
				
				
				$.ajax({
					url:"/empSC/proc",
					method:"post",
					dataType:"json",
					data:dataStr,
					contentType:"application/json; charset=UTF-8"
				}).done(function(data) {
					var emp = data.emp
					if(emp!=null){
						$("#empNo").val(emp.empNo);
						$("#position").val(emp.position).prop("selected", true);
						$("#division").val(emp.division).prop("selected", true);
					}else{
						alert("찾는 직원이 없습니다.");
					}
						
				}).fail(function(e) {
					if(e.status==401){
						alert("세션이 만료되어 입력에 실패하였습니다. 다시로그인 하세요");
						opener.parent.location.reload();
						window.close();
					}
				})
			}
			$.frmchk = function() {
				var frm=$("#assetForm").find("input");
				var num=frm.length-1;
				for(i=1;i<=num;i++){
					if($(frm[i]).val()==""){
						return false;	
					}
				}
				if($("#category").val()==""){
					return false;
				}
				return true;
			}
				
			function yesnodialog(button1, button2, element){
				  var btns = {};
				  btns[button1] = function(){ 
				      element.parents('li').hide();
				      $(this).dialog("close");
				  };
				  btns[button2] = function(){ 
				      // Do nothing
				      $(this).dialog("close");
				  };
				  $("<div></div>").dialog({
				    autoOpen: true,
				    title: 'Condition',
				    modal:true,
				    buttons:btns
				  });
				}
				$('.delete').click(function(){
				    yesnodialog('Yes', 'No', $(this));
				})
		})
		
		
	</script>
</head>
<body>
	<div class="content-wrapper2" style="width: 600px">
		
		   <!-- Main content -->
	       <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong>Asset Register</strong></h3>
		                </div><!-- /.box-header -->
		                
						<div class="box-body">
							  <div id="writeDiv">
							   <form id="assetForm" name="assetForm">
							   <input type="hidden" value="${vo.aNo }" name="aNo" id="aNo">
									<table class="table table-bordered text-sm" style="table-layout: fixed;" id="resultTable">
										<tbody id="assetbody"><tr height="22">
											<td class="tdBack" align="left" width="15%"><strong class="list_title">종류</strong></td>
											<td align="left">
												&nbsp;
						              			<select class="SelectBox" id="category" name="category">
						              				<option value="">선택하세요</option>
						              				<c:forEach var="category" items="${common.category }">
									        	 		<option value="${category.cCode }">${category.cName }</option>
									        	 	</c:forEach>
												</select>
											</td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">자산번호</strong></td>
											<td align="left">
												&nbsp;&nbsp;<input type="text" size="10" name="assetNo" id="assetNo" value="${vo.assetNo}">
												&nbsp;&nbsp;( PC &nbsp;:&nbsp; PC0001&nbsp;&nbsp;|&nbsp;&nbsp;MONITOR &nbsp;:&nbsp; MO0001)
											
											
											</td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">모델명</strong></td>
											<td align="left">
												&nbsp;&nbsp;<input type="text" size="20" name="modelNm" id="modelNm" value="${vo.modelNm }">											
											</td>
										</tr>
										<tr height="22" id="inch" style="display: none;">
											<td class="tdBack" align="left" width="15%"><strong class="list_title">종류</strong></td>
											<td align="left">
												&nbsp;&nbsp;<select class="SelectBox" id="mInch" name="mInch">
												<option value="">선택하세요</option>
												<option value="0">none</option>
												<option value="1">17인치</option>
												<option value="2">19인치</option>
												<option value="3">24인치</option>
												<option value="4">27인치</option>
												</select>
											</td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">시리얼번호</strong></td>
											<td align="left">
												&nbsp;&nbsp;<input type="text" size="15" name="serialNo" id="serialNo" value="${vo.serialNo }">											
											</td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">구매일</strong></td>
											<td align="left">&nbsp;&nbsp;<input type="text" name="buying" id="buying" size="10" value="${vo.buying }"></td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">가격</strong></td>
											<td align="left">&nbsp;&nbsp;<input type="text" name="price" id="price" size="10" value="${vo.price }"></td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">상태</strong></td>
											<td align="left">&nbsp;&nbsp;<select class="SelectBox" id="status" name="status"> 
								              	<option value="y" selected ="selected">사용</option>
								              	<option value="s">보관</option>
												<option value="c">공용</option>
								              	<option value="d" style="display: none;">폐기</option>
							             </select></td>
										</tr>
										</tbody></table>
										</form>
										
										<form name="empForm" id="empForm">
										<table class="table table-bordered text-sm" style="table-layout: fixed;" id="resultTable">
										<tbody>
										<tr height="22">
											<td class="tdBack" align="left" width="15%"><strong class="list_title">이름</strong></td>
											<td align="left">&nbsp;&nbsp;<input type="text" size="10" name="userName" id="userName" value="${vo.userName }">
											&nbsp;&nbsp;<input type="button" class="btn bg-navy btn-sm" id="empBt" name="empBt" value="확인">&nbsp;
											</td>
											
										</tr>
										<tr height="22">
											<td class="tdBack" align="left" ><strong class="list_title">사번</strong></td>
											<td align="left">&nbsp;&nbsp;<input type="text" size="10" name="empNo" id="empNo" value="${vo.empNo }">
											</td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">직위</strong></td>
						            		<td align="left" width="80">&nbsp;
								              	<select class="SelectBox" id="position" name="position">
								              		<option value=""></option>
								              		<c:forEach var="position" items="${common.position }">
									        	 		<option value="${position.cCode }">${position.cName }</option>
									        	 	</c:forEach>
								              	</select></td>
										</tr>
										
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">부서</strong></td>
											<td align="left">&nbsp; 
							             <select class="SelectBox" id="division" name="division">
							             		<option value=""></option> 
								              	<c:forEach var="division" items="${common.division }">
									        	 	<option value="${division.cCode }">${division.cName }</option>
									        	 </c:forEach>
							             </select></td>
										</tr>
										</tbody>
										</table>
										<table class="table table-bordered text-sm" style="table-layout: fixed;" id="resultTable">
										<tbody>
										<tr height="22">
											<td class="tdBack" align="left" width="15%"><strong class="list_title">비고</strong></td>
											<td align="left">&nbsp;&nbsp;<input type="text" size="50" name="note" id="note" value="${vo.note}">
											</td>
										</tr>
										</tbody></table>
								
										<table class="table table-bordered text-sm" style="table-layout: fixed;" id="resultTable">
										<tbody>
										<tr height="22">
											<td class="tdBack" align="left" width="15%"><strong class="list_title">&nbsp;Notice</strong></td>
											<td><font color="red">사용법<br>
													 &nbsp;- 종류 선택시 자산번호를 자동 입력<br>
													 &nbsp;- 사원 검색에 없는 경우 직원등록 후 자산에 매칭<br>
												     &nbsp;- 비고란은 상태에 보관으로  수정시 위치 확인용으로 수기 작성<br>
												</font>	  	
											</td>
										</tr>
										</tbody></table>
									</form>
									<br>
									
									<div align="right">
										<button class="btn bg-navy btn-sm" id="requestBt" name="requestBt">Request</button>&nbsp;
										<c:if test="${vo.assetNo != null }">
											<button type="button" class="btn bg-red btn-sm" id="deleteBt" name="deleteBt">Delete</button>&nbsp;
										</c:if>
									</div><br>
									
							    </div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	
</body>
</html>