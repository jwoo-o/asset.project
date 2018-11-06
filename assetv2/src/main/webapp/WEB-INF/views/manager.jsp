<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		body{
			background: #ecf0f5;
		}
		tbody{
			background: #ffffff;
		}
	</style>
	
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/js/common.js" type="text/javascript"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.js" type="text/javascript"></script>
  	<script src="js/jquery.serializeObject.js" type="text/javascript"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="background: #ffffff">
            <div class="col-9">
                <form class="form-inline" id="srchForm">
                	<select id="keyword" class="form-control mb-2 mr-sm-2 mb-sm-0">
                		<option value="">선택</option>
                		<option value="name">이름</option>
                		<option value="division">부서</option>
                		<option value="position">직위</option>
                		<option value="status">상태</option>
                		<c:if test="${mgr.auth==1 }">
                		<option value="manager">계정</option>
                		</c:if>
                	</select>
                	<span id="s"></span>
                     <button id="btnSearch" type="button" class="btn btn-default">Search</button> &nbsp;
               		 <button id="btnClear" type="button" class="btn btn-default">Clear</button>
                </form>
            </div>
            <div class="col-3">
                <button id="btnAdd" type="button" class="btn btn-default pull-right">New</button>
            </div>
        </div>
        <div class="box box-primary" style="margin-top: 10px">
            <div class="col-12">
                <table id="grid"></table>
            </div>
        </div>
    </div>

    <div id="regist" style="display: none">
        <form id="regForm">
            <div class="form-group">
                <label for="empNo">사번</label>
                <input type="text" class="form-control" id="empNo" name="empNo">
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name"/>
            </div>
             <div class="form-group">
                <label for="position">직위</label>
                <select class="form-control" id="position" name="position">
	                <option value=""></option>
	                <c:forEach var="position" items="${common.position }">
	                	<option value="${position.cCode }">${position.cName }</option>
	                </c:forEach>
                </select>

            </div>
             <div class="form-group">
                <label for="division">부서</label>
                <select class="form-control" id="division" name="division">
	                <option value=""></option>
	                <c:forEach var="division" items="${common.division }">
	                	<option value="${division.cCode }">${division.cName }</option>
	                </c:forEach>
                </select>
            </div>
             <div class="form-group">
                <label for="gender">성별</label>
                <select class="form-control" id="gender" name="gender">
                	<option value="M">남성</option> 
					<option value="F">여성</option>       
                </select>
            </div>
             <div class="form-group">
                <label for="email">이메일</label>
                <input type="text" class="form-control" id="email" name="email" value="@qoo10.com"/>
            </div>
            <div class="form-group">
                <label for="joinDate">입사일</label>
                <input type="text" class="form-control" id="joinDate" name="joinDate"/>
            </div>
            <button type="button" id="btnSave" class="btn btn-default">Save</button>
            <button type="button" id="btnCancel" class="btn btn-default">Cancel</button>
        </form>
    </div>
    <div id="modify" style="display: none">
        <form id="mdfForm">
            <input type="hidden" class="form-control" id="eempNo" name="empNo">
            <input type="hidden" class="form-control" id="eemail" name="email">
            <div class="form-group">
                <label for="ename">이름</label>
                <input type="text" class="form-control" id="ename" readonly="readonly" name="name"/>
            </div>
             <div class="form-group">
                <label for="eposition">직위</label>
                <select class="form-control" id="eposition" name="position">
                	<option value=""></option> 
	                <c:forEach var="position" items="${common.position }">
	                	<option value="${position.cCode }">${position.cName }</option>
	                </c:forEach>
                </select>
            </div>
             <div class="form-group">
                <label for="edivision">부서</label>
                <select class="form-control" id="edivision" name="division">
                	<option value=""></option>
	                <c:forEach var="division" items="${common.division }">
	                	<option value="${division.cCode }">${division.cName }</option>
	                </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="estatus">상태</label>
                <select class="form-control" id="estatus" name="status">
                	<option value="y">정상</option>
					<option value="n">휴직</option>
                </select>
            </div>
            <div class="form-group" id="managerCr">
                <label for="">계정생성</label>
                <input type="checkbox" id="manager" name="manager" value="y">
            </div>
            <div class="form-group" id="managerDiv" style="display: none">
                <label for="managerAuth">계정권한</label>
                <select class="form-control" id="auth" name="auth">
                	<option value="0">일반</option>
					<option value="1">관리자</option>
                </select>
            </div>
            <button type="button" id="btnRevise" class="btn btn-default">Revise</button>
            <button type="button" id="btnCancel1" class="btn btn-default">Cancel</button>
        </form>
    </div>

    <script type="text/javascript">
        var grid, regist,modify;
      	
        if("${mgr.auth}"==0){
        	$("#btnAdd").remove();
        }
        
        
        function Edit(e) {
        	if("${mgr.auth}"!=0){
	            $("#eempNo").val(e.data.id);
	            $("#ename").val(e.data.record.name);
	            $("#eposition").val(e.data.record.pcode).prop("selected",true);
	            $("#edivision").val(e.data.record.dcode).prop("selected",true);
	            $("#estatus").val(e.data.record.status).prop("selected",true);
	            $("#eemail").val(e.data.record.email);
	            if(e.data.record.manager=='y'){
	            	$("#managerDiv").show();
	            	$("#manager").prop("checked",true);
	            	$("#auth").val(e.data.record.auth).prop("selected",true);
	            }else{
	            	$("#managerDiv").hide();
	            }
	            modify.open('사원 수정');
        	}else{
        		alert("Not Authorization");
        	}
        }
        function frmchk() {
			var frm=$("#regForm").find("input");
			var num=frm.length;
			for(i=0;i<=num;i++){
				if($(frm[i]).val()==""){
					return false;	
				}
			}
			return true;
		}
        function Save() {
        	
        	if(!frmchk()){
				alert("사번/이름/입사일은 필수 입력사항입니다.");
        	}else{
        		
	            var data = $("#regForm").serializeObject(),dataStr = JSON.stringify(data); 
	               
	            
	            $.ajax({ url: '/empRgt/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
	                .done(function () {
	                    regist.close();
	                    var keyword = $("#keyword").val();
                    	var search = $("#search").val();
        				grid.reload({ keyword : keyword, search : search,page : 1 });
	                })
	                .fail(function (e) {
	                	if(e.status == 401){
	                		regist.close();
	        				oonErrorFunc(e);
	                	}
	                });
        	}
        }
        
        function Revise() {
            var data = $("#mdfForm").serializeObject(), dataStr = JSON.stringify(data);  
            $.ajax({ url: '/empMdf/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
                .done(function () {
                    modify.close();
                    grid.reload();
                })
                .fail(function (e) {
                	if(e.status == 401){
                		modify.close();
                		onErrorFunc(e);
                		
                	}
                });
        }
        
        
        function Delete(e) {
        	if("${mgr.auth}"!=0){
	            if (confirm('Are you sure?')) {
	            	var data = { empNo: e.data.id,name: e.data.record.name,manager:e.data.record.manager }, dataStr = JSON.stringify(data);
	                $.ajax({ url: '/empDl/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
	                    .done(function () {
	                        grid.reload();
	                    })
	                    .fail(function (e) {
	                    	onErrorFunc(e);
	                    });
	            }
        	}else{
        		alert("Not Authorization");
        	}
        }
        /*function DeleteMgt(record){
        	
        	var data = {"empNo":record.empNo},dataStr = JSON.stringify(data);
        	 $.ajax({ url: '/managerDl/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
             .done(function (data) {
            	 if(data.msg=='0001'){
             		alert("계정 삭제 완료");
             		
             	}else{
            		alert(data.msg);
            	}
             })
             .fail(function (e,data) {
             	if(e.status == 401){
             		alert("세션이 만료되었습니다. 다시로그인 하세요");
     				opener.parent.location.reload();
     				window.close();
             	}
             });
        }*/
        
        /*function RegisterMgt(record){
        	 var data = {"mId":record.email,"mName":record.name,"empNo":record.empNo,"position":record.position,"dept":record.division},dataStr = JSON.stringify(data);
        	$.ajax({
            	url:"/managerRgt/proc",
            	data:dataStr,
            	dataType:"json",
            	contentType:"application/json;charset=utf-8",
            	method:"post"
            }).done(function(data) {
            	if(data.msg=='0001'){
            		alert("계정 등록 완료");
            		
            	}else{
            		alert(data.msg);
            	}
            }).fail(function (e) {
             	if(e.status == 401){
             		alert("세션이 만료되었습니다. 다시로그인 하세요");
     				opener.parent.location.reload();
     				window.close();
             	}
             });
        }*/
        
        
        
        $(document).ready(function () {
        	
        	
        	
        	$("#joinDate").datepicker({format:'yyyy-mm-dd',header: true, modal: true, footer: true });
        	
        	
        	
        	
        	var keyword,search;
        	var division_data = ['Corporate Development Division','Development Unit','FA Division','Fulfillment Operation Group','Global Biz Division','Global JP Group','Global P.Planning Division','KR GA & ER Division','KRSG Beauty & Fashion Division','Live10 Division','Platform Planning Division','SQM Division','Technology Unit','US & EU Biz Division'];
            var position_data = ['Dispatched','Staff','Senior Staff','Manager','Senior Manager','General Manager','Director','Managing Director'];
            grid = $('#grid').grid({
                primaryKey: 'empNo',
                dataSource: {url:'/empLst/proc',error:onErrorFunc },
                uiLibrary: 'bootstrap4',
                columns: [
                    { field: 'empNo',title: '사번', width: 100, align: 'center' },
                    { field: 'name',title: '이름', width: 100,sortable: true, align: 'center' },
                    { field: 'position', title: '직위', sortable: true, align: 'center' },
                    { field: 'division', title: '부서', sortable: true, align: 'center' },
                    { field: 'gender', title: '성별', width: 70, align: 'center' },
                    { title: '', field: 'Edit', width: 42, type: 'icon', icon: 'fa fa-pencil', tooltip: 'Edit', events: { 'click': Edit } },
                    { title: '', field: 'Delete', width: 42, type: 'icon', icon: 'fa fa-remove', tooltip: 'Delete', events: { 'click': Delete } }
                ],
                pager: { limit: 10, sizes: [10, 20, 50] }
            });
            

            


            regist = $('#regist').dialog({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                autoOpen: false,
                resizable: false,
                modal: true
            });
            modify = $('#modify').dialog({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                autoOpen: false,
                resizable: false,
                modal: true
            });
            $('#btnAdd').on('click', function () {
               $("#regForm")[0].reset();
                regist.open('사원 등록');
            });
            $('#btnSave').on('click', Save);
            $('#btnRevise').on('click', Revise);
            $('#btnCancel').on('click', function () {
               regist.close();
              
            });
            
            $('#btnCancel1').on('click', function () {
            	modify.close();
               
             });
            
            $('#btnSearch').on('click', function () {
            	keyword = $("#keyword").val();
            	search = $("#search").val();
                grid.reload({ keyword : keyword, search : search,page : 1 });
            });
            $('#btnClear').on('click', function () {
                $('#keyword').val('').prop("selected", true);
                $('#s').empty();
               	grid.reload({ keyword : '', search : '' });
            });
            $("#keyword").change(function() {
            	$("#search").remove();
            	var keyword = $("#keyword option:selected").val();
            	var select = $("<select id='search' class='form-control mb-2 mr-sm-2 mb-sm-0'></select>");
            	switch(keyword){
            		case '':
            			$("#search").remove();
            			break;
            		case 'name':
            			
            			var input = $('<input id="search" type="text" placeholder="name...." class="form-control mb-2 mr-sm-2 mb-sm-0" />');
            			$("#s").append(input);
            			break;
            	
            		case 'division':
            			$(select).append("<option value=''>선택</option>");
            			for(var i=0;i<division_data.length;i++){
            				var option = $("<option value='"+i+"'>"+division_data[i]+"</option>")
            				$(select).append(option).show();
            			}
            			$("#s").append(select).show();;
            			//alert(division_data.length);
                		break;
            		case 'position':
            			$(select).append("<option value=''>선택</option>");
            			for(var i=0;i<position_data.length;i++){
            				var option = $("<option value='"+i+"'>"+position_data[i]+"</option>")
            				$(select).append(option);
            			}
            			$("#s").append(select).show();;
            			//alert(division_data.size());
                		break;
            		case 'status':
            			$(select).append("<option value='y'>정상</option><option value='n'>휴직</option>");
            			$("#s").append(select).show();;
            			break;
            		case 'manager':
            			$(select).append("<option value='y'></option>");
            			$("#s").append(select).hide();
            			break;
            			
            	}
            })
            $("#manager").change(function() {
            	if($("#manager").is(":checked")){
            		$("#managerDiv").show();
            	}else{
            		$("#managerDiv").hide();
            		
            		var data = {"empNo":$("#eempNo").val()},dataStr = JSON.stringify(data);
               	 	$.ajax({ url: '/managerDl/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
                    .done(function (data) {
	                   	 if(data.msg=='0001'){
	                    	alert("계정 삭제 완료");
	                    	
	                   	}
                    })
                    .fail(function (e,data) {
                    	if(e.status == 401){
                    		onErrorFunc(e);
                    	}
                    });
            	}
            })
            

            
        });
    </script>
</body>
</html>