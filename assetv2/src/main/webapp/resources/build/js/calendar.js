/**
 * calendar.jsp 스크립트 소스
 */
var regist;
var calendar;
var empRegist;
var isRun = false;
	
    	$(function () {
    		
    		function frmchk(formName) {
    			
    			if(formName=="#regForm"){
    				
    				if($("#name").val()=="" || $("#division").val()==""){
    					return false;
    				}
    				if($("#mgr").tagit("assignedTags").join(",")==""){
    					return false;
    				}
        			
    			}
    			if(formName=="#empForm"){
    				var input=$(formName).find("input");
        			var select=$(formName).find("select");
        			for(i=0;i<input.length-1;i++){		
        				if($(input[i]).val().trim()==""){
        						return false;
        					}				
        				}
        			if($("#division").val()=="43"){
        				if($("#office_number").val().trim()==""){
        					return false;
        				}
        			}
        			for(i=0;i<select.length;i++){
        				if($(select[i]).val().trim()==""){
        					return false;	
        				}
        			}
        		}
        			
    			return true;		
    		}
    		function Save() {
            	var url = '/calendar/register/proc';
            	if($("#no").val()!='0'){
            		url = '/calendar/update/proc';
            	}
            	if(!frmchk("#regForm")){
    				alert("빈칸없이 입력하세요.");
            	}else{
            		
            		if(isRun == true){
            			return;
            		}
            		isRun = true;
            		
    	            var data = $("#regForm").serializeObject()
    	            data.divNm = $("#first_dept option:checked").text();
    	            data.mgr = [];
    	            var name = $("#mgr").find(".tagit-label");
    	            for(i=0;i<name.length;i++){
    	            	data.mgr.push($(name[i]).text());
    	            }
    	            data.mgr = data.mgr.join(",");
    	            data.mgr_email = $("#mgr").tagit("assignedTags").join(",");
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
    			email_re= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    			ext_re = /^[0-9]+$/;
    			if(!email_re.test($("#email").val())){
    				alert("올바른 이메일을 입력하세요.");
    				return false;
    			}
    			if(!ext_re.test($("#ext").val())){
    				alert("올바른 내선번호를 입력하세요");
    				return false;
    			}
    			
    			if(!frmchk("#empForm")){
    				alert("빈칸없이 입력하세요.");
            	}else{
            		
            		if(isRun == true){
            			return;
            		}
            		isRun = true;
            		
            		var data = $("#empForm").serializeObject();
            		data.division = $("#division").val();
            		data.divNm = $("#first_dept option:checked").text();
            		data.first_dept = $("#first_dept").val();
            		data.second_dept = $("#second_dept").val();
            		data.three_dept = $("#three_dept").val();
            		data.four_dept = $("#four_dept").val();
            		data.basic_dept = $("#basic_dept").val();
            		data.posNm = $("#position option:checked").text();
            		data.name = $("#name").val();
            		data.joinDate = $("#start").val();
            		data.no = $("#no").val();
            		data.seat = $("#seat").prev().val();
            		data.ext = $("#ext").val();
            		dataStr = JSON.stringify(data);
            		
            		$.ajax({ url:'calendar/join/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
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
    				 $.ajax({ url: '/calendar/delete/proc', data:dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
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
					url: '/calendar/list/proc', method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'
				}).done(function(data) {
					$.each(data, function(i, elt) {
							if(elt.joinYN=='y'){
								elt.color = '#666666';
							}
					})
					calendar(data);		
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
						var mgr = event.mgr.split(",");
						var mgr_email = event.mgr_email.split(",");
						var data = {};
		        		data.second_dept = event.first_dept;
		        		data.three_dept = event.second_dept;
		        		data.four_dept = event.three_dept;
		        		$.deptAjaxData(data,event);
						$("#division").val(event.division);
						$("#first_dept").val(event.division).prop("selected",true);
						$("#addNrein").val(event.addNrein);
						$("#mgr").tagit("removeAll");
						if(mgr_data=="" || event.joinYN=='y'){
							$("#btnSave").hide();
							$("#btnJoin").hide();
							$("#btnDelete").hide();
							$("#seat").hide();
							$("#regForm").find("input").prop("readonly",true);
							$("#mgr").tagit({readOnly: true});
							$("#first_dept").attr('disabled', 'true');
							$(".dept").attr('disabled', 'true');
							$("#addNrein").attr('disabled', 'true');
							for(i=0;i<mgr.length;i++){							
								$("#mgr").tagit("createTag",mgr[i],mgr_email[i]);			
							}							
						}else{
							$("#btnSave").show();
							$("#btnJoin").show();
							$("#btnDelete").show();
							$("#regForm").find("input").prop("readonly",false);
							$(".dept").empty().attr("disabled", true);
							$("#second_dept").append("<option value=''>## NONE ##</option>");
							$("#three_dept").append("<option value=''>## NONE ##</option>");
							$("#four_dept").append("<option value=''>## NONE ##</option>");
							$("#mgr").tagit({readOnly: false});
							$("#seat").show();
							$("#first_dept").removeAttr("disabled");
							$("#addNrein").removeAttr("disabled");
							for(i=0;i<mgr.length;i++){
								$("#mgr").tagit("createTag", mgr[i],mgr_email[i]);
							}						
						}
						$("#name").val(event.name);
						$("#no").val(event.no);
						$("#seat").prev().val(event.seat);
						
						$("#start").val(getTimeStamp(event.start));
		                $("#end").val(getTimeStamp(event.end));    
		               // $("#mgr").val(event.mgr);
		               //$("#mgr_email").val(event.mgr_email);
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
			        	if(mgr_data==""){
				    		$("#btnSave").hide();
							$("#btnJoin").hide();
							$("#btnDelete").hide();
							$("#seat").hide();
							$("#regForm").find("input").prop("readonly",true);
							$("#mgr").tagit({readOnly: true});
							$("#first_dept").attr('disabled', 'true');
							$(".dept").attr('disabled', 'true');
							$("#addNrein").attr('disabled', 'true');
			    		}else{
			        	$("#btnDelete").hide();
			        	$("#btnJoin").hide();
			        	$("#btnSave").show();
			        	$("#seat").show();
			        	$("#regForm")[0].reset();
		                $("#start").val(getTimeStamp(start));
		                $("#end").val(getTimeStamp(end));
		                $("#no").val('0');
		                $("#first_dept").removeAttr("disabled");
		                $(".dept").empty().attr("disabled", true);
						$("#second_dept").append("<option value=''>## NONE ##</option>");
						$("#three_dept").append("<option value=''>## NONE ##</option>");
						$("#four_dept").append("<option value=''>## NONE ##</option>");
						$("#addNrein").removeAttr("disabled");
		                $("#regForm").find("input").prop("readonly",false);
		                $("#mgr").tagit("removeAll");
		                regist.open('Join Employee');	
			    		}
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
				 $("#empForm")[0].reset();
				 regist.close();
			 })
			var emp_data = [];
			$("#first_dept").change(function() {
				$("#division").val($(this).val());
				emp_data.length = 0;
				if($(this).val()!=""){
					
					var data = { "mgr" : '',"division" : $(this).val()};
		        	var dataStr = JSON.stringify(data);
					$.ajax({
		                method: 'POST',
		                url: "/emp/mgrSearch/proc",
		                dataType: "json",
		                data:dataStr,
		              	contentType:"application/json; charset=UTF-8"
			         }).done(function(data) {
			        	$.each(data, function(i, elt) {
			        	 emp_data.push({"label":elt.name,"value":elt.email});
			        	})
			        	
			         })
				}
				
		         
		         
		         var data = {};
        		data.second_dept = Number($(this).val());
        		
        		$("#second_dept,#three_dept,#four_dept").empty();
        		$("#second_dept,#three_dept,#four_dept").append("<option value=''>## NONE ##</option>");
        		$("#second_dept,#three_dept,#four_dept").val("").prop("selected",true);
        		$("#second_dept").attr("disabled",false);
        		
        		$("#basic_dept").val($(this).val());
        		$.deptAjaxData(data);
			})
			$("#second_dept").change(function() {
        	 
        		var data = {};
        		data.three_dept = Number($(this).val());
        		$("#three_dept,#four_dept").empty();
        		$("#three_dept,#four_dept").append("<option value=''>## NONE ##</option>");
        		$("#three_dept").val("").prop("selected",true).attr("disabled",false);
        		
        		$("#basic_dept").val($(this).val());
        		$.deptAjaxData(data);
        		
        	})
        	$("#three_dept").change(function() {
        		
        		var data = {};
        		data.four_dept = Number($(this).val());
        		$("#four_dept").empty();
        		$("#four_dept").append("<option value=''>## NONE ##</option>");
        		$("#four_dept").val("").prop("selected",true).attr("disabled",false);	
        		
        		$("#basic_dept").val($(this).val());
        		$.deptAjaxData(data);
        		
        	})
        	$("#four_dept").change(function() {
        	 	
        		$("#basic_dept,#ebasic_dept").val($(this).val());
        		
        	})
			
			
			
			
			
	         $("#mgr").tagit({
				
				allowSpaces: true,
				availableTags: emp_data,
				tagSource: emp_data,
				showAutocompleteOnFocus: true,
				autocomplete: {
					delay: 0,
					minLength: 1,
					autoFocus: true,
					source: emp_data,
					appendTo: "#regist",
					focus: function(event, ui){
						return false;
					}
				},
				beforeTagAdded: function(event, ui) {
			        // do something special			        
			    return $.isValidateEmail(ui.tagLabel);			        
			    }
			})
			 /*$("#mgr").autocomplete({

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
		   });*/
			$.isValidateEmail = function(mail){
				var expression = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				if (expression.test(mail)) {
					return true;
				} else {
					return false;
				}
			}
			  $.deptAjaxData = function(data,event){
	            	var dataStr = JSON.stringify(data);
	            	$.ajax({
	        			url:"/dept/emp-edit/search/proc",
	        			dataType:"json",
	        			method:"post",
	        			contentType:"application/json; charset=utf-8",
	        			data:dataStr
	        		}).done(function(call) {
	        		 
	        			if(call.msg=="0001"){
	        				
	        				if(call.first_dept.length>0){
	        					
	        					$.each(call.first_dept, function(i, elt) {
	        						
	        						if(elt.dept_no!=1){
	        							$("#first_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>").attr("disabled", false);
	                					
	        						}else{
	        							$("#first_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+"</option>").attr("disabled", false);
	                					
	        						}
	            					
	            				})
	        				}
	        				if(call.second_dept.length>0){
	        					
		        				$.each(call.second_dept, function(i, elt) {
		        					if(elt.org_nm!="Country"){
		        						$("#second_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>").attr("disabled", false);
		        					}	
		        					
		        				})
	        				}
	        				if(call.three_dept.length>0){
		        				$.each(call.three_dept, function(i, elt) {
		        					
		        					$("#three_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>").attr("disabled", false);
		        					
		        				})
	        				}
	        				if(call.four_dept.length>0){
		        				$.each(call.four_dept, function(i, elt) {
		        				 
		        					$("#four_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>").attr("disabled", false);
		        					
		        				})
	        				}
	        				if(event!=undefined){
	        					
	        					if(event.second_dept!=0){
		        					$("#second_dept").val(event.second_dept).prop("selected",true);
	        					}else{
	        						$("#second_dept").val("").prop("selected",true);
	        					}
	        					if(event.three_dept!=0){
	        						$("#three_dept").val(event.three_dept).prop("selected",true);
	        					}else{
	        						$("#three_dept").val("").prop("selected",true);
	        					}
	        					if(event.four_dept!=0){
	        						$("#four_dept").val(event.four_dept).prop("selected",true);   
	        					}else{
	        						$("#four_dept").val("").prop("selected",true);
	        					}
	        					if(mgr_data=="" || event.joinYN=='y'){
	        						$(".dept").attr("disabled", true);
	        					}
	        				}
	        				
	        				
							
							
	        				

	        			}else{
	        				alert(call.msg);
	        			}
	        		}).fail(function (e) {
	                	if(e.status == 401){
	                		modify.close();
	        				onErrorFunc(e);
	                	}
	                });
	           	
	           }
			
			
			
			
			calendarData(); 
			
    	})