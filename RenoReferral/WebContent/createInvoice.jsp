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

<!--  HI FIRST svn CHECK -->

<%-- <c:choose>      
    <c:when test=" ${sessionScope.user}.equals('admin')" >    
        <jsp:include  page="sidebar.jsp"></jsp:include>   
    </c:when>

    <c:when test="${sessionScope.user}='contractor'}">   
        <jsp:include page="contractorSidebar.jsp"></jsp:include>   
    </c:when>
</c:choose>   --%>



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

						<a class="navbar-brand" href="#validationforms">Invoice</a>
					</div>
					<span class="navbar-brand pull-right">

						<form action="ContractorFlowController" method="post">
							<input type="hidden" name="action" value="showAllInvoices">
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


							<div class="col-md-12">
								<div class="card">
									<!-- <div class="card-header">
	                                <h4 class="card-title">Collapsible Accordion</h4>
	                             
	                            </div> -->
									<div class="card-content">
										<div id="acordeon">
											<div class="panel-group" id="accordion">
												<div class="panel panel-border panel-default">
													<a data-toggle="collapse" href="#loadContent">
														<div class="panel-heading">
															<h4 class="panel-title" onclick="validateEstimation()">
																Load Estimation <i class="ti-angle-down"></i>
															</h4>
														</div>
													</a>
													<div id="loadContent" class="panel-collapse collapse">
														<div class="panel-body">
															<form action="InvoiceController" method="post">

																<input type="hidden" name="action"
																	value="loadEstimation"> <input type="hidden"
																	name="invoice_id" value="${invoice.invoice_id}">

																<input type="hidden" name="oldDueAmount"
																	value="${oldDueAmount}">

																<div class="col-sm-4 form-group">
																	<label for="lead_id" class="control-label">Lead
																		Reference Number</label> <input class=" form-control"
																		name="lead_id" id="lead_id" type="text"
																		value="${lead.leadID}" readonly />
																</div>



																<div class="col-sm-4 form-group">
																	<label for="customer_name" class="control-label">Customer
																		Name</label> <input class=" form-control" name="customer_name"
																		id="customer_name" type="text" value="${lead.name}"
																		readonly />
																</div>

																<div class="col-sm-4 form-group">

																	<label class="control-label">Location</label> <input
																		class=" form-control" name="service_name"
																		id="service_name" type="text"
																		value="${lead.locationName}" readonly />
																</div>


																<div class="col-sm-4 form-group">

																	<label class="control-label">Service Name</label> <input
																		class=" form-control" name="service_name"
																		id="service_name" type="text"
																		value="${lead.serviceName}" readonly />
																</div>




																<div class="col-sm-4 form-group">

																	<label class="control-label">Select Estimation</label>
																	<select class="selectpicker" id="load_estimation_id"
																		name="estimation_id" type="text" required="true">
																		<option value="">----Select----</option>
																		<c:forEach items="${estimationList}" var="est">
																			<option value="${est.estimation_id}">${est.estimation_title}</option>
																		</c:forEach>
																	</select>
																</div>



																<div class="col-sm-4 form-group">
																	<label class="control-label"> Estimation Id</label>
																	<div class="form-group">
																		<input class=" form-control" name="estimation_id"
																			id="estimation_id" type="text"
																			value="${estimation_id}" required="true" readonly />
																	</div>

																</div>


																<div class="text-center">
																	<button type="submit" class="btn btn-info btn-fill"
																		style="background-color: #de7e31; color: white; border-color: #de7e31;">Load</button>

																</div>

															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>

							<div class="col-md-12">
								<div class="card">
									<!-- <div class="card-header">
	                                <h4 class="card-title">Collapsible Accordion</h4>
	                               
	                            </div> -->
									<div class="card-content">
										<div id="acordeon">
											<div class="panel-group" id="accordion">
												<div class="panel panel-border panel-default">
													<a data-toggle="collapse" href="#elementContent">
														<div class="panel-heading">
															<h4 class="panel-title">
																Add Elements <i class="ti-angle-down"></i>
															</h4>
														</div>
													</a>
													<div id="elementContent" class="panel-collapse collapse">
														<div class="panel-body">
															<form id="createElementForm" action="InvoiceController"
																method="post">


																<div>
																	<h3 align="center" class="fadeThis"
																		style="color: green">${SuccessMessage}</h3>
																</div>

																<div>
																	<h3 align="center" class="fadeThis" style="color: red">${ErrorMessage}</h3>
																</div>

																<input type="hidden" name="oldDueAmount"
																	value="${oldDueAmount}"> <input type="hidden"
																	name="invoice_id" value="${invoice.invoice_id}">

																<input id="lead_id" type="hidden" name="lead_id"
																	value="${lead.leadID}"> <input
																	id="estimation_id" type="hidden" name="estimation_id"
																	value="${estimation_id}">

																<!--  <div class="form-group">
	                                      -->
																<input class=" form-control" name="invoice_id"
																	id="invoice_id" type="hidden"
																	value="${invoice.invoice_id}" readonly />
																<!--    </div> -->

																<%-- <input type="hidden" name="invoice_title" value="${invoice_title}">
	                                       --%>
																<%--  <div class="form-group ">
	                                        <label class="control-label">Invoice Title<star>*</star></label>
	                                      
	                                        <div class="form-group">
	                                        <input class=" form-control"
	                                               name="invoice_title"
	                                               id="invoice_title"
	                                               type="text"
	                                               value="${invoice_title}"
	                                               required="true"
	                                               
											/>
	                                    </div>  
	                                    
	                                    </div>--%>

																<%-- <div class="form-group ">
	                                        <label class="control-label">Customer Name</label>
	                                      
	                                        <div class="form-group">
	                                        <input class=" form-control"
	                                               name="customer_name"
	                                               id="customer_name"
	                                               type="text"
	                                               value="${lead.name}"
	                                               readonly
	                                               
											/>
	                                    </div>
	                                   
	                                     </div>
	                                     
	                                      <div class="form-group ">
	                                        <label class="control-label">Service Name</label>
	                                      
	                                        <div class="form-group">
	                                        <input class=" form-control"
	                                               name="service_name"
	                                               id="service_name"
	                                               type="text"
	                                               value="${lead.serviceName}"
	                                               readonly
	                                              
											/>
	                                    </div>
	                                   
	                                     </div>
	                              
	                                --%>
																<div class="form-group ">
																	<label class="control-label"> Date <star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control datetimepicker" id="date"
																			name="date" type="text" required="true"
																			autocomplete="off" />
																	</div>
																</div>


																<div class="form-group">
																	<label class="control-label">Select Service
																		from Notes<star>*</star>
																	</label> <select class="  selectpicker" id="serviceNotes"
																		name="serviceNotes" type="text" autocomplete="off">
																		<option value="0">---Select Note---</option>
																		<c:forEach items="${notesList}" var="note">
																			<option value="${note.note}">${note.note}</option>
																		</c:forEach>
																	</select>
																</div>





																<label class="control-label">Other Description<star>*</star></label>
																<div class="form-group ">
																	<textarea type="text" class="form-control" rows="3"
																		name="serviceDescription" id="serviceDescription"
																		maxlength="250"></textarea>
																</div>


																<div class="form-group ">
																	<label class="control-label">Quantity<star>*</star></label>

																	<div class="form-group">
																		<input class=" form-control" name="quantity"
																			id="quantity" type="text" required="true"
																			autocomplete="off" maxlength="10" number="true" />
																	</div>

																</div>




																<div class="form-group ">
																	<label class="control-label"> Price<star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="price" name="price"
																			type="text" required="true" value="0"
																			autocomplete="off" maxlength="10" number="true" />
																	</div>
																</div>


																<!-- <div class="form-group ">
	                                       <label class="control-label">
												Tax(%)<star>*</star>
											</label>
											
											  <div class="form-group">
	                                        <input class="form-control"
	                                               id="tax"
	                                               name="tax"
	                                               type="text"
	                                               required="true"
	                                                value="0"
	                                               autocomplete="off"
	                                              
											/>
	                                    </div>
	                                    </div>
	                                     -->


																<div class="form-group ">
																	<label class="control-label">Amount<star>*</star></label>

																	<div class="form-group">
																		<input class="form-control" name="amount" id="amount"
																			type="text" required="true" autocomplete="off"
																			value="0" maxlength="10" number="true" />
																	</div>

																</div>



																<input class="form-control" id="total" name="total"
																	type="hidden" value="${invoice.subTotal}"
																	maxlength="10" number="true" />

																<input type="hidden" name="action" value="createInvoice">

																<div class="category">
																	<star>*</star>
																	Required fields
																</div>

																<button type="submit" class="btn btn-info btn-fill"
																	style="background-color: #de7e31; color: white; border-color: #de7e31;">Submit</button>
														</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="col-md-12">
								<div class="card">
									<!-- <div class="card-header">
	                                <h4 class="card-title">Collapsible Accordion</h4>
	                               
	                            </div> -->
									<div class="card-content">
										<div id="acordeon">
											<div class="panel-group" id="accordion">
												<div class="panel panel-border panel-default">
													<a data-toggle="collapse" href="#invoiceContent"
														onclick="return validateSaveBtn()">
														<div class="panel-heading">
															<h4 class="panel-title">
																Final Details <i class="ti-angle-down"></i>
															</h4>
														</div>
													</a>
													<div id="invoiceContent" class="panel-collapse collapse">
														<div class="panel-body">
															<form id="saveFinalDetails" action="InvoiceController"
																method="post" onsubmit="return validateSaveBtn()">
																<input type="hidden" name="action" value="saveFinal">

																<input type="hidden" name="invoice_id"
																	value="${invoice.invoice_id}"> <input
																	type="hidden" name="lead_id" value="${lead.leadID}">

																<input type="hidden" name="estimation_id"
																	value="${estimation_id}">



																<div class="form-group ">
																	<label class="control-label">Invoice Title</label> <input
																		class=" form-control" name="invoice_title"
																		id="invoice_title" type="text"
																		value="${invoice_title}" required="true"
																		maxlength="50" />
																</div>


																<div class="form-group">
																	<label class="control-label"> Sub Total<star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="subTotal"
																			name="subTotal" type="text"
																			value="${invoice.subTotal}" maxlength="10"
																			number="true" readonly />
																	</div>

																</div>


																<div class="form-group ">
																	<label class="control-label"> Select Promotion<star>*</star>
																	</label>
																	<div class="form-group">
																		<select class="selectpicker" id="promoCode"
																			name="promoCode" type="text">
																			<option value="0" selected>----Select----</option>
																			<c:forEach items="${promotions}" var="promo">
																				<option
																					value="${promo.type}:${promo.discount_amount}">${promo.description}</option>
																			</c:forEach>
																		</select>
																	</div>
																</div>



																<div class="form-group ">
																	<label class="control-label"> Promotion Amount<star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="promoDiscount"
																			name="promoDiscount" type="text" required="true"
																			autocomplete="off" maxlength="10" value="0" readonly />
																	</div>
																</div>


																<div class="form-group ">
																	<label class="control-label"> Tax Rate(%) <star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="taxRate"
																			name="taxRate" type="text" required="true"
																			autocomplete="off" value="${tax}" readonly />
																	</div>
																</div>




																<div class="form-group ">
																	<label class="control-label"> Tax Due Amount<star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="taxDueAmount"
																			name="taxDueAmount" type="text" required="true"
																			autocomplete="off" value="0" maxlength="10"
																			number="true" readonly />
																	</div>
																</div>



																<div class="form-group">
																	<label class="control-label"> Tax Due Date <star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control datetimepicker"
																			id="tax_due_date" name="tax_due_date" type="text"
																			required="true" autocomplete="off" />
																	</div>
																</div>









																<div class="form-group ">
																	<label class="control-label"> Gross Amount<star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="grossTotal"
																			name="grossTotal" type="text" required="true"
																			autocomplete="off" value="0" maxlength="10"
																			number="true" readonly />
																	</div>
																</div>

																<div class="form-group ">
																	<label class="control-label"> Payment Amount<star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="paymentAmount"
																			name="paymentAmount" type="text" required="true"
																			autocomplete="off" maxlength="10" number="true"
																			value="0" />
																	</div>
																</div>

																<div class="form-group ">
																	<label class="control-label"> Old Due Amount<star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="oldDueAmount"
																			name="oldDueAmount" type="text" required="true"
																			autocomplete="off" value="${oldDueAmount}"
																			maxlength="10" number="true" readonly />
																	</div>
																</div>


																<div class="form-group ">
																	<label class="control-label"> Due Amount<star>*</star>
																	</label>

																	<div class="form-group">
																		<input class="form-control" id="dueAmount"
																			name="dueAmount" type="text" required="true"
																			autocomplete="off" value="0" maxlength="10"
																			number="true" readonly />
																	</div>
																</div>

																<button type="submit" class="btn btn-info btn-fill"
																	style="background-color: #de7e31; color: white; border-color: #de7e31;">Submit</button>

																<div class="card-footer">

																	<div class="clearfix"></div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>









							<div class="col-sm-12">
								<div class="card">


									<div on class="card-header">
										<h4 class="card-title">INVOICE</h4>
										<div class="pull-right">
											<%-- <form action="PrintInvoice" method="post">
										 <input class="btn" type="submit" value="Print">
										<input type="hidden" id="print_invoice_id" name="invoice_id" value="${invoice.invoice_id}">
										</form> --%>
										</div>
									</div>
									<div class="card-content">

										<table id=""
											class="table datatables table-striped table-bordered table-hover "
											cellspacing="0" width="100%" style="width: 100%">
											<thead>
												<tr>
													<th>Item Code</th>
													<th>Date</th>
													<th>Service Name</th>
													<th>Quantity</th>
													<th>Price</th>
													<!-- <th>Tax(%)</th> -->
													<th>Amount</th>
													<th>Actions</th>




												</tr>
											</thead>

											<tbody>

												<c:forEach items="${elementList}" var="ele">

													<tr>
														<td class="">${ele.item_code}</td>
														<td class="">${ele.service_date}</td>
														<td class="">${ele.service_description}</td>
														<td class="">${ele.quantity}</td>
														<td class="">${ele.price}</td>
														<%-- <td class="">${ele.tax}</td> --%>
														<td class="">${ele.amount}</td>
														<td>
															<form action="InvoiceController" method="post">
																<input type="hidden" name="action" value="deleteElement">
																<input type="hidden" name="oldDueAmount"
																	value="${oldDueAmount}"> <input type="hidden"
																	name="lead_id" value="${lead.leadID}"> <input
																	type="hidden" name="invoice_id"
																	value="${ele.invoice_id}"> <input
																	type="hidden" name=estimation_id
																	value="${estimation_id}"> <input type="hidden"
																	name="element_total" value="${ele.amount}"> <input
																	type="hidden" name="item_code" value="${ele.item_code}">
																<button type="submit"
																	class="btn btn-simple btn-danger btn-icon remove">
																	<i class="ti-close"></i>
																</button>
															</form>
														</td>
													</tr>
												</c:forEach>
											</tbody>

											<thead>
												<tr>

													<th colspan="5"><span class="pull-right"><strong>Sub
																Total</strong></span></th>
													<th id="invTotal">${invoice.subTotal}</th>
													<th></th>
												</tr>


												<%-- <tr>
						                       <th colspan="5"><span class="pull-right" ><strong>Promotion Discount</strong></span></th>
												  <th>${invoice.promoDiscount}</th>
												  <th></th>
											</tr>
											
											
											
											
											<tr>
						                       
											    <th colspan="5"><span class="pull-right" ><strong>Tax Due(${invoice.taxRate}%)</strong></span></th>
												  <th>${invoice.taxDueAmount}</th>
												  <th></th>
											</tr>
											
							                
											
											<tr>
						                       
											    <th colspan="5"><span class="pull-right" ><strong>Gross Total</strong></span></th>
												  <th>${invoice.grossTotal}</th>
												  <th></th>
											</tr>
											<tr>
						                       
											    <th colspan="5"><span class="pull-right" ><strong>Payment</strong></span></th>
												  <th>${invoice.paymentAmount}</th>
												  <th></th>
											</tr>
											<tr>
						                       
											    <th colspan="5"><span class="pull-right" ><strong>Old Due Amount</strong></span></th>
												  <th>${invoice.oldDueAmount}</th>
												  <th></th>
											</tr>
											<tr>
						                       
											    <th colspan="5"><span class="pull-right" ><strong>New Due Amount</strong></span></th>
												  <th>${invoice.dueAmount}</th>
												  <th></th>
											</tr> --%>
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
        $().ready(function(){
        	
			$('#createElementForm').validate();
			$('#saveFinalDetails').validate();
			
			
         /*    $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
            
            
		
	            
	            // Init DatetimePicker
	             /* demo.initFormExtendedDatetimepickers();  */
	            
	            
	           /*  $(".datepicker").datepicker().datepicker("setDate", new Date()); */
	    
	        
            
        });
        
        
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

