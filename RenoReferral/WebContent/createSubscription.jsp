
<jsp:include page="sidebar.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Home:Lead Registration</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="css/bootstrap.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="css/paper-dashboard.css" rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="css/demo.css" rel="stylesheet" />


<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="css/themify-icons.css" rel="stylesheet">

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<!--  <link href="css/imageuploadify.min.css" rel="stylesheet"> -->

<style type="text/css">
.error {
	color: red
}
</style>

</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-minimize">
						<button id="minimizeSidebar" class="btn btn-fill btn-icon"
							style="padding: 10px !important;">
							<i class="ti-more-alt"></i>
						</button>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>

						<a class="navbar-brand" href="#validationforms">Admin</a>
					</div>
				</div>
				</nav>

				<div class="content">

					<div class="container-fluid">
						<div class="row">

							<div class=" col-md-12">
								<div class="card">

									<div>
										<h3 align="center" style="color: green">${msg}</h3>
									</div>

									<form class="" id="CreateSubscription"
										action="CreateSubscription" method="post"
										enctype="multipart/form-data"
										onsubmit="return validateLimits()">
										<%-- <div on class="card-header">
	                                <center>
										<h3 class="card-title">
										<strong>
											Create Subscription
											</strong>
										</h3>
										<hr>
										</center>
									</div> --%>

										<div class="card-header">
											<h4 class="card-title">Create Subscription</h4>
										</div>


										<div class="card-content">
											<%-- <div><h3 align="center" style="color:green">${SuccessMessage}</h3></div> 
	                                 
	                                <div><h3 align="center" style="color:red">${ErrorMessage}</h3></div>  
	                                  --%>

											<fieldset>
												<div class="column-sizing">
													<div class="col-sm-12">
														<div class="row">

															<div class="col-sm-12"
																style="margin-bottom: 15px !important;">
																<div class="form-group">
																	<div class="col-md-2 ">
																		<label class="control-label"> Subscription
																			Name <star>*</star>
																		</label>
																	</div>
																	<div class="col-md-10">
																		<input class="form-control" id="subscriptionName"
																			name="subscriptionName" type="text" required="true"
																			autocomplete="off" maxlength="30" />
																	</div>
																</div>
															</div>

															<div class="col-md-12"
																style="margin-bottom: 15px !important;">

																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label">Reno Referal
																				Leads<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<select class="form-control selectpicker"
																				id="RenoLeads" name="RenoLeads" type="text"
																				required="true" autocomplete="off" list="oRenoLeads"
																				maxlength="15">

																				<option value="Allowed">Allowed</option>
																				<option value="Not Allowed">Not Allowed</option>
																				<option value="Assign By Admin">Assign By
																					Admin</option>
																				<option value="Unlimited">Unlimited</option>
																			</select>
																		</div>
																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;"> Set
																				Limit </label>
																		</div>
																		<div class="col-md-8">
																			<input class="form-control" id="renoLeadLimit"
																				name="renoLeadLimit" type="text" value="0"
																				maxlength="4" number="true" autocomplete="off" />
																			<div id="rlError" class="error"></div>
																		</div>
																	</div>
																</div>
															</div>




															<!--    <div class="col-md-12">
	                                   
	                                  <div class="form-group">
	                                        <label class="control-label">
											Subscription Name <star>*</star>
											</label>
	                                        <input class="form-control"
	                                               id="subscriptionName"
	                                               name="subscriptionName"
	                                               type="text"
	                                               required="true"
	                                             autocomplete="off"
											/>
											 </div>
	                                  </div>
	                                
	                                 
	                                 
	                               <div class="col-md-6 form-group">
	                                        <label class="control-label">
												Reno Referal Leads<star>*</star>
											</label>
	                                        <select  class="form-control selectpicker"  
	                                               id="RenoLeads"
	                                               name="RenoLeads"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                               list="oRenoLeads"
	                                           >
	                                     
	                                        <option value="Allowed">Allowed</option>
	                                        <option value="Not Allowed">Not Allowed</option>
	                                         
	                                          </select>       
	                                        
	                                    </div> 
	                                    
	                                    
	                                
	                                                    
	                                                
	                                
	                                    <div class="col-md-6 form-group column-sizing">
	                                        <label class="control-label">
											Set Limit<star>*</star>
											</label>
	                                        <input class="form-control"
	                                               id="renoLeadLimit"
	                                               name="renoLeadLimit"
	                                               type="text"
	                                               required="true"
	                                             autocomplete="off"
											/>
											 </div> -->





															<div class="col-md-12"
																style="margin-bottom: 15px !important;">

																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;">
																				Purchase Lead<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<select class="form-control selectpicker"
																				id="purchaseLeads" name="purchaseLeads" type="text"
																				required="true" autocomplete="off" maxlength="15">
																				<option value="Allowed">Allowed</option>
																				<option value="Not Allowed">Not Allowed</option>
																				<option value="Unlimited">Unlimited</option>
																			</select>
																		</div>
																	</div>
																</div>


																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;"> Set
																				Limit </label>
																		</div>
																		<div class="col-md-8">
																			<input class="form-control" id="purchaseLeadLimit"
																				name="purchaseLeadLimit" type="text" value="0"
																				autocomplete="off" maxlength="4" number="true" />
																			<div id="plError" class="error"></div>
																		</div>


																	</div>
																</div>
															</div>

															<div class="col-md-12"
																style="margin-bottom: 15px !important;">

																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;"> Create
																				Leads:<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<select class="form-control selectpicker"
																				id="createLeads" name="createLeads" type="text"
																				required="true" autocomplete="off"
																				list="oCreateLeads" maxlength="15">

																				<option value="Allowed">Allowed</option>
																				<option value="Not Allowed">Not Allowed</option>
																				<option value="Unlimited">Unlimited</option>

																			</select>
																		</div>
																	</div>
																</div>


																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;"> Set
																				Limit </label>
																		</div>
																		<div class="col-md-8">
																			<input class="form-control" id="createLeadLimit"
																				name="createLeadLimit" type="text" value="0"
																				maxlength="4" number="true" autocomplete="off" />
																			<div id="clError" class="error"></div>
																		</div>
																	</div>
																</div>

															</div>


															<div class="col-md-12"
																style="margin-bottom: 15px !important;">

																<div class="col-md-6">
																	<div class=" form-group ">
																		<div class="col-md-4">
																			<label class="control-label"> Create
																				Employees<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<select class="form-control selectpicker"
																				id="createEmployees" name="createEmployees"
																				type="text" required="true" autocomplete="off"
																				list="oCreateEmployees" maxlength="15">
																				<option value="Allowed">Allowed</option>
																				<option value="Not Allowed">Not Allowed</option>
																				<option value="Unlimited">Unlimited</option>

																			</select>
																		</div>
																	</div>
																</div>


																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;"> Set
																				Limit </label>
																		</div>
																		<div class="col-md-8">
																			<input class="form-control" id="createEmployeeLimit"
																				name="createEmployeeLimit" type="text" value="0"
																				maxlength="4" number="true" autocomplete="off"
																				maxlength="15" />
																			<div id="ceError" class="error"></div>
																		</div>
																	</div>
																</div>

															</div>



															<div class="col-md-12"
																style="margin-bottom: 15px !important;">

																<div class="col-md-6">
																	<div class=" form-group">
																		<div class="col-md-4">
																			<label class="control-label"> Create
																				Sub-Contractors<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<select class="form-control selectpicker"
																				id="createSubContractor" name="createSubContractor"
																				type="text" required="true" autocomplete="off"
																				list="oCreateSubContractor" maxlength="15">

																				<option value="Allowed">Allowed</option>
																				<option value="Not Allowed">Not Allowed</option>
																				<option value="Unlimited">Unlimited</option>

																			</select>
																		</div>
																	</div>
																</div>


																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;"> Set
																				Limit </label>
																		</div>
																		<div class="col-md-8">
																			<input class="form-control" id="createSubConLimit"
																				name="createSubConLimit" type="text" value="0"
																				maxlength="4" number="true" autocomplete="off" />
																			<div id="scError" class="error"></div>
																		</div>
																	</div>
																</div>

															</div>




															<!--       
	                                     <div class="form-group">
	                                        <label class="control-label">
											Lead Management<star>*</star>
											</label>
	                                        <input  class="form-control"  
	                                               id="leadManagement"
	                                               name="leadManagement"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                                list="oLeadManagement"
	                                           >
	                                      <datalist id="oLeadManagement">
	                                       <option value="Allowed">Allowed</option>
	                                        <option value="Not Allowed">Not Allowed</option>    
	                                         <option  value="Only When Working On Lead">Only When Working On Lead</option>    
	                                           </datalist>    
	                                    </div> -->


															<div class="col-md-12"
																style="margin-bottom: 15px !important;">

																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;"> Sign
																				Contract:<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<select class="form-control selectpicker"
																				id="signContact" name="signContact" type="text"
																				value="0" autocomplete="off" list="oSignContact"
																				maxlength="15">

																				<option value="Yes">Yes</option>
																				<option value="No" selected>No</option>

																			</select>
																		</div>
																	</div>
																</div>


																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;">
																				price(in Cents):<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<input class="form-control selectpicker" id="price"
																				name="price" type="text" required="true"
																				maxlength="7" number="true" autocomplete="off">

																			<!-- <datalist id="oPrice">
	                                       <option value="Free">Free</option>
	                                        <option value="Percentage Basis">Percentage Basis</option>    
	                                        
	                                        </datalist>   -->
																		</div>
																	</div>
																</div>

															</div>


															<div class="col-md-12"
																style="margin-bottom: 15px !important;">

																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"> Upload Contract
																				Doocument<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<input class="form-control selectpicker"
																				id="uploadContact" name="uploadContact" type="file"
																				required="true" autocomplete="off"
																				list="oUploadContact" disabled="disabled">
																		</div>
																	</div>
																</div>


																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4">
																			<label class="control-label"
																				style="margin-top: 8px !important;"> Select
																				Visibility:<star>*</star>
																			</label>
																		</div>
																		<div class="col-md-8">
																			<select class="form-control selectpicker"
																				id="visibility" name="visibility" type="text"
																				required="true" autocomplete="off">
																				<option value="Public">Public</option>
																				<option value="Private">Private</option>

																			</select>
																		</div>
																	</div>
																</div>

															</div>


															<div class="col-md-12"
																style="margin-bottom: 15px !important;">
																<div class="form-group">
																	<div class="col-md-1">
																		<label class="control-label"
																			style="margin-top: 25px !important;"> Note: </label>
																	</div>


																	<div class="col-md-11">
																		<textarea type="text"
																			class="form-control selectpicker" rows="3"
																			name="note" id="note" maxlength="250"></textarea>
																	</div>
																</div>
															</div>







														</div>
													</div>
												</div>

											</fieldset>

											<div class="col-sm-12">
												<center>
													<div class="category">
														<star>*</star>
														Required fields
													</div>
												</center>
											</div>
											<div class="card-footer">
												<center>
													<button type="submit" class="btn btn-info btn-fill"
														style="background-color: #de7e31; border-color: #de7e31;">Submit</button>
												</center>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>

		<footer class="footer">
		<div class="container-fluid">
			<div class="copyright pull-right">
				&copy;
				<script>document.write(new Date().getFullYear())</script>
				, made with <i class="fa fa-heart heart"></i> by <a href="#">RenoReferral</a>
			</div>
		</div>
		</footer>

	</div>
