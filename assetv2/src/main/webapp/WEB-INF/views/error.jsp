<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	alert("${msg}")
	if(opener){
		window.close();
		window.opener.location.reload();
	}else{
		location.href="/"
	}
</script>
</head>
</html>
