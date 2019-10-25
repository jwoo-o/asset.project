var oc;
var organization = {
		
		
		init : function () {
			var _this = this;
			_this.orgChartData("kr");
			$(".btn-country").on('click', function() {
				 
				var country = $(this).text();
				$("#seat_title").text(country);
				_this.orgChartData(country);
			});
			$("#btn_download").on('click',function(){	
				oc.export($("#seat_title").text()+"-organization", "png");
			});
			$(document).on('click', '.title', function(){			
				_this.deptPopup(this);		
			});
			$(document).on('mouseenter', '.employee', function(){
	    		$(this).css('background-color', 'rgba(255, 217, 250, 0.8)');
	  		});
	  		$(document).on('mouseleave', '.employee', function(){
	  			$(this).css('background-color', 'rgba(255, 255, 255, 1)');
	  		});
	  		$(document).on('mouseleave', '.node .content', function(){
	  			$(this).css('background-color', 'rgba(245, 214, 255, 0.8)');
	  		});
	  		$(document).on('click', '.div_select', function(){
	  			
				var id = $(this).data("link");
				var dept = Number(-($("#"+id).position().left));
				var translate = $(".orgchart").css("transform");
				var x = Number(translate.substring(7,translate.length-1).split(",")[4]);
				
				$(".orgchart").css('transform', 'matrix(1, 0, 0, 1, ' + (x+dept-90+$("#org_div").width()/2) + ',0)');
			});
	  		
	 		
			$(document).on('click', '.employee', function(){
				_this.employee(this);
			});
			
		},
		orgChartData : function(country){
			var _this = this;
			$.ajax({
				url: '/emp/organization/proc', method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8',data:country
			}).done(function(data) {
					if(data.msg=="0001"){
						//oc.$chart
						//$('#org_div').empty();
						if(oc==undefined){
							_this.orgChart(data,country);
						}else{
							oc.init({'data':data.tree[0]});
							_this.empData(data,country);
							var ceo = -($("#1").position().left+90-$("#org_div").width()/2);
							//.css("-webkit-transform","translate("+ceo+"px, 0px)");
							$(".orgchart").css('transform', 'matrix(1, 0, 0, 1, ' + ceo + ',0)');
						}

					}else{
						alert(data.msg);
					}
		
			}).fail(function(e) {
				if (e.status == 401) {
					onErrorFunc(e);
				}
			});
			
		},
		orgChart : function(data,country){
			var _this = this;
			oc = $('#org_div').orgchart({
				  'nodeTitle': "dept_nm",
				  "nodeContent" : "emp_nm",
				  'nodeId':"dept_no",
				  'parentId':"dept_mgr_no",
				  'toggleSiblingsResp':true,
				  'zoominLimit':2,
			      'data' :data.tree[0],
			      //'exportButton':true,
			      'exportFilename':'organizationchart',
			      'exportFileextension': 'png',
			      'zoom':true,
			      'pan':true,
			      'draggable': false,
			      'dropCriteria': function($draggedNode, $dragZone, $dropZone) {
			        if($draggedNode.find('.content').text().indexOf('manager') > -1 && $dropZone.find('.content').text().indexOf('engineer') > -1) {
			          return false;
			        }
			        return true;
			        
			      }
				
			});

			
			
			oc.$chart.on('nodedrop.orgchart', function(event, extraParams) {
				
				/*console.log('draggedNode:' + extraParams.draggedNode.children('.title').text()
				+ ', dragZone:' + extraParams.dragZone.children('.title').text()
				        + ', dropZone:' + extraParams.dropZone.children('.title').text()
				      );
				console.log('draggedNode:' +extraParams.draggedNode.attr("id") + +extraParams.draggedNode.data("parent")
						+ ', dragZone:' + extraParams.dragZone.attr("id") + extraParams.dragZone.data("parent")
						 + ', dropZone:' + extraParams.dropZone.attr("id") + extraParams.dropZone.data("parent")
					);*/
			});
			
			var ceo = -($("#1").position().left+90-$("#org_div").width()/2);
			//.css("-webkit-transform","translate("+ceo+"px, 0px)");
			$(".orgchart").css('transform', 'matrix(1, 0, 0, 1, ' + ceo + ',0)');
			_this.empData(data,country);
			
		},
		empData : function(data,country){
			
			$.each(data.emp, function(i, elt) {
				
				$("#"+elt.basic_dept).append('<div class="sub_content employee" id="'+elt.empNo+'">'+textLengthOverCut(elt.name,12)+'['+elt.pos_nm+']</div>');
			});
			$.each($(".node"), function(i, elt) {
			 	$(elt).children(".sub_content").last().removeClass("sub_content").addClass("sub_last_content");
			});
			
			
			$("#floor_data").empty();
			var data_count = 0;
			$.each(data.count, function(i, elt) {
				data_count += elt.count;
			});
			var tag = "<table style='width:100%' border='1'><thead><tr><td align='center' colspan='6'><b>"+country+" 사업국가 부서별 현황("+data_count+")</b></td></tr><thead><tr>";
			$.each(data.count, function(i, elt) {
					if(elt.div_nm!=undefined){
						tag += "<td align='center' class='title div_select' data-link='"+elt.division+"'>"+elt.div_nm+"</td><td width='5%' align='center' >"+elt.count+"</td>";
					}
					
			
				if((i+1)%3==0){
					tag +="</tr><tr>";
				}
			});
			tag += "</tr></table>";
			$("#floor_data").append(tag);
			
		},
		deptPopup : function(_this){
			
			var id = $(_this).parent().attr("id");
			if(id!=undefined){
				
				var x = 1000;
			    var y = 900;
			    var url = '/dept/register?dept_no='+id+'&emp_no=null';
			    var title = 'Common Register';
			    
			    popup(url,title,x,y);
			};
		},
		employee : function(_this){
			
			$.ajax({
				url: '/emp/detail/proc', method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8',data:$(_this).attr("id")
			}).done(function(data) {
					if(data.msg=="0001"){
						//oc.$chart
						//$('#org_div').empty();
						
						if($("#mgrAuth").val()!=0){
			        		var d = {};
			        		d.first_dept = data.data.country;
			        		d.second_dept = data.data.first_dept;
			        		d.three_dept = data.data.second_dept;
			        		d.four_dept = data.data.three_dept;
			        		
			        		$.deptAjaxData(d,data.data);
			        		$(".dept").empty().attr("disabled", true);
			        		$("#efirst_dept").append("<option value=''>## NONE ##</option>");
							$("#esecond_dept").append("<option value=''>## NONE ##</option>");
							$("#ethree_dept").append("<option value=''>## NONE ##</option>");
							$("#efour_dept").append("<option value=''>## NONE ##</option>");
			        		
			        		
			        		/*if(data.data.dcode=="7"){
			        			$(".ga_only").show();
			        			
			        		}else{
			        			$("#office_number").val("");
			        			$(".ga_only").hide();
			        		}*/
							$("#eoffice_number").val(data.data.office_number);
				            $("#eempNo").val(data.data.empNo);
				            $("#ename").val(data.data.name);
				            $("#eposition").val(data.data.pcode).prop("selected",true);
				            //$("#edivision").val(e.data.record.dcode).prop("selected",true);
				            
				            $("#estatus").val(data.data.status).prop("selected",true);
				            $("#ebasic_dept").val(data.data.basic_dept);
				            $("#edivision").val(data.data.dcode);
				            $("#ecountry").val(data.data.country).prop("selected",true);
				            $("#eemail").val(data.data.email);
				            $("#eseat").val(data.data.seat);
				            $("#original_name").val(data.data.profile_name);
				            if(data.data.profile_name!=null && data.data.profile_name!=''){
				            	$("#profile").attr("src", "/resources/build/images/profileImage/"+data.data.profile_name);
				            }else{
				            	$("#profile").attr("src","/images/profileImage/default_profile.jpg");
				            }
				            $("#profile_upload").val('');
				            if(data.data.manager=='y'){
				            	$("#managerDiv").show();
				            	$("#manager").prop("checked",true);
				            	$("#auth").val(data.data.auth).prop("selected",true);
				            	$("#isManager").val('y');
				            }else{
				            	$("#managerDiv").hide();
				            	$("#manager").prop("checked",false);
				            	$("#isManager").val('n');	            	
				            }
				        	$("#efirst_dept").val(data.data.first_dept).prop("selected",true);
				            $("#esecond_dept").val(data.data.second_dept).prop("selected",true);
				            $("#ethree_dept").val(data.data.three_dept).prop("selected",true);
				            $("#efour_dept").val(data.data.four_dept).prop("selected",true);
				            modify.open('사원 수정');
				            $("#efirst_dept").val(data.data.first_dept).prop("selected",true);
				            $("#esecond_dept").val(data.data.second_dept).prop("selected",true);
				            $("#ethree_dept").val(data.data.three_dept).prop("selected",true);
				            $("#efour_dept").val(data.data.four_dept).prop("selected",true); 
				            
				            
			        	}else{
			        		alert("Not Authorization");
			        	}
	
					}else{
						alert(data.msg);
					}
					
						
			}).fail(function(e) {
				if (e.status == 401) {
					onErrorFunc(e);
				}
			});
		}
};
organization.init();

function textLengthOverCut(txt, len, lastTxt) {
    if (len == "" || len == null) { // 기본값
        len = 20;
    }
    if (lastTxt == "" || lastTxt == null) { // 기본값
        lastTxt = "...";
    }
    if (txt.length > len) {
        txt = txt.substr(0, len) + lastTxt;
    }
    return txt;
}