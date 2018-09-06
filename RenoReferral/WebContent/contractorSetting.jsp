<jsp:include page="contractorSidebar.jsp" />

<%@page import="com.tlite.connection.DBConnection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
</head>



<body>
	<div class="wrapper">
		<div class="main-panel">

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

					<a class="navbar-brand" href="#validationforms">Setting</a>
				</div>
				<!-- <span class="pull-right"> <a class="navbar-brand"
					href="DefaultLeadAction"><button type="button"
							class="btn btn-info btn-fill">Default Lead
							Setting</button> </a> <span class="navbar-brand">
						       <form action="CreateLeadAction" method="post">
							<input class="btn btn-info btn-fill" type="submit"
								value="Create Lead">
						</form>
				</span>

				</span> -->

			</div>
			</nav>

			<%--  <div class="content">
               <div class="container-fluid">
					<div class="row">
					<div class="col-md-10 col-md-offset-1">
                        <div class="card">
                        <div class="card-header">
                        <h3 class="card-title" ><strong>Manage Services</strong>
                        
                        <span class="card-title pull-right" data-toggle="collapse" data-target="#manage_services" ><i id="serviceDown" class="ti-angle-down"></i></span>
                        
                        </h3>
                        </div>
						  <div class="card-content">
						     <div  id="manage_services" class="collapse">
						     <h4>All Service<button class="btn btn-info pull-right" data-toggle="modal"
                                            data-target="#serviceModal">Add Service</button>
				                                  </h4>
						     
						             <div class="">
										<table class="table table-striped table-no-bordered table-hover datatables" cellspacing="0" width="100%" style="width:100%">
										<thead>
											<tr>
											    <th>Sr</th>
												<!-- <th>Id</th> -->
												<th>Name</th>
												
												<th class="disabled-sorting">Actions</th>
											</tr>
										</thead>
										
										<tbody>
										 <c:forEach items="${serviceList}" var="service">   
											<tr>
			                                   <td></td>
												<td>${service.serviceId}</td>
												<td>${service.serviceName}</td>
												
												<td>
												    <a href="${doc.document_path}"  target="_blank"
												    class="btn btn-simple btn-success btn-icon like">
												    <i class="ti-image" title="view"></i></a>
													<a  href="${doc.document_path}" class="btn btn-simple btn-info btn-icon like" download>
													<i class="ti-download" title="download"></i></a>
												   
												   <button id="editbtn" value="${doc.document_id}" class="btn btn-simple btn-warning btn-icon editbtn" data-toggle="modal"data-target="#editModal"><i class="ti-pencil-alt" title="Edit"></i></button>
												    
												    <form action="Setting" method="post"
												    onsubmit="return confirm('Please confirm your action');"
												    >
												    <input type="hidden" name="action" value="deleteService"> 
												    <input type="hidden" name="service_id" value="${service.serviceId}"> 
												    <button class="btn btn-simple btn-danger btn-icon remove" type="submit"><i class="ti-close" title="Close"></i></button>
												    </form>
												    
												    
												    
												    
												    
													
												</td>
											</tr>
											 </c:forEach> 
										</tbody>
									</table>
						</div><!--fresh-datatables end-->
						     
						     
                                 	
										
										

									</div>
									</div>


								</div>
								
							</div>
							
							<div class="col-md-10 col-md-offset-1">
                        <div class="card">
                        <div class="card-header">
                        <h3 class="card-title" ><strong>Manage Budget Ranges</strong>
                        
                        <span class="card-title pull-right" data-toggle="collapse" data-target="#manage_br" ><i class="ti-angle-down"></i></span>
                        
                        </h3>
                        </div>
                        <div class="card-content">
						    
                                <div  id="manage_br" class="collapse">
						     <h4>All Budget Ranges<button class="btn btn-info pull-right" data-toggle="modal"
                                            data-target="#budgetModal">Add New Range</button>
				                                  </h4>
						     
						             <div class="">
										<table class="table table-striped table-no-bordered table-hover datatables" cellspacing="0" width="100%" style="width:100%">
										<thead>
											<tr>
											    <th>Sr</th>
												<th>Min Value</th>
												<th>Max Value</th>
												
												<th class="disabled-sorting">Actions</th>
											</tr>
										</thead>
										
										<tbody>
										 <c:forEach items="${budgetRanges}" var="budget">   
											<tr>
			                                   <td></td>
										    	<td>${budget.min_value}</td>
												<td>${budget.max_value}</td>
												
												<td>
												    <a href="${doc.document_path}"  target="_blank"
												    class="btn btn-simple btn-success btn-icon like">
												    <i class="ti-image" title="view"></i></a>
													<a  href="${doc.document_path}" class="btn btn-simple btn-info btn-icon like" download>
													<i class="ti-download" title="download"></i></a>
												   
												   <button id="editbtn" value="${doc.document_id}" class="btn btn-simple btn-warning btn-icon editbtn" data-toggle="modal"data-target="#editModal"><i class="ti-pencil-alt" title="Edit"></i></button>
												    
												    <form action="Setting" method="post"
												    onsubmit="return confirm('Please confirm your action');"
												    >
												    <input type="hidden" name="action" value="deleteRange"> 
												    <input type="hidden" name="ranges_id" value="${budget.budget_ranges_id}"> 
												    <button class="btn btn-simple btn-danger btn-icon remove" type="submit"><i class="ti-close" title="Close"></i></button>
												    </form>
												    
												    
												    
												    
												    
													
												</td>
											</tr>
											 </c:forEach> 
										</tbody>
									</table>
						</div><!--fresh-datatables end-->
						     
						     
                                 	
										
										

									
										
										

									</div>
									</div>


								</div>
								
							</div>
						</div>
						</div>
			</div> --%>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Dropdown Setting</h4>
									<p class="category">Add Dropdown Vaules</p>
								</div>
								<div class="card-content">

									<div id="acordeon">
										<div class="panel-group" id="accordion">
											<div class="panel panel-border panel-default">
												<a data-toggle="collapse" href="#collapseOne">
													<div class="panel-heading">
														<h4 class="panel-title">
															Manage Document Types <i class="ti-angle-down"></i>
														</h4>
													</div>
												</a>
												<div id="collapseOne" class="panel-collapse collapse">
													<div class="panel-body">


														<button class="btn btn-info pull-right"
															data-toggle="modal" data-target="#docTypeModal">Add
															Type</button>


														<div class="fresh-datable">
															<table
																class="table table-striped table-no-bordered table-hover datatables"
																cellspacing="0" width="100%" style="width: 100%">
																<thead>
																	<tr>
																		<!-- <th>Sr</th> -->
																		<th>Id</th>
																		<th>Name</th>

																		<th class="disabled-sorting">Actions</th>
																	</tr>
																</thead>

																<tbody>
																	<c:forEach items="${documentTypes}" var="docTypes">
																		<tr>
																			<!-- <td></td> -->
																			<td>${docTypes.type_id}</td>
																			<td>${docTypes.document_type}</td>

																			<td>
																				<form action="ContractorController" method="post"
																					onsubmit="return confirm('Do you really want to delete this?');">
																					<input type="hidden" name="action"
																						value="deleteDoctype"> <input
																						type="hidden" name="type_id"
																						value="${docTypes.type_id}">
																					<button
																						class="btn btn-simple btn-danger btn-icon remove"
																						type="submit">
																						<i class="ti-close" title="Close"></i>
																					</button>
																				</form>






																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
														<!--fresh-datatables end-->







													</div>
												</div>
											</div>


											<%--  <div class="panel panel-border panel-default">
		    	                                <a data-toggle="collapse" href="#collapseTwo">
		    	                                    <div class="panel-heading">
		    	                                    	<h4 class="panel-title">
		    	                                        	Manage Budget Ranges
		    	                                        	<i class="ti-angle-down"></i>
		    	                                        </h4>
		    	                                    </div>
		    	                                </a>
		    	                                <div id="collapseTwo" class="panel-collapse collapse">
		    	                                	<div class="panel-body">
		    	                                    	 <button class="btn btn-info pull-right" data-toggle="modal"
                                            data-target="#budgetModal">Add New Range</button>
				          
						     
						             <div class="fresh-datable">
										<table class="table table-striped table-no-bordered table-hover datatables" cellspacing="0" width="100%" style="width:100%">
										<thead>
											<tr>
											    <!-- <th>Sr</th> -->
												<th>Min Value</th>
												<th>Max Value</th>
												
												<th class="disabled-sorting">Actions</th>
											</tr>
										</thead>
										
										<tbody>
										 <c:forEach items="${budgetRanges}" var="budget">   
											<tr>
			                                   <!-- <td></td> -->
										    	<td>${budget.min_value}</td>
												<td>${budget.max_value}</td>
												
												<td>
												    <a href="${doc.document_path}"  target="_blank"
												    class="btn btn-simple btn-success btn-icon like">
												    <i class="ti-image" title="view"></i></a>
													<a  href="${doc.document_path}" class="btn btn-simple btn-info btn-icon like" download>
													<i class="ti-download" title="download"></i></a>
												   
												   <button id="editbtn" value="${doc.document_id}" class="btn btn-simple btn-warning btn-icon editbtn" data-toggle="modal"data-target="#editModal"><i class="ti-pencil-alt" title="Edit"></i></button>
												    
												    <form action="Setting" method="post"
												    onsubmit="return confirm('Please confirm your action');"
												    >
												    <input type="hidden" name="action" value="deleteRange"> 
												    <input type="hidden" name="ranges_id" value="${budget.budget_ranges_id}"> 
												    <button class="btn btn-simple btn-danger btn-icon remove" type="submit"><i class="ti-close" title="Close"></i></button>
												    </form>
												    
												    
												    
												    
												    
													
												</td>
											</tr>
											 </c:forEach> 
										</tbody>
									</table>
						</div><!--fresh-datatables end-->
		    	                                    </div>
		    	                                </div>
	    	                                </div> --%>

										</div>
									</div>
									<!--  end acordeon -->

								</div>
							</div>
						</div>


						<div class="col-lg-6 col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Other Setting</h4>
									<p class="category"></p>
								</div>
								<div class="card-content">
									<div id="acordeon">
										<div class="panel-group" id="accordion">
											<div class="panel panel-border panel-default">
												<a data-toggle="collapse" href="#collapseThree">
													<div class="panel-heading">
														<h4 class="panel-title">
															Company Logo <i class="ti-angle-down"></i>
														</h4>
													</div>
												</a>
												<div id="collapseThree" class="panel-collapse collapse">
													<div class="panel-body">
														<div class="col-md-12">
															<div class="row">

																<div class="col-md-12">
																	<img class="img-responsive" alt="logo not found"
																		src="${companyLogo}">
																</div>

																<div class="col-md-12">
																	<form id="uploadLogo" action="UploadLogo" method="post"
																		enctype="multipart/form-data">
																		<div class="">
																			<label class="control-label">Upload Comapany
																				Logo<star>*</star>
																			</label>

																			<div class="form-group">
																				<input type="file" class="form-control" name="file"
																					required>
																			</div>
																		</div>
																		<div class="">
																			<div class="category">
																				<star>*</star>
																				Required fields
																			</div>
																		</div>
																		<div class="">
																			<div class="panel-footer">
																				<button type="submit"
																					class="btn btn-success btn-fill"
																					style="background-color: #de7e31; color: white; border-color: #de7e31;">Upload</button>
																				<div class="clearfix"></div>
																			</div>
																		</div>

																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="panel panel-border panel-default">
												<a data-toggle="collapse" href="#collapseFour">
													<div class="panel-heading">
														<h4 class="panel-title">
															Default Collapsible Item 1 <i class="ti-angle-down"></i>
														</h4>
													</div>
												</a>
												<div id="collapseFour" class="panel-collapse collapse">
													<div class="panel-body">Anim pariatur cliche
														reprehenderit, enim eiusmod high life accusamus terry
														richardson ad squid. 3 wolf moon officia aute, non
														cupidatat skateboard dolor brunch. Food truck quinoa
														nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt
														aliqua put a bird on it squid single-origin coffee nulla
														assumenda shoreditch et. Nihil anim keffiyeh helvetica,
														craft beer labore wes anderson cred nesciunt sapiente ea
														proident. Ad vegan excepteur butcher vice lomo. Leggings
														occaecat craft beer farm-to-table, raw denim aesthetic
														synth nesciunt you probably haven't heard of them
														accusamus labore sustainable VHS.</div>
												</div>
											</div>
											<!--  <div class="panel panel-border panel-default">
		    	                                <a data-toggle="collapse" href="#collapseThree">
		    	                                    <div class="panel-heading">
		    	                                        <h4 class="panel-title">
		    	                                        	Default Collapsible Item 1
		    	                                        	<i class="ti-angle-down"></i>
		    	                                        </h4>
		    	                                    </div>
		    	                                </a>
		    	                                <div id="collapseThree" class="panel-collapse collapse">
		    	                                	<div class="panel-body">
		    	                                    	Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
		    	                                    </div>
		    	                                </div>
	    	                                </div> -->
										</div>
									</div>
									<!--  end acordeon -->
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
					<script>
						document.write(new Date().getFullYear())
					</script>
					, made with <i class="fa fa-heart heart"></i> by <a href="#">RenoReferral</a>
				</div>
			</div>
			</footer>
		</div>
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