<script type="text/javascript">
            $(function () {
            	$('.datetimepicker').datetimepicker({
                    format: 'YYYY-MM-DD'
              });
            	
            	
            });
            
              
           $("#serviceNotes").change(function(){
                var note = $(this).find("option:selected").text();	 
            	
            	$("#serviceDescription").val(note);
            	
            	
            }); 
           
          /*  $("#serviceDescription").on('input',function(){
               
           	/* var note = $(this).find("option:selected").text();	
           	
           	$("#serviceNotes").prop("readonly",true);
          
           
           });  */
            
            
        </script>

<!-- Calculation Script -->
<script type="text/javascript">

      $("#quantity").on('input',function(){
    	  
    	 if($("#quantity").val()!=""){
    	  
         var quantity=parseInt($("#quantity").val());
         var price=parseFloat($("#price").val());
         var amount=parseFloat($("#amount").val());
         var total=parseFloat($("#total").val());
        /*  var tax=parseFloat($("#tax").val()); */
         
         
         /* var newAmount=(quantity*price)+((quantity*price)*(tax/100)); */
         var newAmount=quantity*price;
        
         $("#amount").val(newAmount.toFixed(2));
         
         
    	  }
          
      });
     
       $("#price").on('input',function(){
    	   
    	 if($("#price").val()!=""){
    		 
    		 var quantity=parseInt($("#quantity").val());
             var price=parseFloat($("#price").val());
             var amount=parseFloat($("#amount").val());
             var total=parseFloat($("#total").val());
            /*  var tax=parseFloat($("#tax").val()); */
             
             
             /* var newAmount=(quantity*price)+((quantity*price)*(tax/100)); */
             var newAmount=quantity*price;
            
             $("#amount").val(newAmount.toFixed(2));
             
             
       } 
     });
     
     
     /*  $("#tax").on('input',function(){
      	 
    	  if($("#tax").val()!=""){
    		  
    	  var quantity=parseInt($("#quantity").val());
          var price=parseFloat($("#price").val());
          var amount=parseFloat($("#amount").val());
          var total=parseFloat($("#total").val());
          var tax=parseFloat($("#tax").val());
          
          
          var newAmount=(quantity*price)+((quantity*price)*(tax/100));
          
         
          $("#amount").val(newAmount);
          
           
    	  }
    	  
       });
     
       */
      
      
       
       $("#promoCode").on('change',function(){
      	 
      	  if($("#promoCode option:selected").val()!=""){
      		
      		calculate();
      	  }
      	  
         });
       
       
       
       
       $("#taxRate").on('input',function(){
      	 
      	  if($("#taxRate").val()!=""){
      		 
      		calculate();
               
              }
      	  
         });
       
       $("#paymentAmount").on('input',function(){
        	 
       	  if($("#paymentAmount").val()!=""){
       		 
       		calculate();
           
       	  }
       	  
          });
       
       
       
       function calculate(){
    	   
    	   var promo =$("#promoCode option:selected").val();
    	   var arr = promo.split(':');
    	  
    	    var subTotal=parseFloat($("#subTotal").val());
     	    var promoType=arr[0];
    	    var promoAmount=parseFloat(arr[1]);
    	   var taxRate=parseFloat($("#taxRate").val());	  
       	var taxDueAmount=parseFloat($("#taxDueAmount").val());
       	var paymentAmount=parseFloat($("#paymentAmount").val());
           var grossTotal=parseFloat($("#grossTotal").val());
            var oldDueAmount=parseFloat($("#oldDueAmount").val()); 
           
            
            
            
            if(promoType=="0"){
            	
          
            grossTotal=subTotal; 
            $("#promoDiscount").val(0);
            }
           else if(promoType=="Cad"){
       	   
       	   grossTotal=subTotal-promoAmount; 
       	 $("#promoDiscount").val(promoAmount+promoType);
          }
          else{
       	   
       	   grossTotal=subTotal-((subTotal*promoAmount)/100);
       	 $("#promoDiscount").val(promoAmount+promoType);
          }
           
           
          
           taxDueAmount=(grossTotal*taxRate)/100;
           
           $("#taxDueAmount").val(taxDueAmount.toFixed(2))
           
           
            grossTotal=grossTotal+taxDueAmount;
           
           
           
            dueAmount=(grossTotal+oldDueAmount)-paymentAmount;
            
            /* dueAmount=grossTotal-paymentAmount; */
            
           $("#dueAmount").val(dueAmount.toFixed(2));
           
           $("#grossTotal").val(grossTotal.toFixed(2));
           
    	   
    	   
    	   
       }
       
       
       
       
         
      /* $(function () {
    	  
     
      	if($("#invoice_title").val()!=""){
      		
      		$("#invoice_title").attr("readonly","readonly");
      		
      	}
              
        }); */
      
      
      
     /*  window.onbeforeunload = function() { return "Your work will be lost."; }; */
      
        	
       
      
       $("#load_estimation_id").on('change',function(){
        	 
    	   $("#estimation_id").val($("#load_estimation_id").val());
    	   
       });
      
     
     
       $(document).ready(function(e) {
    	    var $input = $('#refresh');

    	    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
    	});
     
       
       
       
        function  validateSaveBtn(){
    	   
    	   if($("#subTotal").val()==""){
    		   
    		   showNotification('Please add an element first','danger');
    		   
    		   return false;
    	   } 
    	   
    	   
       }
       
         function  validateEstimation(){
    	   
    	   if(!$("#estimation_id").val()==""){
    		   
    		   showNotification('You have already loaded an estimation','danger');
    		   
    		   return false;
    	   } 
    	   
    	   
       }
       
         $(document).ready(function(){

        	   calculate();

        	});
     
        
       
     
     
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