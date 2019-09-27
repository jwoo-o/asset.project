/**
 * manager.jsp 스크립트
 */
   var grid, regist,modify;
   var isRun = false;
      	
        
        
        function Edit(e) {
        	
        	if($("#mgrAuth").val()!=0){
        		var data = {};
        		data.first_dept = e.data.record.country;
        		data.second_dept = e.data.record.first_dept;
        		data.three_dept = e.data.record.second_dept;
        		data.four_dept = e.data.record.three_dept;
        		
        		$.deptAjaxData(data,e);
        		$(".dept").empty().attr("disabled", true);
        		$("#efirst_dept").append("<option value=''>## NONE ##</option>");
				$("#esecond_dept").append("<option value=''>## NONE ##</option>");
				$("#ethree_dept").append("<option value=''>## NONE ##</option>");
				$("#efour_dept").append("<option value=''>## NONE ##</option>");
        		
        		
        		/*if(e.data.record.dcode=="7"){
        			$(".ga_only").show();
        			
        		}else{
        			$("#office_number").val("");
        			$(".ga_only").hide();
        		}*/
				$("#eoffice_number").val(e.data.record.office_number);
	            $("#eempNo").val(e.data.id);
	            $("#ename").val(e.data.record.name);
	            $("#eposition").val(e.data.record.pcode).prop("selected",true);
	            //$("#edivision").val(e.data.record.dcode).prop("selected",true);
	            
	            $("#estatus").val(e.data.record.status).prop("selected",true);
	            $("#ebasic_dept").val(e.data.record.basic_dept);
	            $("#edivision").val(e.data.record.dcode);
	            $("#ecountry").val(e.data.record.country).prop("selected",true);
	            $("#eemail").val(e.data.record.email);
	            $("#eseat").val(e.data.record.seat);
	            $("#original_name").val(e.data.record.profile_name);
	            if(e.data.record.profile_name!=null && e.data.record.profile_name!=''){
	            	$("#profile").attr("src", "/resources/build/images/profileImage/"+e.data.record.profile_name);
	            }else{
	            	$("#profile").attr("src","images/profileImage/default_profile.jpg");
	            }
	            $("#profile_upload").val('');
	            if(e.data.record.manager=='y'){
	            	$("#managerDiv").show();
	            	$("#manager").prop("checked",true);
	            	$("#auth").val(e.data.record.auth).prop("selected",true);
	            	$("#isManager").val('y');
	            }else{
	            	$("#managerDiv").hide();
	            	$("#manager").prop("checked",false);
	            	$("#isManager").val('n');	            	
	            }
	        	$("#efirst_dept").val(e.data.record.first_dept).prop("selected",true);
	            $("#esecond_dept").val(e.data.record.second_dept).prop("selected",true);
	            $("#ethree_dept").val(e.data.record.three_dept).prop("selected",true);
	            $("#efour_dept").val(e.data.record.four_dept).prop("selected",true);
	            modify.open('사원 수정');
	            $("#efirst_dept").val(e.data.record.first_dept).prop("selected",true);
	            $("#esecond_dept").val(e.data.record.second_dept).prop("selected",true);
	            $("#ethree_dept").val(e.data.record.three_dept).prop("selected",true);
	            $("#efour_dept").val(e.data.record.four_dept).prop("selected",true); 
	            
	            
        	}else{
        		alert("Not Authorization");
        	}
        }
        function frmchk(formNames) {
        	if(formNames=="regForm"){
        		var frm=$("#"+formNames);
    			var $input = $(frm).find("input[type=text]");
    			var $select = $(frm).find("select");
    					
    			for(i=0;i<$input.length;i++){
    				if(i!=2){
    					if(i==3){
    						if(!$.isValidateEmail($($input[i]).val())){
    							alert("올바른 이메일을 입력하세요.");
    							return false;
    						}
    							
    					}
    					if($($input[i]).val()==""){
    						alert("사번/이름/입사일/이메일은 필수 입력사항입니다.");
    						return false;
    					}
    				}
    				
    			}
    			if($("#division").val()==43){
    				if($("#office_number").val().trim()==""){
    					alert("GA&ER 부서는 사무실전화번호가 필수 입니다.");
    					return false;
    				}
    			}
        	}else if(formNames=="mdfForm"){
        		if($("#edivision").val()==43){
    				if($("#office_number").val().trim()==""){
    					alert("GA&ER 부서는 사무실전화번호가 필수 입니다.");
    					return false;
    				}
    			}
        		if($("#ecountry").val()==""){
        			alert("사업국가를 선택하세요.");
        			return false;
        		}
        		if($("#edivision").val()==""){
        			alert("최상위 부서 선택 없이 수정할 수 없습니다");
        			return false;
        		}
        	}
			return true;
		}
        function Save() {
        	
        	if(frmchk("regForm")){
				
        		if(isRun == true){
        			return;
        		}
        		isRun = true;
        		 var data = $("#regForm").serializeObject(),dataStr = JSON.stringify(data); 
	               
 	            
 	            $.ajax({ url: '/emp/register/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
 	                .done(function (data) {
 	                	if(data.msg=="0001"){
 	                		alert("등록이 완료되었습니다");
 	                		regist.close();
 		                    var keyword = $("#keyword").val();
 	                    	var search = $("#search").val();
 	                    	
 	        				grid.reload({ keyword : keyword, search : search,page : 1 });
 	                	}else{
 	                		alert("사번 또는 이메일이 중복되었습니다");
 	                	}
 	                	isRun = false;
 	                })
 	                .fail(function (e) {
 	                	if(e.status == 401){
 	                		regist.close();
 	        				onErrorFunc(e);
 	                	}
 	                });
        		
        		
        	}
	
        }
        
        function Revise() {
			if(frmchk("mdfForm")){
				if(isRun == true){
	    			return;
	    		}
	    		isRun = true;
				var data = $("#mdfForm").serializeObject(), dataStr = JSON.stringify(data);
	            $.ajax({ url: '/emp/update/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
	                .done(function (data) {
	                	if(data.msg=="0001"){
	                		alert("수정이 완료되었습니다");
	                		modify.close();
	                        grid.reload();
	                       
	                	}else{
	                		alert(data.msg);
	                	}
	                	 isRun = false;
	                })
	                .fail(function (e) {
	                	if(e.status == 401){
	                		modify.close();
	                		onErrorFunc(e);
	                		
	                	}
	                });
        	}
            
        }
        function Upload(){
        	
        	if(isRun == true){
    			return;
    		}
    		isRun = true;
        	var data = new FormData();
        	data.append("profile",$("input[name=profile]")[0].files[0]);
        	data.append("empNo",$("#eempNo").val());
        	data.append("original_name",$("#original_name").val());
        	$.ajax({url:'/emp/imgUpload/proc',data:data,type:'post',contentType:false,dataType: "json",processData:false})
        	.done(function(data) {
        		if(data.msg=="0001"){
        			
        			$(".upload").hide();
        		}else{
        			alert(data.msg);
        		}
        		isRun = false;
        		
        		
        	})
        	.fail(function (e) {
            	if(e.status == 401){
            		modify.close();
            		onErrorFunc(e);
            		
            	}
            });
        	
        }
        
        
        function Delete(e) {
        	if($("#mgrAuth").val()!=0){
	            if (confirm('Are you sure?')) {
	            	if(isRun == true){
	        			return;
	        		}
	        		isRun = true;
	            	var data = { empNo: e.data.id,name: e.data.record.name,manager:e.data.record.manager }, dataStr = JSON.stringify(data);
	                $.ajax({ url: '/emp/delete/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
	                    .done(function (data) {
	                    	if(data.msg=="0001"){
	                    		alert("삭제가 완료되었습니다");
	                    		 grid.reload();
	                    		 
	                    	}else{
	                    		alert(data.msg);
	                    	}
	                    	isRun = false;
	                    })
	                    .fail(function (e) {
	                    	if(e.status == 401){
	                    		modify.close();
	                    		onErrorFunc(e);
	                    		
	                    	}
	                    });
	            }
        	}else{
        		alert("Not Authorization");
        	}
        }
        /*function DeleteMgt(record){
        	
        	var data = {"empNo":record.empNo},dataStr = JSON.stringify(data);
        	 $.ajax({ url: '/managerDl/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
             .done(function (data) {
            	 if(data.msg=='0001'){
             		alert("계정 삭제 완료");
             		
             	}else{
            		alert(data.msg);
            	}
             })
             .fail(function (e,data) {
             	if(e.status == 401){
             		alert("세션이 만료되었습니다. 다시로그인 하세요");
     				opener.parent.location.reload();
     				window.close();
             	}
             });
        }*/
        
        /*function RegisterMgt(record){
        	 var data = {"mId":record.email,"mName":record.name,"empNo":record.empNo,"position":record.position,"dept":record.division},dataStr = JSON.stringify(data);
        	$.ajax({
            	url:"/managerRgt/proc",
            	data:dataStr,
            	dataType:"json",
            	contentType:"application/json;charset=utf-8",
            	method:"post"
            }).done(function(data) {
            	if(data.msg=='0001'){
            		alert("계정 등록 완료");
            		
            	}else{
            		alert(data.msg);
            	}
            }).fail(function (e) {
             	if(e.status == 401){
             		alert("세션이 만료되었습니다. 다시로그인 하세요");
     				opener.parent.location.reload();
     				window.close();
             	}
             });
        }*/
        
        function readURL(input) {
        	 
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		 
		        reader.onload = function (e) {
		            $('#profile').attr('src', e.target.result);
		        }
		 
		        reader.readAsDataURL(input.files[0]);
		    }
        }
        
        $(document).ready(function () {
        	
        	
        	$("#first_dept,#efirst_dept").change(function() {
        	 
        		if($(this).text().match("GA&ER")){
        			$(".ga_only").show();
        		}else{
        			$(".ga_only").hide();
        		}
        		var data = {};
        		data.second_dept = Number($(this).val());
        		
        		$("#second_dept,#esecond_dept,#three_dept,#ethree_dept,#four_dept,#efour_dept").empty();
        		$("#second_dept,#esecond_dept,#three_dept,#ethree_dept,#four_dept,#efour_dept").append("<option value=''>## NONE ##</option>");
        		$("#second_dept,#esecond_dept,#three_dept,#ethree_dept,#four_dept,#efour_dept").val("").prop("selected",true);
        		$("#second_dept,#esecond_dept").attr("disabled",false);
        		
        		$("#basic_dept,#ebasic_dept").val($(this).val());
        		$("#division,#edivision").val($(this).val());
        		$.deptAjaxData(data);
        		
        	})
        	$("#second_dept,#esecond_dept").change(function() {
        	 
        		var data = {};
        		data.three_dept = Number($(this).val());
        		$("#three_dept,#ethree_dept,#four_dept,#efour_dept").empty();
        		$("#three_dept,#ethree_dept,#four_dept,#efour_dept").append("<option value=''>## NONE ##</option>");
        		$("#three_dept,#ethree_dept").val("").prop("selected",true);
        		$("#three_dept,#ethree_dept").attr("disabled",false);
        		
        		$("#basic_dept,#ebasic_dept").val($(this).val());
        		$.deptAjaxData(data);
        		
        	})
        	$("#three_dept,#ethree_dept").change(function() {
        		
        		var data = {};
        		data.four_dept = Number($(this).val());
        		$("#four_dept,#efour_dept").empty();
        		$("#four_dept,#efour_dept").append("<option value=''>## NONE ##</option>");
        		$("#four_dept,#efour_dept").val("").prop("selected",true);
        		$("#four_dept,#efour_dept").attr("disabled",false);
        		
        		$("#basic_dept,#ebasic_dept").val($(this).val());
        		$.deptAjaxData(data);
        		
        	})
        	$("#four_dept,#efour_dept").change(function() {
        	 	
        		$("#basic_dept,#ebasic_dept").val($(this).val());
        		
        	})
        	$("#country,#ecountry").on("change", function() {
        		
        		if($(this).val()!=""){
        			
        			$(".dept").empty().attr("disabled", true);
                    $("#first_dept,#efirst_dept").append("<option value=''>## NONE ##</option>");
                    $("#second_dept,#esecond_dept").append("<option value=''>## NONE ##</option>");
                    $("#three_dept,#ethree_dept").append("<option value=''>## NONE ##</option>");
                    $("#four_dept,#efour_dept").append("<option value=''>## NONE ##</option>");
                    
        			$(".dept").val("").prop("selected",true).attr("disabled",true);
            		$("#first_dept,#efirst_dept").attr("disabled",false);
            		var data = {};
            		data.first_dept = $(this).val();
            		$.deptAjaxData(data);
            		
        		}else{
        			$(".dept").val("").prop("selected",true).attr("disabled",true);    			
        		}
        		
        	})
        
        	
        	
        	
        	$("#joinDate").datepicker({format:'yyyy-mm-dd',header: true, modal: true, footer: true });
        	 if($("#mgrAuth").val()==0){
             	$("#btnAdd").remove();
             }
        	var keyword,search;
            
            grid = $('#grid').grid({
                primaryKey: 'empNo',
                dataSource: {url:'/emp/list/proc'},
                uiLibrary: 'bootstrap4',
                columns: [
                    { field: 'empNo',title: '사번', width: 100, align: 'center' },
                    { field: 'name',title: '이름', width: 100,sortable: true, align: 'center' },
                    { field: 'position', title: '직위', sortable: true, align: 'center' },
                    { field: 'first_dept_nm', title: '부서', sortable: true, align: 'center' },
                    { field: 'gender', title: '성별', width: 70, align: 'center' },
                    { title: '', field: 'Edit', width: 42, type: 'icon', icon: 'fa fa-pencil', tooltip: 'Edit', events: { 'click': Edit } },
                    { title: '', field: 'Delete', width: 42, type: 'icon', icon: 'fa fa-remove', tooltip: 'Delete', events: { 'click': Delete } }
                ],
                pager: { limit: 10, sizes: [10, 20, 50] }
            });
            

            


            regist = $('#regist').dialog({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                autoOpen: false,
                resizable: false,
                modal: true,
                scrollable:true,
                height:700
                
            });
            modify = $('#modify').dialog({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                autoOpen: false,
                resizable: false,
                modal: true,
                scrollable:true,
                height:700
               
                	
                
                
            });
            $('#btnAdd').on('click', function () {
               $("#regForm")[0].reset();
               $("#basic_dept").val("");
               $("#division").val("");
               $(".dept").empty().attr("disabled", true);
               $("#first_dept").append("<option value=''>## NONE ##</option>");
               $("#second_dept").append("<option value=''>## NONE ##</option>");
               $("#three_dept").append("<option value=''>## NONE ##</option>");
               $("#four_dept").append("<option value=''>## NONE ##</option>");
				
                regist.open('사원 등록');
            });
            $('#btnSave').on('click', Save);
            $('#btnRevise').on('click', Revise);
            $('#btnCancel').on('click', function () {
               regist.close();
              
            });
            
            $('#btnCancel1').on('click', function () {
            	modify.close();
            	$(".upload").hide();
               
             });
            
            $('#btnSearch').on('click', function () {
            	keyword = $("#keyword").val();
            	search = $("#search").val();
                grid.reload({ keyword : keyword, search : search,page : 1 });
            });
            $('#btnClear').on('click', function () {
                $('#keyword').val('').prop("selected", true);
                $('#s').empty();
               	grid.reload({ keyword : '', search : '' });
            });
            $("#keyword").change(function() {
            	$("#search").remove();
            	var keyword = $("#keyword option:selected").val();
            	var select = $("<select id='search' class='form-control mb-2 mr-sm-2 mb-sm-0'></select>");
            	
            	/*if(keyword==''){
            		$("#search").remove();
            	}else if(keyword=='name'){
            		var input = $('<input id="search" type="text" placeholder="name...." class="form-control mb-2 mr-sm-2 mb-sm-0" />');
        			$("#s").append(input).show();
            	}else if(keyword=='manager'){
            		$(select).append("<option value='y'></option>");
        			$("#s").append(select).hide();
            	}else if(keyword=='status'){
            		$(select).append("<option value='y'>정상</option><option value='n'>휴직</option>");
        			$("#s").append(select).show();
            	}else if(keyword=='dept'){
            		$.each(dept, function(i, elt) {
            			var option = $("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>")
            			$(select).append(option);
            		})
            		$("#s").append(select).show();
            	}else{
            		
            	}*/
            	switch(keyword){
            		case '':
            			$("#search").remove();
            			break;
            		case 'name':
            			
            			var input = $('<input id="search" type="text" placeholder="name...." class="form-control mb-2 mr-sm-2 mb-sm-0" />');
            			$("#s").append(input).show();
            			break;
            		case 'manager':
            			$(select).append("<option value='y'></option>");
            			$("#s").append(select).hide();
            			break;
            		case 'status':
            			$(select).append("<option value='y'>정상</option><option value='n'>휴직</option>");
            			$("#s").append(select).show();
            			break;		
            		case 'dept':
            			$(select).append("<option value=''>선택</option>");
            			for(var i=0;i<dept_data.length;i++){
            				var option = $("<option value='"+dept_val[i]+"'>"+dept_data[i]+"</option>")
            				$(select).append(option).show();
            			}		
            			$("#s").append(select).show();
            			//alert(division_data.length);
                		break;
                		
            		case 'position':
            			$(select).append("<option value=''>선택</option>");
            			for(var i=0;i<position_data.length;i++){
            				var option = $("<option value='"+position_val[i]+"'>"+position_data[i]+"</option>")
            				$(select).append(option);
            			}
            			$("#s").append(select).show();
            			//alert(division_data.size());
                		break;
            		case 'country':
            			for(var i=0;i<country_data.length;i++){
            				var option = $("<option value='"+country_val[i]+"'>"+country_data[i]+"</option>")
            				$(select).append(option);
            			}
            			$("#s").append(select).show();
            			//alert(division_data.size());
                		break;
            		
            		case 'office':
            			for(var i=0;i<office_data.length;i++){
            				var option = $("<option value='"+office_val[i]+"'>"+office_data[i]+"</option>")
            				$(select).append(option);
            			}
            			$("#s").append(select).show();
            			break;
            			
            	}
            })
            $("#s input[id='search']").keypress(function(e) {
            	
            	if(e.which==13){
            		keyword = $("#keyword").val();
                	search = $("#search").val();
                    grid.reload({ keyword : keyword, search : search,page : 1 });
            	}
            })
            $("#profile_upload").change(function() {
             
            	var upload_name = $('input[type=file]')[0].files[0].name;
            	ext = upload_name.slice(upload_name.indexOf('.')+1).toLowerCase();

            	if(!(ext == 'jpg' || ext == 'png' || ext =='jpeg' || ext =='gif')){
            		alert('이미지만 업로드 가능');
            		$(this).val("");
            		return false;
            	}
            	readURL(this);
            	$(".upload").show();
     
            	
            })
            
            
            $("#manager").change(function() {
            	if($("#manager").is(":checked")){
            		$("#managerDiv").show();
            	}else{
            		$("#managerDiv").hide();
            		if($("#isManager").val()=='y'){	
                		var data = {"empNo":$("#eempNo").val()},dataStr = JSON.stringify(data);
                   	 	$.ajax({ url: '/account/delete/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
                        .done(function (data) {
    	                   	 if(data.msg=='0001'){
    	                    	alert("계정 삭제 완료");                    	
    	                   	}else{
    	                   		alert(data.msg);
    	                   	}
                        })
                        .fail(function (e,data) {
                        	if(e.status == 401){
                        		onErrorFunc(e);
                        	}
                        });
            		}
            		
            	}
            })
            
            $(".seatMap").click(function() {
            	var x = 2000;
			 	var y = 1000;
				var url = '/seat';
				var title = 'Seat Search';
				    
				    popup(url,title,x,y);
            })
            $('.upload').on('click', Upload);
            
            
            
            
            $.deptAjaxData = function(data,e){
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
        							$("#efirst_dept,#first_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>").attr("disabled", false);
                					
        						}else{
        							$("#efirst_dept,#first_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+"</option>").attr("disabled", false);
                					
        						}
            					
            				})
        				}
        				if(call.second_dept.length>0){
        					
	        				$.each(call.second_dept, function(i, elt) {
	        					if(elt.org_nm!="Country"){
	        						$("#esecond_dept,#second_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>").attr("disabled", false);
	        					}	
	        					
	        				})
        				}
        				if(call.three_dept.length>0){
	        				$.each(call.three_dept, function(i, elt) {
	        					
	        					$("#ethree_dept,#three_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>").attr("disabled", false);
	        					
	        				})
        				}
        				if(call.four_dept.length>0){
	        				$.each(call.four_dept, function(i, elt) {
	        				 
	        					$("#efour_dept,#four_dept").append("<option value='"+elt.dept_no+"'>"+elt.dept_nm+" "+elt.org_nm+"</option>").attr("disabled", false);
	        					
	        				})
        				}
        				
        				if(e!=undefined){
        					if(e.data.record.first_dept!=0){
        						$("#efirst_dept").val(e.data.record.first_dept).prop("selected",true);
        					}else{
        						$("#efirst_dept").val("").prop("selected",true);
        					}
        					if(e.data.record.second_dept!=0){
        						$("#esecond_dept").val(e.data.record.second_dept).prop("selected",true);
        					}else{
        						$("#esecond_dept").val("").prop("selected",true);
        					}
        					if(e.data.record.three_dept!=0){
        						 $("#ethree_dept").val(e.data.record.three_dept).prop("selected",true);
        					}else{
        						$("#ethree_dept").val("").prop("selected",true);
        					}
        					if(e.data.record.four_dept!=0){
        						 $("#efour_dept").val(e.data.record.four_dept).prop("selected",true);   
        					}else{
        						$("#efour_dept").val("").prop("selected",true);
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
            
            $.isValidateEmail = function(mail){
				var expression = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				if (expression.test(mail)) {
					return true;
				} else {
					return false;
				}
			}
                   
        });