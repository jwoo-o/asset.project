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
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#floor_data{

	
	left: 1175px;
	top: 85px;
	width: 700px;
	height: 105px;
	border: 1px solid #666666;
	position:absolute;
	
	
	
}
#N3F {
	background-image: url("/images/n3f.jpg");
	width: 1865px;
	height: 930px;
	position: relative;
}

#N13F {
	background-image: url("/images/n13f.jpg");
	width: 1865px;
	height: 930px;
	position: relative;
}

.seat2 {
	width: 40px;
	height: 55px;
	border: 1px solid #666666;
	position:absolute;
	padding-top: 20px;
	background-color: #BABABA;
}
.seat1 {
	width: 55px;
	height: 40px;
	border: 1px solid #666666;
	position:absolute;
	padding-top: 13px;
	background-color:#BABABA;
}
p{
	text-align: center;
	font-size: x-small;
}
.seat3 {
	width: 50px;
	height: 40px;
	border: 1px solid #666666;
	position:absolute;
	padding-top: 13px;
	background-color:#BABABA;
}


</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.js" type="text/javascript"></script>
<script type="text/javascript">
//좌표 확인
/*function action_coords(event) {
	var x1 = event.pageX;

    var y1 = event.pageY;
	var t = $("#N13F").position().top;
	var l = $("#N13F").position().left;
	alert("x : "+(x1-l-20)+", y : "+(y1-t-15));
	
	
}*/
var popup;
	$(function () {
		var url;
		if(opener){
			url = window.opener.document.URL.split('/');
		}else{
			url = "seat/get"
		}
		
		var type = url[url.length-1];
		var tag = "<table style='width:100%' border='1'><thead><tr><td align='center' colspan='6'><b>부서별 현황</b></td></tr><thead><tr>";
		var n3_count_tag = '';
		var n13_count_tag = '';
		var n3_seatNo = 21;		
		var n13_seatNo = 17;
		function seatGrid() {
			var n3_tag='';
			var n13_tag='';
				
		//n3
				//GAF 헤드석
				n3_tag +='<div class="seat1 seat n3" style="left:135px;top:15px" id="n30001"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:240px;top:15px" id="n30002"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:310px;top:15px" id="n30003"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:365px;top:15px" id="n30004"></div>';
				
				//엽업 부서 헤드석
				n3_tag +='<div class="seat1 seat n3" style="left:25px;top:810px" id="n30005"></div>';
				n3_tag +='<div class="seat2 seat n3" style="left:175px;top:865px" id="n30006"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:215px;top:865px" id="n30007"></div>';//40
				n3_tag +='<div class="seat1 seat n3" style="left:335px;top:865px" id="n30008"></div>';//120
				n3_tag +='<div class="seat1 seat n3" style="left:565px;top:865px" id="n30009"></div>';//230
				n3_tag +='<div class="seat2 seat n3" style="left:620px;top:865px" id="n30010"></div>';//
				n3_tag +='<div class="seat1 seat n3" style="left:715px;top:865px" id="n30011"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:835px;top:865px" id="n30012"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:970px;top:865px" id="n30013"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:1025px;top:865px" id="n30014"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:1120px;top:865px" id="n30015"></div>';
				n3_tag +='<div class="seat2 seat n3" style="left:1175px;top:865px" id="n30016"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:1255px;top:865px" id="n30017"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:1390px;top:865px" id="n30018"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:1550px;top:865px" id="n30019"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:1645px;top:865px" id="n30020"></div>';
				
				
			
				
				//부서 자리	
				for(var i=1;i<5;i++){
					var y = 55*i;
					var x = 40;
					var x_1 = 30;
					n3_tag +='<div class="seat2 seat n3" style="left:30px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat n3" style="left:110px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat n3" style="left:150px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat n3" style="left:240px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat n3" style="left:325px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat n3" style="left:365px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';		
					n3_tag +='<div class="seat2 seat n3" style="left:445px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					if(i<4){
						n3_tag +='<div class="seat2 seat n3" style="left:40px;top:'+(590+y)+'px" id="n3'+divIdAssign('n3')+'"></div>';
						n3_tag +='<div class="seat2 seat n3" style="left:80px;top:'+(590+y)+'px" id="n3'+divIdAssign('n3')+'"></div>';
					}
					for(var j=0;j<24;j++){
						if(j%2==0){
							x +=40;
						}else{
							x +=95;
						}
						n3_tag +='<div class="seat2 seat n3" style="left:'+x+'px;top:'+(590+y)+'px" id="n3'+divIdAssign('n3')+'"></div>';
					}
							
				}
				//추가좌석
				n3_tag +='<div class="seat2 seat n3" style="left:35px;top:465px" id="n30151"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:75px;top:465px" id="n30152"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:130px;top:465px" id="n30153"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:185px;top:465px" id="n30154"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:240px;top:465px" id="n30155"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:295px;top:465px" id="n30156"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:95px;top:547px" id="n30157"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:150px;top:547px" id="n30158"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:205px;top:547px" id="n30159"></div>';
				n3_tag +='<div class="seat1 seat n3" style="left:260px;top:547px" id="n30160"></div>';
				
				//2번째 추가좌석
				n3_tag +='<div class="seat2 seat n3" style="left:255px;top:345px" id="n30161"></div>';
				n3_tag +='<div class="seat2 seat n3" style="left:255px;top:400px" id="n30162"></div>';
				n3_tag +='<div class="seat2 seat n3" style="left:350px;top:345px" id="n30163"></div>';
				n3_tag +='<div class="seat2 seat n3" style="left:350px;top:400px" id="n30164"></div>';
		//n13
			
			//tech 헤드석
			n13_tag +='<div class="seat2 seat n13" style="left:30px;top:55px" id="n130001"></div>';
			
			
			var y3= 45;
			//tech 부서자리
			for(var i=0;i<7;i++){
				var x= 100;
				
				for(var j=1;j<7;j++){
					if(i==6 && j>=3){
						break;
					}
					n13_tag += '<div class="seat1 seat n13" style="left:'+x+'px;top:'+y3+'px"  id="n13'+divIdAssign('n13')+'"></div>';
					x += 55;
				}
				//tech 헤드석
				if(i>1 && i<6){
					n13_tag += '<div class="seat1 seat n13" style="left:15px;top:'+y3+'px"  id="n13'+divIdAssign('n13')+'"></div>';
				}
				if(i%2==0){
					y3 +=40;
				}else{
					y3 +=75;
				}
			}
			var x = 255;
			for(var i=1;i<=3;i++){
				//var x = 260;
				var y = 390;
				for(var j=1;j<=3;j++){
					n13_tag += '<div class="seat2 seat n13" style="left:'+x+'px;top:'+y+'px"  id="n13'+divIdAssign('n13')+'"></div>';
					y+= 55;
				}
				if(i%2==0){
					x +=85;
				}else{
					x +=40;
				}
				
			}
			
			n13_tag +='<div class="seat2 seat n13" style="left:170px;top:430px" id="n13'+divIdAssign('n13')+'"></div>';
			n13_tag +='<div class="seat2 seat n13" style="left:170px;top:485px" id="n13'+divIdAssign('n13')+'"></div>';
			//헤드석
			n13_tag +='<div class="seat1 seat n13" style="left:235px;top:850px" id="n130002"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:325px;top:850px" id="n130003"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:380px;top:850px" id="n130004"></div>';
			n13_tag +='<div class="seat3 seat n13" style="left:518px;top:850px" id="n130005"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:625px;top:850px" id="n130006"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:715px;top:850px" id="n130007"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:770px;top:850px" id="n130008"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:850px;top:850px" id="n130009"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:1015px;top:850px" id="n130010"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:1105px;top:850px" id="n130011"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:1160px;top:850px" id="n130013"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:1275px;top:850px" id="n130014"></div>';
			n13_tag +='<div class="seat1 seat n13" style="left:1405px;top:850px" id="n130015"></div>';
			n13_tag +='<div class="seat2 seat n13" style="left:1510px;top:850px" id="n130016"></div>';
			
			
			//중앙
			var x3 = 890;
			for(var i=0;i<9;i++){
				var y= 465;
				for(var j=1;j<3;j++){
					n13_tag += '<div class="seat2 seat n13" style="left:'+x3+'px;top:'+y+'px"  id="n13'+divIdAssign('n13')+'"></div>';
					y += 55;
				}
				if(i%2==0){
					if(i==4){
						x3+=120;
					}else{
						x3 +=40;
					}
				
				}else{
					x3 +=90;
					if(i>4)
						x3 -=10;
					
				}
			}
			
			for(var i=1;i<5;i++){
				var y = 55*i;
				var x = 120;
				for(var j=1;j<=21;j++){
					if(j%2==0){
						x +=40;
					}else{
						x +=90;
					}
					n13_tag += '<div class="seat2 seat n13" style="left:'+x+'px;top:'+(575+y)+'px"  id="n13'+divIdAssign('n13')+'"></div>';
				}
			}
			
			
			$("#N3F").append(n3_tag);
			$("#N13F").append(n13_tag);
			
		}
		function divIdAssign(floors) {
			var str = '';
			var length = 4;
			if(floors=='n3'){
				var num = n3_seatNo+"";			
				for(var c=0;c<length-num.length;c++){
					str += '0';
				}
				str += num;
				n3_seatNo++;
				
			}else if(floors=='n13'){
				var num = n13_seatNo+"";			
				for(var c=0;c<length-num.length;c++){
					str += '0';
				}
				str += num;
				n13_seatNo++;
			}
			return str;
		}
		
		seatGrid();
		
		function seatData(){
			var data = {"search":"kr","keyword":"country"}
			var dataStr = JSON.stringify(data);
			$.ajax({
				url:"/seat/list/proc",
				dataType:"json",
				data:dataStr,
				contentType:"application/json; charset=utf-8",
				method:"post"
			}).done(function(data) {
			 
				if(data.msg=='0001'){
					//alert(data.total);
					$.each(data.records, function(i, elt) {
					 	if(elt.seat!=null){
					 		//alert(elt.name);
					 		$("#"+elt.seat).append('<p>'+elt.name+'</p><input type="hidden" value="'+elt.empNo+'"><input type="hidden" value="'+elt.first_dept_nm+' '+elt.first_dept_org_nm+'"><input type="hidden" value="'+elt.position+'"><input type="hidden" value="'+elt.profile_name+'">');				 		
					 		$("#"+elt.seat).css("background", elt.color);
					 		/*$('.employee').dialog({
				                uiLibrary: 'bootstrap4',
				                iconsLibrary: 'fontawesome',
				                autoOpen: false,
				                resizable: false,
				                modal: true
				            });*/
					 		
	
					 	}
					})
					$.each(data.ex, function(i, elt) {
						$("#"+elt.seat).append('<p>'+elt.name+'</p><input type="hidden" value="입사예정자"><input type="hidden" value="'+elt.divNm+'">');				 		
				 		$("#"+elt.seat).css("background", "#47C83E");
					})
					n3_count_tag = "<table style='width:100%' border='1'><thead><tr><td align='center' colspan='6'><b>부서별 현황("+$(".n3 p").length+"/"+$(".n3").length+")</b></td></tr><thead><tr>";
					n13_count_tag = "<table style='width:100%' border='1'><thead><tr><td align='center' colspan='6'><b>부서별 현황("+$(".n13 p").length+"/"+$(".n13").length+")</b></td></tr><thead><tr>";
					var n3_count = 1;
					var n13_count = 1;
					$.each(data.count, function(i, elt) {
						
						if(elt.office=='n3'){						
							n3_count_tag += "<td align='center' style='background:"+elt.color+"'>"+elt.division+"</td><td width='5%' align='center' >"+elt.count+"</td>";
							if(n3_count++%3==0){
								n3_count_tag +="</tr><tr>";
							}
						}else{
							n13_count_tag += "<td align='center' style='background:"+elt.color+"'>"+elt.division+"</td><td width='5%' align='center' >"+elt.count+"</td>";
							if(n13_count++%3==0){
								n13_count_tag +="</tr><tr>";
							}
						}
						
						
					})
					n3_count_tag += "</tr></table>";
					n13_count_tag += "</tr></table>";
					$("#floor_data").append(n3_count_tag);
					
					//qx좌석
					for(var i=1;i<=11;i++){
						$("#n1300"+(i+58)).append('<p>qx'+i+'</p>').off();
						$("#n1300"+(i+58)).css("background", "#FFE400");
					}
					//$("#n30089").append('<p>출장석</p>').off("click");
					//$("#n30122").append('<p>출장석</p>').off("click");
					//$("#n30120").append('<p>테스트석</p>').off("click");
					
					
			 		
					
				}else{
					alert(data.msg);
				}
				
			}).fail(function(e) {
				
				onErrorFunc(e);
			})
		}
		popup = $('#employee_info').dialog({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            autoOpen: false,
            resizable: false,
            modal: true
        });
		
		seatData("n3");
		$("#btn_n3f").on('click', function() {
			$("#N13F").hide()
		 	$("#N3F").show();
			$("#seat_title").html("N3F");
			$("#floor_data").empty().append(n3_count_tag);
			
		});
		
		$("#btn_n13f").on('click', function() {
			$("#N3F").hide()
			$("#N13F").show();	 
			$("#seat_title").html("N13F");
			$("#floor_data").empty().append(n13_count_tag);
		});
		if(type=='calendar'){
			var id = $("#seat",opener.document).prev().val()
			if(id !=''){
				$("#"+id).css('border','2px solid #003399');
			}
		}
		if(type=='emp'){
			var id = $("#eseat",opener.document).val();
			if(id !=''){
				$("#"+id).css('border','2px solid #003399');
			}
		}
		/*if(type.substring('detail') !=-1){
			var id = $("#location",opener.document).val();
			if(id !=''){
				$("#"+id).css('border','2px solid #003399');
			}
		}*/
		
		
		$(".seat").on('click', function() {
			 
			 
			 /*switch (type) {
				case 'home':
					if($(this).children().html()!=undefined){
						var input = $(this).find("input");
						$("#name").val($(this).find("p").text());
						$("#empNo").val($(input[0]).val());
						$("#position").val($(input[1]).val());
						$("#division").val($(input[2]).val());
						if($(input[3]).val()!="null" && $(input[3]).val()!=''){
							$("#profile").attr("src", "/resources/build/images/profileImage/"+$(input[3]).val());
						}else{
							$("#profile").attr("src","/images/profileImage/default_profile.jpg");
						}
						popup.open("Info");
					}
					
					break;
	
				case 'emp':
					if($(this).children().html()==undefined){
						$(".seat",opener.document).val($(this).attr("id"));
						//$("#eseat",opener.document).val($(this).attr("id"));				
						window.close();
					}
					break;
					
				case 'calendar':
					if($(this).children().html()==undefined){
						$("#seat",opener.document).val($(this).attr("id"));
						//$("#eseat",opener.document).val($(this).attr("id"));				
						window.close();
					}
					break;
			}*/
			
			if(type=="emp"){
				
				if($(this).children().html()==undefined){
					$(".seat",opener.document).val($(this).attr("id"));
					//$("#eseat",opener.document).val($(this).attr("id"));				
					window.close();
				}
				
			}else if(type=="calendar"){
				
				if($(this).children().html()==undefined){
					$("#seat",opener.document).prev().val($(this).attr("id"));
					//$("#eseat",opener.document).val($(this).attr("id"));				
					window.close();
				}
				
			}else{			
				if($(this).children().html()!=undefined){
					var input = $(this).find("input");
					$("#name").val($(this).find("p").text());
					$("#empNo").val($(input[0]).val());
					$("#position").val($(input[2]).val());
					$("#division").val($(input[1]).val());
					if($(input[3]).val()!="null" && $(input[3]).val()!='' && $(input[3]).val()!=undefined){
						$("#profile").attr("src", "/resources/build/images/profileImage/"+$(input[3]).val());
					}else{
						$("#profile").attr("src","/images/profileImage/default_profile.jpg");
					}
					popup.open("Info");
				}
			}
			
		})
	
		$(".seat").hover(function() {
			 $(this).css({
				'border' : '2px solid #003399'
			 })
		}, function() {
			$(this).css({
				'border' : '1px solid #666666'
			 })
		})
	});
