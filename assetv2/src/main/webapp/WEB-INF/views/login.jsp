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
	
    <!-- Custom Theme Style -->
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="/css/custom.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/js/jquery.form.js" type="text/javascript"></script>
    <script src="js/jquery.session.js" type="text/javascript"></script>
    <script src="js/jquery.serializeObject.js" type="text/javascript"></script>
   

    
    <title>Welcome GIOSIS</title>
    <script type="text/javascript">
    var isRun = false;
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
    		if(isRun == true){
    			return;
    		}
    		isRun = true;
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
    			isRun = false;
    		})
    	}	
    		
    </script>
  </head>
  <body class="body-signin">
    <div class="container" style="text-align: center;">
    	<div style="width: 500px; height: 400px; border: 2px solid; display: inline-block;">
			<form class="form-signin" id="form-signin" action="/login/proc" method="post">
				<h3 class="form-signin-heading">GIOSIS<br> Asset Management</h3>
				<div class="form-group">
					<label class="sr-only">아이디</label>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span><input name="mId" class="form-control" aria-describedby="basic-addon1" autofocus="" required="" type="text" placeholder="Pc Login ID ">
					</div>
				</div>
				<div class="form-group">
					<label class="sr-only">비밀번호</label>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon2"><i class="glyphicon glyphicon-lock"></i></span><input name="pwd" class="form-control" aria-describedby="basic-addon2" required="" type="password" placeholder="Password">
					</div>
				</div>
				<button class="btn btn-lg btn-primary btn-block" id="btn-submit" type="button">로그인</button>
				<div class="text-info">
					<p>
						계정이 없는 경우 운영 담당자에게 요청하십시오.
					</p>
				</div>
			</form>
			<div style="text-align: center;">
	    	<img src="/images/common/logo.jpg"/>
	    	</div>
    	</div>
    </div>

 
  
</body></html>