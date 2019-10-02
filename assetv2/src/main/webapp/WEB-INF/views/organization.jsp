<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/css/orgchart.css" rel="stylesheet" type="text/css">
<style type="text/css">
.org_div {
		position: relative;
		text-align: center;
	}
.orgchart { 
	background: #fff; 
	}
	
	.box {
	position: relative;
	border-radius: 3px;
	background: #ffffff;
	border-top: 3px solid #d2d6de;
	margin-bottom: 20px;
	width: 100%;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}
.box.box-primary {
	border-top-color: #3c8dbc;
}
.box-header .box-title
	{
	display: inline-block;
	font-size: 18px;
	margin: 0;
	line-height: 1;
}
.box-header.with-border {
	border-bottom: 1px solid #f4f4f4;
}
.content {
	padding: 15px;
	margin-right: auto;
	margin-left: auto;
	padding-left: 15px;
	padding-right: 15px;
}
.content-wrapper2 {
	z-index: 0;
	margin-left: 0;
	min-height: 100%;
	background-color: #ecf0f5;
	z-index: 0;
}
#floor_data{

	
	left: 60%;
	top: 85px;
	width: 700px;
	height: 128px;
	border: 1px solid #666666;
	position:absolute;	
}
#floor_data .title{
	 background-color: rgba(155, 124, 201, 0.8);
  	 color: #fff;
}
	
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/js/html2canvas.min.js"></script>
<script type="text/javascript" src="/js/jspdf.min.js"></script>
<script type="text/javascript" src="/js/orgchart.js"></script>
<script type="text/javascript" src="/js/common.js"></script>


<script type="text/javascript">

	$(function () {
		var oc
		function orgChartData(country){
    		
    		$.ajax({
				url: '/emp/organization/proc', method: 'POST',dataType:'json',contentType:'application/json; charset=UTF-8',data:country
			}).done(function(data) {
					if(data.msg=="0001"){
						//oc.$chart
						//$('#org_div').empty();
						if(oc==undefined){
							orgChart(data,country);
						}else{
							oc.init({'data':data.tree[0]});
							empData(data,country);
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
			})
			
			
		}
		
		
		
		orgChartData("kr");
		
		
		
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


		
		
		
		
		function orgChart(data,country){
			
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
			
			
			empData(data,country)
		}
		
		
		
		
		$(".btn-country").on('click', function() {
			 
			var country = $(this).text();
			$("#seat_title").text(country);
			orgChartData(country);
		})
		
		
		function empData(data,country){
			
			$.each(data.emp, function(i, elt) {
				
				$("#"+elt.basic_dept).append('<div class="sub_content">'+textLengthOverCut(elt.name,12)+'['+elt.pos_nm+']</div>');
			})
			$.each($(".node"), function(i, elt) {
			 	$(elt).children(".sub_content").last().removeClass("sub_content").addClass("sub_last_content");
			})	
			
			
			$("#floor_data").empty();
			var data_count = 0;
			$.each(data.count, function(i, elt) {
				data_count += elt.count;
			})
			var tag = "<table style='width:100%' border='1'><thead><tr><td align='center' colspan='6'><b>"+country+" 사업국가 부서별 현황("+data_count+")</b></td></tr><thead><tr>";
			$.each(data.count, function(i, elt) {
					if(elt.div_nm!=undefined){
						tag += "<td align='center' class='title div_select' data-link='"+elt.division+"'>"+elt.div_nm+"</td><td width='5%' align='center' >"+elt.count+"</td>";
					}
					
			
				if((i+1)%3==0){
					tag +="</tr><tr>";
				}
			})
			tag += "</tr></table>";
			$("#floor_data").append(tag);
			
		
			
			
			$(document).on('click', '.div_select', function(){
				var id = $(this).data("link");
				var dept = Number(-($("#"+id).position().left));
				var translate = $(".orgchart").css("transform");
				var x = Number(translate.substring(7,translate.length-1).split(",")[4]);
				
				$(".orgchart").css('transform', 'matrix(1, 0, 0, 1, ' + (x+dept-90+$("#org_div").width()/2) + ',0)');
			})	
			
		}
		$("#btn_download").on('click',function(){
			
			oc.export($("#seat_title").text()+"-organization", "png");
		})
		$(document).on('click', '.node', function(){
			var id = $(this).attr("id");
			var x = 1000;
		    var y = 900;
		    var url = '/dept/register?dept_no='+id+'&emp_no=null';
		    var title = 'Common Register';
		    
		    popup(url,title,x,y);
		})	
		
		
		
	});
</script>
</head>
<body class="content-wrapper2">
	<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary" style="padding: 10px; width:100%; height: 800px; ">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong id="seat_title">kr</strong></h3>
		                </div><!-- /.box-header -->
		                <button id="btn_kr" class="btn btn-primary btn-country">kr</button>&nbsp;&nbsp;<button id="btn_sg" class="btn btn-primary btn-country">sg</button>&nbsp;&nbsp;<button id="btn_cn" class="btn btn-primary btn-country">cn</button>&nbsp;&nbsp;<button id="btn_id" class="btn btn-primary btn-country">id</button>&nbsp;&nbsp;<button id="btn_my" class="btn btn-primary btn-country">my</button>
		     			<button id="btn_download" class="btn btn-primary" style="left:95%; position: absolute;">download</button>
		                <div id="org_div" class="org_div" style="height: 700px; width:100%;" ></div>
						<div id="floor_data"></div>
					</div>	
				</div>
			</div>	
	</section>
</body>
</html>