</script>
</head>
<body class="content-wrapper2">
	<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary" style="padding: 10px; width:1880px ">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong id="seat_title">N3F</strong></h3>
		                </div><!-- /.box-header -->
		                <button id="btn_n3f" class="btn btn-primary">N3F</button>&nbsp;&nbsp;<button id="btn_n13f" class="btn btn-primary">N13F</button>
		                
		                <div id="N3F"></div>
						<div id="N13F" style="display: none;"></div>
						<div id="floor_data">
						</div>
					</div>	
				</div>
			</div>
			<div id="employee_info" style="display: none">
			
        		<div class="form-group" style="text-align: center;">  
	                <img alt="사진" width="150px" height="170px" id="profile">
	            </div>
        		<div class="form-group">
	                <label for="empNo">사번</label>
	                <input type="text" class="form-control" id="empNo" readonly="readonly"/>
	            </div>
	            <div class="form-group">
	                <label for="name">이름</label>
	                <input type="text" class="form-control" id="name" readonly="readonly"/>
	            </div>
	            <div class="form-group">
	                <label for="division">부서</label>
	                <input type="text" class="form-control" id="division" readonly="readonly"/>
	            </div>   
	             <div class="form-group">
	                <label for="position">직위</label>
	                <input type="text" class="form-control" id="position" readonly="readonly" />
	            </div>
	                  
            </div>
			
	</section>
	
</body>
</html>