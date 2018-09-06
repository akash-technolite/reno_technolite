<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--  <c:choose>
	<c:when test="${sessionScope.user=='contractor'}"> --%>
<jsp:include page="contractorSidebar.jsp" />
<%-- </c:when>
	<c:when test="${sessionScope.user=='estimator'}">
	<jsp:include page="estimatorSidebar.jsp" />
	 </c:when>
	<c:otherwise>
	<jsp:include page="installerSidebar.jsp" />
	</c:otherwise>
	</c:choose> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Create Complaint</title>

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

					<a class="navbar-brand" href="#validationforms">Subscription
						Renewal</a>
				</div>
				<span class="pull-right"> </span>
			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">

						<div class="col-md-12">
							<!-- <h2><b>Add Institute</b></h2> -->
							<!-- <h4>Document Center
					<button class="btn btn-info pull-right" data-toggle="modal"
                                            data-target="#myModal">Add Document</button>
				</h4> -->

							<br>

							<!-- <div class="card">
	                     <div class="card-header">
				    <h3 class="card-title">Current  Subscription</h3>
				         </div> -->
							<div class="col-md-12">
								<div class="card-header">
									<h3 class="card-title">Current Subscription</h3>
								</div>
								<div class="col-md-4">

									<div class="card" style="height: 202px !important;">
										<div class="card-block">
											<div class="card-header">
												<center>
													<h4 class="card-title">${current_subscription.subscriptionName}</h4>
												</center>
											</div>
											<h6 class="card-subtitle mb-2 text-muted"></h6>
											<div class="col-md-12">
												<center>
													<h3 class="card-title">
														<p class="text-success">${current_subscription.price}</p>
													</h3>
													<h6>Price</h6>
												</center>
											</div>
											<%-- <div class="col-md-6">
																	<p class="text-info">${current_subscription.subscriberCount}</p>
																	<h6>Subscribers</h6>
																</div> --%>
											<hr
												style="width: 100%; height: 1px; background: #fff; margin-top: 95px !important; margin-bottom: 11px !important;">
											<div class="card-footer text-muted">

												<a href="#myModal"
													class="col-md-6 btn btn-simple btn-info btn-icon like"
													data-toggle="modal" data-target="#myModal"
													onclick="viewDetails(${current_subscription.subscriptionId})">Read</a>


												<c:choose>
													<c:when
														test="${current_subscription.visibility!='Default'}">

														<form action="Subscriptions" method="post"
															onsubmit="return confirm('Please confirm before submitting?');">

															<input type="hidden" name="action" value="renewal">
															<input type="hidden" name="subscription_id"
																value="${current_subscription.subscriptionId}">
															<input type="hidden" name="previous"
																value="${previous_subscription.subscriptionId}">
															<button
																class="col-md-6 btn btn-simple btn-success btn-icon like"
																type="submit" style="padding-left: 0px !important;">
																<script src="https://checkout.stripe.com/checkout.js"
																	class="stripe-button"
																	data-key="pk_test_6pRNASCoBOKtIshFeQd4XMUh"
																	data-amount="${current_subscription.price}"
																	data-name="RenoReferral"
																	data-description="Subscription Renewal" data-image=""
																	data-locale="auto" data-zip-code="true"
																	data-label="Subscribe" data-currency="CAD"
																	data-email="${sessionScope.contractor.contractorEmail}">
																						  </script>
															</button>
														</form>



													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>




												<%-- <c:choose>
																	<c:when test="${sub.subscriberCount==0}">
																	<form action="Subscriptions" method="post"
																		onsubmit="return confirm('Please confirm before submitting?');">
																		<input type="hidden" name="action" value="disable">
																		<input type="hidden" name="subscription_id"
																			value="${sub.subscriptionId}">
																		<button
																			class="col-md-4 btn btn-simple btn-danger btn-icon like"
																			type="submit">Delete</button>
																	</form>
																	</c:when>
																	</c:choose> --%>

												&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
												<%-- <a href="#editModal" class="card-link" data-toggle="modal" onclick="updateDetails(${sub.subscriptionId})" data-target="#editModal">Edit</a> --%>

												<!-- <a href="#" class="card-link">Edit</a> -->
											</div>

										</div>
									</div>

								</div>
							</div>

							<div class="col-md-12">
								<div class="card-header">
									<h3 class="card-title">Previous Subscription</h3>
								</div>
								<div class="col-md-4">

									<div class="card" style="height: 202px !important;">
										<div class="card-block">
											<div class="card-header">
												<center>
													<h4 class="card-title">${previous_subscription.subscriptionName}</h4>
												</center>
											</div>
											<h6 class="card-subtitle mb-2 text-muted"></h6>
											<div class="col-md-12">
												<center>
													<h3 class="card-title">
														<p class="text-success">${previous_subscription.price}</p>
													</h3>
													<h6>Price</h6>
												</center>
											</div>
											<%-- <div class="col-md-6">
																	<p class="text-info">${sub.subscriberCount}</p>
																	<h6>Subscribers</h6>
																</div> --%>
											<hr
												style="width: 100%; height: 1px; background: #fff; margin-top: 95px !important; margin-bottom: 11px !important;">
											<div class="card-footer text-muted">

												<a href="#myModal"
													class="col-md-6 btn btn-simple btn-info btn-icon like"
													data-toggle="modal" data-target="#myModal"
													onclick="viewDetails(${previous_subscription.subscriptionId})">Read</a>
												<c:choose>
													<c:when
														test="${previous_subscription.visibility!='Default'}">

														<form action="Subscriptions" method="post"
															onsubmit="return confirm('Please confirm before submitting?');">

															<input type="hidden" name="action" value="renewal">
															<input type="hidden" name="subscription_id"
																value="${previous_subscription.subscriptionId}">
															<input type="hidden" name="previous"
																value="${previous_subscription.subscriptionId}">
															<button
																class="col-md-6 btn btn-simple btn-success btn-icon like"
																type="submit" style="padding-left: 0px !important;">
																<script src="https://checkout.stripe.com/checkout.js"
																	class="stripe-button"
																	data-key="pk_test_6pRNASCoBOKtIshFeQd4XMUh"
																	data-amount="${previous_subscription.price}"
																	data-name="RenoReferral"
																	data-description="Subscription Renewal" data-image=""
																	data-locale="auto" data-zip-code="true"
																	data-label="Subscribe" data-currency="CAD"
																	data-email="${sessionScope.contractor.contractorEmail}">
																						  </script>
															</button>
														</form>



													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>

												<%-- <form action="Subscriptions" method="post"
																		onsubmit="return confirm('Please confirm before submitting?');">
																		<input type="hidden" name="action" value="makePrivate">
																		<input type="hidden" name="subscription_id"
																			value="${sub.subscriptionId}">

																		<button
																			class="col-md-4 btn btn-simple btn-info btn-icon like"
																			type="submit" style="padding-left:0px !important;">Make Private</button>
																	</form>
																	
																	<c:choose>
																	<c:when test="${sub.subscriberCount==0}">
																	<form action="Subscriptions" method="post"
																		onsubmit="return confirm('Please confirm before submitting?');">
																		<input type="hidden" name="action" value="disable">
																		<input type="hidden" name="subscription_id"
																			value="${sub.subscriptionId}">
																		<button
																			class="col-md-4 btn btn-simple btn-danger btn-icon like"
																			type="submit">Delete</button>
																	</form>
																	</c:when>
																	</c:choose> --%>

												&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
												<%-- <a href="#editModal" class="card-link" data-toggle="modal" onclick="updateDetails(${sub.subscriptionId})" data-target="#editModal">Edit</a> --%>

												<!-- <a href="#" class="card-link">Edit</a> -->
											</div>

										</div>
									</div>

								</div>
							</div>


							<div class="col-md-12">
								<div class="card-header">
									<h3 class="card-title">Choose Another Subscription</h3>
								</div>

								<c:forEach items="${subscriptions}" var="sub">
									<div class="col-md-4">

										<div class="card" style="height: 202px !important;">
											<div class="card-block">
												<div class="card-header">
													<center>
														<h4 class="card-title">${sub.subscriptionName}</h4>
													</center>
												</div>
												<h6 class="card-subtitle mb-2 text-muted"></h6>
												<div class="col-md-12">
													<center>
														<h3 class="card-title">
															<p class="text-success">${sub.price}</p>
														</h3>
														<h6>Price</h6>
													</center>
												</div>
												<%-- <div class="col-md-6">
																	<p class="text-info">${sub.subscriberCount}</p>
																	<h6>Subscribers</h6>
																</div> --%>
												<hr
													style="width: 100%; height: 1px; background: #fff; margin-top: 95px !important; margin-bottom: 11px !important;">
												<div class="card-footer text-muted">

													<a href="#myModal"
														class="col-md-6 btn btn-simple btn-info btn-icon like"
														data-toggle="modal" data-target="#myModal"
														onclick="viewDetails(${sub.subscriptionId})">Read</a>

													<form action="Subscriptions" method="post"
														onsubmit="return confirm('Please confirm before submitting?');">


														<input type="hidden" name="action" value="renewal">
														<input type="hidden" name="subscription_id"
															value="${sub.subscriptionId}"> <input
															type="hidden" name="previous"
															value="${previous_subscription.subscriptionId}">

														<button
															class="col-md-6 btn btn-simple btn-success btn-icon like"
															type="submit" style="padding-left: 0px !important;">
															<script src="https://checkout.stripe.com/checkout.js"
																class="stripe-button"
																data-key="pk_test_6pRNASCoBOKtIshFeQd4XMUh"
																data-amount="${sub.price}" data-name="RenoReferral"
																data-description="Subscription Renewal" data-image=""
																data-locale="auto" data-zip-code="true"
																data-label="Subscribe" data-currency="CAD"
																data-email="${sessionScope.contractor.contractorEmail}">
																						  </script>
														</button>
													</form>
													<%-- <form action="Subscriptions" method="post"
																		onsubmit="return confirm('Please confirm before submitting?');">
																		<input type="hidden" name="action" value="makePrivate">
																		<input type="hidden" name="subscription_id"
																			value="${sub.subscriptionId}">

																		<button
																			class="col-md-4 btn btn-simple btn-info btn-icon like"
																			type="submit" style="padding-left:0px !important;">Make Private</button>
																	</form>
																	
																	<c:choose>
																	<c:when test="${sub.subscriberCount==0}">
																	<form action="Subscriptions" method="post"
																		onsubmit="return confirm('Please confirm before submitting?');">
																		<input type="hidden" name="action" value="disable">
																		<input type="hidden" name="subscription_id"
																			value="${sub.subscriptionId}">
																		<button
																			class="col-md-4 btn btn-simple btn-danger btn-icon like"
																			type="submit">Delete</button>
																	</form>
																	</c:when>
																	</c:choose> --%>

													&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													<%-- <a href="#editModal" class="card-link" data-toggle="modal" onclick="updateDetails(${sub.subscriptionId})" data-target="#editModal">Edit</a> --%>

													<!-- <a href="#" class="card-link">Edit</a> -->
												</div>

											</div>
										</div>
									</div>
								</c:forEach>

							</div>



						</div>
						<!--col-md-12-->
					</div>
					<!--row-->
				</div>
				<!--container-fluid-->
			</div>
			<!--content end-->


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

