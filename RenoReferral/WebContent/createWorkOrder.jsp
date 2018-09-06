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

						<a class="navbar-brand" href="#validationforms">Create Work
							Order</a>
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

				<%-- <div class="content" style="margin-top:15px;">
	       
	            <div  class="container-fluid">
	                <div   class="row">
	                
	                 <div class="col-md-12">
	                 
	                        <div class="card">
								              
		                            <div class="card-header" >
										<h4  ><a class="card-title" href="#loadContent" data-toggle="collapse">
											Lead Details</a>
										</h4>
									</div>
									 
									 <div class="card-content">
									 <div   class="row">
		                            <div id="loadContent" class="collapse in">
		                           
		                             <div class="col-sm-3 form-group">
										 <label for="lead_id" class="control-label">Lead Reference Number</label>
	                                          <input class=" form-control"
	                                               name="lead_id"
	                                               id="lead_id"
	                                               type="text"
	                                               value="${lead.leadID}"
	                                               readonly
											/>
	                                    </div>
	                                     
	                                               
		                                 
		                                   <div class="col-sm-3 form-group">
	                                        <label for="customer_name" class="control-label">Customer Name</label>
	                                        <input class=" form-control"
	                                               name="customer_name"
	                                               id="customer_name"
	                                               type="text"
	                                               value="${lead.name}"
	                                               readonly
	                                               
											/>
	                                    </div>
	                                   
	                                    <div class="col-sm-3 form-group">
	                                     
	                                        <label class="control-label">Location</label>
	                                      <input class=" form-control"
	                                               name="service_name"
	                                               id="service_name"
	                                               type="text"
	                                               value="${lead.locationName}"
	                                               readonly
	                                              
											/>
	                                    </div>
	                                     
	                                    
	                                     <div class="col-sm-3 form-group">
	                                     
	                                        <label class="control-label">Service Name</label>
	                                      <input class=" form-control"
	                                               name="service_name"
	                                               id="service_name"
	                                               type="text"
	                                               value="${lead.serviceName}"
	                                               readonly
	                                              
											/>
	                                    </div>
		                            
		                                    
		                                
		                                
		                            </div>    
								 </div>   
								 </div>
								 
								 
	                    	</div> <!-- end card -->
	                	</div>
	                
	                
	                
	                   
	                                      
	             
	                
	                
	                    <div  class="col-sm-3">
	                        <div  class="card">
	                        
	                          <form  id="createWorkOrderProduct"  action="WorkOrderController"  method="post">
	                                
	                                 <div on class="card-header">
	                                  <h4  ><a class="card-title" href="#elementContent" data-toggle="collapse">
											Add Details</a>
										</h4>
										
									</div>
									
									
									<div id="elementContent" class="collapse">
									
	                                <div class="card-content">
	                                
	                              <!--  RequiredHiddenFields -->
	                              
	                               <input type="hidden" name="lead_id" value="${lead.leadID}">
	                               <input type="hidden" name="work_order_id" value="${work_order_id}">        
	                               <input type="hidden" name="action" value="createElement" >          
	                                          
	                                          
	                                            <!-- 
	                                     
			                                    <div class="form-group ">
			                                       <label class="control-label">
														Date <star>*</star>
													</label>
													 
													  <div class="form-group">
			                                        <input class="form-control datetimepicker"
			                                               id="date"
			                                               name="date"
			                                               type="text"
			                                               required="true"
			                                             autocomplete="off"
			                                             
													/>
			                                    </div>
			                                        -->
			                                 
	                                 
	                                 <div class="form-group">
	                                 <label class="control-label">Product Name<star>*</star></label>
	                                         <input class="form-control"
			                                               id="product"
			                                               name="product"
			                                               type="text"
			                                               required="true"
			                                             autocomplete="off"
			                                             
													/>
	                                    </div>
	                                  
	                                    
	                                    
	                                    
	                                
	                                    <label class="control-label">Product Description<star>*</star></label> 
	                                        <div class="form-group ">
                                                    <textarea type="text" 
                                                     class="form-control"
                                                     rows="3"
                                                     name="productDescription"
	                                                 id="productDescription"
                                                    
                                                     
                                                    ></textarea>
	                                        </div>
	                                        
	                                        
	                                         <div class="form-group ">
	                                        <label class="control-label">Quantity<star>*</star></label>
	                                       <input class=" form-control"
	                                               name="quantity"
	                                               id="quantity"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                               maxlength="10"
											/>
	                                    </div>
	                                   
	                                   
	                                          
	                                   <div class="form-group ">
	                                        <label class="control-label">Other</label>
	                                      
	                                        <div class="form-group">
	                                        <input class="form-control"
	                                               name="other"
	                                               id="other"
	                                               type="text"
	                                               autocomplete="off"
	                                                value=""
											/>
	                                    </div>
	                                   
	                                     </div>
	                                     
	                                    
	                                   
	                                    <div class="category"><star>*</star> Required fields</div>
	                                    
	                                    <button type="submit" class="btn btn-info btn-fill" style="background-color: #de7e31;  border-color: #de7e31;">Submit</button>
	                                    
	                                </div>
	                                
	                                 </div>
	                                </form>
	                                 
	                                 
	                            </div>
	                
	                   
	                   
	                   
									
									
	                   
	                   
	                   
	                   
	                   <div  class="card">
	                     <form  id="saveFinalDetails"  action="WorkOrderController"  method="post">
	                       
	                        <div on class="card-header">
										<h4  ><a class="card-title" href="#invoiceContent" data-toggle="collapse">
											Final Details</a>
										</h4>
									</div>
	                           
	                           
	                           <div id="invoiceContent" class="collapse">
	                           
	                           
	                             <div class="card-content">
	                             
	                             
	                            <input type="hidden" name="action" value="saveFinal">
		                        <input type="hidden" name="lead_id" value="${lead.leadID}">
	                            <input type="hidden" name="work_order_id" value="${work_order_id}">    
		                           
	                         
	                           		 
	                           		          <div class="form-group ">
										  <label class="control-label">Title</label>
	                                       <input class=" form-control"
	                                               name="title"
	                                               id="title"
	                                               type="text"
	                                               required="true"
	                                                 
											      />
	                                          </div>
	                           		 
	                           		 <label class="control-label">Special Notes</label> 
	                                        <div class="form-group ">
                                                    <textarea type="text" 
                                                     class="form-control"
                                                     rows="5"
                                                     name="specialNotes"
	                                                 id="specialNotes"
                                                    ></textarea>
	                                        </div>
	                           		           
	                                         
	                                  
	                            <button type="submit" class="btn btn-info btn-fill" style="background-color: #de7e31;  border-color: #de7e31;">Submit</button>
									
									<div class="card-footer">
										
										<div class="clearfix"></div>
									</div>
	                 </div>
	                 
	                 </div>
	                   </form>
	                   
	                   
	                   </div>
	                   
	                   </div>
	                   
	                   
	                   
	                   
	                    <div  class="col-sm-9">
	                        <div  class="card">
	                        
 
	                                <div on class="card-header">
										<h4 class="card-title">WORK ORDER</h4>
										<div class="pull-right">
										<form action="PrintInvoice" method="post">
										 <input class="btn" type="submit" value="Print">
										<input type="hidden" id="print_invoice_id" name="invoice_id" value="${invoice.invoice_id}">
										</form>
										</div>
									</div>
									<div class="card-content">
	                   
	                        <table id="" class="table datatables table-striped table-bordered table-hover " cellspacing="0" width="100%" style="width:100%">
									    	<thead>
											<tr>
											    <th>Product</th>
											   <th>Product Description</th>
												<th>Quantity</th>
												<th>Other</th>
												<th >Actions</th>
												
												
												
												
											</tr>
										</thead>
										
										<tbody>
										
										  <c:forEach items="${elementList}" var="ele">      
										     
										<tr>
						                         <td class="">${ele.product}</td>
											     <td class="">${ele.product_description}</td> 
												  <td class="">${ele.quantity}</td>
												  <td class="">${ele.other}</td>
												  <td>
												   <form action="WorkOrderController" method="post">
												     <input type="hidden" name="action" value="deleteElement" >
												     <input type="hidden" name="work_order_id" value="${ele.work_order_id}">
												     <input type="hidden" name="item_no" value="${ele.item_no}" >
												     <input type="hidden" name="lead_id" value="${lead.leadID}" >
						    					    <button type="submit" class="btn btn-simple btn-danger btn-icon remove"><i class="ti-close"></i></button>
												</form>
												</td> 
											</tr> 
									</c:forEach> 
										</tbody>
								
										<thead>
										 <tr>
						                       
											    <th ><span class="pull-right" ><strong>Sub Total</strong></span></th>
												  <th>${invoice.subTotal}</th>
												  <th></th>
											</tr> 
											
											
										</thead>
										
										
									    </table>
	               
	               
	               
	               
	               
	               
	               
	                   </div>
	                   
	                   
	                   </div>
	                   
	                   </div>
	                   
	                   
	                   
	              </div>
	        </div>
    
			
	    </div> --%>











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
															<h4 class="panel-title">
																Lead Details <i class="ti-angle-down"></i>
															</h4>
														</div>
													</a>
													<div id="loadContent" class="panel-collapse collapse">
														<div class="panel-body">
															<div class="col-sm-3 form-group">
																<label for="lead_id" class="control-label">Lead
																	Reference Number</label> <input class=" form-control"
																	name="lead_id" id="lead_id" type="text"
																	value="${lead.leadID}" readonly />
															</div>



															<div class="col-sm-3 form-group">
																<label for="customer_name" class="control-label">Customer
																	Name</label> <input class=" form-control" name="customer_name"
																	id="customer_name" type="text" value="${lead.name}"
																	readonly />
															</div>

															<div class="col-sm-3 form-group">

																<label class="control-label">Location</label> <input
																	class=" form-control" name="service_name"
																	id="service_name" type="text"
																	value="${lead.locationName}" readonly />
															</div>


															<div class="col-sm-3 form-group">

																<label class="control-label">Service Name</label> <input
																	class=" form-control" name="service_name"
																	id="service_name" type="text"
																	value="${lead.serviceName}" readonly />
															</div>
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
																Add Details <i class="ti-angle-down"></i>
															</h4>
														</div>
													</a>
													<div id="elementContent" class="panel-collapse collapse">
														<div class="panel-body">
															<form id="createWorkOrderProduct"
																action="WorkOrderController" method="post">
																<!--  RequiredHiddenFields -->
																<input type="hidden" name="lead_id"
																	value="${lead.leadID}"> <input type="hidden"
																	name="work_order_id" value="${work_order_id}">
																<input type="hidden" name="action" value="createElement">


																<!-- 
	                                     
			                                    <div class="form-group ">
			                                       <label class="control-label">
														Date <star>*</star>
													</label>
													 
													  <div class="form-group">
			                                        <input class="form-control datetimepicker"
			                                               id="date"
			                                               name="date"
			                                               type="text"
			                                               required="true"
			                                             autocomplete="off"
			                                             
													/>
			                                    </div>
			                                        -->


																<div class="form-group">
																	<label class="control-label">Product Name<star>*</star></label>
																	<input class="form-control" id="product" name="product"
																		type="text" required="true" autocomplete="off" />
																</div>





																<label class="control-label">Product Description<star>*</star></label>
																<div class="form-group ">
																	<textarea type="text" class="form-control" rows="3"
																		name="productDescription" id="productDescription"></textarea>
																</div>


																<div class="form-group ">
																	<label class="control-label">Quantity<star>*</star></label>
																	<input class=" form-control" name="quantity"
																		id="quantity" type="text" required="true"
																		autocomplete="off" maxlength="10" number="true" />
																</div>



																<div class="form-group ">
																	<label class="control-label">Other</label>

																	<div class="form-group">
																		<input class="form-control" name="other" id="other"
																			type="text" autocomplete="off" value="" />
																	</div>

																</div>



																<div class="category">
																	<star>*</star>
																	Required fields
																</div>

																<button type="submit" class="btn btn-info btn-fill"
																	style="background-color: #de7e31; border-color: #de7e31;">Submit</button>

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
													<a data-toggle="collapse" href="#invoiceContent">
														<div class="panel-heading"
															onclick="return validateElement()">
															<h4 class="panel-title">
																Final Details <i class="ti-angle-down"></i>
															</h4>
														</div>
													</a>
													<div id="invoiceContent" class="panel-collapse collapse">
														<div class="panel-body">
															<form id="saveFinalDetails" action="WorkOrderController"
																method="post" onsubmit="return validateElement()">
																<input type="hidden" name="action" value="saveFinal">
																<input type="hidden" name="lead_id"
																	value="${lead.leadID}"> <input type="hidden"
																	name="work_order_id" value="${work_order_id}">



																<div class="form-group ">
																	<label class="control-label">Title</label> <input
																		class=" form-control" name="title" id="title"
																		type="text" required="true" />
																</div>

																<label class="control-label">Special Notes</label>
																<div class="form-group ">
																	<textarea type="text" class="form-control" rows="5"
																		name="specialNotes" id="specialNotes"></textarea>
																</div>



																<button type="submit" class="btn btn-info btn-fill"
																	style="background-color: #de7e31; border-color: #de7e31;">Submit</button>

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
						</div>
					</div>









					<div class="col-sm-12">
						<div class="card">


							<div on class="card-header">
								<h4 class="card-title">WORK ORDER</h4>
								<div class="pull-right">
									<%-- <form action="PrintInvoice" method="post"
										onsubmit="return validatePrintBtn()"
										>
										 <input class="btn" type="submit" value="Print">
										<input type="hidden" id="print_invoice_id" name="invoice_id" value="${invoice.invoice_id}">
										</form> --%>
								</div>
							</div>
							<div class="card-content">

								<table id="workTable"
									class="table datatables table-striped table-bordered table-hover "
									cellspacing="0" width="100%" style="width: 100%">
									<thead>
										<tr>
											<th>Product</th>
											<th>Product Description</th>
											<th>Quantity</th>
											<th>Other</th>
											<th>Actions</th>




										</tr>
									</thead>

									<tbody>

										<c:forEach items="${elementList}" var="ele">

											<tr>
												<td class="">${ele.product}</td>
												<td class="">${ele.product_description}</td>
												<td class="">${ele.quantity}</td>
												<td class="">${ele.other}</td>
												<td>
													<form action="WorkOrderController" method="post">
														<input type="hidden" name="action" value="deleteElement">
														<input type="hidden" name="work_order_id"
															value="${ele.work_order_id}"> <input
															type="hidden" name="item_no" value="${ele.item_no}">
														<input type="hidden" name="lead_id" value="${lead.leadID}">
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
										<%-- <tr>
						                       
											    <th ><span class="pull-right" ><strong>Sub Total</strong></span></th>
												  <th>${invoice.subTotal}</th>
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


<!-- Custom JS -->
<script src="js/utility.js"></script>


<script type="text/javascript">
        $().ready(function(){
			$('#createWorkOrderProduct').validate();
			$('#saveFinalDetails').validate();
            
        });
        
        var t1;
        $(document).ready(function() {

	       /*  $('.datatables').DataTable({
	            "pagingType": "full_numbers",
	            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
	            responsive: true,
	            language: {
	            search: "_INPUT_",
		            searchPlaceholder: "Search records",
		        }
	        }); */
	        
        	 t1 = $('#workTable').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
        
        });
           
        function validateElement(){
       	 
       	 
       	 
            var rowCount = t1.page.info().recordsTotal;
       	 /* var rowCount =parseInt($('#workTable tr').length);
       	 
       	 alert(rowCount); */
       
       	 if(rowCount==0){
       		 
       		 showNotification('Please add an element first','danger');
     		   
     		   return false;
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

<!-- <script type="text/javascript">
            $(function () {
            	$('.datetimepicker').datetimepicker({
                    format: 'YYYY-MM-DD'
              });
            	
            	
            });
            
         </script> -->



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