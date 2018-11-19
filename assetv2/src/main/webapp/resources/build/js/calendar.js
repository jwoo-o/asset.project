/**
 * calendar.jsp 스크립트 소스
 */
var regist;
    	var calendar;
    	function frmchk() {
			var frm=$("#regForm").find("input");
			var num=frm.length;
			for(i=0;i<=num;i++){
				if($(frm[i]).val()==""){
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
        	if(!frmchk()){
				alert("이름/예정좌석을 입력하세요.");
        	}else{
        		
	            var data = $("#regForm").serializeObject(),dataStr = JSON.stringify(data); 
	               
	            
	            $.ajax({ url: url, data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
	                .done(function () {
	                    regist.close();
	                    $('#calendar').fullCalendar('destroy');
	    				calendar();
	                   
	                })
	                .fail(function (e) {
	                	if(e.status == 401){
	                		regist.close();
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
	                .done(function () {
	                    regist.close();
	                    $('#calendar').fullCalendar('destroy');
	    				calendar();
	                   
	                })
	                .fail(function (e) {
	                	if(e.status == 401){
	                		regist.close();
	        				onErrorFunc(e);
	                	}
	                });
            }
		}
		
    	$(function () {
    		calendar = function renderCalendar(){
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
					editable:true,
					events:{url: '/calendarLst/proc', method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'},
					eventClick:function(event,start,end){
						$("#division").val(event.division).prop("selected",true);
						$("#btnDelete").show();
						$("#name").val(event.name);
						$("#no").val(event.no);
						$("#seat").val(event.seat);
						$("#addNrein").val(event.addNrein);
						$("#start").val(getTimeStamp(event.start));
		                $("#end").val(getTimeStamp(event.end));          
		                regist.open('Join Employee');
					},
					eventDrop:function(event){
						var data = {"start":getTimeStamp(event.start),"end":getTimeStamp(event.end),"no":event.no}, dataStr = JSON.stringify(data);
						$.ajax({url:'/calendarDate/proc',method:'post',data:dataStr,dataType:'json',contentType:'application/json; charset=UTF-8'})
							.done(function(data) {
								if(data.msg!="0001")
									alert(data.msg);		
							})
							.fail(function (e) {
			                	if(e.status == 401){
			        				onErrorFunc(e);
			                	}
			                });
						
					},
			        select:function(start, end){
			        	$("#btnDelete").hide();
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
                modal: true
            });
			 
			 $("#btnCancel").click(function() {
				 $("#regForm")[0].reset(); 
				 regist.close();
			 })
			 $("#btnSave").on('click', Save);
			 $("#btnDelete").on('click', Delete);
			 
			 calendar();
    	})