<!-- 	<script type="text/javascript">
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
	    
	    
	</script> -->

<script>
  /* $(function() {
    $('#toggle-two').bootstrapToggle({
      on: 'Enabled',
      off: 'Disabled'
    });
  }) */
</script>
<!-- 
Add Modal
	
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Document</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
                  	<div class="container-fluid">
	   		   
	   			<div class="col-md-12">
	   			<div class="row">
	            	<form id="addDocumentForm" action="DocumentUploader" method="post" enctype="multipart/form-data">               
	                	
	                   	
	                   	<div class="">
	                   	<div class="form-group">
	                      		<label class="control-label">Document Name<star>*</star>
												</label>
		                                        
		                                            <input class="form-control"
		                                                   type="text"
		                                                   name="docname"
		                                                   required="true"
		                                                   autocomplete="off"
		                                                   maxlength="50"
													/>
					                      </div>
					                      </div>
	                      
	                      <div class="">
	                   	<div class="form-group">
	                      		<label class="control-label">
													Document Type<star>*</star>
												</label>
		                                        
		                                            <input class="form-control"
		                                                   type="text"
		                                                   name="doctype"
		                                                   required="true"
		                                                   autocomplete="off"
		                                                   maxlength="50"
													/>
	                      </div>
	                      </div>
	                     
	                     
	                     <div class="">
	                     <label class="control-label">Document Discription</label>
	                   	
	                      	 <div class="form-group">
                                                    <textarea type="text" 
                                                     class="form-control"
                                                     rows="3"
                                                     name="description"
	                                                 id="description"
                                                     required="true"
                                                     maxlength="250"
                                                     
                                                    ></textarea>
	                                        </div>
	                      </div>
	                      
	                            <div class="">
	                                       <label class="control-label">Upload Document<star>*</star></label>
	                                      
	                                       <div class="form-group">
	                                        <input class="form-control selectpicker"
	                                               name="file"
	                                               id="file"
	                                               type="file"
	                                             />
	                            </div>
	                      </div>
	                   	
	                   	<div class="">
	                         <div class="category"><star>*</star> Required fields</div>
	                    </div>            
	                         
	                         <div class="">       
							<div class="modal-footer">
								<button type="submit" class="btn btn-success btn-fill">Upload</button>
								<button type="reset" class="btn btn-default btn-fill">Clear</button>
									<div class="form-group pull-left">
										<label class="checkbox">
											<input type="checkbox" data-toggle="checkbox" value="subscribe">
											
											</label>
									</div>
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
      </div> -->

