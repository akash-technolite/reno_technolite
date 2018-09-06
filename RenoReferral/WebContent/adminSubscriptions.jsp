<%@page import="com.tlite.connection.DBConnection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ page import="java.sql.*"%>
<jsp:include page="sidebar.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<a class="navbar-brand" href="#">Manage Subscriptions</a>
					</div>
					<!-- <span
						class="pull-right"> <a class="navbar-brand"
						href="createSubscription.jsp"><button type="button"
								class="btn btn-info btn-fill">Create New</button> </a>
					</span> -->
					<!--  <ul class="nav navbar-nav navbar-right">
	                        <li>
	                            <a href="createSubscription.jsp" class=" btn-magnify" >
	                                <i class="ti-star"></i>
									<p>Create New</p>
	                            </a>
	                        </li>
	                 </ul> -->

					<div class="collapse navbar-collapse">

						<ul class="nav navbar-nav navbar-right">
							<li><a href="createSubscription.jsp" class="btn-rotate">
									<i class="ti-star"></i>
									<p>Create New</p>
							</a></li>
						</ul>
					</div>


				</div>
				</nav>

				<div class="col-md-12">
					<div class="content">

						<div class="container-fluid">
							<h4 class="card-title">All Subscriptions</h4>

							<!-- <h3></h3>
