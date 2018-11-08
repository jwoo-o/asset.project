/**
 * passowrd.jsp script
 */
    	$(function () {
    		var key = false;
    		var isPwd = false;
    		$("#reNewPwd").keypress(function() {
				$("#tr2").hide();
			})
			$("#reNewPwd").focusout(function(){
				if($("#newPwd").val()==$(this).val()){
					isPwd = true;
				}else{
					$("#reNewPwd").val('');
					$("#tr2").show();
					isPwd = false;
				}
			})
			
			$("#newPwd").focusout(function(){
				if($(this).val().length<7){
					$("#tr1").show();
					key = false;
				}else{
					key = true;
				}
			})
			$("#newPwd").keypress(function() {
				$("#tr1").hide();
			})
			
			$("#reviseBt").click(function() {
			 	if(!$.isNull()){
			 		$.gfn_Alert("alert-message-center", "alert-warning", "필수 정보를 입력하세요.");
			 		$("#pwd").focus();
			 	}else{
			 		if(!isPwd || !key){
			 			$.gfn_Alert("alert-message-center", "alert-warning", "필수 정보를 확인하세요.");
			 		}else{
			 			var pwd = SHA256($("#pwd").val());
			 			var newPwd = SHA256($("#newPwd").val());
			 			var mId = $("#mId").val();
			 			var data = {"mId":mId,"pwd":pwd,"newPwd":newPwd},dataStr = JSON.stringify(data);
			 			$.ajax({
			 				url:"password/proc",
			 				data:dataStr,
			 				dataType:"json",
			 				contentType:"application/json; charset=utf-8",
			 				method:"post"
			 			}).done(function(data) {
			 			  
			 				if(data.msg=="0000"){
			 					$.gfn_Alert("alert-message-center", "alert-warning", "이전 패스워드를 확인하세요.");
			 					$("#pwd").val('').focus();
			 				}else if(data.msg="0001"){
			 					$.gfn_Alert("alert-message-center", "alert-info", "Request Success.");
			 					
			 					window.setTimeout(function() {
			 						window.close();
			 					}, 2000)
			 					
			 				}else{
			 					$.gfn_Alert("alert-message-center", "alert-error", data.msg);
			 				}
			 			}).fail(function(e) {
							if(e.status==401){
								onErrorFunc(e);
							}
						})
			 		}
			 	}
			})
			$.isNull = function(){
    			var form = $("#passForm").find("input");
    			for(i=0;i<form.length;i++){
    				if($(form[i]).val()=='')
    					return false;
    			}
    			return true;
    		}
		})