<!--Edit Modal -->
<!-- 	
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Document</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
                  	<div class="container-fluid">
	   		   
	   			<div class="col-md-12">
	   			<div class="row">
	            	<form id="editDocumentForm" action="DocumentUpdater" method="post" enctype="multipart/form-data">               
	                	
	                   	   
	                   	<div class="">
	                   	<div class="form-group">
	                      		<label class="control-label">Document Name<star>*</star>
												</label>
		                                        
		                                            <input class="form-control"
		                                                   type="text"
		                                                   name="docname"
		                                                   id="edocname"
		                                                   required="true"
		                                                   autocomplete="off"
		                                                   maxlength="50"
													/>
					                      </div>
					                      </div>
	                      
				                      <div class="">
				                   	<div class="form-group">
				                      		<label class="control-label">
																Document Type<star>*</star>
															</label>
					                                        
					                                            <input class="form-control"
					                                                   type="text"
					                                                   name="doctype"
					                                                    id="edoctype"
					                                                   required="true"
					                                                   autocomplete="off"
					                                                   maxlength="50"
																/>
				                      </div>
				                      </div>
	                     
	                   
	                     <div class="">
	                     <label class="control-label">Document Discription</label>
	                   	
	                      	 <div class="form-group">
                                                    <textarea type="text" 
                                                     class="form-control"
                                                     rows="3"
                                                     name="description"
                                                     id="edescription"
                                                     required="true"
                                                     maxlength="500"
                                                     
                                                    ></textarea>
	                                        </div>
	                      </div>
	                        
	                        <div class="col-sm-12 form-group">
	                   	
	                   	    <a target="_blank" id="viewDoc" class="btn btn-success" >View Old Document</a>
	                   	
	                   	   </div>
	                        
	                            <div class="">
	                                       <label class="control-label">Upload Document<star>*</star></label>
	                                      
	                                       <div class="form-group">
	                                        <input class="form-control selectpicker"
	                                               name="file"
	                                               id="file"
	                                               type="file"
	                                             />
	                            </div>
	                      </div>
	                   
	                   	 
	                   	
	                   	
	                   	 <input type="hidden" id="edocument_id" name="document_id"> 
	                   	
	                   	
	                   	<div class="">
	                         <div class="category"><star>*</star> Required fields</div>
	                    </div>            
	                         
	                         <div class="">       
							<div class="modal-footer">
								<button type="submit" class="btn btn-success btn-fill">Upload</button>
								<button type="reset" class="btn btn-default btn-fill">Clear</button>
									<div class="form-group pull-left">
										<label class="checkbox">
											<input type="checkbox" data-toggle="checkbox" value="subscribe">
											
											</label>
									</div>
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
      </div>
      
      
      Share Modal
      <div class="modal fade" id="shareModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Share Document</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
                  	<div class="container-fluid">
	   		   
	   			<div class="col-md-12">
	   			<div class="row">
	               	<form id="editDocumentForm" action="DocumentController" method="post"">               
	                	
	                                    <div class= form-group">
	                                 <label class="control-label">Select Employee<star>*</star></label>
	                                        <select  class="selectpicker"  
	                                               id="employee_id"
	                                               name="employee_id"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                               data-live-search="true"
	                                           >
	                                        </select>
	                                    </div>
	                                   
	                       <input type="hidden" id="share_document_id" name="document_id">        
	                                
	                   	 <input type="hidden"  name="action" value="share"> 
	                   	
	                   	
	                   	<div class="">
	                         <div class="category"><star>*</star> Required fields</div>
	                    </div>            
	                         
	                         <div class="">       
							<div class="modal-footer">
								<button type="submit" class="btn btn-success btn-fill">Share</button>
				            <div class="form-group pull-left">
										<label class="checkbox">
											<input type="checkbox" data-toggle="checkbox" value="subscribe">
											
											</label>
									</div>
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
      </div> -->

