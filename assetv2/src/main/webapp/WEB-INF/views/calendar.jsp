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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link href='/css/fullcalendar.css' rel='stylesheet' />
    <link href='/css/fullcalendar.print.css' rel='stylesheet' media='print' />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="/css/jquery.tagit.css" rel="stylesheet" type="text/css">
    <script src='/js/moment.min.js'></script>
    <script src='/js/jquery.min.js'></script>
    <script type="text/javascript" src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.js" type="text/javascript"></script>
    <script src="/js/tag-it.js" type="text/javascript"></script>
    <script src='/js/fullcalendar.min.js'></script>
    <script type="text/javascript" src="/js/ko.js"></script>
    <script src="/js/jquery.serializeObject.js" type="text/javascript"></script>
    <script src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript">
   		var mgr_data = "${mgr}"
    </script>
    <script type="text/javascript" src="/js/calendar.js"></script>  
</head>
<body  class="content-wrapper2" style="max-height: 870px; max-width: 1000px;">
	
		<input type="hidden" id="mgrAuth" value="${mgr.auth }">
		   <!-- Main content -->
	       <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary" style="padding: 10px;">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong>Planned to join</strong></h3>
		                </div><!-- /.box-header -->
						<div id='calendar'></div>
					</div>
				</div>
			</div>
	
		</section>
	    <div id="regist" style="display: none">
        <form id="regForm">
        	<input type="hidden" name="start" id="start">
        	<input type="hidden" name="end" id="end">
        	<input type="hidden" name="no" id="no">
        	<input type="hidden" name="division" id="division">
        	<input type="hidden" name="basic_dept" id="basic_dept">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" maxlength="10"/>
            </div>
             <div class="form-group">
                <label for="first_dept">부서</label>
                <select class="form-control" id="first_dept" name="first_dept">
	                <option value="">## NONE ##</option>
	                <c:forEach var="dept" items="${dept}">
	                	<option value="${dept.dept_no }">${dept.dept_nm}</option>
	                </c:forEach>
                </select>
            </div>
             <div class="form-group">
              <select class="form-control dept" id="second_dept" name="second_dept">
	                <option value="">## NONE ##</option>
                </select>
             </div>
              <div class="form-group">
              <select class="form-control dept" id="three_dept" name="three_dept">
	                <option value="">## NONE ##</option>
                </select>
             </div>
              <div class="form-group">
              <select class="form-control dept" id="four_dept" name="four_dept">
	                <option value="">## NONE ##</option>
                </select>
             </div>
            <div class="form-group">
                <label for="name">관리자</label>
                <div class="input-col"><ul id="mgr" class="auto"></ul></div>
                <!--  <input type="text" class="form-control" id="mgr" name="mgr" maxlength="10"/>
                <input type="hidden" id="mgr_email" name="mgr_email"/>-->
            </div>
             <div class="form-group">
                <label for="gender">증원/충원</label>
                <select class="form-control" id="addNrein" name="addNrein">
                	<option value="증원">증원</option> 
					<option value="충원">충원</option>       
                </select>
            </div>
             <div class="form-group">
                <label for="seat">예정 좌석</label>
                <div role="wrapper" class="gj-datepicker gj-datepicker-md">
                <input type="text" class="form-control" name="seat" role="input">
                <i class="fa fa-map-marker" role="right-icon" id="seat"></i>
                </div>
                <!--<input type="text" class="form-control" id="seat" name="seat" maxlength="200"/>-->
            </div>
            
            <button type="button" id="btnSave" class="btn btn-default">Save</button>
            <button type="button" id="btnDelete" class="btn btn-default">Delete</button>
            <button type="button" id="btnJoin" class="btn btn-danger" style="display: none">Join</button>
            <button type="button" class="btn btn-default btnCancel">Cancel</button>
        </form>
    </div>
    <div id="employee_regist" style="display: none">
    	<form id="empForm">
	    	<div class="form-group">
	        	<label for="empNo">사번</label>
	        	<input type="text" class="form-control" id="empNo" name="empNo" maxlength="10"/>
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
	        	<label for="gender">성별</label>
		        <select class="form-control" id="gender" name="gender">
					<option value="M">Male</option> 
					<option value="F">Female</option>       	
				</select>
			</div>
	    	<div class="form-group">
	        	<label for="email">이메일</label>
	        	<input type="text" class="form-control" id="email" name="email" value="@qoo10.com"/>
	    	</div>
	    	<div class="form-group">
	        	<label for="ext">ext</label>
	        	<input type="text" class="form-control" id="ext" name="ext"/>
	    	</div>
	    	<div class="form-group" id="ga_only">
                <label for="office_number">사무실전화번호</label>
                <input type="text" class="form-control" id="office_number" name="office_number" maxlength="12">
            </div>
	    	<button type="button" id="btnSuccess" class="btn btn-default">Success</button>
	    	<button type="button" class="btn btn-default btnCancel">Cancel</button>
	    </form>
    </div>
</body>

</html>