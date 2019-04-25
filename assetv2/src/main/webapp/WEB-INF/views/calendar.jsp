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
    <link href="css/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link href='/css/fullcalendar.css' rel='stylesheet' />
    <link href='/css/fullcalendar.print.css' rel='stylesheet' media='print' />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src='/js/moment.min.js'></script>
    <script src='/js/jquery.min.js'></script>
    <script type="text/javascript" src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.js" type="text/javascript"></script>
    <script src='/js/fullcalendar.min.js'></script>
    <script type="text/javascript" src="/js/ko.js"></script>
    <script src="/js/jquery.serializeObject.js" type="text/javascript"></script>
    <script src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/calendar.js"></script>
</head>
<body  class="content-wrapper2">
	
		
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
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" maxlength="10"/>
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
                <label for="name">관리자</label>
                <input type="text" class="form-control" id="mgr" name="mgr" maxlength="10"/>
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
                <input type="text" class="form-control" id="seat" name="seat" maxlength="200"/>
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
	        	<label for="name">이메일</label>
	        	<input type="text" class="form-control" id="email" name="email" value="@qoo10.com"/>
	    	</div>
	    	<button type="button" id="btnSuccess" class="btn btn-default">Success</button>
	    	<button type="button" class="btn btn-default btnCancel">Cancel</button>
	    </form>
    </div>
</body>
	
</html>