<!-- READ MODEL -->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Subscriptions</h4>
			</div>
			<div class="modal-body">
				<h3 id="subName">
					<strong></strong>
				</h3>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">

						<thead>
							<th><strong>Action</strong></th>
							<th><strong>Details</strong></th>
						</thead>
						<tbody>
							<tr>
								<td>Reno Referral Leads</td>
								<td id="renoRefLeads"></td>

							</tr>
							<tr>
								<td>Reno Referral Leads Limit</td>
								<td id="renoLeadLimit"></td>

							</tr>
							<tr>
								<td>Purchase Leads</td>
								<td id="purchaseLeads"></td>

							</tr>
							<tr>
								<td>Purchase Leads Limit</td>
								<td id="purchaseLeadLimit"></td>

							</tr>
							<tr>
								<td>Create Leads</td>
								<td id="createLeads"></td>

							</tr>
							<tr>
								<td>Create Leads Limit</td>
								<td id="createLeadLimit"></td>

							</tr>
							<tr>
								<td>Create Employees</td>
								<td id="createEmployees"></td>

							</tr>
							<tr>
								<td>Create Employees Limit</td>
								<td id="createEmployeeLimit"></td>

							</tr>
							<tr>
								<td>Create Subcontractor</td>
								<td id="createSubcontractors"></td>

							</tr>
							<tr>
								<td>Create Subcontractor Limit</td>
								<td id="createSubConLimit"></td>

							</tr>
							<!-- <tr>
														<td>Lead Management</td>
														<td id="leadManagement"></td>

													</tr> -->
							<tr>
								<td>Sign Contact</td>
								<td id="signContact"></td>

							</tr>

							<tr>
								<td>Upload Contact</td>
								<td id="uploadContact"></td>

							</tr>

							<tr>
								<td>Price</td>
								<td id="price"></td>

							</tr>
							<tr>
								<td>Note</td>
								<td id="note"></td>

							</tr>
							<tr>
								<td>Visibility</td>
								<td id="visibility"></td>

							</tr>
						</tbody>
					</table>
				</div>



			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<script>
	
	function viewDetails(subscId)
	{
	
			var subId=subscId;
			
    	$.get('AjaxSubscriptionById',{
    		subId:subId
 		},function(responseJson) {
 			
 		 
 			$("#subName").text(responseJson.subscriptionName);		
 			$("#renoRefLeads").text(responseJson.renoRefLeads);		
 			$("#purchaseLeads").text(responseJson.purchaseLeads);		
 			$("#createLeads").text(responseJson.createLeads);		
 			$("#createEmployees").text(responseJson.createEmployees);		
 			$("#createSubcontractors").text(responseJson.createSubcontractors);		
 			$("#leadManagement").text(responseJson.LeadManagement);		
 			$("#signContact").text(responseJson.signContact);
 			$("#uploadContact").empty();
 			/* $("#uploadContact").append("<iframe src="+responseJson.uploadContact+" width='100%;'></iframe>");		 */
 			if(responseJson.uploadContact!='No Document to Show'){
 			$("#uploadContact").append("<a href="+responseJson.uploadContact+">View</a> <a href="+responseJson.uploadContact+" download>Download</a>")
 			}else{
 				
 				$("#uploadContact").append(responseJson.uploadContact);
 			}
 			$("#price").text(responseJson.price);		
 			$("#note").text(responseJson.note);		
 			$("#renoLeadLimit").text(responseJson.renoLeadLimit);
 			$("#subscriberCount").text(responseJson.subscriberCount);		
 			$("#purchaseLeadLimit").text(responseJson.purchaseLeadLimit);		
 			$("#createLeadLimit").text(responseJson.createLeadLimit);		
 			$("#createEmployeeLimit").text(responseJson.createEmployeeLimit);		
 			$("#createSubConLimit").text(responseJson.createSubConLimit);		
 			$("#visibility").text(responseJson.visibility);	
 			
 	}); 		
	}	
