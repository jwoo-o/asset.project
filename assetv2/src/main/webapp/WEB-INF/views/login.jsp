<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GIOSIS MANAGER</title>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<!-- Bootstrap -->
	<link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/css/custom.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- jQuery -->
	<script src="/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap javascript -->
	<script src="/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- bootstrap-daterangepicker -->
    <script src="/vendors/moment/moment.js"></script>
    <script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    	<!-- iCheck -->
	<script src="/vendors/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="/vendors/fastclick/lib/fastclick.js"></script>
	<!-- Validator -->
	<script src="/vendors/validator/validator.js"></script>
	<!-- Combo Options -->
    <script src="/js/lib/comboCodes.js"></script>
	<!-- Function Utils -->
	<script src="/js/functionutils.js?v=20180823"></script>
	<script src="/js/ajax_error.js"></script>

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../assets/js/ie8-responsive-file-warning.js"></script><![endif]--	>
    <script src="/vendors/bootstrap/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <title>Welcome GIOSIS</title>
    <script type="text/javascript">
    	$(function(){
    		
    		$("input[type='password']").keypress(function(e){
    			if (e.which == 13) {
    				$.loginProc();
    			}
    		});
    		
    		$("#btn-submit").click(function() {
    			$.loginProc();
    		})
    			
    	})
    	
    	$.loginProc = function(){
    			
    		var data = $("#form-signin").serializeObject(), dataStr = JSON.stringify(data);
    		$.ajax({
    			url:"/login/proc",
    			method:"post",
    			dataType:"json",
    			data : dataStr,
    			contentType:"application/json; charset=UTF-8"
    		}).done(function(data) {
    			if(data.msg == '0001'){
    				location.replace("/home");
    			}else{
    				alert(data.msg);
    			}
    		})
    	}	
    		
    </script>
  </head>
  <body class="body-signin">
    <div class="container">
		<form class="form-signin" id="form-signin" action="/login/proc" method="post">
			<h3 class="form-signin-heading">GIOSIS<br> Asset Management</h3>
			<div class="form-group">
				<label class="sr-only">아이디</label>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span><input name="mId" class="form-control" aria-describedby="basic-addon1" autofocus="" required="" type="text" placeholder="아이디">
				</div>
			</div>
			<div class="form-group">
				<label class="sr-only">비밀번호</label>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon2"><i class="glyphicon glyphicon-lock"></i></span><input name="pwd" class="form-control" aria-describedby="basic-addon2" required="" type="password" placeholder="비밀번호">
				</div>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="btn-submit" type="button">로그인</button>
			<div class="text-info">
				<p>
					계정이 없는 경우 운영 담당자에게 요청하십시오.
				</p>
			</div>
		</form>
    </div>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../vendors/bootstrap/assets/js/ie10-viewport-bug-workaround.js"></script>
  
</body></html>