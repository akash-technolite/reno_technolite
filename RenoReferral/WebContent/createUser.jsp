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

<title>Create User</title>

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

						<a class="navbar-brand" href="#validationforms">Users</a>
					</div>
					<!-- 
					<span class="navbar-brand pull-right">
										
					   <a   href="createSubAdmin.jsp" > <button type="button" class="btn btn-info btn-fill">Create SubAdmin</button></a>
	                     
	                   <a  href="ContractorAction">
	                   		<button type="button" class="btn btn-info btn-fill" onclick="location.href='createContractor.jsp">Create Contractor</button>
	                   	</a>
					
					 </span> -->

					<!-- <ul class="nav navbar-nav navbar-right">
	                        <li>
	                            <a href="createContractor.jsp" class=" btn-magnify" >
	                                <i class="ti-user"></i>
									<p>Create Contractor</p>
	                            </a>
	                        </li>
	                  </ul> -->

					<div class="collapse navbar-collapse">

						<ul class="nav navbar-nav navbar-right">
							<li><a href="ContractorAction" class=" btn-magnify"> <i
									class="ti-user"></i>
									<p>Create Contractor</p>
							</a></li>

						</ul>
					</div>

				</div>
				</nav>

				<div class="content">

					<div class="container-fluid" style="margin-top: 30px;">
						<div class="row">

							<div class="col-md-12 ">
								<div class="card">
									<div class="card-content">


										<%-- <div><h3 align="center" class="fadeThis" style="color:green">${SuccessMessage}</h3></div> 
	                                 
	                                <div><h3 align="center" class="fadeThis" style="color:red">${ErrorMessage}</h3></div>
									 --%>





										<h3>
											<strong>Contractors</strong>
										</h3>
										<hr>
										<div class="fresh-datatables">
											<table
												class="table table-striped table-no-bordered table-hover datatables"
												cellspacing="0" width="100%" style="width: 100%">

												<thead>
													<tr>
														<th><strong>Id</strong></th>
														<th><strong>Name </strong></th>
														<th><strong>Subscription</strong></th>
														<th><strong>Services</strong></th>
														<th><strong>Locations</strong></th>
														<th><strong>Action</strong></th>
														<!-- <th><strong>Email</strong></th> -->
														<th><strong>Mobile</strong></th>
														<th><strong>Company</strong></th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${contractorList}" var="contractor">
														<tr>
															<td class="contractorId">${contractor.contractorId}</td>
															<td class="contractorName">${contractor.contractorName}</td>
															<td class="subscriptionName">${contractor.subscriptionName}</td>
															<td class=""><button type="button"
																	class="btn btn-simple btn-info btn-icon like"
																	value="${contractor.contractorId}"
																	onclick="viewService(this)" data-toggle="modal"
																	data-target="#myModal">View Services</button></td>
															<td><button type="button"
																	class="btn btn-simple btn-info btn-icon like"
																	value="${contractor.contractorId}"
																	onclick="viewLocations(this)" data-toggle="modal"
																	data-target="#myModal2">View Locations</button></td>
															<td>
																<%-- <button id="viewBtn" class="btn btn-simple btn-info btn-icon like" value="${contractor.contractorId}" onclick="viewContractor(this)" data-toggle="modal" data-target="#contractorDetails" href="#" >Read</button> --%>

																<form action="Admin" method="post">
																	<input type="hidden" name="action"
																		value="contractorProfile"> <input
																		type="hidden" name="contractorId"
																		value="${contractor.contractorId}">
																	<button type="submit" class="btn btn-simple btn-info">View
																		Profile</button>
																</form> <a
																href="UserAction?action=register&contractorId=${contractor.contractorId}"><button
																		type="button" class="btn btn-simple btn-info">
																		<!-- <span class="fa fa-edit"></span> -->
																		Set Password
																	</button></a> <%-- 														<td><a value="${contractor.contractorId}" onclick="viewService(this)" data-toggle="modal" data-target="#myModal" class="btn btn-simple btn-info btn-icon like">View Details</i></a></td>
 --%> <%-- <td class="contractorEmail">${contractor.contractorEmail}</td> --%>
															<td class="contractorMobileNumber">${contractor.contractorMobileNumber}</td>
															<td class="contractorCompany">${contractor.contractorCompany}</td>
														</tr>
													</c:forEach>
												</tbody>

												<%-- <tr>
														<td>Contractor Service</td>
														
														<td>
														
													
														<c:forEach items="${contractor.contractorServices}" var="contractorServices">
														
														
														${contractorServices.serviceName},
														
														</c:forEach>
														
														

													</tr>  --%>



												<%-- <tr>
														<td>Contractor Locations</td>
														
														<td>
														<c:forEach items="${contractor.contractorLocations}" var="contractorLocations">
														
														
														${contractorLocations.locationName},
														
														</c:forEach>
														
														</td> --%>


											</table>
										</div>
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">Services List</h4>
													</div>
													<div class="modal-body">
														<div id="servicesList">
															<ol class="list">

															</ol>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>
												</div>

											</div>
										</div>

										<div class="modal fade" id="myModal2" role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">Location List</h4>
													</div>
													<div class="modal-body">


														<div id="locationList">
															<ol class="list">

															</ol>
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>
												</div>

											</div>
										</div>

										<!-- Contractor Details Model -->
										<div class="modal fade" id="contractorDetails" role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">Contractor Details</h4>
													</div>
													<div class="modal-body">
														<div class="card-content table-responsive">
															<table class="table table-striped table-bordered">
																<thead>
																	<th><strong>Name</strong></th>
																	<th><strong>Details</strong></th>
																</thead>
																<tbody>
																	<tr>
																		<td><strong>Referrance Number</strong></td>
																		<td id="conId"></td>
																	</tr>
																	<tr>
																		<td><strong>Subscription Type</strong></td>
																		<td id="subtype"></td>
																	</tr>
																	<tr>
																		<td><strong>Company Name</strong></td>
																		<td id="companyName"></td>
																	</tr>
																	<tr>
																		<td><strong>Contractor Name</strong></td>
																		<td id="conName"></td>
																	</tr>
																	<tr>
																		<td><strong>Phone</strong></td>
																		<td id="phone"></td>
																	</tr>
																	<tr>
																		<td><strong>Email</strong></td>
																		<td id="conmail"></td>
																	</tr>
																	<tr>
																		<td><strong>Services</strong></td>
																		<td id="conservices">
																			<div id="servicesList">
																				<ol class="list">

																				</ol>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td><strong>Locations</strong></td>
																		<td id="conlocation">
																			<div id="locationList">
																				<ol class="list">

																				</ol>
																			</div>

																		</td>
																	</tr>

																</tbody>
															</table>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>
												</div>

											</div>
										</div>


									</div>

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
<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

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
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->

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





