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
 <link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
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
<script type="text/javascript">
/*function action_coords(event) {
	var x1 = event.pageX

    var y1 = event.pageY;
	var t = $("#N13F").position().top;
	var l = $("#N13F").position().left;
	alert("x : "+(x1-l-20)+", y : "+(y1-t-15));
	
	
}*/
	$(function () {
		var n3_seatNo = 21;		
		var n13_seatNo = 17;
		function seatGrid() {
			var n3_tag='';
			var n13_tag='';
				
			//n3
				//GAF 헤드석
				n3_tag +='<div class="seat1 seat" style="left:135px;top:15px" id="n30001"></div>';
				n3_tag +='<div class="seat1 seat" style="left:240px;top:15px" id="n30002"></div>';
				n3_tag +='<div class="seat1 seat" style="left:310px;top:15px" id="n30003"></div>';
				n3_tag +='<div class="seat1 seat" style="left:365px;top:15px" id="n30004"></div>';
				
				//엽업 부서 헤드석
				n3_tag +='<div class="seat1 seat" style="left:25px;top:810px" id="n30005"></div>';
				n3_tag +='<div class="seat2 seat" style="left:175px;top:865px" id="n30006"></div>';
				n3_tag +='<div class="seat1 seat" style="left:215px;top:865px" id="n30007"></div>';//40
				n3_tag +='<div class="seat1 seat" style="left:335px;top:865px" id="n30008"></div>';//120
				n3_tag +='<div class="seat1 seat" style="left:565px;top:865px" id="n30009"></div>';//230
				n3_tag +='<div class="seat2 seat" style="left:620px;top:865px" id="n30010"></div>';//
				n3_tag +='<div class="seat1 seat" style="left:715px;top:865px" id="n30011"></div>';
				n3_tag +='<div class="seat1 seat" style="left:835px;top:865px" id="n30012"></div>';
				n3_tag +='<div class="seat1 seat" style="left:970px;top:865px" id="n30013"></div>';
				n3_tag +='<div class="seat1 seat" style="left:1025px;top:865px" id="n30014"></div>';
				n3_tag +='<div class="seat1 seat" style="left:1120px;top:865px" id="n30015"></div>';
				n3_tag +='<div class="seat2 seat" style="left:1175px;top:865px" id="n30016"></div>';
				n3_tag +='<div class="seat1 seat" style="left:1255px;top:865px" id="n30017"></div>';
				n3_tag +='<div class="seat1 seat" style="left:1390px;top:865px" id="n30018"></div>';
				n3_tag +='<div class="seat1 seat" style="left:1550px;top:865px" id="n30019"></div>';
				n3_tag +='<div class="seat1 seat" style="left:1645px;top:865px" id="n30020"></div>';
				
				//부서 자리	
				for(var i=1;i<5;i++){
					var y = 55*i;
					var x = 40;
					var x_1 = 30;
					n3_tag +='<div class="seat2 seat" style="left:30px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat" style="left:110px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat" style="left:150px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat" style="left:240px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat" style="left:325px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					n3_tag +='<div class="seat2 seat" style="left:365px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';		
					n3_tag +='<div class="seat2 seat" style="left:445px;top:'+y+'px" id="n3'+divIdAssign('n3')+'"></div>';
					if(i<4){
						n3_tag +='<div class="seat2 seat" style="left:40px;top:'+(590+y)+'px" id="n3'+divIdAssign('n3')+'"></div>';
						n3_tag +='<div class="seat2 seat" style="left:80px;top:'+(590+y)+'px" id="n3'+divIdAssign('n3')+'"></div>';
					}
					for(var j=0;j<24;j++){
						if(j%2==0){
							x +=40;
						}else{
							x +=95;
						}
						n3_tag +='<div class="seat2 seat" style="left:'+x+'px;top:'+(590+y)+'px" id="n3'+divIdAssign('n3')+'"></div>';
					}
							
				}
			//n13
			
			//tech 헤드석
			n13_tag +='<div class="seat2 seat" style="left:30px;top:55px" id="n130001"></div>';
			
			
			var y3= 45;
			//tech 부서자리
			for(var i=0;i<7;i++){
				var x= 100;
				
				for(var j=1;j<7;j++){
					
					n13_tag += '<div class="seat1 seat" style="left:'+x+'px;top:'+y3+'px"  id="n13'+divIdAssign('n13')+'"></div>';
					x += 55;
				}
				//tech 헤드석
				if(i>1 && i<6){
					n13_tag += '<div class="seat1 seat" style="left:15px;top:'+y3+'px"  id="n13'+divIdAssign('n13')+'"></div>';
				}
				if(i%2==0){
					y3 +=40;
				}else{
					y3 +=75;
				}
			}
			//헤드석
			n13_tag +='<div class="seat1 seat" style="left:235px;top:865px" id="n130002"></div>';
			n13_tag +='<div class="seat1 seat" style="left:325px;top:865px" id="n130003"></div>';
			n13_tag +='<div class="seat1 seat" style="left:380px;top:865px" id="n130004"></div>';
			n13_tag +='<div class="seat3 seat" style="left:518px;top:865px" id="n130005"></div>';
			n13_tag +='<div class="seat1 seat" style="left:625px;top:865px" id="n130006"></div>';
			n13_tag +='<div class="seat1 seat" style="left:715px;top:865px" id="n130007"></div>';
			n13_tag +='<div class="seat1 seat" style="left:770px;top:865px" id="n130008"></div>';
			n13_tag +='<div class="seat1 seat" style="left:850px;top:865px" id="n130009"></div>';
			n13_tag +='<div class="seat1 seat" style="left:1015px;top:865px" id="n130010"></div>';
			n13_tag +='<div class="seat1 seat" style="left:1105px;top:865px" id="n130011"></div>';
			n13_tag +='<div class="seat1 seat" style="left:1160px;top:865px" id="n130013"></div>';
			n13_tag +='<div class="seat1 seat" style="left:1275px;top:865px" id="n130014"></div>';
			n13_tag +='<div class="seat1 seat" style="left:1405px;top:865px" id="n130015"></div>';
			n13_tag +='<div class="seat2 seat" style="left:1510px;top:865px" id="n130016"></div>';
			
			
			//중앙
			var x3 = 890;
			for(var i=0;i<9;i++){
				var y= 465;
				for(var j=1;j<3;j++){
					n13_tag += '<div class="seat2 seat" style="left:'+x3+'px;top:'+y+'px"  id="n13'+divIdAssign('n13')+'"></div>';
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
					n13_tag += '<div class="seat2 seat" style="left:'+x+'px;top:'+(590+y)+'px"  id="n13'+divIdAssign('n13')+'"></div>';
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
			var data = {"search":''}
			var dataStr = JSON.stringify(data);
			$.ajax({
				url:"/empSeat/proc",
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
					 		$("#"+elt.seat).append("<p>"+elt.name+"</p>");
					 		if(elt.dcode=='1'){
					 			$("#"+elt.seat).css("background", "#DDD9C4");
					 			
					 		}
					 		if(elt.dcode=='2'){
					 			$("#"+elt.seat).css("background", "#F2DCDB");
					 			
					 		}
					 		if(elt.dcode=='3'){
					 			$("#"+elt.seat).css("background", "#FABF8F");
					 			
					 		}
					 		if(elt.dcode=='4'){
					 			$("#"+elt.seat).css("background", "#DA9694");
					 			
					 		}
					 		if(elt.dcode=='5'){
					 			$("#"+elt.seat).css("background", "#CCC0DA");
					 			
					 		}
					 		if(elt.dcode=='6'){
					 			$("#"+elt.seat).css("background", "#FFFFCC");
					 			
					 		}
					 		if(elt.dcode=='7'){
					 			$("#"+elt.seat).css("background", "yellow");
					 			
					 		}
					 		
					 		if(elt.dcode=='8'){
					 			$("#"+elt.seat).css("background", "#DDD9C4");
					 			
					 		}
					 		if(elt.dcode=='9'){
					 			$("#"+elt.seat).css("background", "#FFC000");
					 			
					 		}
					 		if(elt.dcode=='10'){
					 			$("#"+elt.seat).css("background", "#CCECFF");
					 			
					 		}
					 		if(elt.dcode=='11'){
					 			$("#"+elt.seat).css("background", "#FFC000");
					 			
					 		}
					 		
					 		if(elt.dcode=='12'){
					 			$("#"+elt.seat).css("background", "#FFCCFF");
					 			
					 		}
					 		
					 		
					 		if(elt.dcode=='13'){
					 			$("#"+elt.seat).css("background", "#CCECFF");
					 			
					 		}
					 		if(elt.dcode=='14'){
					 			$("#"+elt.seat).css("background", "#FFCCFF");
					 			
					 		}
					 	}
					 	
					})
				}else{
					
				}
				
			}).fail(function(e) {
				
				onErrorFunc(e);
			})
		}
		
		seatData("n3");
		
		$("#btn_n3f").on('click', function() {
			$("#N13F").hide()
		 	$("#N3F").show();
			$("#seat_title").html("N3F");
			
		});
		
		$("#btn_n13f").on('click', function() {
			$("#N3F").hide()
			$("#N13F").show();	 
			$("#seat_title").html("N13F");
		});
		
		
		
		$(".seat").on('click', function() {
			 var url = window.opener.document.URL.split('/');
			 var type = url[url.length-1];
			 
			 switch (type) {
			case 'home':
				
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
					</div>
					
				</div>
			</div>
			
	</section>
	
</body>
</html>