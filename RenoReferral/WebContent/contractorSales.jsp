<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="contractorSidebar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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



<style type="text/css">
select {
	position: absolute;
	width: 160px;
	height: 23px;
	left: 0;
	top: 0;
	border: 0;
}
</style>
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

					<a class="navbar-brand" href="#validationforms">Sales</a>
				</div>
				<div class="collapse navbar-collapse">

					<ul class="nav navbar-nav navbar-right">
						<!--  <li>
            					<a  title="Sign-Out"class="logout" href="login.jsp">
              						<i class="fa fa-sign-out"></i>
            					</a>
         					</li>
         					<li>
             					<a  title="Lock-Screen" class="lock-screen" href="lock.jsp">
              						<i class="fa fa-lock"></i>
            					</a>
         					</li>
	                         -->
					</ul>
				</div>

			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<h4 class="card-title" style="padding-top: 15px;">
									<strong style="margin-left: 18px;">Search</strong>
								</h4>

								<div class="card-content">


									<div class="row">


										<form action="ContractorFlowController" method="post"
											class="form">

											<input type="hidden" name="action" value="showAllInvoices">

											<div class="col-md-4">
												<div class="form-group">
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




											<%-- 
                                  
									 <div class="col-md-12">
									 <div class="form-group">
								    <label class="col-md-4" ><h5>Select Lead</h5></label>
								    <div class="col-md-8">
								    <select name="lead_id" class="selectpicker" id="leadSelect">
								      <c:forEach items="${leadList}" var="lead">     
	                                       <option value="${lead.leadID}"> ${lead.leadID} : ${lead.name}</option>
	                                         </c:forEach> 
								    </select>
								    </div>
								  </div>
								  </div>
									  --%>



											<!-- <div class="col-lg-4 form-group">
								  
								     <input type="hidden" name="action" value="showAllPaidInvoices" >
								     
								       <div class="input-group">
								      <div class="input-group-btn dropdown">
								        <button href="#" class="btn btn-block dropdown-toggle" data-toggle="dropdown">
                                                      Regular
                                                      <b class="caret"></b>
                                                  </button>
                                                  <ul class="dropdown-menu">
                                                    <li><a href="#">Action</a></li>
                                                    <li><a href="#">Another action</a></li>
                                                    <li><a href="#">Something else here</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="#">Separated link</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="#">One more separated link</a></li>
                                                  </ul>
                                            </div>
								     
								      
								    </div>
										</div> -->


											<%--  <div class="form-group">
									 	<center>
									  <button type="submit" class="btn btn-fill"  style="background-color: #de7e31; color:white; border-color: #de7e31;">Submit</button>
									  	</center>
									  </div> --%>
										</form>

									</div>

								</div>


							</div>
						</div>

						<!-- All-Invoices   -->
						<div class="col-md-12">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">



										<div class="card">
											<h4 class="">All Contractor Invoices</h4>
											<div class="card-content">
												<div class="toolbar">
													<!--Here you can write extra buttons/actions for the toolbar-->
												</div>
												<div class="fresh-datatables">
													<table id="invoicesTable"
														class="table table-striped table-no-bordered table-hover"
														cellspacing="0" width="100%" style="width: 100%">
														<thead>
															<tr>
																<th><strong>Lead Ref No.</strong></th>
																<th><strong>Invoice ID</strong></th>
																<th><strong>Date</strong></th>
																<th><strong>Invoice Title</strong></th>
																<th><strong>Gross Amount</strong></th>
																<th><strong>Action</strong></th>
																<!-- <th><strong>Status</strong></th>
													<th><strong>Change Status</strong></th> -->
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${invoiceList}" var="inv">
																<tr>
																	<td>${inv.leadId}</td>
																	<td class="invId">${inv.invoice_id}</td>
																	<td>${inv.invoice_date}</td>
																	<td>${inv.invoice_title}</td>
																	<td>${inv.grossTotal}</td>
																	<td><form action="InvoiceController" method="post">

																			<input type="hidden" name="lead_id"
																				value="${inv.leadId}"> <input type="hidden"
																				name="action" value="showInvoice"> <input
																				type="hidden" value="${inv.invoice_id}"
																				name="invoice_id"> <input type="submit"
																				class="btn" value="Read">

																		</form></td>
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
    $(document).ready(function() {

        $('#invoicesTable').DataTable({
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
        $().ready(function(){
			 $('.form').validate(); 
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