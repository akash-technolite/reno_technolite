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

<title>Contractor Invoices</title>

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
						<a class="navbar-brand" href="#validationforms">Paid Invoices</a>

					</div>


				</div>
				</nav>

				<div class="content" style="margin-top: 15px;">

					<div class="container-fluid">
						<div class="row">

							<div class="col-md-12 ">
								<div class="card">
									<div class="card-content">


										<h3>
											<strong>All Paid Invoices</strong> <span class="pull-right">
												<form action="ContractorFlowController" method="post">
													<input type="hidden" name="action" value="newInvoice">
													<input type="hidden" name="lead_id" value="${lead.leadID}">
													<button type="submit" class="btn btn-info">Create
														New Invoice</button>
												</form>
											</span>
										</h3>
										<hr>

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

										<table id="estimationTable"
											class="table table-striped table-bordered datatables">

											<thead>
												<th><strong>Invoice ID</strong></th>
												<th><strong>Date</strong></th>
												<th><strong>Invoice Title</strong></th>
												<!-- <th><strong>Estimation ID</strong></th>
											        <th><strong>Sub Total</strong></th>
											          <th><strong>Discount</strong></th>
											          <th><strong>Tax(%)</strong></th>
											           <th><strong>Tax Due</strong></th> 
											          <th><strong>Tax Due Date</strong></th>  -->
												<th><strong>Gross Amount</strong></th>
												<th><strong>Old Due Amount</strong></th>
												<th><strong>Paid Amount</strong></th>
												<th><strong>New Due Amount</strong></th>
												<th><strong>Action</strong></th>
												<!-- <th><strong>Status</strong></th>
													<th><strong>Change Status</strong></th> -->
											</thead>
											<tbody>
												<c:forEach items="${invoiceList}" var="inv">
													<tr>
														<td class="invId">${inv.invoice_id}</td>
														<td>${inv.invoice_date}</td>
														<td>${inv.invoice_title}</td>
														<%-- <td >${inv.estimation_id}</td>
													   <td >${inv.subTotal}</td>
													   <td>${inv.promoDiscount}</td>
													     <td>${inv.taxRate}</td>
													      <td>${inv.taxDueAmount}</td> 
													      <td>${inv.tax_due_date}</td>  --%>
														<td>${inv.grossTotal}</td>
														<td>${inv.oldDueAmount}</td>
														<td>${inv.paymentAmount}</td>
														<td>${inv.dueAmount}</td>


														<c:choose>
															<c:when test="${inv.dueAmount==0}">
																<td>No Due</td>
															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${inv.due_status==1}">
																		<td>Due is paid look for due invoice</td>
																	</c:when>
																	<c:otherwise>
																		<td><button data-toggle="modal"
																				data-target="#payDueModal" type="button"
																				class="btn btn-success"
																				onclick="payDue(${inv.invoice_id})">Pay Due</button></td>
																	</c:otherwise>
																</c:choose>
															</c:otherwise>
														</c:choose>






														<%--<td>${inv.invoice_status}</td>
														<td>
														
														<form action="InvoiceController" method="post"
														 onsubmit="return confirm('ALL non-paid invoices will get discarded');">
														
														<input type="hidden" name="lead_id" value="${lead.leadID}" >
														
														 <input type="hidden" name="action" value="changeStatus" >
														 
														<input type="hidden" value="${inv.invoice_id}" name="invoice_id">
														
														<select class="selectpicker" name="invoice_status">
														
														<option selected>-----select-----</option>
														<option>Sent</option>
														<option>Draft</option>
														<option>Paid</option>
														<option>Unpaid</option>
														<option>Cancelled</option>
														</select>
														
														<input type="submit" class="btn" value="update">
														</form>
														</td> --%>


														<!-- <td><button type="button" class="btn btn-info btn-fill" onclick="viewService(this)" data-toggle="modal" data-target="#myModal" >View Services</button></td>
														<td><button type="button" class="btn btn-info btn-fill" onclick="viewLocations(this)" data-toggle="modal" data-target="#myModal2">View Locations</button></td> -->

													</tr>

												</c:forEach>

											</tbody>

										</table>



										<!-- <div class="modal fade" id="myModal" role="dialog">
									    <div class="modal-dialog">
									    
									      Modal content
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
									          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									        </div>
									      </div>
										
										 </div>
									      </div>
										
										
										
										
										
										<div class="modal fade" id="myModal2" role="dialog">
									    <div class="modal-dialog">
									    
									      Modal content
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
									          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									        </div>
									      </div>
										
										 </div>
									      </div>
										 -->








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

	<div id="payDueModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Pay Due</h4>
				</div>
				<div class="modal-body">

					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="card-header">

											<h4 class="card-title"></h4>

										</div>
										<div class="card-content">

											<form action="InvoiceController" method="post">



												<div class="form-group">


													<div class="form-group">
														<label>Invoice Id</label> <input id="mInvoiceId"
															name="mInvoiceId" class="form-control" type="text"
															readonly="readonly" />
													</div>
												</div>

												<div class="form-group">
													<label>Gross Amount</label> <input id="mInvGrossAmt"
														name="mInvGrossAmt" class="form-control" type="text"
														readonly="readonly" />
												</div>

												<div class="form-group">
													<label>Old Payment Amount</label> <input id="mOldPayAmt"
														name="mOldPayAmt" class="form-control" type="text"
														readonly="readonly" />
												</div>

												<div class="form-group">
													<label>Old Due Amount </label> <input id="mOldDueAmt"
														name="mOldDueAmt" class="form-control" type="text"
														readonly="readonly" />
												</div>


												<div class="form-group">
													<div class="text-danger" id="newPayError"></div>
													<label>New Payment Amount</label> <input id="mNewPayAmt"
														name="mNewPayAmt" class="form-control" type="text" />
												</div>


												<div class="form-group">
													<label>New Due Amount</label> <input id="mNewDueAmt"
														name="mNewDueAmt" class="form-control" type="text"
														readonly="readonly" />
												</div>


												<input type="hidden" name="lead_id" value="${lead.leadID}">
												<input type="hidden" name="action" value="payDue">

												<div class="card-footer">
													<button type="submit" value="payDueBtn"
														class="btn btn-success">Pay</button>

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
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
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

