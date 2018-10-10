/**
 * AJAX Error
 */
$(document).ajaxError(function (evt, xhr){
    try {
    	if(xhr.status=="401"){
    		alert("Login Session Expired");
    		location.href = "/";
		}else{
			var json = $.parseJSON(xhr.responseText);
	        alert(json.errorMessage);
		}
    } catch (e) { 
        alert(xhr.statusText);
    }
});
$(document).ready(function() { 
	$.ajaxSetup({
		beforeSend: function(xhr, settings){
			xhr.setRequestHeader("AJAX", "true");
		}
	});
});