<h5 class="card-title">All Subscription</h5>
 -->

							<!--   <div class="nav-tabs-navigation">
				                        <div class="nav-tabs-wrapper">
					                        <ul id="tabs" class="nav  nav-pills nav-tabs nav-justified">
					                            <li class="active"><a href="#home" data-toggle="tab">Public Subscriptions</a></li>
					                            <li><a href="#profile" data-toggle="tab">Private Subscriptions </a></li>
					                          
					                        </ul>
				                        </div>
				                    </div> -->
							<nav class="navbar">
							<div class="container-fluid">
								<div class="navbar-header"></div>
								<div class="col-md-12" style="margin-bottom: 10px !important;">

									<div class="col-offset-md-6 col-md-6">
										<ul class="nav  nav-pills  nav-justified">

											<li class="active"><a data-toggle="tab" href="#home">Public
											</a></li>


											<li><a data-toggle="tab" href="#profile">Private </a></li>

											<li><a data-toggle="tab" href="#defaultSub">Default
											</a></li>

										</ul>
									</div>

								</div>
							</div>
							</nav>



							<div id="my-tab-content" class="tab-content text-center">

								<div class="tab-pane active" id="home">

									<div class="content">
										<div class="container-fluid">
											<div class="row">
												<%-- <div><h3 align="center" style="color:green">${SuccessMessage}</h3></div> 
					     
					<div><h3 align="center" style="color:red">${ErrorMessage}</h3></div> 
					  --%>

												<c:forEach items="${subscriptionsList}" var="sub">

													<div class="col-md-4">

														<%-- <div class="card"  style="height:202px !important;">
															<div class="card-block">
																<div class="card-header">
																	<h4 class="card-title">${sub.subscriptionName}</h4>
																</div>
																<h6 class="card-subtitle mb-2 text-muted"></h6>
																<div class="col-md-6">
																	<h3 class="card-title">
																		<p class="text-success">${sub.price}</p>
																	</h3>
																	<h6>Price</h6>
																</div>
																<div class="col-md-6">
																	<p class="text-info">${sub.subscriberCount}</p>
																	<h6>Subscribers</h6>
																</div>
																<hr style="width: 100%; height: 1px; background: #fff; margin-top:95px !important; margin-bottom:11px !important;">
																<div class="card-footer text-muted">

																	<a href="#myModal"
																		class="col-md-4 btn btn-simple btn-info btn-icon like"
																		data-toggle="modal" data-target="#myModal"
																		onclick="viewDetails(${sub.subscriptionId})">Read</a>

																	<form action="Subscriptions" method="post"
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
																	</c:choose>
																	
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	<a href="#editModal" class="card-link" data-toggle="modal" onclick="updateDetails(${sub.subscriptionId})" data-target="#editModal">Edit</a>

																	<!-- <a href="#" class="card-link">Edit</a> -->
																</div>

															</div>
														</div> --%>


														<div class="card">
															<div class="card-content">
																<div class="row">
																	<div class="card-title">
																		<h4 class="card-title">${sub.subscriptionName}</h4>
																	</div>
																	<h6 class="card-subtitle mb-2 text-muted"></h6>
																	<div class="col-xs-6">
																		<p class="text-success">$ ${sub.price/100}</p>
																		<h6>Price</h6>
																	</div>
																	<div class="col-xs-6">
																		<p class="text-info">${sub.subscriberCount}</p>
																		<h6>Subscribers</h6>
																	</div>
																</div>
															</div>
															<div class="card-footer">
																<hr />
																<div class="stats">
																	<div class="row">
																		<a href="#myModal"
																			class="col-md-4 btn btn-simple btn-info btn-icon like"
																			data-toggle="modal" data-target="#myModal"
																			onclick="viewDetails(${sub.subscriptionId})">Read</a>

																		<form action="Subscriptions" method="post"
																			onsubmit="return confirm('Please confirm before submitting?');">
																			<input type="hidden" name="action"
																				value="makePrivate"> <input type="hidden"
																				name="subscription_id" value="${sub.subscriptionId}">

																			<button
																				class="col-md-4 btn btn-simple btn-info btn-icon like"
																				type="submit" style="padding-left: 0px !important;">Make
																				Private</button>
																		</form>

																		<c:choose>
																			<c:when test="${sub.subscriberCount==0}">
																				<form action="Subscriptions" method="post"
																					onsubmit="return confirm('Are you sure you want to delete this subscription?');">
																					<input type="hidden" name="action" value="disable">
																					<input type="hidden" name="subscription_id"
																						value="${sub.subscriptionId}">
																					<button
																						class="col-md-4 btn btn-simple btn-danger btn-icon like"
																						type="submit">Delete</button>
																				</form>
																			</c:when>
																		</c:choose>
																	</div>
																</div>
															</div>
														</div>


													</div>


													<!-- FINISH MODEL -->
												</c:forEach>

												<!-- EDIT SUBSCRIPTION -->
											</div>
										</div>
									</div>
								</div>






								<!-- tab 2 -->
								<div class="tab-pane" id="profile">


									<div class="content">
										<div class="container-fluid">
											<div class="row">
												<c:forEach items="${subscriptionPrivate}" var="sub">

													<div class="col-md-4">

														<%-- <div class="card">
															<div class="card-block">
																<div class="card-header subscriptionName">
																	<h4 class="card-title">${sub.subscriptionName}</h4>
																</div>
																<h6 class="card-subtitle mb-2 text-muted"></h6>
																<div class="col-md-6">
																	<p class="text-success">${sub.price}</p>
																	<h6>Price</h6>
																</div>
																<div class="col-md-6">
																	<p class="text-info">${sub.subscriberCount}</p>
																	<h6>Subscribers</h6>
																</div>
																<hr style="width: 100%; height: 1px; background: #fff; margin-top:95px !important; margin-bottom:11px !important;">
																<div class="card-footer text-muted" style="padding-bottom:0px !important;">

																		<a href="#myModal"
																		class="col-md-4 btn btn-simple btn-info btn-icon like"
																		data-toggle="modal" data-target="#myModal"
																		onclick="viewDetails(${sub.subscriptionId})">Read</a>

																	<form action="Subscriptions" method="post"
																		onsubmit="return confirm('Please confirm before submitting?');">
																		<input type="hidden" name="action" value="makePublic">
																		<input type="hidden" name="subscription_id"
																			value="${sub.subscriptionId}">

																		<button
																			class="col-md-4 btn btn-simple btn-info btn-icon like"
																			type="submit" style="padding-left:0px !important;">Make Public</button>
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
																	</c:choose>
																	
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	<a href="#editModal" class="card-link" data-toggle="modal" onclick="updateDetails(${sub.subscriptionId})"  data-target="#editModal">Edit</a>

																	<!--  <a href="#" class="card-link">Edit</a> -->

																</div>

															</div>
														</div> --%>


														<div class="card">
															<div class="card-content">
																<div class="row">
																	<div class="card-title">
																		<h4 class="card-title">${sub.subscriptionName}</h4>
																	</div>
																	<h6 class="card-subtitle mb-2 text-muted"></h6>
																	<div class="col-xs-6">
																		<p class="text-success">$ ${sub.price/100}</p>
																		<h6>Price</h6>
																	</div>
																	<div class="col-xs-6">
																		<p class="text-info">${sub.subscriberCount}</p>
																		<h6>Subscribers</h6>
																	</div>
																</div>
															</div>
															<div class="card-footer">
																<hr />
																<div class="stats">
																	<div class="row">
																		<a href="#myModal"
																			class="col-md-4 btn btn-simple btn-info btn-icon like"
																			data-toggle="modal" data-target="#myModal"
																			onclick="viewDetails(${sub.subscriptionId})">Read</a>

																		<form action="Subscriptions" method="post"
																			onsubmit="return confirm('Please confirm?');">
																			<input type="hidden" name="action" value="makePublic">
																			<input type="hidden" name="subscription_id"
																				value="${sub.subscriptionId}">

																			<button
																				class="col-md-4 btn btn-simple btn-info btn-icon like"
																				type="submit" style="padding-left: 0px !important;">Make
																				Public</button>
																		</form>
																		<c:choose>
																			<c:when test="${sub.subscriberCount==0}">
																				<form action="Subscriptions" method="post"
																					onsubmit="return confirm('Are you sure you want to delete this subscription?');">
																					<input type="hidden" name="action" value="disable">
																					<input type="hidden" name="subscription_id"
																						value="${sub.subscriptionId}">
																					<button
																						class="col-md-4 btn btn-simple btn-danger btn-icon like"
																						type="submit">Delete</button>
																				</form>
																			</c:when>
																		</c:choose>
																	</div>
																</div>
															</div>
														</div>



													</div>

													<!-- FINISH MODEL -->
												</c:forEach>

												<!-- EDIT SUBSCRIPTION -->





											</div>
										</div>
									</div>




								</div>

								<div class="tab-pane" id="defaultSub">
									<div class="content">
										<div class="container-fluid">
											<div class="row">
												<div class="col-md-4">
													<div class="card">
														<div class="card-content">
															<div class="row">
																<div class="card-title">
																	<h4 class="card-title">${defaultSub.subscriptionName}</h4>
																</div>
																<h6 class="card-subtitle mb-2 text-muted"></h6>
																<div class="col-xs-6">
																	<p class="text-success">${defaultSub.price}</p>
																	<h6>Price</h6>
																</div>
																<div class="col-xs-6">
																	<p class="text-info">${defaultSub.subscriberCount}</p>
																	<h6>Subscribers</h6>
																</div>
															</div>
														</div>
														<div class="card-footer">
															<hr />
															<div class="stats">
																<div class="row">
																	<a href="#myModal"
																		class="col-md-6 btn btn-simple btn-info btn-icon like"
																		data-toggle="modal" data-target="#myModal"
																		onclick="viewDetails(${defaultSub.subscriptionId})">Read</a>
																	<a href="#editModal"
																		class="col-md-6 btn btn-simple btn-info btn-icon like"
																		data-toggle="modal"
																		onclick="updateDetails(${defaultSub.subscriptionId})"
																		data-target="#editModal">Edit</a>

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
																		onsubmit="return confirm('Are you sure you want to delete this subscription?');">
																		<input type="hidden" name="action" value="disable">
																		<input type="hidden" name="subscription_id"
																			value="${sub.subscriptionId}">
																		<button
																			class="col-md-4 btn btn-simple btn-danger btn-icon like"
																			type="submit">Delete</button>
																	</form>
																	</c:when>
																	</c:choose> --%>
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








							<!-- Modal -->
							<div id="editModal" class="modal fade" role="dialog">
								<div class="modal-dialog modal-lg">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Update Default Subscription</h4>
										</div>
										<div class="modal-body">


											<div class="col-md-12 ">
												<div class="card">
													<div>
														<h3 align="center" style="color: green">${msg}</h3>
													</div>

													<!-- <form id="" action="UpdateSubscription" method="post"
														enctype="multipart/form-data"> -->
													<form id="updateForm" action="UpdateSubscription"
														method="post">
														<!-- <div on class="card-header">
															<h4 class="modal-title">Update Subscription</h4>
														</div> -->

														<div class="card-content">



															<fieldset>
																<div class="column-sizing">
																	<div class="col-sm-12">
																		<div class="row">

																			<input id="usubscriptionId" name="subscriptionId"
																				type="hidden" />

																			<div class="col-sm-12"
																				style="margin-bottom: 15px !important;">
																				<div class="form-group">
																					<div class="col-md-2 ">
																						<label class="control-label">
																							Subscription Name <star>*</star>
																						</label>
																					</div>
																					<div class="col-md-10">
																						<input class="form-control" id="usubscriptionName"
																							name="subscriptionName" type="text"
																							readonly="readonly" />
																					</div>
																				</div>
																			</div>

																			<div class="col-md-12"
																				style="margin-bottom: 15px !important;">

																				<div class="col-md-6">
																					<div class="form-group">
																						<div class="col-md-4">
																							<label class="control-label">Reno
																								Referal Leads<star>*</star>
																							</label>
																						</div>
																						<div class="col-md-8">
																							<select class="form-control selectpicker"
																								id="uRenoLeads" name="RenoLeads" type="text"
																								required="true" autocomplete="off"
																								list="oRenoLeads" maxlength="15">

																								<option value="Allowed">Allowed</option>
																								<option value="Not Allowed">Not Allowed</option>
																								<option value="Unlimited">Unlimited</option>
																							</select>
																						</div>
																					</div>
																				</div>

																				<div class="col-md-6">
																					<div class="form-group">
																						<div class="col-md-4">
																							<label class="control-label"
																								style="margin-top: 8px !important;"> Set
																								Limit </label>
																						</div>
																						<div class="col-md-8">
																							<input class="form-control" id="urenoLeadLimit"
																								name="renoLeadLimit" type="text" value="0"
																								maxlength="4" number="true" autocomplete="off" />
																						</div>
																					</div>
																				</div>
																			</div>






																			<!--    <div class="col-md-12">
	                                   
	                                  <div class="form-group">
	                                        <label class="control-label">
											Subscription Name <star>*</star>
											</label>
	                                        <input class="form-control"
	                                               id="subscriptionName"
	                                               name="subscriptionName"
	                                               type="text"
	                                               required="true"
	                                             autocomplete="off"
											/>
											 </div>
	                                  </div>
	                                
	                                 
	                                 
	                               <div class="col-md-6 form-group">
	                                        <label class="control-label">
												Reno Referal Leads<star>*</star>
											</label>
	                                        <select  class="form-control selectpicker"  
	                                               id="RenoLeads"
	                                               name="RenoLeads"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                               list="oRenoLeads"
	                                           >
	                                     
	                                        <option value="Allowed">Allowed</option>
	                                        <option value="Not Allowed">Not Allowed</option>
	                                         
	                                          </select>       
	                                        
	                                    </div> 
	                                    
	                                    
	                                
	                                                    
	                                                
	                                
	                                    <div class="col-md-6 form-group column-sizing">
	                                        <label class="control-label">
											Set Limit<star>*</star>
											</label>
	                                        <input class="form-control"
	                                               id="renoLeadLimit"
	                                               name="renoLeadLimit"
	                                               type="text"
	                                               required="true"
	                                             autocomplete="off"
											/>
											 </div> -->





																			<div class="col-md-12"
																				style="margin-bottom: 15px !important;">

																				<div class="col-md-6">
																					<div class="form-group">
																						<div class="col-md-4">
																							<label class="control-label"
																								style="margin-top: 8px !important;">
																								Purchase Lead<star>*</star>
																							</label>
																						</div>
																						<div class="col-md-8">
																							<select class="form-control selectpicker"
																								id="upurchaseLeads" name="purchaseLeads"
																								type="text" required="true" autocomplete="off"
																								maxlength="15">
																								<option value="Allowed">Allowed</option>
																								<option value="Not Allowed" selected>Not
																									Allowed</option>
																								<option value="Unlimited">Unlimited</option>
																							</select>
																						</div>
																					</div>
																				</div>


																				<div class="col-md-6">
																					<div class="form-group">
																						<div class="col-md-4">
																							<label class="control-label"
																								style="margin-top: 8px !important;"> Set
																								Limit </label>
																						</div>
																						<div class="col-md-8">
																							<input class="form-control"
																								id="upurchaseLeadLimit" name="purchaseLeadLimit"
																								type="text" value="0" autocomplete="off"
																								maxlength="4" number="true" readonly="readonly" />
																						</div>
																					</div>
																				</div>
																			</div>

																			<div class="col-md-12"
																				style="margin-bottom: 15px !important;">

																				<div class="col-md-6">
																					<div class="form-group">
																						<div class="col-md-4">
																							<label class="control-label"
																								style="margin-top: 8px !important;">
																								Create Leads:<star>*</star>
																							</label>
																						</div>
																						<div class="col-md-8">
																							<select class="form-control selectpicker"
																								id="ucreateLeads" name="createLeads" type="text"
																								required="true" autocomplete="off"
																								list="oCreateLeads" maxlength="15">

																								<option value="Allowed">Allowed</option>
																								<option value="Not Allowed">Not Allowed</option>
																								<option value="Unlimited">Unlimited</option>

																							</select>
																						</div>
																					</div>
																				</div>


																				<div class="col-md-6">
																					<div class="form-group">
																						<div class="col-md-4">
																							<label class="control-label"
																								style="margin-top: 8px !important;"> Set
																								Limit </label>
																						</div>
																						<div class="col-md-8">
																							<input class="form-control" id="ucreateLeadLimit"
																								name="createLeadLimit" type="text"
																								placeholder="0" maxlength="4" number="true"
																								autocomplete="off" />
																						</div>
																					</div>
																				</div>

																			</div>


																			<div class="col-md-12"
																				style="margin-bottom: 15px !important;">

																				<div class="col-md-6">
																					<div class=" form-group ">
																						<div class="col-md-4">
																							<label class="control-label"> Create
																								Employees<star>*</star>
																							</label>
																						</div>
																						<div class="col-md-8">
																							<select class="form-control selectpicker"
																								id="ucreateEmployees" name="createEmployees"
																								type="text" required="true" autocomplete="off"
																								list="oCreateEmployees" maxlength="15">
																								<option value="Allowed">Allowed</option>
																								<option value="Not Allowed">Not Allowed</option>
																								<option value="Unlimited">Unlimited</option>

																							</select>
																						</div>
																					</div>
																				</div>


																				<div class="col-md-6">
																					<div class="form-group">
																						<div class="col-md-4">
																							<label class="control-label"
																								style="margin-top: 8px !important;"> Set
																								Limit </label>
																						</div>
																						<div class="col-md-8">
																							<input class="form-control"
																								id="ucreateEmployeeLimit"
																								name="createEmployeeLimit" type="text"
																								placeholder="0" maxlength="4" number="true"
																								autocomplete="off" maxlength="15" />
																						</div>
																					</div>
																				</div>

																			</div>



																			<div class="col-md-12"
																				style="margin-bottom: 15px !important;">

																				<div class="col-md-6">
																					<div class=" form-group">
																						<div class="col-md-4">
																							<label class="control-label"> Create
																								Sub-Contractors<star>*</star>
																							</label>
																						</div>
																						<div class="col-md-8">
																							<select class="form-control selectpicker"
																								id="ucreateSubContractor"
																								name="createSubContractor" type="text"
																								required="true" autocomplete="off"
																								list="oCreateSubContractor" maxlength="15">

																								<option value="Allowed">Allowed</option>
																								<option value="Not Allowed">Not Allowed</option>
																								<option value="Unlimited">Unlimited</option>

																							</select>
																						</div>
																					</div>
																				</div>


																				<div class="col-md-6">
																					<div class="form-group">
																						<div class="col-md-4">
																							<label class="control-label"
																								style="margin-top: 8px !important;"> Set
																								Limit </label>
																						</div>
																						<div class="col-md-8">
																							<input class="form-control"
																								id="ucreateSubConLimit" name="createSubConLimit"
																								type="text" placeholder="0" maxlength="4"
																								number="true" autocomplete="off" />
																						</div>
																					</div>
																				</div>

																			</div>




																			<!--       
	                                     <div class="form-group">
	                                        <label class="control-label">
											Lead Management<star>*</star>
											</label>
	                                        <input  class="form-control"  
	                                               id="leadManagement"
	                                               name="leadManagement"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                                list="oLeadManagement"
	                                           >
	                                      <datalist id="oLeadManagement">
	                                       <option value="Allowed">Allowed</option>
	                                        <option value="Not Allowed">Not Allowed</option>    
	                                         <option  value="Only When Working On Lead">Only When Working On Lead</option>    
	                                           </datalist>    
	                                    </div> -->


																			<!--  <div class="col-md-12" style="margin-bottom:15px !important;">
	                                    
	                                    <div class="col-md-6">
	                                     <div class="form-group">
	                                     <div class="col-md-4">
	                                        <label class="control-label" style="margin-top:8px !important;">
											Sign Contract:<star>*</star>
											</label>
											</div>
											<div class="col-md-8">
	                                        <select  class="form-control selectpicker"  
	                                               id="signContact"
	                                               name="signContact"
	                                               type="text"
	                                                value="0"
	                                               autocomplete="off"
	                                               list="oSignContact"
	                                               maxlength="15"
	                                           >
	                                       
	                                       <option value="Yes">Yes</option>
	                                        <option value="No" selected>No</option>    
	                                         
	                                       </select>
	                                       </div>   
	                                    </div>
	                                    </div>
	                                    
	                                    
	                                    <div class="col-md-6">
	                                     <div class="form-group">
	                                     	<div class="col-md-4">
	                                        <label class="control-label" style="margin-top:8px !important;">
											price(in Cents):<star>*</star>
											</label>
											</div>
											<div class="col-md-8">
	                                        <input  class="form-control selectpicker"  
	                                               id="price"
	                                               name="price"
	                                               type="text"
	                                               required="true"
	                                                maxlength="7"
	                                                number="true"
	                                               autocomplete="off"
	                                             
	                                           >
	                                           
	                                           <datalist id="oPrice">
	                                       <option value="Free">Free</option>
	                                        <option value="Percentage Basis">Percentage Basis</option>    
	                                        
	                                        </datalist>  
	                                    </div>
	                                    </div>
	                                    </div>
	                                    
	                                    </div>
	                                 
	                                 
	                                 <div class="col-md-12" style="margin-bottom:15px !important;">
	                                 
	                                 	<div class="col-md-6">
	                                     <div class="form-group">
	                                     <div class="col-md-4">
	                                        <label class="control-label">
											Upload Contract Doocument<star>*</star>
											</label>
											</div>
											<div class="col-md-8">
	                                        <input  class="form-control selectpicker"  
	                                               id="uploadContact"
	                                               name="uploadContact"
	                                               type="file"
	                                               required="true"
	                                               autocomplete="off"
	                                                list="oUploadContact"
	                                                disabled="disabled"
	                                           >
	                                           </div>
	                                       </div>
	                                    </div>
	                                   
	                                    
	                                   <div class="col-md-6">
	                                    <div class="form-group">
	                                    <div class="col-md-4">
	                                        <label class="control-label" style="margin-top:8px !important;">
											Select Visibility:<star>*</star>
											</label>
											</div>
											<div class="col-md-8">
	                                        <select  class="form-control selectpicker"  
	                                               id="visibility"
	                                               name="visibility"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                           >
	                                       <option value="Public">Public</option>
	                                        <option value="Private">Private</option>    
	                                        
	                                          </select>
	                                          </div>
	                                    </div>
	                                    </div>
	                                    
	                                   </div>  -->


																			<div class="col-md-12"
																				style="margin-bottom: 15px !important;">
																				<div class="form-group">
																					<div class="col-md-1">
																						<label class="control-label"
																							style="margin-top: 25px !important;">
																							Note: </label>
																					</div>


																					<div class="col-md-11">
																						<textarea type="text"
																							class="form-control selectpicker" rows="3"
																							name="note" id="unote" maxlength="250"></textarea>
																					</div>
																				</div>
																			</div>







																		</div>
																	</div>
																</div>

															</fieldset>


															<div class="category">
																<star>*</star>
																Required fields
															</div>
														</div>
														<div class="card-footer">
															<button type="submit" class="btn btn-info btn-fill"
																style="background-color: #de7e31; border-color: #de7e31;">Submit</button>
															<div class="clearfix"></div>
														</div>
													</form>
												</div>
											</div>










										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>










							<%-- 
	              <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
							<h4 class="title">Subscriptions</h4>

                                 <c:forEach items="${subscriptionsList}" var="sub">
								<div class="card">
									<div class="card-content">
									
										<h3>
											<strong>${sub.subscriptionName}</strong>
										</h3>
										<hr>
										<div class="table-responsive">
											<table class="table table-striped table-bordered">

												<thead>
													<th><strong>Action</strong></th>
													<th><strong>Details</strong></th>
												</thead>
												<tbody>
													
													<tr>
														<td>Reno Referral Leads</td>
														<td>${sub.renoRefLeads}</td>

													</tr>
													<tr>
														<td>Purchase Leads</td>
														<td>${sub.purchaseLeads}</td>

													</tr>
													<tr>
														<td>Create Leads</td>
														<td>${sub.createLeads}</td>

													</tr>
													<tr>
														<td>Create Employees</td>
														<td>${sub.createEmployees}</td>

													</tr>
													<tr>
														<td>Create Subcontractors</td>
														<td>${sub.createSubcontractors}</td>

													</tr>
													<tr>
														<td>Lead Management</td>
														<td>${sub.leadManagement}</td>

													</tr>
													<tr>
														<td>Sign Contact</td>
														<td>${sub.signContact}</td>

													</tr>

													<tr>
														<td>Upload Contact</td>
														<td>${sub.uploadContact}</td>

													</tr>

													<tr>
														<td>Price</td>
														<td>${sub.price}</td>

													</tr>
													<tr>
														<td>Note</td>
														<td>${sub.note}</td>

													</tr>
													<tr>
														<td>Visibility</td>
														<td>${sub.visibility}</td>

													</tr>
													</tbody>
											</table>
										</div>
									</div>
								</div>
								</c:forEach>
								<!--  end card  -->
							</div> <!-- end col-md-12 -->
	                </div> <!-- end row -->
	            </div>
	        </div> --%>


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


	<!-- READ MODEL -->
	<!-- Modal -->
	<!-- <div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			Modal content
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
									<td class="subscriptionId" id="subscriptionId"></td>

								</tr>
								<tr>
									<td>Purchase Leads</td>
									<td class="purchaseLeads" id="purchaseLeads"></td>

								</tr>
								<tr>
									<td>Create Leads</td>
									<td id="createLeads"></td>

								</tr>
								<tr>
									<td>Create Employees</td>
									<td id="createEmployees"></td>

								</tr>
								<tr>
									<td>Create Subcontractor</td>
									<td id="createSubcontractors"></td>

								</tr>
								<tr>
									<td>Lead Management</td>
									<td id="leadManagement"></td>

								</tr>
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

