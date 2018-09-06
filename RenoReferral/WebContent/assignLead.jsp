
<jsp:include page="sidebar.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title></title>

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

				<div class="content" style="margin-top: 15px !important;">

					<div class="container-fluid">
						<div class="row">

							<div class="col-md-offset-1 col-md-10 ">
								<div class="card">

									<form id="assignLeadForm" action="AssignLead" method="post">
										<div class="card-header">
											<h4 class="card-title">Assign Lead</h4>
										</div>

										<div class="card-content">

											<div>
												<h3 align="center" style="color: green">${SuccessMessage}</h3>
											</div>
											<div>
												<h3 align="center" style="color: red">${ErrorMessage}</h3>
											</div>

											<%-- <h4 class="card-title">
											 Lead ID
										</h4>
	                                    <h3 id="LeadId">${LeadId}</h3> --%>


											<c:choose>
												<c:when test="${not empty contractorList}">
												</c:when>
												<c:otherwise>
													<h3 id="msg" align="center" class="alert alert-danger">No
														contractor available for this service at this location</h3>
												</c:otherwise>
											</c:choose>


											<div class="form-group">
												<label class="control-label"> Lead Id </label> <input
													class=" form-control" id="leadId" name="leadId" type="text"
													value="${LeadId}" readonly="readonly" />
											</div>





											<div class="form-group">
												<!-- <label class="control-label">
												Service Id
											</label> -->
												<input class=" form-control" id="serviceId" name="serviceId"
													type="hidden" value="${lead.serviceId}" readonly="readonly" />
											</div>


											<div class="form-group">
												<label class="control-label"> Sevice Name </label> <input
													class=" form-control" id="serviceName" name="serviceName"
													type="text" value="${lead.serviceName}" readonly="readonly" />
											</div>


											<div class="form-group">
												<!-- <label class="control-label">
												 Location Id
											</label> -->
												<input class=" form-control" id="locationId"
													name="locationId" type="hidden" value="${lead.locationId}"
													readonly="readonly" />
											</div>





											<div class="form-group">
												<label class="control-label"> Lead Location </label> <input
													class=" form-control" id="location" name="location"
													type="text" value="${lead.locationName}"
													readonly="readonly" />
											</div>




											<%-- <div  class="form-group" >
	                                   <label class="control-label">Select Subscriptions:</label>
	                                    
	                                   <c:forEach items="${subscriptionsList}" var="sub">
	                                    
	                                      <div class="checkbox">
													    <input id="selectSub" name="subscriptions" type="checkbox" value="${sub.subscriptionId}">
													    <label for="subscriptions">
													 		${sub.subscriptionName}
													    </label>
													</div>
	                                     </c:forEach>
	                                  </div>  --%>




											<div class="form-group">
												<label class="control-label">Select Subscriptions:</label> <select
													multiple class="selectpicker" data-size="5" id="selectSub"
													name="subscriptions" type="text" autocomplete="off"
													data-live-search="true">
													<c:forEach items="${subscriptionsList}" var="sub">
														<option value="${sub.subscriptionId}">${sub.subscriptionName}</option>
													</c:forEach>
												</select>
											</div>








											<%--  <label class="control-label">Select Locations:</label>
	                                    
	                                   <c:forEach items="${LocationList}" var="location">
	                                    
	                                      <div class="checkbox">
													    <input id="locations" name="locations" type="checkbox" value="${location.locatonId}">
													    <label for="locations">
													 		${location.locationName}
													    </label>
													</div>
	                                     </c:forEach> --%>




											<!--   <div class="input-group">
									      <input id="searchContractor" type="text" class="form-control" placeholder="Search for Contractors" aria-label="Search for...">
									      <span class="input-group-btn">
									        <button id="searchBtn" class="btn btn-secondary" type="button">Serach</button>
									      </span>
									    </div> -->


											<%--  <div  class="form-group">
	                                  
	                                    <label class="control-label">Select Contractors:</label>
	                                    
	                                    <c:forEach items="${contractorList}" var="contractor"> 
	                                    
	                                      <div class="checkbox">
													    <input id="selectCon"  name="contractors" type="checkbox" value="${contractor.contractorId}">
													    <label for="contractors">
													 		${contractor.contractorName}
													    </label>
													</div>
	                                     </c:forEach>
	                                   
	                                    </div>  
	                                    --%>



											<div class="form-group">
												<label class="control-label">Select Contractors:</label> <select
													multiple class="selectpicker" data-size="5" id="selectCon"
													name="contractors" type="text" autocomplete="off"
													data-live-search="true">
													<c:forEach items="${contractorList}" var="contractor">
														<option value="${contractor.contractorId}">${contractor.contractorName}</option>
													</c:forEach>
												</select>
											</div>







											<!--   <div class="form-group">
	                                        <label for="contractorsCount" class="control-label">
								              Contractors Count
											</label>
	                                        <input class="form-control"
	                                               id="contractorsCount"
	                                               name="contractorsCount"
	                                               type="text"
	                                               readonly="readonly"
	                                               value="0"
											/>
	                                    </div> -->



										</div>


										<div class="card-footer ">
											<center>
												<button type="submit" class="btn btn-info btn-fill">Assign</button>
												<div class="clearfix"></div>
											</center>
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
<!-- 	<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
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

