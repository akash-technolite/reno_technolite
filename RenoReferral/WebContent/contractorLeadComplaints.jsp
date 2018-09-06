<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${sessionScope.user=='contractor'}">
		<jsp:include page="contractorSidebar.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="estimatorSidebar.jsp" />
	</c:otherwise>
</c:choose>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

			<nav class="navbar navbar-default navbar-justified">
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
					<a class="navbar-brand" href="#">Lead Complaints </a>
				</div>
				<div class="navbar-brand pull-right">
					<form action="ComplaintController" method="post">
						<input type="hidden" name="action" value="createNewComplaint">
						<input type="hidden" name="lead_id" value="${lead.leadID}">
						<button type="submit" class="btn btn-info">Create
							Complaint</button>
					</form>
				</div>



			</div>
			</nav>

			<div class="content">

				<div class="container-fluid">
					<div class="row">


						<div class="col-md-12">
							<div class="card">
								<div class="card-content">
									<div class="row">


										<%--    <div><h3 align="center" style="color:green">${SuccessMessage}</h3></div> 
	                                 
	                                <div><h3 align="center" style="color:red">${ErrorMessage}</h3></div> 
	                    
	                    
	                     --%>

										<div class="col-md-4">
											<div class="form-group ">
												<label class="control-label">Lead Reference Number</label>

												<div class="form-group">
													<input class=" form-control" name="leadId" id="leadId"
														type="text" value="${lead.leadID}" readonly />
												</div>

											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label class="control-label">Customer Name</label>

												<div class="form-group">
													<input class=" form-control" name="customer_name"
														id="customer_name" type="text" value="${lead.name}"
														readonly />
												</div>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label class="control-label">Service Name</label>

												<div class="form-group">
													<input class=" form-control" name="service_name"
														id="service_name" type="text" value="${lead.serviceName}"
														readonly />
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>




						<div class="col-md-12">
							<div class="card">

								<div class="card-content">
									<div class="row">
										<nav class="navbar fixed-top navbar-light bg-faded">
										<div class="container-fluid">
											<div class="navbar-header"></div>
											<ul class="nav  nav-pills nav-justified">
												<li class="nav-item active"><a data-toggle="tab"
													href="#menu1">New <span class="badge" id="newCount"></span></a></li>
												<li><a data-toggle="tab" href="#menu2">Assigned <span
														class="badge" id="assCount"></span></a></li>
												<li><a data-toggle="tab" href="#menu3">Working <span
														class="badge" id="worCount"></span></a></li>
												<li><a data-toggle="tab" href="#menu4">Completed <span
														class="badge" id="comCount"></span></a></li>
											</ul>
										</div>
										</nav>


										<div class="tab-content" style="padding: 20px;">

											<div id="menu1" class="tab-pane fade in active">

												<h3 class="card-title">New</h3>

												<table id="newComplaints"
													class="table table-striped table-no-bordered table-hover datatables"
													cellspacing="0" width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Complaint Id</th>
															<th>Date Time</th>
															<th>Complaint Text</th>
															<th>Actions</th>
														</tr>
													</thead>

													<tbody>

														<c:forEach items="${newComplaints}" var="com">

															<tr>
																<td>${com.con_complaint_id}</td>
																<td>${com.timestamp}</td>
																<td>${com.complaint_text}</td>
																<td><a data-toggle="modal" data-target="#myModal"
																	id="asssignBtn"
																	onclick="assign(${com.con_complaint_id})"
																	class="btn btn-simple btn-info btn-icon like">Assign</i></a>

																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>
											</div>




											<div id="menu2" class="tab-pane fade in ">
												<h3 class="card-title">Assigned</h3>
												<table id="assComplaints"
													class="table table-striped table-no-bordered table-hover datatables"
													cellspacing="0" width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Complaint Id</th>
															<th>Date Time</th>
															<th>Complaint Text</th>
															<th>Actions</th>
														</tr>
													</thead>

													<tbody>

														<c:forEach items="${assignedComplaints}" var="com">

															<tr>
																<td>${com.con_complaint_id}</td>
																<td>${com.timestamp}</td>
																<td>${com.complaint_text}</td>
																<td>
																	<form action="ComplaintController" method="post"
																		onsubmit="return confirm('This action cannot be undone');">
																		<input type="hidden" name="action"
																			value="moveToWorking"> <input type="hidden"
																			name="lead_id" value="${lead.leadID}"> <input
																			type="hidden" name="complaint_id"
																			value="${com.con_complaint_id}">
																		<button type="submit"
																			class="btn btn-info btn-simple  btn-icon like">Move
																			To Working</button>
																	</form>

																	<form action="ContractorFlowController" method="post">
																		<input type="hidden" name="action" value="leadNotes">
																		<input type="hidden" name="lead_id"
																			value="${lead.leadID}">
																		<button type="submit"
																			class="btn btn-simple btn-info btn-icon like">Notes</button>
																	</form>
																</td>
															</tr>

														</c:forEach>


													</tbody>
												</table>
											</div>





											<div id="menu3" class="tab-pane fade in ">
												<h3 class="card-title">Working</h3>
												<table id="worComplaints"
													class="table table-striped table-no-bordered table-hover datatables"
													cellspacing="0" width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Complaint Id</th>
															<th>Date Time</th>
															<th>Complaint Text</th>
															<th>Actions</th>
														</tr>
													</thead>

													<tbody>

														<c:forEach items="${workingComplaints}" var="com">

															<tr>
																<td>${com.con_complaint_id}</td>
																<td>${com.timestamp}</td>
																<td>${com.complaint_text}</td>
																<td>
																	<form action="ComplaintController" method="post"
																		onsubmit="return confirm('This action cannot be undone');">
																		<input type="hidden" name="action"
																			value="closeComplaint"> <input type=hidden
																			name="lead_id" value="${lead.leadID}"> <input
																			type="hidden" name="complaint_id"
																			value="${com.con_complaint_id}">
																		<button type="submit"
																			class="btn btn-info btn-simple  btn-icon like">Close
																			Complaint</button>
																	</form>

																	<form action="ContractorFlowController" method="post">
																		<input type="hidden" name="action" value="leadNotes">
																		<input type="hidden" name="lead_id"
																			value="${lead.leadID}">
																		<button type="submit"
																			class="btn btn-simple btn-info btn-icon like">Notes</button>
																	</form>
																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>
											</div>



											<div id="menu4" class="tab-pane fade in ">
												<h3 class="card-title">Completed</h3>
												<table id="comComplaints"
													class="table table-striped table-no-bordered table-hover datatables"
													cellspacing="0" width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Complaint Id</th>
															<th>Date Time</th>
															<th>Complaint Text</th>
															<th>Actions</th>
														</tr>
													</thead>

													<tbody>

														<c:forEach items="${closedComplaints}" var="com">

															<tr>
																<td>${com.con_complaint_id}</td>
																<td>${com.timestamp}</td>
																<td>${com.complaint_text}</td>
																<td>
																	<%-- <form  action="ComplaintController" method="post"
										    	 onsubmit="return confirm('This action cannot be undone');">
												    <input type="hidden" name="action" value="closeComplaint" >
												   <input type=hidden name="lead_id" value="${lead.leadID}" >
												    <input type="hidden" name="complaint_id" value="${com.con_complaint_id}" >
													<button type="submit" class="btn btn-info btn-simple  btn-icon like">Close Complaint</button>
												</form> --%>

																	<form action="ContractorFlowController" method="post">
																		<input type="hidden" name="action" value="leadNotes">
																		<input type="hidden" name="lead_id"
																			value="${lead.leadID}">
																		<button type="submit"
																			class="btn btn-simple btn-info btn-icon like">Notes</button>
																	</form>
																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>
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






		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				Modal content
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Assign Complaint</h4>
					</div>
					<div class="modal-body">

						<div class="container">
							<div class="row">
								<form id="assignForm" action="ComplaintController" method="post">

									<input type="hidden" name="action" value="assignComplaint">



									<div class="col-sm-12">
										<div class="col-sm-4">
											<div class="form-group">
												<label>Lead ID</label> <input id="lead_id" name="lead_id"
													class="form-control" type="text" value="${lead.leadID}"
													readonly="readonly">
											</div>
										</div>
									</div>

									<div class="col-sm-12">
										<div class="col-sm-4">
											<div class="form-group">
												<label>Complaint ID</label> <input id="complaint_id"
													name="complaint_id" class="form-control" type="text"
													readonly="readonly">
											</div>
										</div>
									</div>





									<div class="col-sm-12">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="control-label">Select Estimator<star>*</star></label>
												<select class="selectpicker" id="employee_id"
													name="employee_id" type="text" required="true"
													autocomplete="off">
													<option value="0">----Select Employee-------</option>
													<c:forEach items="${employees}" var="emp">
														<option value="${emp.employee_id}">${emp.employee_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>

									<div class="col-sm-12">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="control-label">Select Installer<star>*</star></label>
												<select class="selectpicker" id="installer_id"
													name="installer_id" type="text" required="true"
													autocomplete="off">
													<option value="0">----Select Employee-------</option>
													<c:forEach items="${installers}" var="emp">
														<option value="${emp.employee_id}">${emp.employee_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>

									<div class="col-sm-offset-2 col-sm-8">
										<div class="form-group">
											<button type="submit" class="btn">Assign</button>
										</div>

									</div>

								</form>


							</div>
						</div>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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






<script type="text/javascript">
    $(document).ready(function() {

       /*  $('.datatables').DataTable({
            "pagingType": "full_numbers",
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            responsive: true,
            language: {
            search: "_INPUT_",
	            searchPlaceholder: "Search records",
	        }
        });
    
    } );*/
    
    var t1 = $('#newComplaints').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
    var t1Lenght = t1.page.info().recordsTotal;
    var t2 = $('#assComplaints').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
    var t2Lenght = t2.page.info().recordsTotal;
    var t3 = $('#worComplaints').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
    var t3Lenght = t3.page.info().recordsTotal;
    var t4 = $('#comComplaints').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
    var t4Lenght = t4.page.info().recordsTotal;
    
    
    $('#newCount').text(t1Lenght);
	$('#assCount').text(t2Lenght);
	$('#worCount').text(t3Lenght);
	$('#comCount').text(t4Lenght);
         
});
	
</script>

<script type="text/javascript">
	
       function assign(complaint_id){
    	   
    	   $("#complaint_id").val(complaint_id);
    	   
    	 
       }
       
      </script>

<script type="text/javascript">
   
        $().ready(function(){
        	
			$('#assignForm').validate();
           
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