<script>	
		function viewContractor(row){		
			     	    						 
			  var contractorId=parseInt($(row).val());  
			  
		 /* var $row = $(row).closest("tr");    // Find the row
		 var contractorId = $row.find(".contractorId").text();		 */
		/*  alert(contractorId); */
		
		 $.get('AjaxForContractor',{
		 		contractorId:contractorId
				},function(responseJson) {			
					 
					$("#conId").text(responseJson.contractorId);
					$("#conName").text(responseJson.contractorName);
					$("#subtype").text(responseJson.subscriptionName);					
					$("#companyName").text(responseJson.contractorCompany);
					$("#conmail").text(responseJson.contractorEmail);
					$("#phone").text(responseJson.contractorMobileNumber);
					
				});
                  
		 $.get('AjaxForContractorServices',{
	    		contractorId:contractorId
	 		},function(responseJson) {
	 			
	           

	 			 $('#servicesList .list li').remove();

	 			  $.each(responseJson, function(index,responseJson) {
	 			    $('#servicesList .list').append('<li><h5 class="name">'+responseJson+'</h5></li>')
	 			  });
		 
	 		});
	 			 $.get('AjaxContractorLocations',{
	 	    		contractorId:contractorId
	 	 		},function(responseJson) {
	 	 		
	 	 			 $('#locationList .list li').remove();

	 	 			  $.each(responseJson, function(index,responseJson) {
	 	 			    $('#locationList .list').append('<li><h5 class="name">'+responseJson+'</h5></li>')
	 	 			  });
	  			
	 	 	}); 
	 			  
	
		}
	
	
</script>


<script>	
	   function viewService(row){		
		
		   var contractorId=parseInt($(row).val());
		/* var $row = $(row).closest("tr");    // Find the row
	    var contractorId = $row.find(".contractorId").text();		
	 */
    	$.get('AjaxForContractorServices',{
    		contractorId:contractorId
 		},function(responseJson) {
 			
           

 			 $('#servicesList .list li').remove();

 			  $.each(responseJson, function(index,responseJson) {
 			    $('#servicesList .list').append('<li><h5 class="name">'+responseJson+'</h5></li>')
 			  });
 			
 	}); 
		
		
	}
	
		</script>



<script>
	   function viewLocations(row){
		   
		   
          var contractorId=parseInt($(row).val());
		   
		  
		   
			/* var $row = $(row).closest("tr");    
		    var contractorId = $row.find(".contractorId").text(); */
		 	$.get('AjaxContractorLocations',{
	    		contractorId:contractorId
	 		},function(responseJson) {
	 		
	 			 $('#locationList .list li').remove();

	 			  $.each(responseJson, function(index,responseJson) {
	 			    $('#locationList .list').append('<li><h5 class="name">'+responseJson+'</h5></li>')
	 			  });
 			
	 	}); 
			
		}
		 
	</script>




<script type="text/javascript">
	    $(document).ready(function() {

	        $(".datatables").DataTable({
	            "pagingType": "full_numbers",
	            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
	            responsive: true,
	            language: {
	            search: "_INPUT_",
		            searchPlaceholder: "Search records",
		        }
	        });
	    });
	        </script>

<script type="text/javascript">


     function showNotification(message,type){
	
	

	$.notify({
		message:message 
	},{
		
		type:type,
		timer: 3000,
		allow_dismiss: false,
		placement: {
			from: "top",
			align: "center"
		},
	});
}

   

</script>

<c:if test="${not  empty SuccessMessage}">
	<script>
    
       showNotification("${SuccessMessage}",'success');
         </script>
</c:if>

<c:if test="${not  empty ErrorMessage}">
	<script>
       
       showNotification('${ErrorMessage}','danger');
              
         </script>
</c:if>

</body>
</html>