<!--  Switch and Tags Input Plugins -->
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

<script type="text/javascript">

			$().ready(function(){
				$('#add_budget_form').validate();
				$('#add_service_form').validate();
			});
			
   </script>

<script type="text/javascript">
	
	$(document).ready(function() {

		
		
		$('.datatables').DataTable({
			paging: false,
			searching: false
		}
		);
		
		
		
		
		
		
		$('.datatables').DataTable().on( 'order.dt search.dt', function () {
			$('.datatables').DataTable().column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
		
		
		
		
	});
	
	
	
	
		function validateForm(){
		
		if(parseInt($("#max_value").val())<=parseInt($("#min_value").val())){
			
			
			$("#max_value_error").text("Max value must be greater than min value");
			
			return false;
			
		    }else{
			
			$("#max_value_error").empty();
			
		}
		
		
	}
	
	
	
	
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

<!-- ADD NEW SERVICE MODAL -->

<div class="modal fade" id="docTypeModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<!-- <h5 class="modal-title" id="exampleModalLabel">Add New Service</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span> -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title" id="exampleModalLabel">Add New Document
					Type</h5>
				</button>
			</div>
			<div class="modal-body">

				<div class="container-fluid">

					<div class="col-md-12">
						<div class="row">
							<form id="add_service_form" class="form-inline"
								action="ContractorController" method="post">

								<div class="col-md-12" style="margin-bottom: 10px;">
									<div class="form-group">
										<div class="col-md-5">
											<label for="document_type" style="margin-top: 8px;">Document
												Type:</label>
										</div>
										<div class="col-md-7">
											<input type="text" name="document_type" class="form-control"
												id="document_type" maxlength="20">
										</div>
									</div>
								</div>

								<input type="hidden" name="action" value="addDocumentType">
								<center>
									<button type="submit" class="btn btn-success">Add</button>
								</center>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<!-- ADD NEW BUDGET RANGE MODAL -->

<div class="modal fade" id="budgetModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<!-- <h5 class="modal-title" id="exampleModalLabel">Add New Range</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button> -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title" id="exampleModalLabel">Add New Range</h5>
				</button>
			</div>
			<div class="modal-body">

				<div class="container-fluid">

					<div class="col-md-12">
						<div class="row">
							<form id="add_budget_form" action="Setting" method="post"
								onsubmit="return validateForm()">

								<div class="col-md-12" style="margin-bottom: 10px;">
									<div class="form-group">
										<div class="col-md-3">
											<label for="service_name" style="margin-top: 8px;">Min
												Value:</label>
										</div>
										<div class="col-md-9">
											<input type="text" number="true" name="min_value"
												class="form-control" id="min_value" maxlength="10"
												number="true">
										</div>
									</div>
								</div>

								<div class="col-md-12" style="margin-bottom: 20px;">
									<div class="form-group">
										<div class="col-md-3">
											<label for="service_name" style="margin-top: 8px;">Max
												Value:</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="max_value" class="form-control"
												id="max_value" maxlength="10" number="true">
										</div>
										<div id="max_value_error" class="text-danger"></div>
									</div>
								</div>

								<input type="hidden" name="action" value="addBudgetRange">
								<center>
									<button type="submit" class="btn btn-success">Add</button>
								</center>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>










</body>

<script type="text/javascript">

	/* $('.datatables').dataTable({searching: false, paging: false}); */


</script>



</html>