</script>

<script type="text/javascript">

   /*    $().ready(function(){
    		 
    	   	 
  		$('#addDocumentForm').validate();
  	    $('#editDocumentForm').validate();
  	    
  	    
  	    
  	    
  	      
  	    
     });
      
      $(".editbtn").click(function(){
    	  
     	 var document_id=parseInt($(this).val());
     	  
     	
     	  
                 $.post("AjaxForDocument",
     		    {
                	 document_id:document_id,
     		        
     		    },
     		    function(data){
     		    	
     		         $("#edocument_id").val(data.document_id);
     		    	 $("#edocname").val(data.document_name);
     		    	 $("#edoctype").val(data.document_type);
     		    	 $("#edescription").val(data.document_description);
     		    	 $("#viewDoc").attr("href",data.document_path);
     		    	
     		    	 
     		    		
     		       
     		    });
       });
      
      
      $(".sharebtn").click(function(){
    	  
      	 var document_id=parseInt($(this).val());
      	  
      	 $("#share_document_id").val(document_id);
      	
      	 $('#employee_id').empty();
      	  
      	 $.post("AjaxGetEmployees",
     		    {},
     		    function(data){
     		    	
     		    	$.each(data, function(key, value) {   
     		    		
     		    		 $('#employee_id').append($("<option></option>")
     		    	                    .attr("value",value.employee_id)
     		    	                    .text(value.employee_name)); 
     		    	}); 
     		    	
     		    	 $('#employee_id').selectpicker('refresh');
     		    	
     		  });
        }); 
          	  */
      	     
      
      
      
      
      
      
      

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

</html>