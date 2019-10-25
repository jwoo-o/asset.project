<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#floor_data{

	
	left: 1175px;
	top: 85px;
	width: 700px;
	height: 105px;
	border: 1px solid #666666;
	position:absolute;
	
	
	
}
#N3F {
	background-image: url("/images/n3f.jpg");
	width: 1865px;
	height: 930px;
	position: relative;
}

#N13F {
	background-image: url("/images/n13f.jpg");
	width: 1865px;
	height: 930px;
	position: relative;
}

.seat2 {
	width: 40px;
	height: 55px;
	border: 1px solid #666666;
	position:absolute;
	padding-top: 20px;
	background-color: #BABABA;
}
.seat1 {
	width: 55px;
	height: 40px;
	border: 1px solid #666666;
	position:absolute;
	padding-top: 13px;
	background-color:#BABABA;
}
p{
	text-align: center;
	font-size: x-small;
}
.seat3 {
	width: 50px;
	height: 40px;
	border: 1px solid #666666;
	position:absolute;
	padding-top: 13px;
	background-color:#BABABA;
}


</style>
</head>
<body class="content-wrapper2">
	<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary" style="padding: 10px; width:1880px ">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong id="seat_title">N3F</strong></h3>
		                </div><!-- /.box-header -->
		                <button id="btn_n3f" class="btn btn-primary">N3F</button>&nbsp;&nbsp;<button id="btn_n13f" class="btn btn-primary">N13F</button>
		                
		                <div id="N3F"></div>
						<div id="N13F" style="display: none;"></div>
						<div id="floor_data">
						</div>
					</div>	
				</div>
			</div>
			<div id="employee_info" style="display: none">
			
        		<div class="form-group" style="text-align: center;">  
	                <img alt="사진" width="150px" height="170px" id="profile">
	            </div>
        		<div class="form-group">
	                <label for="empNo">사번</label>
	                <input type="text" class="form-control" id="empNo" readonly="readonly"/>
	            </div>
	            <div class="form-group">
	                <label for="name">이름</label>
	                <input type="text" class="form-control" id="name" readonly="readonly"/>
	            </div>
	            <div class="form-group">
	                <label for="division">부서</label>
	                <input type="text" class="form-control" id="division" readonly="readonly"/>
	            </div>   
	             <div class="form-group">
	                <label for="position">직위</label>
	                <input type="text" class="form-control" id="position" readonly="readonly" />
	            </div>
	                  
            </div>
			
	</section>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.js" type="text/javascript"></script>
<script src="/js/seat.js" type="text/javascript"></script>
</body>
</html>