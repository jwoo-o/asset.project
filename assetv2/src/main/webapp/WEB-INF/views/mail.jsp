<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GIOSIS MANAGER</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="css/jquery.tagit.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    	.input-col{
    		width: 250px;
    	}
    </style>

  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="/js/common.js" type="text/javascript"></script>
  	<script src="/js/jquery-ui-1.11.4.js" type="text/javascript"></script>
  	<script src="/js/tag-it.js" type="text/javascript"></script>
    <script src="/js/jquery.form.js" type="text/javascript"></script>
    <script src="js/jquery.session.js" type="text/javascript"></script>
    <script src="js/jquery.serializeObject.js" type="text/javascript"></script>
    <script type="text/javascript">
    
    	var calendar_list;
    	var isRun = false;
		$(function(){
			
			var $issuer_tr = $("#issuer_tr").tagit({
				readOnly:true
			});
			var emp_data = [];
			var data = { "mgr" : '',"division" : ''};
        	var dataStr = JSON.stringify(data);
			$.ajax({
                method: 'POST',
                url: "/emp/mgrSearch/proc",
                dataType: "json",
                data:dataStr,
              	contentType:"application/json; charset=UTF-8"
	         }).done(function(data) {
	        	$.each(data, function(i, elt) {
	        	 emp_data.push({"label":elt.name,"value":elt.email});
	        	})
	        	
	         })
	         
			          // 라디오버튼 클릭시 이벤트 발생
		    $("input:radio[name=task_type]").click(function(){
		 		$("#content").val("");
		 		$("#ccTags").tagit("removeAll")
				$("#issuer_tr").tagit("removeAll")
				$("#toTags").tagit("removeAll");
		        if($("input[name=task_type]:checked").val() == "GA"){
		           
		        	$("#type option").remove();
		        	
		        	var tag = '<option value=""></option>'
		        	+'<option value="ip">IP/VOIP 발급</option>'
		        	+'<option value="emp_ctf">명함/사원증 수령</option>'
		        	+'<option value="delivery">택배 수령</option>';
		        	$("#type").html(tag);
		        	$(".ga").show();
		        	$(".hr").hide();
		        	
		        	
		        	
		        }else if($("input[name=task_type]:checked").val() == "HR"){
		        	
					$("#type option").remove();
					$("#issuer_tr").hide();
		        	var tag = '<option value=""></option>'
		        	+'<option value="pass">최종합격 안내</option>'
		        	+'<option value="document">입사자 제출 서류 안내</option>';
		        	$("#type").html(tag);
		        	$(".ga").hide();
		        	
		        }
		    });
			
			$("#btnPlus").on('click',function() {
			 
				$("#uploadTable tbody").append('<tr height="22"><td align="left"><input type="file" size="30" name="file"><input type="button" class="btnMinus" value="-"></td></tr>');
				
				$(".btnMinus").on('click', function() {
					 
					$(this).parent().parent().remove();
				})
			})
			$("#toTags").tagit({
				
				allowSpaces: true,
				tagSource: emp_data,
				showAutocompleteOnFocus: true,
				autocomplete: {
					delay: 0,
					minLength: 1,
					autoFocus: true,
					source: emp_data,
					focus: function(event, ui){
						return false;
					}
				},
				beforeTagAdded: function(event, ui) {
			        // do something special			        
			    return $.isValidateEmail(ui.tagLabel);			        
			    }
			})
			$("#ccTags").tagit({
				
				allowSpaces: true,
				availableTags: emp_data,
				tagSource: emp_data,
				showAutocompleteOnFocus: true,
				autocomplete: {
					delay: 0,
					minLength: 1,
					autoFocus: true,
					source: emp_data,
					focus: function(event, ui){
						return false;
					}
				},
				beforeTagAdded: function(event, ui) {
			        // do something special			        
			    return $.isValidateEmail(ui.tagLabel);			        
			    }
			})
			
			
			
			$("#sendBtn").click(function() {
				if($.frmchk()){
					
					if(isRun == true){
            			return;
            		}
            		isRun = true;
					var to = $("#toTags").tagit("assignedTags");
					var cc = $("#ccTags").tagit("assignedTags");
					var data = {};
					data.type=$("#type").val();
					data.to = to;
					data.cc = cc;
					data.content = $("#content").val().replace(/(?:\r\n|\r|\n)/g, '<br/>').replace(/(?:\t)/g, '&nbsp;&nbsp;&nbsp;');
					data.subject = $("#subject").val();
					
					if($("#type").val()=="ip"){
						
						data.list = calendar_list;						
					}
					else if($("#type").val()=="pass"){
						data.entry_date = $("#entry_date").val();
						data.entry_time = $("input[name=entry_time]:checked").val();
						
					}
					var dataStr = JSON.stringify(data);
					$.ajax({
						url:"/mail/send/proc",
						contentType:"application/json; charset=UTF-8",
						dataType:"json",
						method:"post",
						data:dataStr
					}).done(function(d) {
					 
						isRun = false;
						if(d.msg=="0001"){
							alert("Request Success");
							
						}else{
							alert(d.msg);
						}
					})
					
				}
			})
			$("#type").on("change",function() {
				var content ="안녕하세요 경영지원실입니다.\n\n";
				$("#ccTags").tagit("removeAll")
				$("#issuer_tr").tagit("removeAll")
				$("#toTags").tagit("removeAll");
				$("#content").val("");
				switch ($(this).val()) {
				case "ip":
					content +='신규입사자 관련으로 IP/VOIP 할당 요청드립니다.\n'
					+'각 부서 관리자께 설정 URL과 함께 안내 부탁드립니다.\n\n\n';
					$("#content").val(content);
					$("#issuer_tr").show();
					$("#content").val()
					$.ajax({
						url:"/calendar/ipConfirm/proc",
						contentType:"application/json; charset=UTF-8",
						dataType:"json",
						method:"post"			
					}).done(function(data) {
						calendar_list = data.list;
						 $.each(data.list, function(i, elt) {
							 var fstRgt;
							 var mgr;
							 var mgr_email;
							 for(var i=0;i<emp_data.length;i++){
								 for(key in emp_data[i]){
									 if(emp_data[i][key].indexOf(elt.fstRgtWkrNm)!=-1){
										 fstRgt = emp_data[i]; 
									 }
								 }
							 }
							 $issuer_tr.tagit("createTag", elt.name,elt.name)
							 mgr = elt.mgr.split(",");
							 mgr_email = elt.mgr_email.split(",");
							 for(var i=0;i<mgr.length;i++){
								 $("#ccTags").tagit("createTag", mgr[i],mgr_email[i]); 
							 }
							 //$("#ccTags").tagit("createTag", elt.mgr,elt.mgr_email);
							 $("#ccTags").tagit("createTag", fstRgt.label,fstRgt.value);
						 })
						 $issuer_tr.tagit({
							 tagLimit:data.list.length,
							 fieldName: data.list,
							 readOnly:true
						 })
						$("#subject").val("신규 입사자 IP/VOIP 할당 요청");
					
					});
					
					break;
				case "emp_ctf":
					$("#issuer_tr").hide();
					content +='명함 제작 및 사원증 제작 완료되어' 
						+' 안내드리오니,\n 경영지원실에서 수령하시면 되겠습니다.\n\n'
						+'보안 이슈로 인해 사원증의 경우 '
						+'분실 시 \n“분실 사유서 제출” 및 <font color="red">“재발급 비용 1만원”</font>이\n 부과되오니 관리를 철저히 해주시기 바랍니다.';
					$("#content").val(content);
					$("#subject").val("명함 및 사원증 수령 안내");
					break;
				case "delivery":
					$("#issuer_tr").hide();
					content +='문서수발실에서 택배를 전달받아\n3층 메일룸에 보관되어있으니, 수령하시면 되겠습니다.';
					$("#content").val(content);
					$("#subject").val("택배 수령 안내");
					break;
				case "pass":
					$(".hr").show();
					$("#hr_pass").show();
					$("#entry_date").datepicker("setDate",'today');
					$(".hr").insertAfter($("#email_tbody tr:last-child"));
					content ='Qoo10 경영지원실 입니다.\n'
						+'최종합격을 진심으로 축하드립니다.\n\n'
						+'입사일정을 아래와 같이 안내드리오니 확인 부탁드리며,\n'
						+'해당일에 출근해주시기를 바랍니다.';
					$("#content").val(content);
					$("#subject").val("[Qoo10]합격 안내");
					break;
				case "document":
					$(".hr").show();
					$("#hr_pass").hide();
					$("#entry_date").val("");
					$(".hr").insertAfter($("#email_tbody tr:first-child"));
					$("#subject").val("[경영지원실] 입사자 제출 서류 안내");
					content +='입사을 진심으로 축하드립니다.\n\n'
							+'첨부파일 확인하시고, ';
						
						$("#entry_date").on("change", function() {
						 
							content += '하기 서류를\n'+$(this).val()+' 까지 제출하여 주시기 바랍니다.\n\n'
							+'\t1. 명함 신청서(Biz Card)\n'
							+'\t2. Glosis Introduction\n'
							+'\t3. 사진파일(jpg파일)\n'
							+'\t4. 신상명세서\n'
							+'\t5. <font color="red">영업비밀보호서약서 – 출력본으로 제출. 자필서명 필수</font>\n\n'
							+'5번에 해당하는 영엉비밀보호서약서는 출력하여\n'
							+'3층 경영지원실로 제출바라며,\n'
							+'1(QR코드 포함),3,4번의 서류들은\n이메일로 제출하여 주시기 바랍니다.';
							
							$("#content").val(content);
						})
					break;
				default:
					$("#issuer_tr").hide();
					$("#subject").val("");
					$("#content").val("");
					break;
				}
			})
			
			 $("#previewBtn").click(function() {
				var x = 800;
				var y = 900;
				if($("#type").val()=="delivery"){
					y = 619;
				}else if($("#type").val()=="emp_ctf"){
					y = 715;
				}
				var url = "/mail/preview"
				var title = "preview"
							
				popup(url,title,x,y)
			})
			
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
			
			$("#entry_date").datepicker().datepicker("setDate",'today');
			 
			$.frmchk = function() {
				if($("#toTags").find("span").html()==undefined){
					alert("Create without blank space");
					$(frm[i]).find("input").focus();
					return false;
					}
			return true;
			}
			$.isValidateEmail = function(mail){
				var expression = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				if (expression.test(mail)) {
					return true;
				} else {
					return false;
				}
			}
				
		})
		
		
	</script>