<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

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

<!-- 
          <script>	
			$(document).ready(function() {	
				
				var $checkboxes = $("input[type=checkbox][name=subscriptions]");
				var contractorsCount=parseInt($("#contractorsCount").val());
				
				$checkboxes.click(function() {	
			    
					
					 $("input[type=checkbox][name=contractors]").attr("disabled", true);
					
					var subscriptionId= $(this).val();
					
					
					
					var serviceId= $("#serviceId").val();
					
					
					var locationId= $("#locationId").val();
					
					
					
					if($(this).prop("checked")){	
			      
			        $.get('AjaxForContractorCount',{
			    	  
			    	  subscriptionId:subscriptionId,serviceId:serviceId,locationId:locationId
			    	  
			 		},function(responseJson) {
			 			  contractorsCount=contractorsCount+responseJson;
			 				
                           $("#contractorsCount").val(contractorsCount)
               
			 			  });

					}
					
					
					else {	
					      
				        $.get('AjaxForContractorCount',{
				    	  
				        	subscriptionId:subscriptionId,serviceId:serviceId,locationId:locationId
				    	  
				 		},function(responseJson) {
				 			
				 	     
	                           contractorsCount=contractorsCount-responseJson;
				 				
	                           $("#contractorsCount").val(contractorsCount)
	               
				 			  });

				      
						}
					
					
			});
			
			});
	
      </script>

  
          <script>	
          
        
		 $("input[type=checkbox][name=contractors]").click(function() {	
			 
			 
			 
			 
			 $("input[type=checkbox][name=subscriptions]").attr("disabled", true);
			 
			 
			 
			 
			 var contractorsCount=parseInt($("#contractorsCount").val());
				 
			   
			     if($(this).prop("checked")){	
						
			    	 contractorsCount=contractorsCount+1;
			        
			    	 $("#contractorsCount").val(contractorsCount)
					}
			     
					else {	
						
						contractorsCount=contractorsCount-1;
				 		
						$("#contractorsCount").val(contractorsCount)
						}
					
			});
			
          
	
      </script>


 <script>	
          
        
		 $("#searchBtn").click(function() {	
			 
			 var searchText=$("#searchContractor").val();
				 
			 alert(searchText);
			 
			 
			 
			   var val = [];
			 
			 $(':checkbox[name=contractors]').each(function(i){
		        var tmp   = $(this).next('label').text();
		           val[i]=tmp.trim();
		          });
			 
			 
			   
					
			});
			
          
	
      </script> -->
<!--  <script type="text/javascript">
        $().ready(function(){
        	
          var checked = $("#selectCon").attr("checked");
          
                if(checked){
                	
                   $("#selectSub : input").attr("disabled", true);
                   
                }/* else{
                    $("#baseTypes : input").attr("disabled", false);
                } */
        });
        
        
        </script>
 -->


<script type="text/javascript">
       
$("#selectSub").change(function() {	
	
	$("#selectCon").attr("disabled","disabled");
	 /* $("#").removeAttr('disabled'); */
});

$("#selectCon").change(function() {	
	
	$("#selectSub").attr("disabled","disabled");
	/*  $("#").removeAttr('disabled'); */
});
        
        </script>


<script type="text/javascript">
        $().ready(function(){
        	
        	
        	
			$('#CreateContractorForm').validate();
           /*  $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
            
            
            
          /*   if ($('#selectCon').has('option').length == 0) 
            {
            	$('#msg').text("No contractor available for this service at this location ");
            }
            
            if ($('#selectSub').has('option').length == 0) 
            {
            	$('#msg').text("No contractor available for this service at this location ");
            }
             */
            
            
            
            
        });
        
        
    </script>


</body>
</html>