</body>

<!--   Core JS Files. Extra: TouchPunch for touch library inside jquery-ui.min.js   -->
<!-- <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/perfect-scrollbar.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script> -->

<!--  Forms Validations Plugin -->
<script src="js/jquery.validate.min.js"></script>

<!-- Promise Library for SweetAlert2 working on IE -->
<script src="js/es6-promise-auto.min.js"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="js/moment.min.js"></script>

<!--  Date Time Picker Plugin is included in this js file -->
<script src="js/bootstrap-datetimepicker.js"></script>

<!--  Select Picker Plugin -->
<script src="js/bootstrap-selectpicker.js"></script>

<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script src="js/bootstrap-switch-tags.js"></script>

<!-- Circle Percentage-chart -->
<script src="js/jquery.easypiechart.min.js"></script>

<!--  Charts Plugin -->
<script src="js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="js/bootstrap-notify.js"></script>

<!-- Sweet Alert 2 plugin -->
<script src="js/sweetalert2.js"></script>

<!-- Vector Map plugin -->
<script src="js/jquery-jvectormap.js"></script>


<!-- Wizard Plugin    -->
<script src="js/jquery.bootstrap.wizard.min.js"></script>

<!--  Bootstrap Table Plugin    -->
<script src="js/bootstrap-table.js"></script>

