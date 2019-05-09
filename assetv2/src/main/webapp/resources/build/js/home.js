/**
 * home.jsp 스크립트 파일
 */
		$(function(){
			
			var s = 'assetNo';
			var k = 'asc';
			$.years();
			
			
			$.datepicker.setDefaults({
				dateFormat:'yy-mm-dd'
				,showButtonPanel: true
				,changeYear: true //콤보박스에서 년 선택 가능
	            ,changeMonth: true //콤보박스에서 월 선택 가능          
				,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			})
			
			$("#datepicker").datepicker();
			$("#datepicker1").datepicker();
			
			
			$("#setCommon").click(function() {
				 var x = 1000;
				    var y = 900;
				    var url = '/common';
				    var title = 'Common Register';
				    
				    popup(url,title,x,y);
			})
			$("#seatSearch").click(function() {
				 var x = 2000;
			 	 var y = 1000;
				 var url = '/seat';
				 var title = 'Seat Search';
				    
				    popup(url,title,x,y);
			})
			
			$("#requestBt").click(function(){
				
				var x = 600;
				var y = 825;
				var url = '/register';
				var title = 'Asset Register';
				
				popup(url, title, x, y);
			})
			$("#calendar").click(function() {
			    var x = 1000;
			    var y = 900;
			    var url = '/calendar';
			    var title = 'Planned to join';
			    
			    popup(url,title,x,y);
			})
			
			
			$("#empSearch").click(function() {
				var x = 1000;
				var y = 900;
				var title='Employee Search';
				var url = '/emp';
				
				popup(url, title, x, y);
			})
			$("#assetChart").click(function() {
				
				var x = 800;
				var y = 800;
				var title='Chart Search';
				var url = '/chart';
				
				popup(url, title, x, y);
				
			})
			
			
			$("#myPage").click(function() {
				var x = 300;
				var y = 360;
				var title='Password Change';
				var url = '/password';
				
				popup(url, title, x, y);
			})
			$("#mail").click(function() {
				var x = 500;
				var y = 670;
				var url = '/mail';
				var title = 'Mail Send';
				
				popup(url, title, x, y);
			})
			
			$("input[type='text']").keypress(function(e){
    			if (e.which == 13) {
    				$.ajx(s,k);
    			}
    		});
			
			
			$("#searchBt").click(function() {
				
				$.ajx(s,k);
				
			})
			
			var tds = $("thead tr td");
			$(tds).click(function() {
				if(k=="asc")
					k = "desc";
				else if(k=="desc")
					k = "asc"
					
				if($("#view").find("tr").length>1){
					s = $(this).attr("data-value");
					$.ajx(s,k);
				}
			})
			$("#download").click(function() {
				var len = $("#view").find("tr").find("td").length;
				if(len>1){
					
					$("#sort").val(s);
					$("#key").val(k);
					$("#asset_search").serialize();
					$("#asset_search").attr("action", "/excelDownload");
					$("#asset_search").attr("method","post");
					$("#asset_search").submit();
					
					
				}
			})
	
			$.ajx = function(sort,key){
				
				$("#sort").val(sort);
				$("#key").val(key);
				var data = $("#asset_search").serializeObject(),dataStr = JSON.stringify(data);
				
				$.ajax({
					url:"/list/proc",
					method: "post",
					dataType: "json",
					data : dataStr,
					contentType:"application/json; charset=UTF-8"
				}).done(function(data) {
					
					if(data.msg == "0001"){
						
						var list = data.list;
						$("#view").empty();
						if(list.length>0){
							var tag = "";
							$.each(list, function(i, elt) {
								tag += "<tr>";
								$.each(elt, function(key, val) {
									if(key=="aNo"){
										tag +="<td align='center' style='display: none;'>"+val+"</td>";
									}else{
										tag +="<td align='center'>"+val+"</td>";
									}
								})
								tag += "</tr>";
								/*$(tr).click(function() {
									var tds = $(this).find("td");
									
									var url = '/detail?aNo='+$(tds[0]).html();
									var x = 600;
									var y = 860;
									var title = 'Asset Modify';
									
									popup(url, title, x, y);
								})*/
							})
							$("#view").append(tag);
							$("#view").find("tr").click(function() {
									var tds = $(this).find("td");
									var url = '/detail?aNo='+$(tds[0]).html();
									var x = 600;
									var y = 860;
									var title = 'Asset Modify';
									
									popup(url, title, x, y);
							})
						}else{
							$("#view").append("<tr height='18'><td align='center' width='70' colspan='10'>NO DATA</td></tr>")
						}	
						
					}else{
						alert(data.msg);
					}
				}).fail(function(e) {
					if(e.status==401)
						location.href="/"
				})	
			}
			

		})
		
		$.years = function(){
			var date = new Date();
			var year = date.getFullYear();
			$("#re_time").append("<option value=''>년도</option>");
			for(var y=year;y<=(year+10);y++){
				$("#re_time").append("<option value='"+y+"'>"+y+"년"+"</option>");
			}
			
		}