<script>
	
	
	   function viewService(row){
		
		
		var $row = $(row).closest("tr");    // Find the row
	    var contractorId = $row.find(".contractorId").text();
		
		
		
    	$.get('AjaxForContractorServices',{
    		contractorId:contractorId
 		},function(responseJson) {
 			
           

 			 $('#servicesList .list li').remove();

 			  $.each(responseJson, function(index,responseJson) {
 			    $('#servicesList .list').append('<li><h3 class="name">'+responseJson+'</h3></li>')
 			  });

 			
 			
 			
 			
 	}); 
		
		
	}
	
		</script>



<script>
	   function viewLocations(row){
			
			
			
			var $row = $(row).closest("tr");    
		    var contractorId = $row.find(".contractorId").text();
			
		   
			
	    	$.get('AjaxContractorLocations',{
	    		contractorId:contractorId
	 		},function(responseJson) {
	 			
	           

	 			 $('#locationList .list li').remove();

	 			  $.each(responseJson, function(index,responseJson) {
	 			    $('#locationList .list').append('<li><h3 class="name">'+responseJson+'</h3></li>')
	 			  });

	 			
	 			
	 			
	 			
	 	}); 
			
			
		}
		 
	   
	   
	   
	   
	   
	   
	
	
	</script>







<script type="text/javascript">
  
  
 function payDue(invoice_id){
	 
	
	 $.get('AjaxForDueAmount',{
		 invoice_id:invoice_id
			},function(responseJson) {
				
				$("#mInvoiceId").val(responseJson.invoice_id);
			     $("#mInvGrossAmt").val(responseJson.grossTotal);
				 $("#mOldPayAmt").val(responseJson.paymentAmount);
				 $("#mOldDueAmt").val(responseJson.dueAmount);
				 
	           
			});
	  
 }
  
    $("#mNewPayAmt").on('input',function(){
	 
    	 var newPayAmt=parseFloat($("#mNewPayAmt").val());
    	
    	if(newPayAmt!=""){
    		
			 var grossAmount=parseFloat($("#mInvGrossAmt").val());
			 var oldDueAmt=parseFloat($("#mOldDueAmt").val());
			 
			 var newPayAmt=parseFloat($("#mNewPayAmt").val());
			 
			 var newDueAmt=oldDueAmt-newPayAmt;
			 
			 if(newPayAmt<=oldDueAmt && newPayAmt>0){
			 $("#newPayError").empty();
			 $("#mNewDueAmt").val(newDueAmt.toFixed(2));
			 
			 }else{
				
				 $("#mNewDueAmt").val(0);
				 $("#newPayError").text("*enter positive amount less than  due amount"); 
			 }
    	}
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

<!-- <script type="text/javascript">
        $().ready(function(){
			$('#LeadRegisterForm').validate();
            $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate();
        });
    </script> -->
</body>
</html>