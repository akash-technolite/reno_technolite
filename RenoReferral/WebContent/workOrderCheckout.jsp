<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:choose>
	<c:when test="${sessionScope.user=='contractor'}">
		<jsp:include page="contractorSidebar.jsp" />
	</c:when>
	<c:when test="${sessionScope.user=='estimator'}">
		<jsp:include page="estimatorSidebar.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="installerSidebar.jsp" />
	</c:otherwise>
</c:choose>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>RenoReferral</title>

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
						<a class="navbar-brand" href="#validationforms">Work Order
							Details</a>
					</div>


					<span class="navbar-brand pull-right">
						<form action="WorkOrderController" method="post">
							<input type="hidden" name="action" value="showWorkOrders">
							<input type="hidden" name="lead_id" value="${lead.leadID}">
							<button type="submit" class="btn  btn-info">
								<i class="ti-arrow-left"></i> Back
							</button>
						</form>

					</span>


				</div>
				</nav>

				<div class="content" style="margin-top: 15px;">

					<div class="container-fluid">
						<div class="row">

							<div class="col-sm-12">
								<div class="card">


									<div class="card-header">
										<div class="card-title">
											<center>
												<h4>${order.title}</h4>
											</center>
											<div class="pull-right">
												<form target="_blank" action="PrintWorkOrder" method="post">
													<input class="btn" type="submit" value="Print"> <input
														type="hidden" id="print_work_order_id"
														name="work_order_id" value="${order.work_order_id}">
												</form>
											</div>
										</div>
									</div>
									<div class="card-content">


										<div class="col-md-12 ">

											<div class="form-group col-md-4">
												<label class="control-label">Lead Reference Number</label>

												<div class="form-group">
													<input class=" form-control" name="lead_id" id="lead_id"
														type="text" value="${lead.leadID}" readonly />
												</div>

											</div>

											<div class="form-group col-md-4">
												<label class="control-label">Customer Name</label>

												<div class="form-group">
													<input class=" form-control" name="customer_name"
														id="customer_name" type="text" value="${lead.name}"
														readonly />
												</div>

											</div>

											<div class="form-group col-md-4">
												<label class="control-label">Service Name</label>

												<div class="form-group">
													<input class=" form-control" name="service_name"
														id="service_name" type="text" value="${lead.serviceName}"
														readonly />
												</div>

											</div>

										</div>





										<table id=""
											class="table datatables table-striped table-bordered table-hover "
											cellspacing="0" width="100%" style="width: 100%">
											<thead>
												<tr>
													<th><strong>Product</strong></th>
													<th><strong>Product Description</strong></th>
													<th><strong>Quantity</strong></th>
													<th><strong>Other</strong></th>
													<!-- <th >Actions</th> -->





												</tr>
											</thead>

											<tbody>

												<c:forEach items="${elementList}" var="ele">

													<tr>
														<td class="">${ele.product}</td>
														<td class="">${ele.product_description}</td>
														<td class="">${ele.quantity}</td>
														<td class="">${ele.other}</td>
														<%-- <td>
												   <form action="WorkOrderController" method="post">
												     <input type="hidden" name="action" value="deleteElement" >
												     <input type="hidden" name="work_order_id" value="${ele.work_order_id}">
												     <input type="hidden" name="item_no" value="${ele.item_no}" >
												     <input type="hidden" name="lead_id" value="${lead.leadID}" >
						    					    <button type="submit" class="btn btn-simple btn-danger btn-icon remove"><i class="ti-close"></i></button>
												</form>
												</td>  --%>
													</tr>
												</c:forEach>
											</tbody>

											<thead>
												<tr>

													<th><strong>Special Notes</strong></th>
													<th colspan="3">${order.special_notes}</th>
											</thead>


										</table>







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
<!-- 	<script src="js/sweetalert2.js"></script> -->

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


<!-- Custom JS -->
<script src="js/utility.js"></script>


<script type="text/javascript">
        
        
        
        $(document).ready(function() {

	        $('.datatables').DataTable({
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


</body>
</html>