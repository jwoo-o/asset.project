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
  	<script src="/js/manager.js" type="text/javascript"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="background: #ffffff">
            <div class="col-9">
            <input type="hidden" id="mgrAuth" value="${mgr.auth }">
                <form class="form-inline" id="srchForm">
                	
                	<select id="keyword" class="form-control mb-2 mr-sm-2 mb-sm-0">
                		<option value="">선택</option>
                		<option value="name">이름</option>
                		<option value="division">부서</option>
                		<option value="position">직위</option>
                		<option value="office">사무실</option>
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

</body>
</html>