/**
 * calendar.jsp 스크립트 소스
 */
var regist;
var calendar;
var empRegist;
var isRun = false;
	
    	$(function () {
    		
    		function frmchk(formName) {
    			var input=$("#"+formName).find("input");
    			var select=$("#"+formName).find("select");
    			
    			for(i=0;i<input.length;i++){
    				if($(input[i]).val().trim()==""){
    					return false;	
    				}
    			}
    			for(i=0;i<select.length;i++){
    				if($(select[i]).val().trim()==""){
    					return false;	
    				}
    			}
    			
    			return true;
    		}
    		function Save() {
            	var url = '/calendarRgt/proc';
            	if($("#no").val()!='0'){
            		url = '/calendarMdf/proc';
            	}
            	if(!frmchk("regForm")){
    				alert("빈칸없이 입력하세요.");
            	}else{
            		
            		if(isRun == true){
            			return;
            		}
            		isRun = true;
            		
    	            var data = $("#regForm").serializeObject()
    	            data.divNm = $("#division option:checked").text();
    	            var dataStr = JSON.stringify(data); 
    	               
    	            
    	            $.ajax({ url: url, data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
    	                .done(function (data) {
    	                	if(data.msg=="0001"){
    	                		regist.close();
        	                    $('#calendar').fullCalendar('destroy');
        	                    calendarData();
    	                	}else{
    	                		alert(data.msg);
    	                	}
    	                    
    	                    isRun=false;
    	                })
    	                .fail(function (e) {
    	                	if(e.status == 401){
    	                		regist.close();
    	        				onErrorFunc(e);
    	                	}
    	                });
            	}
            }
    		function Success(){
    			if(!frmchk("empForm")){
    				alert("빈칸없이 입력하세요.");
            	}else{
            		
            		if(isRun == true){
            			return;
            		}
            		isRun = true;
            		
            		var data = $("#empForm").serializeObject();
            		data.division = $("#division").val();
            		data.divNm = $("#division option:checked").text();
            		data.posNm = $("#position option:checked").text();
            		data.name = $("#name").val();
            		data.joinDate = $("#start").val();
            		data.no = $("#no").val();
            		data.seat = $("#seat").val();
            		dataStr = JSON.stringify(data);
            		
            		$.ajax({ url:'calendarJoin/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
	                .done(function (data) {
	                	if(data.msg=="0001"){
		                	empRegist.close();
		                    $('#calendar').fullCalendar('destroy');
		                    calendarData();
	                	}else{
	                		alert(data.msg);
	                	}
	                    isRun=false;
	                })
	                .fail(function (e) {
	                	if(e.status == 401){
	                		empRegist.close();
	        				onErrorFunc(e);
	                	}
	                });
            	}
    		}
    		
    		function getTimeStamp(date) {
    			  var d = new Date(date);
    			
    			  var s =
    			    leadingZeros(d.getFullYear(), 4) + '-' +
    			    leadingZeros(d.getMonth() + 1, 2) + '-' +
    			    leadingZeros(d.getDate(), 2);
    			  return s;
    			}
    		function leadingZeros(n, digits) {
    			  var zero = '';
    			  n = n.toString();

    			  if (n.length < digits) {
    			    for (i = 0; i < digits - n.length; i++)
    			      zero += '0';
    			  }
    			  return zero + n;
    			}
    		function Delete(){
    			if (confirm('Are you sure?')) {
                	var data = {"no":$("#no").val()},dataStr = JSON.stringify(data);
    				 $.ajax({ url: '/calendarDl/proc', data:dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
    	                .done(function (data) {
    	                	if(data.msg=="0001"){
    	                		 regist.close();
    	    	                 $('#calendar').fullCalendar('destroy');
    	    	                 calendarData();
    	                	}else{
    	                		alert(data.msg);
    	                	}
    	                   
    	                   
    	                })
    	                .fail(function (e) {
    	                	if(e.status == 401){
    	                		regist.close();
    	        				onErrorFunc(e);
    	                	}
    	                });
                }
    		}
  
    		function calendarData(){
    		
	    		$.ajax({
					url: '/calendarLst/proc', method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'
				}).done(function(data) {
					if(data.msg="0001"){
						$.each(data, function(i, elt) {
							if(elt.joinYN=='y'){
								elt.color = '#666666';
								
							}
						})
						calendar(data);
					}else{
						alert(data.msg);
					}				
				})
    		}
    		function calendar(data){
    			
    			
    			
				$("#calendar").fullCalendar({
					header: {
			            left: 'prev',
			            right: 'next',
			            center: 'title'
			            },
			        lang : 'ko',
			        selectable: true,
					selectHelper: true,
					businessHours: true,
					eventLimit: true,
					//editable:true,
					events:data,
					eventClick:function(event,start,end){
						$("#division").val(event.division);
						if(event.joinYN=='n'){
							$("#btnSave").show();
							$("#btnJoin").show();
							$("#btnDelete").show();
							$("#regForm").find("input").prop("readonly",false);
						}else{
							$("#btnSave").hide();
							$("#btnJoin").hide();
							$("#btnDelete").hide();
							$("#regForm").find("input").prop("readonly",true);
							
						}
						$("#name").val(event.name);
						$("#no").val(event.no);
						$("#seat").val(event.seat);
						$("#addNrein").val(event.addNrein);
						$("#start").val(getTimeStamp(event.start));
		                $("#end").val(getTimeStamp(event.end));    
		                $("#mgr").val(event.mgr);
		                regist.open('Join Employee');
					},
					/*eventDrop:function(event){
						if(event.joinYN=='y'){
							return false;
						}
						$('#calendar').fullCalendar('destroy');
						
						var data = {"start":getTimeStamp(event.start),"end":getTimeStamp(event.end),"no":event.no}, dataStr = JSON.stringify(data);
						$.ajax({url:'/calendarDate/proc',method:'post',data:dataStr,dataType:'json',contentType:'application/json; charset=UTF-8'})
							.done(function(data) {							
								if(data.msg=="0001"){
									calendarData();
								}else{
									alert(data.msg);
								}
							})
							.fail(function (e) {
			                	if(e.status == 401){
			        				onErrorFunc(e);
			                	}
			                });
						
					},*/
			        select:function(start, end){
			        	$("#btnDelete").hide();
			        	$("#btnJoin").hide();
			        	$("#btnSave").show();
			        	$("#regForm")[0].reset();
		                $("#start").val(getTimeStamp(start));
		                $("#end").val(getTimeStamp(end));
		                $("#no").val('0');
		                regist.open('Join Employee');
						$('#calendar').fullCalendar('unselect');
			        }
			        	   
				})
    		}
			 regist = $('#regist').dialog({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                autoOpen: false,
                resizable: false,
                modal: true,
				
            });
			empRegist = $("#employee_regist").dialog({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                autoOpen: false,
                resizable: false,
                modal: true
            });
			 
			 $(".btnCancel").click(function() {
				 $("#regForm")[0].reset();
				 $("#empForm")[0].reset();
				 regist.close();
				 empRegist.close();
			 })
			 $("#seat").on('click', function() {
				 	var x = 2000;
				 	var y = 1000;
					var url = '/seat';
					var title = 'Seat Search';
					    
					    popup(url,title,x,y);
			 })
			 $("#btnSave").on('click', Save);
			 $("#btnDelete").on('click', Delete);
			 $("#btnSuccess").on('click', Success);
			 $("#btnJoin").click(function() {
				 empRegist.open('Join Success');
				 regist.close();
			 })
			 $("#mgr").autocomplete({

		        source : function( request, response ) {
		        	
		        	
		        	var data = { "mgr" : request.term,"division" : $("#division").val()};
		        	var dataStr = JSON.stringify(data);
		             $.ajax({
		                    type: 'post',
		                    url: "/mgrSearch/proc",
		                    dataType: "json",
		                    contentType:"application/json; charset=UTF-8",
		                    data: dataStr
		             }).done(function(data) {
		              
		              response($.map(data, function(ui) {
		            	  return{
		            		  label: ui.name,
		            		  value:ui.name,
		            		  email:ui.email,
		            		  empNo:ui.empNo
		            	  }
		              }));
		             });
		        },
		        
		        minLength: 1,
		        appendTo: "#regist",
		       	delay: 200,
				minLength: 1,
				autoFocus: true,
				focus:function(event,ui){
			
		    	   return false;
				},
		       	select: function( event, ui ) {
		    	$("#mgr_email").val(ui.item.email);
		    	$("#mgr").val(ui.item.value);
		    	 if(event.keyCode==13){
		    		 $("#addNrein").focus();
		    	 }
		    	 return false;
		        }
		   });
			calendarData(); 
			
    	})