<!--  Plugin for DataTables.net  -->
<script src="js/jquery.datatables.js"></script>

<!--  Full Calendar Plugin    -->
<script src="js/fullcalendar.min.js"></script>

<!-- Paper Dashboard PRO Core javascript and methods for Demo purpose -->
<script src="js/paper-dashboard.js"></script>

<!-- Paper Dashboard PRO DEMO methods, don't include it in your project! -->
<script src="js/demo.js"></script>


<script type="text/javascript">
        $().ready(function(){
        	
			$('form').validate();
        });
        
        
        
        $("#RenoLeads").change(function() {
        	
        	renoleads=$('#RenoLeads option:selected').val();
        	
        	
        	if(renoleads=="Not Allowed"){
        		
        		$('#renoLeadLimit').val(0);
        		
        		$('#renoLeadLimit').attr('readonly','readonly');
        		
        			
               $('#purchaseLeadLimit').val(0);
        		 
        		 $('#purchaseLeadLimit').removeAttr('readonly');
        		 
        		 $("#purchaseLeads").empty();
         		 
         		 $('#purchaseLeads').append($('<option>', {
     			    value: 'Allowed',
     			    text: 'Allowed'
     			}));
          		
        		 $('#purchaseLeads').append($('<option>', {
        			    value: 'Not Allowed',
        			    text: 'Not Allowed'
        			}));
        		 
        		 $('#purchaseLeads').append($('<option>', {
     			    value: 'Unlimited',
     			    text: 'Unlimited'
     			}));
        		 
        		 $('#createLeadLimit').val(0);
        	 		
        		 $("#createLeadLimit").removeAttr('readonly');
        		 
        		 $("#createLeads").empty();
        		 
        		 $('#createLeads').append($('<option>', {
        			    value: 'Allowed',
        			    text: 'Allowed'
        			}));
           		
         		 $('#createLeads').append($('<option>', {
         			    value: 'Not Allowed',
         			    text: 'Not Allowed'
         			}));
         		 
         		 $('#createLeads').append($('<option>', {
        			    value: 'Unlimited',
        			    text: 'Unlimited'
        			}));
        		 
        		 $('.selectpicker').selectpicker('refresh');
        	}
        	
        	else if(renoleads=="Allowed"){
        		
	             $('#renoLeadLimit').val(0);
        		
        		$('#renoLeadLimit').removeAttr('readonly');
        		
        		  $('#purchaseLeadLimit').val(0);
         		 
         		 $('#purchaseLeadLimit').removeAttr('readonly');
         		 
         		 $("#purchaseLeads").empty();
          		 
          		 $('#purchaseLeads').append($('<option>', {
      			    value: 'Allowed',
      			    text: 'Allowed'
      			}));
           		
         		 $('#purchaseLeads').append($('<option>', {
         			    value: 'Not Allowed',
         			    text: 'Not Allowed'
         			}));
         		 
         		 $('#purchaseLeads').append($('<option>', {
      			    value: 'Unlimited',
      			    text: 'Unlimited'
      			}));
         		 
        		
        		$('#createLeadLimit').val(0);
         		
          		 $("#createLeadLimit").removeAttr('readonly');
          		 
          		 $("#createLeads").empty();
          		 
          		 $('#createLeads').append($('<option>', {
          			    value: 'Allowed',
          			    text: 'Allowed'
          			}));
             		
           		 $('#createLeads').append($('<option>', {
           			    value: 'Not Allowed',
           			    text: 'Not Allowed'
           			}));
           		 
           		 $('#createLeads').append($('<option>', {
          			    value: 'Unlimited',
          			    text: 'Unlimited'
          			}));
          		 
             		 
          		$('.selectpicker').selectpicker('refresh');
        		
        		
        		
        		
        		
                /* $('#renoLeadLimit').val(0);
        		
        		 $("#renoLeadLimit").removeAttr('readonly');
        		 
        		 $('#purchaseLeadLimit').val("0");
        		 
        		 $('#purchaseLeadLimit').attr('readonly','readonly');
        		 
        		 $("#purchaseLeads").empty();
        	  		
        		 $('#purchaseLeads').append($('<option>', {
        			    value: 'Not Allowed',
        			    text: 'Not Allowed'
        			}));
        		 
        		 $('.selectpicker').selectpicker('refresh'); */
           		 
        		 
    	}else if(renoleads=="Unlimited"){
    		
    	 $('#renoLeadLimit').val("0");
    		
   		 $("#renoLeadLimit").attr('readonly','readonly');
   		 
   		 $('#purchaseLeadLimit').val("0");
   		 
   		 $('#purchaseLeadLimit').attr('readonly','readonly');
   		
   		 
   		 $("#purchaseLeads").empty();
  		
		 $('#purchaseLeads').append($('<option>', {
			    value: 'Not Allowed',
			    text: 'Not Allowed'
			}));
		 
		 
		 $('#createLeadLimit').val(0);
 		
		 $("#createLeadLimit").removeAttr('readonly');
		 
		 $("#createLeads").empty();
		 
		 $('#createLeads').append($('<option>', {
			    value: 'Allowed',
			    text: 'Allowed'
			}));
   		
 		 $('#createLeads').append($('<option>', {
 			    value: 'Not Allowed',
 			    text: 'Not Allowed'
 			}));
 		 
 		 $('#createLeads').append($('<option>', {
			    value: 'Unlimited',
			    text: 'Unlimited'
			}));
		 
		 
		 $('.selectpicker').selectpicker('refresh');
   		 
   		 
   		 
   		 
    	}else if(renoleads=="Assign By Admin"){
    		
       	 $('#renoLeadLimit').val("0");
       		
      		 $("#renoLeadLimit").attr('readonly','readonly');
      		 
      		 $('#purchaseLeadLimit').val("0");
      		 
      		 $('#purchaseLeadLimit').attr('readonly','readonly');
      		
      		  $("#purchaseLeads").empty();
      		  
      		  
      		  
     		
   		 $('#purchaseLeads').append($('<option>', {
   			    value: 'Not Allowed',
   			    text: 'Not Allowed'
   			}));
   		 
   		 $("#createLeads").empty();
   		 
   		 $('#createLeads').append($('<option>', {
			    value: 'Not Allowed',
			    text: 'Not Allowed'
			}));
      		 
      	
   		$('#createLeadLimit').val(0);
		
		$('#createLeadLimit').attr('readonly','readonly');
   		 
		$('.selectpicker').selectpicker('refresh');
   		
		
       	}
        	
        });
        
        
          
      $("#createLeads").change(function() {
        	
    	  createLeads=$('#createLeads option:selected').val();
        	
        	
        	if(createLeads=="Not Allowed"){
        		
        		$('#createLeadLimit').val(0);
        		
        		$('#createLeadLimit').attr('readonly','readonly');
        		
        	}
        	
        	else if(createLeads=="Allowed"){
        		
                $('#createLeadLimit').val(0);
        		
        		 $("#createLeadLimit").removeAttr('readonly');
        		 
        	}else if(createLeads=="Unlimited"){
        		
                $('#createLeadLimit').val("0");
        		
        		$('#createLeadLimit').attr('readonly','readonly');
        	}
         });
        
 
                            
      
      
      
      
      
      
      $("#createEmployees").change(function() {
      	
    	  createEmployees=$('#createEmployees option:selected').val();
        	
        	
        	if(createEmployees=="Not Allowed"){
        		
        		$('#createEmployeeLimit').val(0);
        		
        		$('#createEmployeeLimit').attr('readonly','readonly');
        		
        	}
        	
        	else if(createEmployees=="Allowed"){
        		
                $('#createEmployeeLimit').val(0);
        		
        		 $("#createEmployeeLimit").removeAttr('readonly');
        		 
        	}else if(createEmployees=="Unlimited"){
        		
                $('#createEmployeeLimit').val("0");
        		
                $('#createEmployeeLimit').attr('readonly','readonly');
        	}
         });
 
 
       
 
      $("#createSubContractor").change(function() {
      	
    	  createSubContractor=$('#createSubContractor option:selected').val();
        	
        	
        	if(createSubContractor=="Not Allowed"){
        		
        		$('#createSubConLimit').val(0);
        		
        		$('#createSubConLimit').attr('readonly','readonly');
        		
        	}
        	
        	else if(createSubContractor=="Allowed"){
        		
                $('#createSubConLimit').val(0);
        		
        		 $("#createSubConLimit").removeAttr('readonly');
        		 
        	}else if(createSubContractor=="Unlimited"){
        		
				$('#createSubConLimit').val("0");
        		
        		$('#createSubConLimit').attr('readonly','readonly');
        	}
         });
 
      
      
      
      
        
        $("#signContact").change(function() {
        	
        	$signContact=$('#signContact option:selected').val();
        	  
        	
        	 if($signContact==="No"){
         		
         		
         		
         		$('#uploadContact').attr('disabled','disabled');
         		
         		
         	}
         	
             else{
     		
     		
     		
             $("#uploadContact").removeAttr('disabled');
     		
     		
     	} 
        	
        	
        	
        });
        
      $("#purchaseLeads").change(function() {
        	
    	 
    	 purchaseLeads=$('#purchaseLeads option:selected').val();
     	
    	   if(purchaseLeads=="Not Allowed"){
     		
     		$('#purchaseLeadLimit').val(0);
     		
     		$('#purchaseLeadLimit').attr('readonly','readonly');
     		
     			
            $('#renoLeadLimit').val(0);
     		 
     		 $('#renoLeadLimit').removeAttr('readonly');
     		 
     		 $("#RenoLeads").empty();
     		 
     		 $('#RenoLeads').append($('<option>', {
 			    value: 'Allowed',
 			    text: 'Allowed'
 			}));
      		
    		 $('#RenoLeads').append($('<option>', {
    			    value: 'Not Allowed',
    			    text: 'Not Allowed'
    			}));
    		 
    		 $('#RenoLeads').append($('<option>', {
 			    value: 'Unlimited',
 			    text: 'Unlimited'
 			}));
    		 
    		  
    		 
    		 
    		 $('.selectpicker').selectpicker('refresh');
     	}
     	
     	else if(purchaseLeads=="Allowed"){
     		
             $('#purchaseLeadLimit').val(0);
     		
     		 $("#purchaseLeadLimit").removeAttr('readonly');
     		 
     		 $('#renoLeadLimit').val("0");
     		 
     		 $('#renoLeadLimit').attr('readonly','readonly');
     		 
     		 $("#RenoLeads").empty();
     		
    		 $('#RenoLeads').append($('<option>', {
    			    value: 'Not Allowed',
    			    text: 'Not Allowed'
    			}));
    		 
    		 $('.selectpicker').selectpicker('refresh');
     		 
     		 
 	      }else  if(purchaseLeads=="Unlimited"){
     		
			$('#purchaseLeadLimit').val("0");
     		
     		$('#purchaseLeadLimit').attr('readonly','readonly');
     		
     		$('#renoLeadLimit').val(0);
    		
    		$('#renoLeadLimit').attr('readonly','readonly');
    		
    		 $("#RenoLeads").empty();
    		
    		 $('#RenoLeads').append($('<option>', {
    			    value: 'Not Allowed',
    			    text: 'Not Allowed'
    			}));
    		 
    		 $('.selectpicker').selectpicker('refresh');
    	}
      });
      
      
          	
    	
    
        
        
     /*  $("#renoDrop li a").click(function(){
    	  var selText = $(this).text();
    	 $("#RenoLeads").val(selText);
    	});
         */
        
        
    </script>

