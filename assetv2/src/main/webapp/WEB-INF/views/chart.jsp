<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
	
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
	
	
     function drawChart(keyword) {
			var category = keyword
			var data = new google.visualization.DataTable();
			data.addColumn('string','categorys');
			data.addColumn('number','count');
			
	       	if(keyword==undefined){
	       		category = 'division';
	       	}
			$.ajax({
				url:"/asset/chart/proc",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				method:'post',
				data : JSON.stringify({"categorys" : category})
			}).done(function(d) {
				if(d.msg=="0001"){
					$.each(d.rows, function(i, elt) {
						var category = elt.categorys;
						var count = elt.count;
						data.addRows([[category,count]]);
					});
					var options = {
						       title: 'chart of '+category,
						       is3D: true
						       };       
					var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
					chart.draw(data,options);	
				}else{
					alert(d.msg);
				}					
				
			}).fail(function (e) {
            	onErrorFunc(e);
            });
			
	       
	 }
     $(function(){
    	 
    	 google.charts.setOnLoadCallback(drawChart);
    	 
 		$("input:radio[name=keyword]").click(function() {
 		   google.charts.setOnLoadCallback(drawChart($(this).val()));
 	   })

 	      
 	})
    </script>
</head>
<body  class="content-wrapper2">
	
		
		   <!-- Main content -->
	       <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong>Asset Chart</strong></h3>
		                </div><!-- /.box-header -->
		                <div class="box-header">
			                 <label class="radio-inline"><input type="radio" name="keyword" checked value="division">division</label>
							 <label class="radio-inline"><input type="radio" name="keyword" value="position">position</label>
							 <label class="radio-inline"><input type="radio" name="keyword" value="buying">purchase</label>
		                </div><!-- /.box-header -->
		                
						<div class="box-body" id="donutchart" style="height: 600px;">  	
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
</html>