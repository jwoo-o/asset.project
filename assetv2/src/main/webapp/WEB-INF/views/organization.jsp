<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<link href="/css/orgchart.css" rel="stylesheet" type="text/css">
<style type="text/css">
.org_div {
		position: relative;
		text-align: center;
	}
.orgchart { 
	background: #fff; 
	}
	
	.box {
	position: relative;
	border-radius: 3px;
	background: #ffffff;
	border-top: 3px solid #d2d6de;
	margin-bottom: 20px;
	width: 100%;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}
.box.box-primary {
	border-top-color: #3c8dbc;
}
.box-header .box-title
	{
	display: inline-block;
	font-size: 18px;
	margin: 0;
	line-height: 1;
}
.box-header.with-border {
	border-bottom: 1px solid #f4f4f4;
}
.content {
	padding: 15px;
	margin-right: auto;
	margin-left: auto;
	padding-left: 15px;
	padding-right: 15px;
}
.content-wrapper2 {
	z-index: 0;
	margin-left: 0;
	min-height: 100%;
	background-color: #ecf0f5;
	z-index: 0;
}
#floor_data{

	
	left: 60%;
	top: 85px;
	width: 700px;
	height: 128px;
	border: 1px solid #666666;
	position:absolute;	
}
#floor_data .title{
	 background-color: rgba(155, 124, 201, 0.8);
  	 color: #fff;
}

</style>
</head>
<body class="content-wrapper2">
<input type="hidden" id="mgrAuth" value="${mgr.auth }">
	<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary" style="padding: 10px; width:100%; height: 800px; ">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong id="seat_title">kr</strong></h3>
		                </div><!-- /.box-header -->
		                <button id="btn_kr" class="btn btn-primary btn-country">kr</button>&nbsp;&nbsp;<button id="btn_sg" class="btn btn-primary btn-country">sg</button>&nbsp;&nbsp;<button id="btn_cn" class="btn btn-primary btn-country">cn</button>&nbsp;&nbsp;<button id="btn_id" class="btn btn-primary btn-country">id</button>&nbsp;&nbsp;<button id="btn_my" class="btn btn-primary btn-country">my</button>
		     			<button id="btn_download" class="btn btn-primary" style="left:95%; position: absolute;">download</button>
		                <div id="org_div" class="org_div" style="height: 700px; width:100%;" ></div>
						<div id="floor_data"></div>
					</div>	
				</div>
			</div>	
	</section>
	
	<div id="modify">
        <form id="mdfForm" enctype="multipart/form-data">
        	
            <input type="hidden" class="form-control" id="eempNo" name="empNo">
            <input type="hidden" class="form-control" id="eemail" name="email">
            <input type="hidden" class="form-control" id="original_name">
            <input type="hidden" class="form-control" id="isManager">
            <input type="hidden" id="ebasic_dept" name="basic_dept">
            <input type="hidden" id="edivision" name="division">  
            <div class="form-group" style="text-align: center;">  
	       		<img alt="사진" width="150px" height="170px" id="profile">
	        </div>
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
                <label for="country">사업국가</label>
                <select class="form-control" id="ecountry" name="country">
	                <option value="">선택하세요</option>
	                <c:forEach var="country" items="${common.country }">
	                	<option value="${country.cCode }">${country.cName }</option>
	                </c:forEach>
                </select>

            </div>
             <div class="form-group">
                <label for="division">부서</label>
                <select class="form-control dept" id="efirst_dept" name="first_dept">
	                <option value="">## NONE ##</option>
                </select>
            </div>
             <div class="form-group">
              <select class="form-control dept" id="esecond_dept" name="second_dept">
	                <option value="">## NONE ##</option>
                </select>
             </div>
              <div class="form-group">
              <select class="form-control dept" id="ethree_dept" name="three_dept">
	                <option value="">## NONE ##</option>
                </select>
             </div>
              <div class="form-group">
              <select class="form-control dept" id="efour_dept" name="four_dept">
	                <option value="">## NONE ##</option>
                </select>
             </div>
            <div class="form-group ga_only">
                <label for="office_number">사무실전화번호</label>
                <input type="text" class="form-control" id="eoffice_number" name="office_number" maxlength="12">
            </div>
            <div class="form-group">
                <label for="seat">좌석</label>
                <div role="wrapper" class="gj-datepicker gj-datepicker-md gj-unselectable">
                <input type="text" class="form-control gj-textbox-md seat" id="eseat" name="seat" role="input">
                <i class="fa fa-map-marker seatMap" role="right-icon"></i>
                </div>    	
            </div>
            <div class="form-group">
                <label for="estatus">상태</label>
                <select class="form-control" id="estatus" name="status">
                	<option value="y">정상</option>
					<option value="n">휴직</option>
                </select>
            </div>
             <div class="form-group">
                <label for="profile">사진</label>
                <div role="wrapper" class="gj-datepicker gj-datepicker-md gj-unselectable">
                <input type="file" class="form-control gj-textbox-md" id="profile_upload" name="profile" role="input"/>
                <i class="fa fa-check upload"role="right-icon" style="display: none"></i>
                </div>
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
    
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/jquery.serializeObject.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/html2canvas.min.js"></script>
<script type="text/javascript" src="/js/jspdf.min.js"></script>
<script type="text/javascript" src="/js/orgchart.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script src="/js/gijgo.js" type="text/javascript"></script>
<script src="/js/manager.js" type="text/javascript"></script>
<script src="/js/organization.js" type="text/javascript"></script>
</body>
</html>