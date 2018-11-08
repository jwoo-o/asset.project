<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
	<title>GIOSIS MANAGER</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style type="text/css">
    	.pmsg{
    		
    		color: red;
    	}
    </style>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script src="/js/functionutils.js" type="text/javascript"></script>
  	<script src="/js/common.js" type="text/javascript"></script>
    <script src="/js/jquery.form.js" type="text/javascript"></script>
    <script src="js/jquery.session.js" type="text/javascript"></script>
    <script src="js/jquery.serializeObject.js" type="text/javascript"></script>
    <script src="/js/password.js" type="text/javascript"></script>
   
    </head>
    <body>
    <div class="content-wrapper2" style="width: 300px">
		
		   <!-- Main content -->
	       <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
					
						<div class="box-header with-border">
		                  <h3 class="box-title"><strong>Password Change</strong></h3>
		             
		                </div><!-- /.box-header -->
		                
						<div class="box-body">
						      <div id="alert-message-center"></div>
							  <div id="writeDiv">
										<form name="passForm" id="passForm">
										<input type="hidden" id="mId" value="${mgr.mId }">
										<table class="table table-bordered text-sm" style="table-layout: fixed;" id="resultTable">
										<tbody>
										<tr height="22">
											<td class="tdBack" align="left" width="40%"><strong class="list_title">이전 비밀번호</strong></td>
											<td align="left" id="t1">&nbsp;&nbsp;<input type="password" size="12" name="pwd" id="pwd" maxlength="12"></td>
										</tr>
										<tr height="22">
											<td class="tdBack" align="left" ><strong class="list_title">새 비밀번호</strong></td>
											<td align="left" id="t2">&nbsp;&nbsp;<input type="password" size="12" name="newPwd" id="newPwd" maxlength="12"></td>
										</tr>
										<tr id="tr1" style="display: none;">
											<td  align="right" colspan="2"><span class='pmsg'>8~12자 사이로 입력하세요&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
								             
								        </tr>
										<tr height="22">
											<td class="tdBack" align="left"><strong class="list_title">비밀번호 확인</strong></td>
								             <td align="left" id="t3">&nbsp;&nbsp;<input type="password" size="12" name="reNewPwd" id="reNewPwd" maxlength="12"></td>
								        </tr>
								        <tr id="tr2" style="display: none;">
											<td  align="right" colspan="2">&nbsp;&nbsp;<span class='pmsg'>비밀번호가 일치하지 않습니다.</span></td>
								             
								        </tr>
										</tbody>
										</table>
										</form>
									
								
									
									<div align="right">
										<button class="btn bg-navy btn-sm" id="reviseBt" name="reviseBt">Revise</button>&nbsp;
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
   