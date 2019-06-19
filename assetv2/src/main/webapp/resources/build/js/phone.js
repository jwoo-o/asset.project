/**
 * manager.jsp 스크립트
 */
   var grid, regist,modify;
      	
       
        
        
        function Edit(e) {
	            $("#no").val(e.data.id);
	            $("#type").val(e.data.record.type).prop("selected",true);
	            $("#sub_type").val(e.data.record.sub_type);
	            $("#company_name").val(e.data.record.company_name)
	            $("#manager").val(e.data.record.manager)
	            $("#tel1").val(e.data.record.tel1);
	            $("#tel2").val(e.data.record.tel2);
	            $("#email").val(e.data.record.mail);
	            $("#note").val(e.data.record.note);

	            regist.open('업체 수정');
        }
        function frmchk() {
			var frm=$("#regForm").find("input");
			var num=frm.length;
			for(i=0;i<=3;i++){
				if($(frm[i]).val()==""){
					return false;
				}
			}
			return true;
		}
        function Save() {
        	var url = '/phone/register/proc'
        		if($("#no").val()>0){
        			url = "/phone/update/proc"
        		}
        	if(!frmchk()){
				alert("구분/용도/업체명은 필수 입력사항입니다.");
        	}else{
        		
	            var data = $("#regForm").serializeObject(),dataStr = JSON.stringify(data); 
	               
	            
	            $.ajax({ url: url, data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
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
        
        
        function Delete(e) {
	            if (confirm('Are you sure?')) {
	            	var data = { no: e.data.id}, dataStr = JSON.stringify(data);
	                $.ajax({ url: '/phone/delete/proc', data: dataStr, method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8'})
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
        
        
        $(document).ready(function () {
        	
        	
        
        	var keyword,search;
            
            grid = $('#grid').grid({
                primaryKey: 'no',
                dataSource: {url:'/phone/list/proc'},
                uiLibrary: 'bootstrap4',
                columns: [
                    { field: 'sub_type',title: '용도',sortable: true, align: 'center' },
                    { field: 'company_name',title: '업체명', align: 'center' },
                    { field: 'manager', title: '담당자',width: 200, sortable: true, align: 'center' },
                    { field: 'tel1', title: '연락처', sortable: true, align: 'center' },
                    { field: 'email', title: '이메일', sortable: true, align: 'center' },
                    { field: 'note', title: '상태', align: 'center' },
                    { title: '', field: 'Delete', width: 42, type: 'icon', icon: 'fa fa-remove', tooltip: 'Delete', events: { 'click': Delete } }
                ],
                grouping: { groupBy : 'type_name'},
                pager: { limit: 10, sizes: [10, 20, 50] }
            });
            

            


            regist = $('#regist').dialog({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                autoOpen: false,
                resizable: false,
                modal: true
            });
            $('#btnAdd').on('click', function () {
               $("#regForm")[0].reset();
               $("#no").val(0);
                regist.open('업체 등록');
            });
            $('#btnSave').on('click', Save);
            
            $('#btnCancel').on('click', function () {
               regist.close();
              
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
            		case 'manager':       			
            			var input = $('<input id="search" type="text" placeholder="manager name...." class="form-control mb-2 mr-sm-2 mb-sm-0" />');
            			$("#s").append(input);
            			break;
            	
            		case 'type':
            			$(select).append("<option value=''>선택</option>");
            			for(var i=0;i<type_data.length;i++){
            				var option = $("<option value='"+type_val[i]+"'>"+type_data[i]+"</option>")
            				$(select).append(option).show();
            			}
            			$("#s").append(select).show();;
            			//alert(division_data.length);
                		break;
            		case 'company_name':
            			var input = $('<input id="search" type="text" placeholder="manager name...." class="form-control mb-2 mr-sm-2 mb-sm-0" />');
            			$("#s").append(input);
                		break;
            		case 'status':
            			$(select).append("<option value='y'>유지업체</option><option value='n'>해지업체</option>");
            			$("#s").append(select).show();;
            			break;
            			
            	}
            })
                   
        });