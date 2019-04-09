/**
 * manager.jsp 스크립트
 */
   var grid, regist,modify;
      	
       
        
        
        function Edit(e) {
        	
        	if($("#mgrAuth").val()!=0){
	            $("#eempNo").val(e.data.id);
	            $("#ename").val(e.data.record.name);
	            $("#eposition").val(e.data.record.pcode).prop("selected",true);
	            $("#edivision").val(e.data.record.dcode).prop("selected",true);
	            $("#estatus").val(e.data.record.status).prop("selected",true);
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
	            }else{
	            	$("#managerDiv").hide();
	            	$("#manager").prop("checked",false);
	            }
	            modify.open('사원 수정');
        	}else{
        		alert("Not Authorization");
        	}
        }
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
        	
        	if(!frmchk()){
				alert("사번/이름/입사일은 필수 입력사항입니다.");
        	}else{
        		
	            var data = $("#regForm").serializeObject(),dataStr = JSON.stringify(data); 
	               
	            
	            $.ajax({ url: '/empRgt/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
	                .done(function (data) {
	                	if(data.msg=="0001"){
	                		regist.close();
		                    var keyword = $("#keyword").val();
	                    	var search = $("#search").val();
	        				grid.reload({ keyword : keyword, search : search,page : 1 });
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
        
        function Revise() {
            var data = $("#mdfForm").serializeObject(), dataStr = JSON.stringify(data);
            $.ajax({ url: '/empMdf/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
                .done(function (data) {
                	if(data.msg=="0001"){
                		modify.close();
                        grid.reload();
                	}else{
                		alert(data.msg);
                	}
                    
                })
                .fail(function (e) {
                	if(e.status == 401){
                		modify.close();
                		onErrorFunc(e);
                		
                	}
                });
        }
        function Upload(){
        	var data = new FormData();
        	data.append("profile",$("input[name=profile]")[0].files[0]);
        	data.append("empNo",$("#eempNo").val());
        	data.append("original_name",$("#original_name").val());
        	$.ajax({url:'/empImgUld/proc',data:data,type:'post',contentType:false,dataType: "json",processData:false})
        	.done(function(data) {
        		if(data.msg!="0001"){
        			alert(data.msg);
        		}
        		$(".upload").hide();
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
	            	var data = { empNo: e.data.id,name: e.data.record.name,manager:e.data.record.manager }, dataStr = JSON.stringify(data);
	                $.ajax({ url: '/empDl/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
	                    .done(function (data) {
	                    	if(data.msg=="0001"){
	                    		 grid.reload();
	                    	}else{
	                    		alert(data.msg);
	                    	}
	                       
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
        	
        	
        
        	$("#joinDate").datepicker({format:'yyyy-mm-dd',header: true, modal: true, footer: true });
        	 if($("#mgrAuth").val()==0){
             	$("#btnAdd").remove();
             }
        	var keyword,search;
            
            grid = $('#grid').grid({
                primaryKey: 'empNo',
                dataSource: {url:'/empLst/proc'},
                uiLibrary: 'bootstrap4',
                columns: [
                    { field: 'empNo',title: '사번', width: 100, align: 'center' },
                    { field: 'name',title: '이름', width: 100,sortable: true, align: 'center' },
                    { field: 'position', title: '직위', sortable: true, align: 'center' },
                    { field: 'division', title: '부서', sortable: true, align: 'center' },
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
                modal: true
            });
            modify = $('#modify').dialog({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                autoOpen: false,
                resizable: false,
                modal: true
            });
            $('#btnAdd').on('click', function () {
               $("#regForm")[0].reset();
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
            	switch(keyword){
            		case '':
            			$("#search").remove();
            			break;
            		case 'name':
            			
            			var input = $('<input id="search" type="text" placeholder="name...." class="form-control mb-2 mr-sm-2 mb-sm-0" />');
            			$("#s").append(input);
            			break;
            	
            		case 'division':
            			$(select).append("<option value=''>선택</option>");
            			for(var i=0;i<division_data.length;i++){
            				var option = $("<option value='"+division_val[i]+"'>"+division_data[i]+"</option>")
            				$(select).append(option).show();
            			}
            			$("#s").append(select).show();;
            			//alert(division_data.length);
                		break;
            		case 'position':
            			$(select).append("<option value=''>선택</option>");
            			for(var i=0;i<position_data.length;i++){
            				var option = $("<option value='"+position_val[i]+"'>"+position_data[i]+"</option>")
            				$(select).append(option);
            			}
            			$("#s").append(select).show();;
            			//alert(division_data.size());
                		break;
            		case 'status':
            			$(select).append("<option value='y'>정상</option><option value='n'>휴직</option>");
            			$("#s").append(select).show();;
            			break;
            		case 'manager':
            			$(select).append("<option value='y'></option>");
            			$("#s").append(select).hide();
            			break;
            		case 'office':
            			for(var i=0;i<office_data.length;i++){
            				var option = $("<option value='"+office_val[i]+"'>"+office_data[i]+"</option>")
            				$(select).append(option);
            			}
            			$("#s").append(select).show();;
            			break;
            			
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
            		
            		var data = {"empNo":$("#eempNo").val()},dataStr = JSON.stringify(data);
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
                    		onErrorFunc(e);
                    	}
                    });
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
                   
        });