<script type="text/javascript">
           /*  $(document).ready(function() {
                $('input[type="file"]').imageuploadify();
            }) */
            
            function  validateLimits(){
            	
        	
        	 
            	
            	if($("#RenoLeads option:selected").val()=="Allowed"){
        		
        		if(parseInt($("#renoLeadLimit").val())<=0){
        			
        			$("#rlError").text("Please Enter Some limit");
        			
        			return false;
        			
        		}else{
        			
        			$("#rlError").empty()
        			
        		}
        		
            	}
            	
        		
        		if($("#purchaseLeads option:selected").val()=="Allowed"){
            		
            		if(parseInt($("#purchaseLeadLimit").val())<=0){
            			
            			$("#plError").text("Please Enter Some limit");
            			
            			return false;
            			
            		}else{
            			
            			$("#plError").empty()
            			
            		}
        		}
            		
            		
            		if($("#createLeads option:selected").val()=="Allowed"){
                		
                		if(parseInt($("#createLeadLimit").val())<=0){
                			
                			$("#clError").text("Please Enter Some limit");
                			
                			return false;
                			
                		}else{
                			
                			$("#clError").empty()
                			
                		}
            		}
                		
                		
                		if($("#createEmployees option:selected").val()=="Allowed"){
                    		
                    		if(parseInt($("#createEmployeeLimit").val())<=0){
                    			
                    			$("#ceError").text("Please Enter Some limit");
                    			
                    			return false;
                    			
                    		}else{
                    			
                    			$("#ceError").empty()
                    			
                    		}
                		}
                    		
                	
                    		if($("#createSubContractor option:selected").val()=="Allowed"){
                        		
                        		if(parseInt($("#createSubConLimit").val())<=0){
                        			
                        			$("#scError").text("Please Enter Some limit");
                        			
                        			return false;
                        			
                        		}else{
                        			
                        			$("#scError").empty()
                        			
                        		}
                    		
                    		}
        		
        		
        		
        		
        	}
        	
            
            
            
            
            
        </script>
</body>
</html>