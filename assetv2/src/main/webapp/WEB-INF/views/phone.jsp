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
  	<script type="text/javascript">
	var type_data = new Array();
	var type_val = new Array(); 
    '<c:forEach items="${common.phone_type}" var="type">'
    	type_data.push("${type.cName}");
    	type_val.push("${type.cCode}");
    '</c:forEach>'
  	</script>
  	<script src="/js/phone.js" type="text/javascript"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="background: #ffffff">
            <div class="col-9">
                <form class="form-inline" id="srchForm">
                	
                	<select id="keyword" class="form-control mb-2 mr-sm-2 mb-sm-0">
                		<option value="">선택</option>
                		<option value="type">구분</option>
                		<option value="sub_type">용도</option>
                		<option value="company_name">업체명</option>
                		<option value="status">상태</option>
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
        <input type="hidden" class="form-control" id="no" name="no">
            <div class="form-group">
                <label for="type">구분</label>
                <select class="form-control" id="type" name="type">
                	<option value="">선택</option>
                	<c:forEach items="${common.phone_type}" var="type">
                		<option value="${type.cCode}">${type.cName}</option>
   					</c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="sub_type">용도</label>
                <input type="text" class="form-control" id="sub_type" name="sub_type">
            </div>
            <div class="form-group">
                <label for="company_name">업체명</label>
                <input type="text" class="form-control" id="company_name" name="company_name"/>
            </div>
             <div class="form-group">
                <label for="manager">담당자</label>
                <input type="text" class="form-control" id="manager" name="manager">
            </div>
             <div class="form-group">
                <label for="division">연락처1</label>
                <input type="text" class="form-control" id="tel1" name="tel1">
            </div>
            <div class="form-group">
                <label for="seat">연락처2</label>
                <input type="text" class="form-control" id="tel2" name="tel2">
            </div>
             <div class="form-group">
                <label for="email">이메일</label>
                <input type="text" class="form-control" id="email" name="email">
            </div>
             <div class="form-group">
                <label for="note">비고</label>
                <input type="text" class="form-control" id="note" name="note"/>
            </div>
            <button type="button" id="btnSave" class="btn btn-default">Save</button>
            <button type="button" id="btnCancel" class="btn btn-default">Cancel</button>
        </form>
    </div>

</body>
</html>