<script>
	
	function updateDetails(subscId)
	{
	
			var subId=subscId;
			
			
		$("#usubscriptionId").val(subId);	
			
    	$.get('AjaxSubscriptionById',{
    		subId:subId
 		},function(responseJson) {
 			                                        
 		 
 		    $("#usubscriptionName").val(responseJson.subscriptionName);		
 			$("#uRenoLeads").val(responseJson.renoRefLeads).change();
 			$("#upurchaseLeads").val(responseJson.purchaseLeads).change();
 			$("#ucreateLeads").val(responseJson.createLeads).change();
 			$("#ucreateEmployees").val(responseJson.createEmployees).change();
 			$("#ucreateSubContractor").val(responseJson.createSubcontractors).change();
 			$("#unote").val(responseJson.note);
 			$("#urenoLeadLimit").val(responseJson.renoLeadLimit);
 			$("#upurchaseLeadLimit").val(responseJson.purchaseLeadLimit);
 			$("#ucreateLeadLimit").val(responseJson.createLeadLimit);
 			$("#ucreateEmployeeLimit").val(responseJson.createEmployeeLimit);
 			$("#ucreateSubConLimit").val(responseJson.createSubConLimit);	
 	}); 		
	}	
</script>

<!-- <script type="text/javascript">
       
        $("#RenoLeads").change(function() {
        	
        	$renoleads=$('#RenoLeads').val();
        	
        	
        	if($renoleads==="Not Allowed"){
        		
        		$("#signContactC").removeAttr('readonly');
        		$("#purchaseLeadsP").removeAttr('readonly');
        	}
        	
        	else if($renoleads==="Allowed"){
    		
    		$('#purchaseLeadsP').val("Not Allowed");
    		
    		$('#purchaseLeadsP').attr('readonly','readonly');
    		$("#signContactC").removeAttr('readonly');
    		
    		
	       /* $('#leadManagement').val("Allowed");
    		
    		$('#leadManagement').attr('readonly','readonly'); */
    		
    		
    		
    	}else if($renoleads==="Assigned By Admin"){
    		$('#purchaseLeadsP').val("Not Allowed");
    		
    		$('#purchaseLeadsP').attr('readonly','readonly');
    		
          /*   $('#leadManagement').val("Only When Working On Lead");
    		
    		$('#leadManagement').attr('readonly','readonly'); */
    		
            $('#signContactC').val("Yes");
     		
     		$('#signContactC').attr('readonly','readonly');
     		
    	}
        	
        	
        	
        	
        });
        
        
        
        $("#signContactC").change(function() {
        	
        	
        	
        	$signContact=$('#signContactC').val();
        	  
        	
        	 if($signContact=="No"){
        		 
  
         		$('#uploadContact').attr('disabled','disabled');
         	}
         	
             else{
     		  		
     		
            	 $("#uploadContact").removeAttr('disabled');
     		
     		   		
     	} 
        	
        	
        	
        });
        
      $("#purchaseLeadsP").change(function() {
        	
    		if($('#RenoLeads').val()==="Not Allowed"){
        		if($('#purchaseLeadsP').val()==="Not Allowed"){
        		/* $('#purchaseLeads').val("Not Allowed");
        		
        		$('#purchaseLeads').attr('readonly','readonly'); */
        		
        		/* $('#leadManagement').val("");
        		$("#leadManagement").removeAttr('readonly'); */
        		
        		
        		$('#createLeads').attr('list','oCreateLeads2');
        		}
        		
        	}
        	
        	
        	
        });
        
        
        
        
    </script> -->

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
        $().ready(function(){
        	
			$('#updateForm').validate();
        });
        
        
        
        $("#uRenoLeads").change(function() {
        	
        	renoleads=$('#uRenoLeads option:selected').val();
        	
        	
        	if(renoleads=="Not Allowed"){
        		
        		$('#urenoLeadLimit').val(0);
        		
        		$('#urenoLeadLimit').attr('readonly','readonly');
        		
        			
               $('#upurchaseLeadLimit').val(0);
        		 
        		 $('#upurchaseLeadLimit').removeAttr('readonly');
        		 
        		 $("#upurchaseLeads").empty();
         		 
         		 $('#upurchaseLeads').append($('<option>', {
     			    value: 'Allowed',
     			    text: 'Allowed'
     			}));
          		
        		 $('#upurchaseLeads').append($('<option>', {
        			    value: 'Not Allowed',
        			    text: 'Not Allowed'
        			}));
        		 
        		 $('#upurchaseLeads').append($('<option>', {
     			    value: 'Unlimited',
     			    text: 'Unlimited'
     			}));
        		 
        		 $('.selectpicker').selectpicker('refresh');
        	}
        	
        	else if(renoleads=="Allowed"){
        		
                $('#urenoLeadLimit').val(0);
        		
        		 $("#urenoLeadLimit").removeAttr('readonly');
        		 
        		 $('#upurchaseLeadLimit').val("0");
        		 
        		 $('#upurchaseLeadLimit').attr('readonly','readonly');
        		 
        		 $("#upurchaseLeads").empty();
        	  		
        		 $('#upurchaseLeads').append($('<option>', {
        			    value: 'Not Allowed',
        			    text: 'Not Allowed'
        			}));
        		 
        		 $('.selectpicker').selectpicker('refresh');
           		 
        		 
    	}else if(renoleads=="Unlimited"){
    		
    	 $('#urenoLeadLimit').val("0");
    		
   		 $("#urenoLeadLimit").attr('readonly','readonly');
   		 
   		 $('#upurchaseLeadLimit').val("0");
   		 
   		 $('#upurchaseLeadLimit').attr('readonly','readonly');
   		
   		 
   		 $("#upurchaseLeads").empty();
  		
		 $('#upurchaseLeads').append($('<option>', {
			    value: 'Not Allowed',
			    text: 'Not Allowed'
			}));
		 
		 $('.selectpicker').selectpicker('refresh');
   		 
   		 
   		 
   		 
    	}
        	
        });
        
        
          
      $("#ucreateLeads").change(function() {
        	
    	  createLeads=$('#ucreateLeads option:selected').val();
        	
        	
        	if(createLeads=="Not Allowed"){
        		
        		$('#ucreateLeadLimit').val(0);
        		
        		$('#ucreateLeadLimit').attr('readonly','readonly');
        		
        	}
        	
        	else if(createLeads=="Allowed"){
        		
                $('#ucreateLeadLimit').val(0);
        		
        		 $("#ucreateLeadLimit").removeAttr('readonly');
        		 
        	}else if(createLeads=="Unlimited"){
        		
                $('#ucreateLeadLimit').val("0");
        		
        		$('#ucreateLeadLimit').attr('readonly','readonly');
        	}
         });
        
 
                            
      
      
      
      
      
      
      $("#ucreateEmployees").change(function() {
      	
    	  createEmployees=$('#ucreateEmployees option:selected').val();
        	
        	
        	if(createEmployees=="Not Allowed"){
        		
        		$('#ucreateEmployeeLimit').val(0);
        		
        		$('#ucreateEmployeeLimit').attr('readonly','readonly');
        		
        	}
        	
        	else if(createEmployees=="Allowed"){
        		
                $('#ucreateEmployeeLimit').val(0);
        		
        		 $("#ucreateEmployeeLimit").removeAttr('readonly');
        		 
        	}else if(createEmployees=="Unlimited"){
        		
                $('#ucreateEmployeeLimit').val("0");
        		
                $('#createEmployeeLimit').attr('readonly','readonly');
        	}
         });
 
 
       
 
      $("#ucreateSubContractor").change(function() {
      	
    	  createSubContractor=$('#ucreateSubContractor option:selected').val();
        	
        	
        	if(createSubContractor=="Not Allowed"){
        		
        		$('#ucreateSubConLimit').val(0);
        		
        		$('#ucreateSubConLimit').attr('readonly','readonly');
        		
        	}
        	
        	else if(createSubContractor=="Allowed"){
        		
                $('#ucreateSubConLimit').val(0);
        		
        		 $("#ucreateSubConLimit").removeAttr('readonly');
        		 
        	}else if(createSubContractor=="Unlimited"){
        		
				$('#ucreateSubConLimit').val("0");
        		
        		$('#ucreateSubConLimit').attr('readonly','readonly');
        	}
         });
 
      
      
      
      
        
      /*   $("#signContact").change(function() {
        	
        	$signContact=$('#signContact option:selected').val();
        	  
        	
        	 if($signContact==="No"){
         		
         		
         		
         		$('#uploadContact').attr('disabled','disabled');
         		
         		
         	}
         	
             else{
     		
     		
     		
             $("#uploadContact").removeAttr('disabled');
     		
     		
     	} 
        	
        	
        	
        }); */
        
      $("#upurchaseLeads").change(function() {
        	
    	 
    	 purchaseLeads=$('#upurchaseLeads option:selected').val();
     	
    	   if(purchaseLeads=="Not Allowed"){
     		
     		$('#upurchaseLeadLimit').val(0);
     		
     		$('#upurchaseLeadLimit').attr('readonly','readonly');
     		
     			
            $('#urenoLeadLimit').val(0);
     		 
     		 $('#urenoLeadLimit').removeAttr('readonly');
     		 
     		 $("#uRenoLeads").empty();
     		 
     		 $('#uRenoLeads').append($('<option>', {
 			    value: 'Allowed',
 			    text: 'Allowed'
 			}));
      		
    		 $('#uRenoLeads').append($('<option>', {
    			    value: 'Not Allowed',
    			    text: 'Not Allowed'
    			}));
    		 
    		 $('#uRenoLeads').append($('<option>', {
 			    value: 'Unlimited',
 			    text: 'Unlimited'
 			}));
    		 
    		 $('.selectpicker').selectpicker('refresh');
     	}
     	
     	else if(purchaseLeads=="Allowed"){
     		
             $('#upurchaseLeadLimit').val(0);
     		
     		 $("#upurchaseLeadLimit").removeAttr('readonly');
     		 
     		 $('#urenoLeadLimit').val("0");
     		 
     		 $('#urenoLeadLimit').attr('readonly','readonly');
     		 
     		 $("#uRenoLeads").empty();
     		
    		 $('#uRenoLeads').append($('<option>', {
    			    value: 'Not Allowed',
    			    text: 'Not Allowed'
    			}));
    		 
    		 $('.selectpicker').selectpicker('refresh');
     		 
     		 
 	      }else  if(purchaseLeads=="Unlimited"){
     		
			$('#upurchaseLeadLimit').val("0");
     		
     		$('#upurchaseLeadLimit').attr('readonly','readonly');
     		
     		$('#urenoLeadLimit').val(0);
    		
    		$('#urenoLeadLimit').attr('readonly','readonly');
    		
    		 $("#uRenoLeads").empty();
    		
    		 $('#uRenoLeads').append($('<option>', {
    			    value: 'Not Allowed',
    			    text: 'Not Allowed'
    			}));
    		 
    		 $('.selectpicker').selectpicker('refresh');
    	}
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