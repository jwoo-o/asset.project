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
    <script src="js/jquery.session.js" type="text/javascript"></script>
    <script src="js/jquery.serializeObject.js" type="text/javascript"></script>
    <script type="text/javascript">
		
		$(function(){
			
			
			var url='/empRgt/proc';
			if("${vo.empNo}"!=""){
				
				$("#division").val("${vo.division}").prop("selected", true);
				$("#position").val("${vo.position}").prop("selected", true);
				
				
				$("#userName").prop('readonly',true);
				$("#empNo").prop('readonly',true);
				$("#gender option").not(":selected").remove();
				url = '/empMdf/proc' 
			}
			
			
			
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
			
			$("#joinDate").datepicker();
			
			
			$("#requestBt").click(function() {
				if(!$.frmchk()){
					alert("사번/이름은 필수 입력사항입니다.");
				}else{
					
					var data = $("#empForm").serializeObject(),dataStr = JSON.stringify(data);
					
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
			$("#deleteBt").click(function() {
				var url = "/empDl/proc";
				var result = confirm('Are you sure?'); 
				if(!result) { 
					return false;	
				} 
				var data = {"empNo":"${vo.empNo }"}, dataStr = JSON.stringify(data);
				
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
					}else{
						alert(data.msg);
					}
				})
			})
			
			
			$.frmchk = function() {
				var frm=$("#empForm").find("input");
				var num=frm.length-1;
				for(i=1;i<=num;i++){
					if($(frm[i]).val()==""){
						return false;	
					}
				}
				return true;
			}
				
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
		                  <h3 class="box-title"><strong>Employee Register</strong></h3>
		                </div><!-- /.box-header -->
		                
						<div class="box-body">
							  <div id="writeDiv">
										<form name="empForm" id="empForm">
										<table class="table table-bordered text-sm" style="table-layout: fixed;" id="resultTable">
										<tbody>
										<tr height="22">
											<td class="tdBack" align="left" width="15%"><strong class="list_title">이름</strong></td>
											<td align="left">&nbsp;&nbsp;<input type="text" size="10" name="userName" id="userName" value="${vo.userName }">
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
									        	</select>
									        	</td>
										</tr>
										
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">부서</strong></td>
											<td align="left">&nbsp; 
							             		<select class="SelectBox" id="division" name="division">
							                		<option value=""></option>
							                		<c:forEach var="division" items="${common.division }">
							                			<option value="${division.cCode }">${division.cName }</option>
							                		</c:forEach>
						                		</select>
						                	</td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">입사일</strong></td>
											<td align="left">&nbsp;&nbsp;<input type="text" name="joinDate" id="joinDate" size="10" value="${vo.joinDate }"></td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">성별</strong></td>
											<td align="left">&nbsp; 
							             <select class="SelectBox" id="gender" name="gender">
							             		<option value="M">남성</option> 
							             		<option value="F">여성</option>       	
							             </select></td>
										</tr>
										</tbody>
										</table>
										</form>
									
									<br>
									
									<div align="right">
										<button class="btn bg-navy btn-sm" id="requestBt" name="requestBt">Request</button>&nbsp;
										<c:if test="${vo.empNo != null }">
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