</head>
<body>
	<div class="content-wrapper2" style="width: 500px">
		
		   <!-- Main content -->
	       <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong>Mail Send</strong></h3>
		                </div><!-- /.box-header -->
		                
						<div class="box-body">
							
							  <div id="writeDiv">
										<form id="empForm">
										<input type="hidden" id="subject">
										<table class="table table-bordered text-sm" style="table-layout: fixed;" id="inputTable">
										<thead>
										<tr height="22">
											<td class="tdBack" align="left" width="17%"><strong class="list_title">GA/HR</strong></td>
											<td align="left">
												<label class="radio-inline">
	  												<input type="radio" name="task_type" value="GA" checked="checked"> GA
												</label>
												<label class="radio-inline">
	  												<input type="radio" name="task_type" value="HR"> HR
												</label>
											</td>
										</tr>
										</thead>
										<tbody id="email_tbody">								
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">종류</strong></td>
											<td align="left"><div style="width: 130px;">
												<select class="form-control input-sm col-xs-3" id="type" name="type">
										    		<option value=""></option>								       		
										    		<option value="ip">IP/VOIP 발급</option>				       						       		
										    		<option value="emp_ctf">명함/사원증 수령</option>		
										    		<option value="delivery">택배 수령</option>								       		
									        	</select>
									        	</div>
											</td>
										</tr>
										<tr height="22" id="issuer_tr" style="display: none;">
											<td class="tdBack" align="left" ><strong class="list_title">대상자</strong></td>
											<td align="left"><div class="input-col"><ul id="issuerTags"></ul></div>
											</td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">수신자</strong></td>
						            		<td align="left" width="80"><div class="input-col"><ul id="toTags" class="auto"></ul></div>	
									        </td>
										</tr>
										
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">참조</strong></td>
						            		<td align="left" width="80"><div class="input-col"><ul id="ccTags" class="auto"></ul></div>
									        </td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">내용</strong></td>
						            		<td align="left" width="80"><div class="input-col"><textarea id="content" rows="5" class="form-control"></textarea><div align="left"><input type="button" class="btn bg-navy btn-sm" id="previewBtn" value="Preview"></div></div>
									        </td>
										</tr>
										<tr height="22" class="hr" style="display: none;">
											<td class="tdBack" align="left"><strong class="list_title">일시</strong></td>
						            		<td align="left" width="80"><div style="width: 100px;">
						            			<input type="text" class="form-control input-sm col-xs-3" id="entry_date" name="entry_date" style="margin-right: 10px;">
						            			</div>
						            			<div id="hr_pass">
							            			<label class="radio-inline input-sm">
		  												<input type="radio" name="entry_time" value="09:30" checked="checked"> 09:30
													</label>
													<label class="radio-inline input-sm col-xs-3">
		  												<input type="radio" name="entry_time" value="09:00"> 09:00
													</label>
												</div>
									        </td>
										</tr>									
										</tbody>
										</table>
										</form>
										<form id="uploadForm">
										<table class="table table-bordered text-sm" style="table-layout: fixed;" id="uploadTable">
										<tbody>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">첨부파일</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn bg-navy btn-sm" id="btnPlus" value="+"></td>
										</tr>
										</table>
										</form>
								
									<br>
									
									<div align="right">
										<button class="btn bg-navy btn-sm" id="sendBtn">Send</button>									
									</div><br>
							    </div>
								
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	
</body>
</html>