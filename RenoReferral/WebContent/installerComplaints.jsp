<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="installerSidebar.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

					<a class="navbar-brand" href="#validationforms">Complaints</a>
				</div>

			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="col-md-12">
						<div class="card">
							<h3 class="card-title" style="padding-top: 15px;">
								<strong style="margin-left: 18px;">Complaints</strong>
							</h3>

							<div class="card-content">
								<div class="row">

									<div class="col-md-12">
										<div class="card">
											<h4 class="card-title" style="padding-top: 15px;">
												<strong style="margin-left: 18px;">Search</strong>
											</h4>

											<div class="card-content">


												<div class="row">
													<form id="leadForm" action="InstallerController"
														method="post" class="form">

														<!-- <div class="col-md-4">
									 
									 <div class="form-group">
								    <label><h5>Enter Reference Number</h5></label>
								    <input 
								   type="text"
								   number="true"
								   required="required"
								   maxlength="6"
								   name="lead_id"
								   class="form-control"
								    >
								    </div>
								  </div> -->

														<input type="hidden" name="action" value="showComplaints">
														<div class="col-md-12">
															<div class="col-md-5 form-group">
																<label><h5>Enter Reference Number</h5></label>
																<div class="input-group ">
																	<input type="text" number="true" required="required"
																		maxlength="6" name="lead_id" class="form-control"
																		number="true"> <span
																		class="input-group-btn">
																		<button type="submit" class="btn btn-primary"
																			style="background-color: #de7e31; color: white; border-color: #de7e31;">Submit</button>
																	</span>
																</div>
															</div>
														</div>


														<input type="hidden" name="action" value="showComplaints">

														<!-- <div class="col-md-12">
									 <div class="form-group">
									 <button type="submit" class="btn btn-primary" style="background-color: #de7e31; color:white; border-color: #de7e31;">Submit</button>
									  </div>
									   </div> -->
													</form>


												</div>

											</div>


										</div>
									</div>


									<div class="col-md-12">
										<div class="card">
											<h4 class="card-title" style="padding-top: 15px;">
												<strong style="margin-left: 18px;">All Complaints</strong>
											</h4>
											<div class="card-content">
												<div class="row">
													<nav class="navbar fixed-top navbar-light bg-faded">
													<div class="container-fluid">
														<div class="navbar-header"></div>
														<ul class="nav  nav-pills nav-justified">
															<!-- <li class="nav-item active"><a data-toggle="tab" href="#menu1">New</a></li> -->
															<li class="nav-item active"><a data-toggle="tab"
																href="#menu2">New <span class="badge" id="newCount"></span></a></li>
															<li><a data-toggle="tab" href="#menu3">Working <span
																	class="badge" id="worCount"></span></a></li>
															<li><a data-toggle="tab" href="#menu4">Completed
																	<span class="badge" id="comCount"></span>
															</a></li>
														</ul>
													</div>
													</nav>


													<div class="tab-content">

														<%--   <div id="menu1" class="tab-pane fade in active">
	                                   
	                                    <h3 class="card-title">New</h3>
	                                    
	                                    <table id="newComplaints" class="table table-striped table-no-bordered table-hover datatables" cellspacing="0" width="100%" style="width:100%">
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
											  <td>
											  
											  	<a data-toggle="modal" data-target="#myModal" id="asssignBtn" onclick="assign(${com.con_complaint_id})"  class="btn btn-simple btn-info btn-icon like">Assign</i></a>  
												
												</td> 
											
											
												
											</tr> 
										
										 </c:forEach> 
										
										
										</tbody>
									    </table>
	                                     </div> --%>




														<div id="menu2" class="tab-pane fade in active">
															<h3 class="card-title">New</h3>
															<table id="newComplaints"
																class="table table-striped table-no-bordered table-hover datatables"
																cellspacing="0" width="100%" style="width: 100%">
																<thead>
																	<tr>
																		<th>Complaint Id</th>
																		<th>Lead Id</th>
																		<th>Date Time</th>
																		<th>Complaint Text</th>
																		<!-- <th>Actions</th> -->
																	</tr>
																</thead>

																<tbody>

																	<c:forEach items="${assignedComplaints}" var="com">

																		<tr>
																			<td>${com.con_complaint_id}</td>
																			<td>${com.leadID}</td>
																			<td>${com.timestamp}</td>
																			<td>${com.complaint_text}</td>
																			<%-- <td>
												<form  action="ComplaintController" method="post"
										    	 onsubmit="return confirm('This action cannot be undone');">
												    <input type="hidden" name="action" value="moveToWorking" >
												    <input type="hidden" name="lead_id" value="${lead.leadID}" >
												    <input type="hidden" name="complaint_id" value="${com.con_complaint_id}" >
													<button type="submit" class="btn btn-info btn-simple  btn-icon like">Move To Working</button>
												</form>
												
												<form action="ContractorFlowController" method="post">
												    <input type="hidden" name="action" value="leadNotes" >
												    <input type="hidden" name="lead_id" value="${lead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Notes</button>
												</form>
												</td>  --%>



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
																		<th>Lead Id</th>
																		<th>Date Time</th>
																		<th>Complaint Text</th>
																		<!-- <th>Actions</th> -->
																	</tr>
																</thead>

																<tbody>

																	<c:forEach items="${workingComplaints}" var="com">

																		<tr>
																			<td>${com.con_complaint_id}</td>
																			<td>${com.leadID}</td>
																			<td>${com.timestamp}</td>
																			<td>${com.complaint_text}</td>
																			<%--  <td>
												<form  action="ComplaintController" method="post"
										    	 onsubmit="return confirm('This action cannot be undone');">
												    <input type="hidden" name="action" value="closeComplaint" >
												   <input type=hidden name="lead_id" value="${lead.leadID}" >
												    <input type="hidden" name="complaint_id" value="${com.con_complaint_id}" >
													<button type="submit" class="btn btn-info btn-simple  btn-icon like">Close Complaint</button>
												</form>
												
												<form action="ContractorFlowController" method="post">
												    <input type="hidden" name="action" value="leadNotes" >
												    <input type="hidden" name="lead_id" value="${lead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Notes</button>
												</form>
												</td> --%>



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
																		<th>Lead Id</th>
																		<th>Date Time</th>
																		<th>Complaint Text</th>
																		<!-- <th>Actions</th> -->
																	</tr>
																</thead>

																<tbody>

																	<c:forEach items="${closedComplaints}" var="com">

																		<tr>
																			<td>${com.con_complaint_id}</td>
																			<td>${com.leadID}</td>
																			<td>${com.timestamp}</td>
																			<td>${com.complaint_text}</td>
																			<%--  <td>
												<form action="ContractorFlowController" method="post">
												    <input type="hidden" name="action" value="leadNotes" >
												    <input type="hidden" name="lead_id" value="${lead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Notes</button>
												</form>
												</td>  --%>



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
				</div>
			</div>
			<!-- row -->
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

<!-- <!-- Vector Map plugin -->
<script src="js/jquery-jvectormap.js"></script>
-->

<!-- <!--  Google Maps Plugin   
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
-->
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




<script type="text/javascript">
    $(document).ready(function() {

    	var t1 = $('#newComplaints').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
        var t1Lenght = t1.page.info().recordsTotal;
        var t3 = $('#worComplaints').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
        var t3Lenght = t3.page.info().recordsTotal;
        var t4 = $('#comComplaints').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
        var t4Lenght =t4.page.info().recordsTotal;
        
        
        $('#newCount').text(t1Lenght);
    	$('#worCount').text(t3Lenght);
    	$('#comCount').text(t4Lenght);
        
    
    });
    
    
    
    
    
    
       function assign(complaint_id){
    	   
    	   $("#complaint_id").val(complaint_id);
    	   
    	  /*  $("#lead_id").val($("#leadId").val()); */
       }
       </script>

<script type="text/javascript">
        $().ready(function(){
			$('#assignForm').validate();
           /*  $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
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