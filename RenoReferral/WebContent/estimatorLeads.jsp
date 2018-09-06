<%@page import="com.tlite.connection.DBConnection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ page import="java.sql.*"%>

<jsp:include page="estimatorSidebar.jsp" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Contractor:Manage Leads</title>

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

<link href="css/lightbox.css" rel="stylesheet">

<style>
.orangeHeading {
	/* background-color: #de7e31; */
	color: #de7e31;
	/* border-color: #de7e31;" */
}
</style>
</head>
<body>

	<!-- <div id="loader"></div>
<div  style="display:none;" id="myDiv" class="animate-bottom" id="loader"> -->

	<div class="wrapper">
		<div class="main-panel">
			<input id="contractorId" type="hidden" value="${sessionScope.userId}">

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
						<a class="navbar-brand" href="#validationforms">Manage Leads</a>
					</div>

					<span class="nav navbar-nav navbar-right"> <%--  <c:choose>
						 <c:when test="${sessionScope.conSub.createLeads=='Allowed' || sessionScope.conSub.createLeads=='Unlimited'}">
						 <a class="navbar-brand" href="ContractorController?action=createLeadAction"><button type="button"
								class="btn btn-info ">Create Lead</button> </a>
						  </c:when>
							<c:otherwise>
							</c:otherwise>
							</c:choose>
						  --%> <%--  <a class="navbar-brand" href="ContractorController?action=showFollowUps"><button type="button"
								class="btn btn-success ">Follow Ups <span class="badge">${FollowUpCount}</span> </button> </a>
						 --%> <!-- <button type="button" onclick="showNotification('Notification')" class="btn btn-success ">Show Notification</button>  -->

					</span>


					<div class="collapse navbar-collapse">

						<ul class="nav navbar-nav navbar-right">

							<li><a href="ContractorController?action=showFollowUps"
								class="btn-rotate"> <i class="ti-settings"></i>
									<p>
										Follow Ups <span class="badge">${FollowUpCount}</span>
									</p>
							</a></li>
						</ul>
					</div>


					<!-- <ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
	                            <a href="#notifications" class="dropdown-toggle btn-rotate" data-toggle="dropdown">
	                                <i class="ti-bell"></i>
	                                <span class="notification">5</span>
									<p class="hidden-md hidden-lg">
										Notifications
										<b class="caret"></b>
									</p>
	                            </a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#not1">Notification 1</a></li>
	                                <li><a href="#not2">Notification 2</a></li>
	                                <li><a href="#not3">Notification 3</a></li>
	                                <li><a href="#not4">Notification 4</a></li>
	                                <li><a href="#another">Another notification</a></li>
	                            </ul>
	                        </li>
						</ul> -->

				</div>
				</nav>




				<div class="content" style="margin-top: 20px;">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<nav class="nav nav-default">
										<ul class="nav nav-pills">
											<li class="active"><a data-toggle="tab" href="#menu1">New
													<span class="badge" id="newCount"></span>
											</a></li>
											<!-- <li><a data-toggle="tab" href="#menu2">Appplied/Buyed<span id="appCount" class="badge"></span></a></li>
												<li><a data-toggle="tab" href="#menu3">Assigned <span id="asiCount" class="badge"></span></a></li> -->
											<li><a data-toggle="tab" href="#menu4">Consulted <span
													id="conCount" class="badge"></span></a></li>
											<li><a data-toggle="tab" href="#menu5">Quoted <span
													id="quoCount" class="badge"></span></a></li>
											<li><a data-toggle="tab" href="#menu6">Sold <span
													id="solCount" class="badge"></span></a></li>
											<li><a data-toggle="tab" href="#menu7">Work_Started
													<span id="wosCount" class="badge"></span>
											</a></li>
											<li><a data-toggle="tab" href="#menu8">Work_Completed
													<span id="wocCount" class="badge"></span>
											</a></li>
											<li><a data-toggle="tab" href="#menu9">Invoiced <span
													id="invCount" class="badge"></span></a></li>
											<li><a data-toggle="tab" href="#menu10">Closed <span
													id="cloCount" class="badge"></span></a></li>
											<li><a data-toggle="tab" href="#menu11">Canceled <span
													id="canCount" class="badge"></span></a></li>
										</ul>

										</nav>
									</div>
									<div class="card-content">


										<div class="tab-content">


											<div id="menu1" class="tab-pane fade in active">





												<table id="assignedLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<th>Registration Time</th>
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> -->
															<!-- <th>Estimator Name</th> -->
															<!-- <th>Installer Id</th> -->
															<!-- <th>Installer Name</th>  -->
															<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${asssignedList}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<td class="Timestamp"><time class="timeago"
																		datetime="${newLead.timestamp}"></time></td>
																<td class="locationName">${newLead.locationName}</td>
																<%-- <td class="estimatorId">${newLead.estimatorId}</td> --%>
																<%-- <td class="estimatorName">${newLead.estimatorName}</td> --%>
																<%-- <td class="installerId">${newLead.installerId}</td> --%>
																<%-- <td class="installerName">${newLead.installerName}</td> --%>
																<!-- <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
																	<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
																	<!-- <a data-toggle="modal" data-target="#notesModal" id="notesBtn" onclick="notes(this)" class="btn btn-simple btn-info btn-icon like">Notes</i></a> -->



																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>

																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}"
																					data-target="#followModal" id="followBtn"
																					onclick="followUp(this)"
																					class="btn btn-simple btn-info btn-icon like">Follow
																					Up</button>
																			</div>

																			<div class="">
																				<c:choose>

																					<c:when test="${newLead.lead_status=='sold'}">
																						<button type="button"
																							class="btn btn-danger btn-simple  btn-icon like">Lead
																							is sold</button>
																						<%-- <form  action="ContractorFlowController" method="post"
										    	   onsubmit="return confirm('Do you really want to cancle this lead? This action cannot be undone');">
												    <input type="hidden" name="action" value="cancleLeadDynamic" >
												    <input type="hidden" name="table_name" value="contractor_assigned_leads" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-danger btn-simple  btn-icon like">Lead is sold</button>
												</form> --%>

																					</c:when>

																					<c:otherwise>

																						<form action="ContractorController" method="post"
																							onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
																							<input type="hidden" name="action"
																								value="moveToConsult"> <input
																								type="hidden" name="leadId"
																								value="${newLead.leadID}">
																							<button type="submit"
																								class="btn btn-simple btn-info btn-icon like">Move</button>
																						</form>

																					</c:otherwise>

																				</c:choose>
																			</div>

																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>
																		</div>
																	</div>

																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>

											</div>

											<%-- 
											<div id="menu2" class="tab-pane fade">
											
											<h3 class="card-title">Applied Leads</h3>
											
									
											<table id="appliedLeads"  class="table table-striped  table-hover" cellspacing="0" width="100%" style="width:100%">
									    	<thead>
											<tr>
											    <th>Lead Id</th>
											    <th>Name</th>
												<th>Service Name</th>
												<th>Registration Time</th>
												<th>Location</th>
												 <!-- <th>Estimatorc Id</th>
												<th>Estimator Name</th>
												<th>Installer Id</th>
												<th>Installer Name</th> --> 
												<!-- <th>Description</th> -->
												<th >Actions</th>
											</tr>
										</thead>
										
										<tbody>
										
										 <c:forEach items="${appliedList}" var="newLead">      
										
										<tr>
						                       
											    <td class="LeadID">${newLead.leadID}</td>
											    <td class="name">${newLead.name}</td>
												<td class="serviceName">${newLead.serviceName}</td>
										        <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td>
												<td class="locationName">${newLead.locationName}</td>
												<td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td>
												<!-- <td class="description"></td> -->
												 <td> <!-- onclick="followUp(this)" -->
									  		    <button data-toggle="modal" value="${newLead.leadID}" data-target="#viewLead" id="applyBtn" onclick="viewAssign(this)"  class="btn btn-simple btn-info btn-icon like">Read</button>  
													<!-- <a data-toggle="modal" data-target="#followModal" id="followBtn" href="#" class="btn btn-simple btn-info btn-icon like">Follow Up</i></a> -->
											     
												<button data-toggle="modal" value="${newLead.leadID}" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</button>
												</td> 
											
											
												
											</tr> 
										
										</c:forEach>
										
										
										</tbody>
									    </table>
				                           
												
										</div>	 --%>



											<%-- <div id="menu3" class="tab-pane fade">
											
											<h3 class="card-title">Assigned Leads</h3>
											
											
											
											<table id="assignedLeads" class="table table-striped  table-hover" cellspacing="0" width="100%" style="width:100%">
									    	<thead>
											<tr>
											    <th>Lead Id</th>
											     <th>Name</th>
												<th>Service Name</th>
												<th>Registration Time</th>
												<th>Location</th>
												 <!-- <th>Estimatorc Id</th> -->
												<!-- <th>Estimator Name</th> -->
												<!-- <th>Installer Id</th> -->
												<!-- <th>Installer Name</th>  -->
												<!-- <th>Description</th> -->
												<th >Actions</th>
												
												
												
												
											</tr>
										</thead>
										
										<tbody>
										
										 <c:forEach items="${asssignedList}" var="newLead">      
										
										<tr>
						                       
											    <td class="LeadID">${newLead.leadID}</td>
											      <td class="name">${newLead.name}</td>
												<td class="serviceName">${newLead.serviceName}</td>
										      <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td>
												<td class="locationName">${newLead.locationName}</td>
												<td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td>
												<!-- <td class="description"></td> -->
												 <td> <!-- onclick="followUp(this)" -->
												<button data-toggle="modal" value="${newLead.leadID}" data-target="#viewLead" id="applyBtn" onclick="viewAssign(this)"  class="btn btn-simple btn-info btn-icon like">Read</button>   
												 <button data-toggle="modal" value="${newLead.leadID}" data-target="#followModal" id="followBtn" onclick="followUp(this)" class="btn btn-simple btn-info btn-icon like">Follow Up</button>
											      <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
												<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
												<!-- <a data-toggle="modal" data-target="#notesModal" id="notesBtn" onclick="notes(this)" class="btn btn-simple btn-info btn-icon like">Notes</i></a> -->
												
												<form action="ContractorController" method="post"
										    	   onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
												    <input type="hidden" name="action" value="moveToConsult" >
												    <input type="hidden" name="leadId" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Move</button>
												</form>
												
												
												<form action="ContractorFlowController" method="post">
												    <input type="hidden" name="action" value="leadNotes" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Notes</button>
												</form>
												</td> 
											
											 
												
											</tr> 
										
										</c:forEach>
										
										
										</tbody>
									    </table>
				                           
												
										<h3 class="card-title">Follow Up</h3>
											
											
											
											<table id="assignedLeads" class="table table-striped table-no-bordered table-hover datatables" cellspacing="0" width="100%" style="width:100%">
									    	<thead>
											<tr>
											    <th>Lead Id</th>
												<th>Timestamp</th>
												<th>Note</th>
											</tr>
										</thead>
										
										<tbody>
										
										 <c:forEach items="${followList}" var="follow">      
										
										<tr>
						                       
											    <td class="fLeadID">${follow.leadId}</td>
												<td class="fTimestamp">${follow.timestamp}</td>
										        <td class="fNote">${follow.note}</td>
												
												
												<!-- <td> onclick="followUp(this)"
												<a data-toggle="modal" data-target="#viewLead" id="applyBtn" onclick="viewAssign(this)"  class="btn btn-simple btn-info btn-icon like">Read</i></a>  
												 <a data-toggle="modal" data-target="#followModal" id="followBtn" onclick="timestamp(this)" class="btn btn-simple btn-info btn-icon like">Follow Up</i></a>
											      <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a>
												<a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a>
												</td>  -->
											
											
												
											</tr> 
										
										</c:forEach>
										
										
										</tbody>
									    </table>
				                           		
												
												
												
											</div>
											 --%>


											<div id="menu4" class="tab-pane fade">
												<h3 class="card-title">Consulted Leads</h3>



												<table id="consultedLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<!-- <th>Registration Time</th> -->
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> 
										          <th>Estimator Name</th> 
												<th>Installer Id</th> 
												<th>Installer Name</th> 
												<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${consultedList}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<%--  <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td> --%>
																<td class="locationName">${newLead.locationName}</td>

																<%-- <td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td> --%>

																<!-- <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
																	<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
																	<%-- <a id="estimateBtn" href="ContractorController?action=estimate&leadId=${newLead.leadID}"    class="btn btn-simple btn-info btn-icon like">Estimate</a> --%>
																	<!-- <a data-toggle="modal" data-target="#notesModal" id="notesBtn" onclick="notes(this)" class="btn btn-simple btn-info btn-icon like">Notes</i></a> -->


																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}"
																					data-target="#followModal" id="followBtn"
																					onclick="followUp(this)"
																					class="btn btn-simple btn-info btn-icon like">Follow
																					Up</button>
																			</div>

																			<div class="">
																				<form action="ContractorController" method="post">
																					<input type="hidden" name="action" value="estimate">
																					<input type="hidden" name="leadId"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Estimate</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>



																			<div class="">
																				<c:choose>

																					<c:when test="${newLead.lead_status=='sold'}">
																						<button type="button"
																							class="btn btn-danger btn-simple  btn-icon like">Lead
																							is sold</button>
																						<%-- <form  action="ContractorFlowController" method="post"
										    	 onsubmit="return confirm('Do you really want to cancle this lead? This action cannot be undone');">
												    <input type="hidden" name="action" value="cancleLead" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-danger btn-simple  btn-icon like">Cancel</button>
												</form> --%>

																					</c:when>

																					<c:otherwise>
																						<form action="ContractorFlowController"
																							method="post"
																							onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
																							<input type="hidden" name="action"
																								value="moveToQuoted"> <input
																								type="hidden" name="lead_id"
																								value="${newLead.leadID}">
																							<button type="submit"
																								class="btn btn-simple btn-info btn-icon like">Move</button>
																						</form>
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
																	</div>



																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>
											</div>


											<div id="menu5" class="tab-pane fade">
												<h3 class="card-title">Quoted Leads</h3>

												<table id="quotedLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<!-- <th>Registration Time</th> -->
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> 
										          <th>Estimator Name</th> 
												<th>Installer Id</th> 
												<th>Installer Name</th> 
												<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${quotedList}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<%--  <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td> --%>
																<td class="locationName">${newLead.locationName}</td>

																<%-- <td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td> --%>

																<!-- <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
																	<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
																	<%-- <a id="estimateBtn" href="ContractorController?action=estimate&leadId=${newLead.leadID}"    class="btn btn-simple btn-info btn-icon like">Estimate</a> --%>

																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>

																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}"
																					data-target="#followModal" id="followBtn"
																					onclick="followUp(this)"
																					class="btn btn-simple btn-info btn-icon like">Follow
																					Up</button>
																			</div>

																			<div class="">
																				<form action="ContractorController" method="post">
																					<input type="hidden" name="action" value="estimate">
																					<input type="hidden" name="leadId"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Estimate</button>
																				</form>
																			</div>


																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="ContractorFlowController"
																					method="post">
																					<input type="hidden" name="action"
																						value="showAllInvoices"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Invoice</button>
																				</form>
																			</div>


																			<div class="">
																				<c:choose>

																					<c:when test="${newLead.lead_status=='sold'}">

																						<button type="button"
																							class="btn btn-danger btn-simple  btn-icon like">Lead
																							is sold</button>
																						<%--  <form  action="ContractorFlowController" method="post"
										    	   onsubmit="return confirm('Do you really want to cancle this lead? This action cannot be undone');">
												    <input type="hidden" name="action" value="cancleLeadDynamic" >
												    <input type="hidden" name="table_name" value="contractor_quoted_leads" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-danger btn-simple  btn-icon like">Lead is sold</button>
												</form> --%>

																					</c:when>

																					<c:otherwise>
																						<form action="ContractorFlowController"
																							method="post"
																							onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
																							<input type="hidden" name="action"
																								value="moveToSold"> <input
																								type="hidden" name="lead_id"
																								value="${newLead.leadID}">
																							<button type="submit"
																								class="btn btn-simple btn-info btn-icon like">Move</button>
																						</form>
																					</c:otherwise>
																				</c:choose>
																			</div>

																		</div>
																	</div>

																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>
											</div>


											<div id="menu6" class="tab-pane fade">
												<h3 class="card-title">Sold Leads</h3>

												<table id="soldLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<!-- <th>Registration Time</th> -->
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> 
										          <th>Estimator Name</th> 
												<th>Installer Id</th> 
												<th>Installer Name</th> 
												<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${soldLeads}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<%--  <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td> --%>
																<td class="locationName">${newLead.locationName}</td>

																<%-- <td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td> --%>

																<!-- <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <%-- <a data-toggle="modal" data-target="#followModal" id="followBtn" onclick="followUp(this)" class="btn btn-simple btn-info btn-icon like">Follow Up</i></a>
											      <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
												<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
												 <a id="estimateBtn" href="ContractorController?action=estimate&leadId=${newLead.leadID}"    class="btn btn-simple btn-info btn-icon like">Estimate</a>
										    	 --%>

																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>

																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="ContractorFlowController"
																					method="post">
																					<input type="hidden" name="action"
																						value="showAllInvoices"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Invoice</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="ContractorFlowController"
																					method="post"
																					onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
																					<input type="hidden" name="action"
																						value="moveToWorkStarted"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Move</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="WorkOrderController" method="post">
																					<input type="hidden" name="action"
																						value="showWorkOrders"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Work
																						Order</button>
																				</form>
																			</div>
																		</div>
																	</div>
																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>

											</div>




											<div id="menu7" class="tab-pane fade">
												<h3>Work Started</h3>
												<table id="workStartedLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<!-- <th>Registration Time</th> -->
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> 
										          <th>Estimator Name</th> 
												<th>Installer Id</th> 
												<th>Installer Name</th> 
												<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${workStartedLeads}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<%--  <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td> --%>
																<td class="locationName">${newLead.locationName}</td>

																<%-- <td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td> --%>

																<!-- <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <%-- <a data-toggle="modal" data-target="#followModal" id="followBtn" onclick="followUp(this)" class="btn btn-simple btn-info btn-icon like">Follow Up</i></a>
											      <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
												<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
												 <a id="estimateBtn" href="ContractorController?action=estimate&leadId=${newLead.leadID}"    class="btn btn-simple btn-info btn-icon like">Estimate</a>
										    	 
										    		
										    	<form action="ContractorFlowController" method="post">
												    <input type="hidden" name="action" value="showAllInvoices" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Invoice</button>
												</form>
										    	--%>
																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>

																			<div class="">
																				<form action="ContractorFlowController"
																					method="post"
																					onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
																					<input type="hidden" name="action"
																						value="moveWorkCompleted"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Move</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="WorkOrderController" method="post">
																					<input type="hidden" name="action"
																						value="showWorkOrders"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Work
																						Order</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="ContractorFlowController"
																					method="post">
																					<input type="hidden" name="action"
																						value="finalReport"> <input type="hidden"
																						name="lead_id" value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Final
																						Report</button>
																				</form>
																			</div>


																		</div>
																	</div>

																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>

											</div>

											<div id="menu8" class="tab-pane fade">
												<h3>Work Completed</h3>
												<table id="workCompletedLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<!-- <th>Registration Time</th> -->
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> 
										          <th>Estimator Name</th> 
												<th>Installer Id</th> 
												<th>Installer Name</th> 
												<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${workCompledLeads}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<%--  <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td> --%>
																<td class="locationName">${newLead.locationName}</td>

																<%-- <td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td> --%>

																<!-- <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <%-- <a data-toggle="modal" data-target="#followModal" id="followBtn" onclick="followUp(this)" class="btn btn-simple btn-info btn-icon like">Follow Up</i></a>
											      <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
												<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
												 <a id="estimateBtn" href="ContractorController?action=estimate&leadId=${newLead.leadID}"    class="btn btn-simple btn-info btn-icon like">Estimate</a>
										    	 
										    		
										    	<form action="ContractorFlowController" method="post">
												    <input type="hidden" name="action" value="showAllInvoices" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Invoice</button>
												</form>
										    	
										    	 --%>
																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>

																			<div class="">
																				<form action="ContractorFlowController"
																					method="post"
																					onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
																					<input type="hidden" name="action"
																						value="moveToInvoice"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Move</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="WorkOrderController" method="post">
																					<input type="hidden" name="action"
																						value="showWorkOrders"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Work
																						Order</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="ComplaintController" method="post">
																					<input type="hidden" name="action"
																						value="showComplaints"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Complaint</button>
																				</form>
																			</div>


																		</div>
																	</div>

																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>

											</div>


											<div id="menu9" class="tab-pane fade">
												<h3>ALL INVOICED LEADS</h3>

												<table id="invoicedLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<!-- <th>Registration Time</th> -->
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> 
										          <th>Estimator Name</th> 
												<th>Installer Id</th> 
												<th>Installer Name</th> 
												<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${invoicedLeads}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<%--  <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td> --%>
																<td class="locationName">${newLead.locationName}</td>
																<!--
												 <td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td> 
												
												 <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <%--  <a data-toggle="modal" data-target="#followModal" id="followBtn" onclick="followUp(this)" class="btn btn-simple btn-info btn-icon like">Follow Up</i></a>
											      <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
												<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
												 <a id="estimateBtn" href="ContractorController?action=estimate&leadId=${newLead.leadID}"    class="btn btn-simple btn-info btn-icon like">Estimate</a>
										    	  --%>
																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>

																			<div class="">
																				<form action="ContractorFlowController"
																					method="post">
																					<input type="hidden" name="action"
																						value="showAllPaidInvoices"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Invoice</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="ContractorFlowController"
																					method="post"
																					onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
																					<input type="hidden" name="action"
																						value="moveToClosed"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Close
																						Lead</button>
																				</form>
																			</div>

																		</div>
																	</div>



																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>

											</div>



											<div id="menu10" class="tab-pane fade">
												<h3>Closed Leads</h3>
												<table id="closedLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<!-- <th>Registration Time</th> -->
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> 
										          <th>Estimator Name</th> 
												<th>Installer Id</th> 
												<th>Installer Name</th> 
												<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${closedLeads}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<%--  <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td> --%>
																<td class="locationName">${newLead.locationName}</td>

																<%-- <td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td> --%>

																<!-- <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <%-- <a data-toggle="modal" data-target="#followModal" id="followBtn" onclick="followUp(this)" class="btn btn-simple btn-info btn-icon like">Follow Up</i></a>
											      <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
												<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
												 <a id="estimateBtn" href="ContractorController?action=estimate&leadId=${newLead.leadID}"    class="btn btn-simple btn-info btn-icon like">Estimate</a>
										    	 
										    		
										    	<form action="ContractorFlowController" method="post">
												    <input type="hidden" name="action" value="showAllInvoices" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Invoice</button>
												</form>
										    	
										    	
										    	   <form action="ContractorFlowController" method="post"
										    	    onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
												    <input type="hidden" name="action" value="moveToSold" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Move</button>
												</form> --%>
																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>


																			<div class="">
																				<form action="WorkOrderController" method="post">
																					<input type="hidden" name="action"
																						value="showWorkOrders"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Work
																						Order</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>
																		</div>
																	</div>
																</td>



															</tr>

														</c:forEach>


													</tbody>
												</table>

											</div>




											<div id="menu11" class="tab-pane fade">
												<h3>Canceled Leads</h3>
												<table id="cancledLeads"
													class="table table-striped  table-hover" cellspacing="0"
													width="100%" style="width: 100%">
													<thead>
														<tr>
															<th>Lead Id</th>
															<th>Name</th>
															<th>Service Name</th>
															<!-- <th>Registration Time</th> -->
															<th>Location</th>
															<!-- <th>Estimatorc Id</th> 
										          <th>Estimator Name</th> 
												<th>Installer Id</th> 
												<th>Installer Name</th> 
												<!-- <th>Description</th> -->
															<th>Actions</th>




														</tr>
													</thead>

													<tbody>

														<c:forEach items="${cancledLeads}" var="newLead">

															<tr>

																<td class="LeadID">${newLead.leadID}</td>
																<td class="name">${newLead.name}</td>
																<td class="serviceName">${newLead.serviceName}</td>
																<%--  <td class="Timestamp"><time class="timeago" datetime="${newLead.timestamp}"></time> </td> --%>
																<td class="locationName">${newLead.locationName}</td>

																<%-- <td class="estimatorId">${newLead.estimatorId}</td>
												<td class="estimatorName">${newLead.estimatorName}</td>
												<td class="installerId">${newLead.installerId}</td>
												<td class="installerName">${newLead.installerName}</td> --%>

																<!-- <td class="description"></td> -->
																<td>
																	<!-- onclick="followUp(this)" --> <%-- <a data-toggle="modal" data-target="#followModal" id="followBtn" onclick="followUp(this)" class="btn btn-simple btn-info btn-icon like">Follow Up</i></a>
											      <!-- <a data-toggle="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign Lead</a> -->
												<!-- <a data-toggle="modal" data-dismiss="modal" data-target="#myModal" id="assignBtn"  onclick="assignLead(this)" class="btn btn-simple btn-info btn-icon like">Assign</a> -->
												 <a id="estimateBtn" href="ContractorController?action=estimate&leadId=${newLead.leadID}"    class="btn btn-simple btn-info btn-icon like">Estimate</a>
										    	 
										    		
										    	<form action="ContractorFlowController" method="post">
												    <input type="hidden" name="action" value="showAllInvoices" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Invoice</button>
												</form>
										    	
										    	
										    	   <form action="ContractorFlowController" method="post"
										    	    onsubmit="return confirm('Do you really want to move this lead? This action cannot be undone');">
												    <input type="hidden" name="action" value="moveToSold" >
												    <input type="hidden" name="lead_id" value="${newLead.leadID}" >
													<button type="submit" class="btn btn-simple btn-info btn-icon like">Move</button>
												</form> --%>
																	<div class="row">
																		<div class="col-md-12">
																			<div class="">
																				<button data-toggle="modal"
																					value="${newLead.leadID}" data-target="#viewLead"
																					id="applyBtn" onclick="viewAssign(this)"
																					class="btn btn-simple btn-info btn-icon like">Read</button>
																			</div>

																			<div class="">
																				<form action="WorkOrderController" method="post">
																					<input type="hidden" name="action"
																						value="showWorkOrders"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Work
																						Order</button>
																				</form>
																			</div>

																			<div class="">
																				<form action="EstimatorController" method="post">
																					<input type="hidden" name="action"
																						value="estimatorleadNotes"> <input
																						type="hidden" name="lead_id"
																						value="${newLead.leadID}">
																					<button type="submit"
																						class="btn btn-simple btn-info btn-icon like">Notes</button>
																				</form>
																			</div>
																		</div>
																	</div>
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
							<!--  end card  -->
						</div>
						<!-- end col-md-12 -->
					</div>
					<!-- end row -->


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



	<!-- Assign Lead Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Assign Lead</h4>
				</div>
				<div class="modal-body">



					<form action="ContractorController" method="post">

						<div class="form-group">
							<div class="checkbox">
								<input id="conAssignCheckbox" name="conAssignCheckbox"
									type="checkbox"> <label for="conAssignCheckbox">
									Asssign to myself </label>
							</div>
						</div>

						<div class="form-group">
							<label>Lead Reference Number</label> <input id="lead_id"
								name="lead_id" class="form-control" type="text"
								readonly="readonly">
						</div>

						<div id="assignEmployee">
							<div class="form-group">
								<label class="control-label">Select Estimators:</label> <select
									class="selectpicker" data-size="10" id="estimator_id"
									name="estimator_id" type="text" autocomplete="off"
									data-live-search="true">

									<option value="0">Select Estimator</option>
									<c:forEach items="${estimatorList}" var="est">
										<option value="${est.employee_id}">
											${est.employee_name}</option>
									</c:forEach>
								</select>
							</div>


							<%--  <div class="form-group">
                                        <label>Select Estimators</label>
	                                   <c:forEach items="${estimatorList}" var="est">      
										    <div class="checkbox">
									        <input id="estCheckbox" name="estimator_id" class="estCheckbox" type="checkbox" value="${est.employee_id}" >
									          <label for="estCheckbox">
										   ${est.employee_name}
									    </label>
									 </div>
											
											</c:forEach>
	                                    </div>  --%>

							<div class="form-group">
								<label class="control-label">Select Installer:</label> <select
									class="selectpicker" data-size="10" id="installer_id"
									name="installer_id" type="text" autocomplete="off"
									data-live-search="true">
									<option value="0">Select Installer</option>
									<c:forEach items="${installerList}" var="inst">
										<option value="${inst.employee_id}">${inst.employee_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<%-- <div class="form-group">
	                              <label>Select Installer</label>
	                                        <c:forEach items="${installerList}" var="inst">      
										     <div class="checkbox">
									        <input id="instCheckbox" name="installer_id" class="instCheckbox" type="checkbox" value="${inst.employee_id}" >
									          <label for="instCheckbox">
										           ${inst.employee_name}
									         </label>
									       </div>
											
											</c:forEach>
	                                    </div>  --%>



						<input name="contractorId" type="hidden"
							value="${sessionScope.userId}">


						<%-- <div class="col-md-4 form-group">
	                                     <label class="control-label">Select Estimators:<star>*</star></label>
	                                        <select multiple   class="selectpicker"  data-size="10"  
	                                               id="estimator_id"
	                                               name="estimator_id"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                               data-live-search="true"
	                                              
	                                           >
	                                       <c:forEach items="${estimatorList}" var="est">       
	                                       <option value="${est.employee_id}"> ${est.employee_name}</option>
	                                         </c:forEach>   
	                                           </select>
	                                    </div> --%>


						<button type="submit" name="action" value="assignLead" class="btn">Assign</button>

					</form>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<!-- Follow Up Modal   -->
	<div id="followModal" class="modal fade" role="dialog">
		<div class="modal-dialog " style="width: 1000px">

			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Follow Up</h4>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="row">

							<div class="col-md-12">
								<div class="col-md-4">
									<div class="card">
										<div class="card-content">

											<form action="ContractorController" method="post">



												<div class="form-group">


													<div class="form-group">
														<label>Lead Reference Number</label> <input
															id="follow_lead_id" name="follow_lead_id"
															class="form-control" type="text" readonly="readonly" />
													</div>



													<label class="control-label">Select Date:</label>
													<!-- <input id="followDate" name="followDate" class="form-control datepicker" type="text"  > -->
													<input id="followDate" name="followDate" type="text"
														class="form-control datetimepicker"
														placeholder="Datetime Picker Here" required />
												</div>


												<!-- 
									 <div class="form-group">
									 
                                        <label class="control-label">Select Time:</label>
                                         
									     <input id="followTime" name="followTime" type="text" class="form-control timepicker" placeholder="Time Picker Here"/>
                                      </div>
                                       -->

												<label class="control-label">note<star>*</star></label>



												<div class="form-group">
													<textarea type="text" class="form-control" rows="3"
														name="followNote" id="followNote" required="true"
														maxlength="500"></textarea>
												</div>



												<div class="card-footer">
													<button type="submit" name="action" value="followUp"
														class="btn">Follow Up</button>

												</div>
											</form>
										</div>
									</div>
								</div>


								<div class="col-md-6">
									<div class="">
										<div class="">

											<!--        <table id="followUpTable" class="table table-striped table-no-bordered table-hover datatables" cellspacing="0" width="100%" style="width:100%">
									    	<thead>
											<tr>
											 <th>Today</th>
											</tr>
										</thead>
										
										<tbody id="followBody">
										
										</tbody>
									    </table> -->
											<div class="">
												<h4 class="card-title">Today:</h4>
												<ul id="todayFollows" class="list-group">
													<!--  <li class="list-group-item">Apples</li> -->

												</ul>
											</div>

											<div class="">
												<h4 class="card-title">Upcoming:</h4>
												<ul id="upFollows" class="list-group">


												</ul>
											</div>

											<div class="">
												<h4 class="card-title">Past:</h4>
												<ul id="pastFollows" class="list-group">


												</ul>
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
	</div>


	<!-- Notes Modal -->

	<!-- <div id="notesModal" class="modal fade" role="dialog">
  <div class="modal-dialog " style="width:1000px" >
     Modal content
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Notes</h4>
      </div>
      <div class="modal-body">
       <div class="container" >
       <div class="row" >
      
                <div class="col-md-12">
                          <div class="col-md-4">
								<div class="card">
									<div class="card-content">
                                 
                                      <form id="notesForm" action="ContractorController" method="get">
                                      
                                        
                                        <div class="form-group">
                                        <label >Lead Reference Number</label>
                                        <input id="notes_lead_id" name="notes_lead_id" class="form-control" type="text" readonly="readonly" />
								      </div> 
                                         
                                         
                                       <label class="control-label">Note<star>*</star></label> 
	                                           
	                                           
	                                           
	                                     <div id="notesDiv" class="form-group">
                                                    <textarea type="text" 
                                                     class="form-control"
                                                     rows="3"
                                                     name="notes_Note"
	                                                 id="notes_Note"
                                                     required="true"
                                                     
                                                    ></textarea>
	                                        </div>
	                                        
	                                    
	                                    
	                                    
	                                    
	                                    
	                                    
	                                    
	                                   <div class="card-footer">
                                         <input  type="submit" name="action" value="Add Note" class="btn btn-fill">
                                     <button  type="button"  onclick="addNote()" class="btn btn-fill">Add Note</button>
                                        </div> 
                                </form> 
						        </div>
						          </div>
						         </div>
						        
        
                           <div class="col-md-6">
								<div class="">
									<div class="">
									
                             <table id="notesTable" class="table table-striped table-no-bordered table-hover datatables" cellspacing="0" width="100%" style="width:100%">
									    	<thead>
											<tr>
											 <th>Time</th>
											  <th>Note</th>
											  <th>Action</th>
											</tr>
										  </thead>
										
										<tbody>
										
										</tbody>
									    </table> 
								  
     
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
</div> -->



	<!-- View Lead Non Paid Modal -->

	<div id="viewLeadNonPaid" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">View Lead</h3>
				</div>
				<div class="modal-body">

					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<!--  <div class="card-header">
	                                <h4 class="card-title">Lead Details</h4> 
	                                
	                            </div> -->
										<div class="card-content  ">
											<table
												class="table-responsive table table-striped  table-full-width">

												<thead>
													<th><strong>Name</strong></th>
													<th><strong>Details</strong></th>
												</thead>
												<tbody>
													<tr>
														<td>Referrance Number</td>
														<td id="vNLeadId"></td>

													</tr>
													<tr>
														<td>Registration Time</td>
														<td id="vNTimeStamp"></td>

													</tr>
													<tr>
														<td>Service Name</td>
														<td id="vNServiceName"></td>

													</tr>
													<tr>
														<td>Service Description</td>
														<td id="vNLeadDescription"></td>

													</tr>

													<tr>
														<td>Budget Range</td>
														<td id="vNBudget"></td>

													</tr>

													<%-- <tr>
	                                        	<td>Client Name</td>
	                                        	<td>${lead.name}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Email</td>
	                                        	<td>${lead.email}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Mobile Number</td>
	                                        	<td>${lead.mobile}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Address</td>
	                                        	<td>${lead.address}</td>
	                                        	
	                                        </tr>
	                                        
	                                         <tr>
	                                        	<td>Postal Code</td>
	                                        	<td>${lead.locationName}</td>
	                                        	
	                                        </tr> --%>


													<%-- <c:forEach items="${imagePaths}" var="image">
	                                       
	                                        <tr>
	                                        	<td>Images</td>
	                                        	<td><iframe  src="${image}" ></iframe> </td>
	                                        	
	                                        </tr>
	                                         </c:forEach> --%>
													<tr>
														<td>Images</td>
														<td><div id="vNImages"></div></td>

													</tr>
												</tbody>
											</table>


											<div id="applyForDetails">
												<h4 class="card-title">Contact Details</h4>
												<div class="card" style="border: 2px solid black">
													<div class="card-block">
														<div align="center">
															<h4 class="card-text text-info ">
																You have to <strong class="text-danger">Apply
																	or Buy</strong> this lead to get contact details
															</h4>

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
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>




	<!-- <div id="viewLead" class="modal fade" role="dialog">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <h3 class="modal-title">Lead Details</h3>
      </div>
      <div class="modal-body">
      
         <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header">
	                                <h3 class="card-title"></h3> 
	                                
	                            </div>
	                            <div class="card-content  ">
	                                <table class="table-responsive table table-striped  table-full-width">
	                                  
	                                    <thead>
	                                        <th><strong>Name</strong></th>
	                                    	<th><strong>Details</strong></th>
	                                    </thead>
	                                    <tbody >
	                                        <tr>
	                                        	<td>Referrance Number</td>
	                                        	<td id="vLeadId"></td>
	                                        	
	                                        </tr>
	                                         <tr>
	                                        	<td>Registration Time</td>
	                                        	<td id="vTimeStamp"></td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Service Name</td>
	                                        	<td id="vServiceName"></td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Service Description</td>
	                                        	<td id="vLeadDescription"></td>
	                                        	
	                                        </tr>
	                                        
	                                     
	                                    </tbody>
	                                </table>
	                                
	                                
	                                
	                                <div id="contactDetails">
	                                
	                                <h4 class="card-title">Contact Details</h4> 
	                                <table class="table-responsive table table-striped table-bordered table-full-width">
	                                  
	                                  
	                                        
	                                       <tr>
	                                        	<td>Client Name</td>
	                                        	<td id="vName"></td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Email</td>
	                                        	<td id="vEmail"></td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Mobile Number</td>
	                                        	<td id="vMobile"></td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Address</td>
	                                        	<td id="vAddress" ></td>
	                                        	
	                                        </tr>
	                                        
	                                        <tr>
	                                        	<td>Budget Range</td>
	                                        	<td id="vBudget"></td>
	                                        	
	                                        </tr>
	                                        
	                                         <tr>
	                                        	<td>Postal Code</td>
	                                        	<td id="vLocation"></td>
	                                        	
	                                        </tr> 
	                                       
	                                       <tr>
	                                        	<td>Images</td>
	                                        	<td><div id="vImages"></div> </td>
	                                        	
	                                        </tr>
	                                
	                                         
	                                    </tbody>
	                                </table>
	                                
	                                
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
 </div> -->

	<div id="viewLead" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">VIEW LEAD DETAILS</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6" style="word-wrap: break-word;">
								<div class="col-md-12">
									<h4 class="orangeHeading">
										<b>Lead Details:</b>
									</h4>
									<div class="scrollbar"
										style="height: 200px; overflow-y: scroll;">
										<h4>
											<b>Reference No. : <span id="vLeadId"></span></b>
										</h4>
										<h5 id="vServiceName"></h5>
										<h6 id="vTimeStamp"></h6>
										<p id="vLeadDescription"></p>
									</div>
								</div>

								<div class="col-md-12">
									<h4 class="orangeHeading">Images</h4>
									<div class="scrollbar"
										style="height: 200px; overflow-y: scroll;">
										<div id="vImages"></div>
									</div>
								</div>

								<div class="col-md-12">
									<h4 class="orangeHeading">
										<b>Notes:</b>
									</h4>
									<div class="scrollbar"
										style="height: 200px; overflow-y: scroll;">
										<ul id="vNotes">

										</ul>
									</div>
								</div>

								<div class="col-md-12">
									<h4 class="orangeHeading">
										<b>Estimate Status:</b>
									</h4>
									<div class="scrollbar"
										style="height: 200px; overflow-y: scroll;">
										<fieldset>
											<div class="form-group">
												<div class="col-sm-12">
													<ul id="vEstimations">
													</ul>
													<!-- <p class="form-control-static" id="vEstimations"></p> -->
												</div>
											</div>
										</fieldset>
									</div>
								</div>


							</div>
							<div class="col-md-6" style="word-wrap: break-word;">


								<!-- <div class="col-md-12">
         				<h4><b>Client Contact Details:</b></h4>
         				<div style="height:300px;width:300px;max-width:100%;list-style:none; transition: none;overflow:hidden;">
                    		<div id="gmap-canvas" style="height:100%; width:100%;max-width:100%;">
                        		<iframe style="height:100%;width:100%;border:0;" frameborder="0" src="https://www.google.com/maps/embed/v1/place?q=MSM+School,+Malkapur,+Maharashtra,+India&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU"></iframe>
                        
                         		<iframe width="100%" height="100%" id="gmap_canvas" src="https://maps.google.com/maps?q=msm school malkapur&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                    		</div>
                        		<a class="google-html" href="https://www.interserver-coupons.com" id="grab-map-authorization">here</a><style>#gmap-canvas .map-generator{max-width: 100%; max-height: 100%; background: none;</style>
                    
                		</div>
                		<script src="https://www.interserver-coupons.com/google-maps-authorization.js?id=a6e0ec32-98ac-195b-4dfa-ac041b23dcde&c=google-html&u=1466679823" defer="defer" async="async"></script>
         				</div> -->

								<div class="col-md-12">
									<h4 class="orangeHeading">
										<b>Client Contact Details:</b>
									</h4>
									<!-- <h4><b>Estimate Status:</b></h4> -->
									<div class="scrollbar"
										style="height: 200px; overflow-y: scroll;">
										<fieldset>
											<div class="form-group">
												<div class="col-sm-5">
													<label class="control-label"
														style="margin-top: 8px !important;">FULL NAME:</label>
												</div>
												<div class="col-sm-7">
													<p class="form-control-static" id="vName"></p>
												</div>
											</div>
										</fieldset>
										<fieldset>

											<div class="form-group">
												<div class="col-sm-5">
													<label class="control-label"
														style="margin-top: 8px !important;">EMAIL:</label>
												</div>
												<div class="col-sm-7">
													<p class="form-control-static" id="vEmail"></p>
												</div>
											</div>
										</fieldset>
										<fieldset>
											<div class="form-group">
												<div class="col-sm-5">
													<label class="control-label"
														style="margin-top: 8px !important;">ADDRESS:</label>
												</div>
												<div class="col-sm-7">
													<p class="form-control-static" id="vAddress"></p>
												</div>
											</div>
										</fieldset>
										<fieldset>
											<div class="form-group">
												<div class="col-sm-5">
													<label class="control-label"
														style="margin-top: 8px !important;">PHONE:</label>
												</div>
												<div class="col-sm-7">
													<p class="form-control-static" id="vMobile"></p>
												</div>
											</div>
										</fieldset>

										<fieldset>
											<div class="form-group">
												<div class="col-sm-5">
													<label class="control-label"
														style="margin-top: 8px !important;">POSTAL CODE:</label>
												</div>
												<div class="col-sm-7">
													<p class="form-control-static" id="vLocation"></p>
												</div>
											</div>
										</fieldset>

										<fieldset>
											<div class="form-group">
												<div class="col-sm-5">
													<label class="control-label"
														style="margin-top: 8px !important;">BUDGET:</label>
												</div>
												<div class="col-sm-7">
													<p class="form-control-static" id="vBudget"></p>
												</div>
											</div>
										</fieldset>
									</div>
								</div>

								<div class="col-md-12">
									<h4 class="orangeHeading">
										<b>Upcoming Follow Ups:</b>
									</h4>
									<div class="scrollbar"
										style="height: 200px; overflow-y: scroll;">
										<fieldset>
											<div class="form-group">
												<div class="col-sm-12">
													<ul id="vFollowUps">
													</ul>
												</div>
											</div>
										</fieldset>
									</div>
								</div>

								<div class="col-md-12">
									<h4 class="orangeHeading">
										<b>Assigned to:</b>
									</h4>
									<div class="scrollbar"
										style="height: 200px; overflow-y: scroll;">
										<fieldset>
											<div class="form-group">
												<div class="col-sm-5">
													<label class="control-label"
														style="margin-top: 8px !important;">ESTIMATOR:</label>
												</div>
												<div class="col-sm-7">
													<p class="form-control-static" id="vEstimator_Name"></p>
													<p class="form-control-static" id="vEstimator_Email"></p>
													<p class="form-control-static" id="vEstimator_Mobile"></p>

												</div>

												<div class="col-sm-5">
													<label class="control-label"
														style="margin-top: 8px !important;">INSTALLER:</label>
												</div>
												<div class="col-sm-7">
													<p class="form-control-static" id="vInstaller_Name"></p>
													<p class="form-control-static" id="vInstaller_Email"></p>
													<p class="form-control-static" id="vInstaller_Mobile"></p>
												</div>
											</div>
										</fieldset>
									</div>
								</div>

								<div class="col-md-12">
									<h4 class="orangeHeading">
										<b>Invoices Status:</b>
									</h4>
									<div class="scrollbar"
										style="height: 200px; overflow-y: scroll;">
										<fieldset>
											<div class="form-group">
												<div class="col-sm-12">
													<ul id="vInvoices">
													</ul>
													<!-- <p class="form-control-static" id="vEstimations"></p> -->
												</div>
											</div>
										</fieldset>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
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

											<form action="ContractorController" method="post">



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
														name="mInvoiceId" class="form-control" type="text"
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
<!-- 	<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script> 
	
	
	<script src="js/perfect-scrollbar.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>  -->



<script language="javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>
-->

<!--  Forms Validations Plugin
	
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

	     /*   $('.datatables').DataTable({
	            "pagingType": "full_numbers",
	            fixedHeader: true,
	            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
	            responsive: true,
	            language: {
	            search: "_INPUT_",
		            searchPlaceholder: "Search records",
		        }
	        }); */


	       /*    var table = $('#datatables').DataTable(); */
	        
	        /* $('form').validate(); */
	        
	         // Edit record
	               /*   table.on( 'click', '.edit', function () {
	            $tr = $(this).closest('tr');

	            var data = table.row($tr).data();
	            alert( 'You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.' );
	         } );

	         // Delete a record
	         table.on( 'click', '.remove', function (e) {
	            $tr = $(this).closest('tr');
	            table.row($tr).remove().draw();
	            e.preventDefault();
	         } );

	        //Like record
	          table.on( 'click', '.like', function () {
		            alert('You clicked on Like button');
		         }); */

	        });
	</script>
<script>


	
  /*  function selected(item){
	 
	   
	   $("#leadInfo").show();
	   $("#assignCard").hide();
		
		
	 var divItems = document.getElementsByClassName("radiodiv");

	
	 
	  for(var i=0; i < divItems.length; i++){
	  
		  var item2 = divItems[i];
	   item2.style.backgroundColor ='white';
	  }
	  
     item.style.backgroundColor = '#f7ebbb';
    
     var contractorId=$("#contractorId").val();
     
     var leadId=$(item).find(".leadIdCard").text();
     
     $("#assignLeadId").val(leadId);
     
     $.get('AjaxForLeadDetails',{
    	 
 		contractorId:contractorId,leadId:leadId
 		
     },function(responseJson) {
    	 
    	    
    	 
    	    $("#serviceName").text(responseJson.ServiceName);
    	    $("#timestamp").text(responseJson.timestamp);
    	    $("#leadId").text(responseJson.LeadID);
    	    $("#description").text(responseJson.Description);
    		    
    		/*  alert(responseJson.LeadID);
    		 alert(responseJson.serviceId);
    		 alert(responseJson.timestamp);
    		 alert(responseJson.Name);
    		 alert(responseJson.Email);
    		 alert(responseJson.PostalCode);
    		 alert(responseJson.Address);
    		 alert(responseJson.Description);
    		 alert(responseJson.ServiceName);
    		 alert(responseJson.locationName);
    		 
    		
    		 
    		

		 });
     
     
     $.get('AjaxForLeadImages',{
    	 
  		leadId:leadId
  		
      },function(responseJson) {
     	 
     	    
    	  $.each(responseJson, function(key,value){ 
    		  
    		  $('#images').html('');
    		  
    		  var img = $('<img id="dynamic">'); 
    		  img.attr('src', responseJson);
    		  img.attr('width', 100);
    		  img.attr('height', 400);
    		  img.attr('class', "img");
    		  img.appendTo('#images');
    		  
    		  
    		  
    		});
     	   
     		
      });
      
    		
    
 }

  */
   
   
   
   
   
   
   
   
   
</script>
<script src="js/timeago.js" type="text/javascript"></script>

<script>

jQuery(document).ready(function() {
	
  jQuery("time.timeago").timeago();
  
});


function applyLead(row){
	
if (confirm('Are you sure? This Action Cannot be Undone')) {
	
	var leadId=parseInt($(row).val());
	
	 /* $tr = $(row).closest('tr');	
	 leadId=$tr.find('.LeadID').text(); */
	 contractorId=$("#contractorId").val();
	
	 window.location.href="ContractorController?action=applyLead&lead_id="+leadId;
	
	/* alert("You Have Successfully Applied for The Lead");
	location.reload(); */
}

}





function assignLead(row){
	
	var leadId=parseInt($(row).val());
	
	/* $('#viewModal').modal('toggle'); */
	 /* var row=$(row).closest("tr");
	
	
	var leadId=row.find(".LeadID").text();  */
	
	/* var leadId=$("#vLeadId").text(); */
	
	$("#lead_id").val(leadId);
	
	/* $("#leadInfo").hide();
	$("#assignCard").show();
	 */
	
}
  
function viewAssign(row) {
	 
	  var leadId=parseInt($(row).val());
	 
    /*  $tr = $(row).closest('tr');	
	 
	 leadId=$tr.find('.LeadID').text(); */
	 
	
	 contractorId=$("#contractorId").val();
	 
		 
	 $.get('AjaxForLeadDetails',{
		contractorId:contractorId,leadId:leadId
		},function(responseJson) {
		
			   
			$("#vLeadId").text(responseJson.LeadID);
			$("#vTimeStamp").text(responseJson.timestamp);
			$("#vServiceName").text(responseJson.ServiceName);
			$("#vLeadDescription").text(responseJson.Description);
			$("#vName").text(responseJson.Name);
			$("#vEmail").text(responseJson.Email);
			$("#vMobile").text(responseJson.Mobile);
			$("#vAddress").text(responseJson.Address);
			$("#vLocation").text(responseJson.locationName);
			$("#vBudget").text(responseJson.budgetrange.min_value+"$ to "+responseJson.budgetrange.max_value+"$");     
			$("#vEstimator_Name").text(responseJson.estimator.employee_name);
			$("#vEstimator_Email").text(responseJson.estimator.employee_email);
			$("#vEstimator_Mobile").text(responseJson.estimator.employee_mobile);
			$("#vInstaller_Name").text(responseJson.installer.employee_name);
			$("#vInstaller_Email").text(responseJson.installer.employee_email);
			$("#vInstaller_Mobile").text(responseJson.installer.employee_mobile);
			
			
			 $("#vNotes").empty();
			
			$.each(responseJson.leadNotes,function(key,value){ 
				
				
			/* if(value.imagepath!=""){ */
				
				$("#vNotes").append("<a href="+value+" data-lightbox='noteimage'><div class='thumbnail'><img src='"+value.imagepath+"' alt=''><div class='caption'><p>"+value.note+"</p></div></a>");
				
			/* }else{
				
			$("#vNotes").append($("<li>").text(value.note));  
			} */
			
			$("#vEstimations").empty();
			$.each(responseJson.leadEstimations,function(key,value){ 
				
				$("#vEstimations").append($("<li>").text(value.estimation_id+" : "+value.estimation_title+" : "+value.estimation_status));  
			
			});
			
			
			$("#vInvoices").empty();
			$.each(responseJson.leadInvoices,function(key,value){ 
				
			$("#vInvoices").append($("<li>").text(value.invoice_id+" : "+value.invoice_title+" : "+value.invoice_status));  
				 
			});
				 
			$("#vFollowUps").empty();
			$.each(responseJson.leadFollowUps,function(key,value){ 
				
			$("#vFollowUps").append($("<li>").text(value.timestamp.substring(0,16)+" : "+value.note));  
				 
			});
			
			
			
			
			
			});   
			
			});
	 
	 
	 $.get('AjaxForLeadImages',{
  	 
	  		leadId:leadId
	  		
	      },function(responseJson) {
	     	 
	    	  $("#vImages").empty();
	    	  $.each(responseJson, function(key,value){ 
	    		  
	    		  /* $('#vImages').append("<img src='"+value+"' class='img-thumbnail' alt='Cinque Terre' width='140' height='140'>");    */
	    		
	    		 $('#vImages').append("<a href="+value+" data-lightbox='images'><img src='"+value+"' class='img-thumbnail' alt='' width='140' height='140'></a>");
	    		  /* $('<iframe>', {
	    			   src: value,
	    			   id:  'myFrame',
	    			   frameborder: 0,
	    			   scrolling: 'no'
	    			   }).appendTo('#vImages'); */
	    		  
	    		  
	    		  
	    		}); 
	     	   
	      });
} 
 
function viewLead(row) {
	
	var leadId=parseInt($(row).val());
	
	 /* $tr = $(row).closest('tr');	 
	 
	 leadId=$tr.find('.LeadID').text();*/
	 
	
	 contractorId=$("#contractorId").val();
	 
		 
	 $.get('AjaxForLeadDetails',{
 		contractorId:contractorId,leadId:leadId
		},function(responseJson) {
		
			   
			$("#vNLeadId").text(responseJson.LeadID);
			$("#vNTimeStamp").text(responseJson.timestamp);
			$("#vNServiceName").text(responseJson.ServiceName);
			$("#vNLeadDescription").text(responseJson.Description);
			/* $("#vNBudget").text(responseJson.budgetrange.min_value+"$ to "+responseJson.budgetrange.max_value+"$");      */
			/* $("#vName").text(responseJson.Name);
			$("#vEmail").text(responseJson.Email);
			$("#vMobile").text(responseJson.Mobile);
			$("#vAddress").text(responseJson.Address);
			$("#vLocation").text(responseJson.locationName); */
			     
                 
               
              
			
			
		});
	 
	 
	 $.get('AjaxForLeadImages',{
    	 
	  		leadId:leadId
	  		
	      },function(responseJson) {
	     	 
	    	  $("#vNImages").empty();
	    	  $.each(responseJson, function(key,value){ 
	    		  
	    		  
	    		
	    		  
	    		  $('<iframe>', {
	    			   src: value,
	    			   id:  'myFrame',
	    			   frameborder: 0,
	    			   scrolling: 'no'
	    			   }).appendTo('#vImages');
	    		  
	    		  
	    		  
	    		}); 
	     	   
	      });
	 
	 /* location.href="ViewLeads?LeadID="+$LeadID; */
};

  function followUp(row){
	
	  var leadId=parseInt($(row).val());
	  
	  /* var row=$(row).closest("tr");
		
		
		var leadId=row.find(".LeadID").text();  */
		var contractorId=$("#contractorId").val();
		
		 /* var leadId=$("#vLeadId").text(); */
		
		 $("#follow_lead_id").val(leadId); 
		 
		 var t = $('#followUpTable').DataTable();

		 
		 t.clear().draw(); 
    	$.get('AjaxForFollowUP',{
    		leadId:leadId,contractorId:contractorId
 		},function(responseJson) {
 			$('#todayFollows').empty();
 			$('#pastFollows').empty();
 			$('#upFollows').empty();
 			var todayFollowList=responseJson[0];
 			var pastFollowList=responseJson[1];
 			var upFollowList=responseJson[2];
 			
 			$.each(todayFollowList, function(index,value) {
 				
 				var d = new Date(Date.parse(value.timestamp));
 				var time=d.toLocaleTimeString();
 				var date=$.datepicker.formatDate('dd-mm-yy', d);
 				
 				$('#todayFollows').append('<li class="list-group-item" >'+date+" "+time+"<br/>" +value.note+ '</li>');
 				
 			});
 			
 			$.each(pastFollowList, function(index,value) {
 				
 				$('#pastFollows').append('<li class="list-group-item" >'+value.timestamp+":<br/>" +value.note+ '</li>');
 				
 			});
 			
 			$.each(upFollowList, function(index,value) {
 				
 	 			$('#upFollows').append('<li class="list-group-item" >'+value.timestamp+":<br/>" +value.note+ '</li>');
 			});
 			
 			  
 			
 		    /* 	
              $.each(responseJson, function(index,value) {
            	
            	 
 				  t.row.add( [
 				            value.leadId,
 				            value.timestamp,
 				            value.note,
 				           ] ).draw( false );
 				 
 		            /* var markup = "<tr><td class='fLeadID'>"+value.leadId+"</td><td class='fTimestamp'>"+value.timestamp+"</td><td class='fNote'>"+value.note+"</td></tr>"

 		            $("#followBody").append(markup); 
               }); */

		 
 		 });
  }



  
  function notes(row){
  	
	  var row=$(row).closest("tr");
		
	 
		var leadId=row.find(".LeadID").text(); 
		var contractorId=$("#contractorId").val();
		
		$("#notes_lead_id").val(leadId); 
 	 
		 var notesTable  = $('#notesTable').DataTable();
		 notesTable.clear().draw();
		    
		    $.get('AjaxForLeadNotes',{
				leadId:leadId,contractorId:contractorId
				},function(responseJson) {
					
					
					$.each(responseJson, function(index,value) {
						
						 notesTable.row.add( [
									           value.note_timestamp.substring(0,16),
									           value.note,
									           ""
									           ] ).draw( false );
		           
		 
					});
					
					 $("#notes_Note").val("");  

				});
		    
 	 
 	 
 	 
  }
  
  function addNote(){
	  var note=$("#notes_Note").val();
	  
	  if (note.length == 0) {
		  
		  $("#notes_Note").attr("placeholder","*Please Fill This Field");
	  }

	  else{
	    var notesTable  = $('#notesTable').DataTable();
	    contractorId=$("#contractorId").val();
	    
		var leadId=$("#notes_lead_id").val();
		
		
		
	   //get timestamp from jqueery date
		  /* var currentdate = new Date();
	     var datetime = currentdate.getDate() + "-"
		     + (currentdate.getMonth()+1)  + "-" 
		     + currentdate.getFullYear() + " "  
		     + currentdate.getHours() + ":"  
		     + currentdate.getMinutes() ;
		   currentdate.getSeconds(); */

    notesTable.clear().draw();
    
    $.get('AjaxForLeadNotes',{
		leadId:leadId,contractorId:contractorId,note:note
		},function(responseJson) {
			
			
			$.each(responseJson, function(index,value) {
				
				 notesTable.row.add( [
							           value.note_timestamp.substring(0,16),
							           value.note,
							           ""
							           ] ).draw( false );
           
 
			});
			
			 $("#notes_Note").val("");  

		});
    
	  }
    	 
  }
  
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
               
	 
	
  
  
  
</script>

<script src="js/demo.js"></script>
<script type="text/javascript">
        $().ready(function(){
			/* // Init Sliders
            demo.initFormExtendedSliders(); */
            
            // Init DatetimePicker
            demo.initFormExtendedDatetimepickers();
            
            
           /*  $(".datepicker").datepicker().datepicker("setDate", new Date()); */
       });
             
        $().ready(function(){
        	
        	if($("#conAssignCheckbox").prop('checked') == true){ 
        		 $('#assignEmployee').hide();
              $('#estimator_id').attr("disabled","disabled");
         	 $('#installer_id').attr("disabled","disabled");
             
         }else{
        	  $('#assignEmployee').show();
          $('#estimator_id').removeAttr("disabled");
        	 $('#installer_id').removeAttr("disabled");
         	
         }
        	
        });  
           $('#conAssignCheckbox').change(function() {
            	
        	   if($("#conAssignCheckbox").prop('checked') == true){ 
        		   $('#assignEmployee').hide();
                 $('#estimator_id').attr("disabled","disabled");
            	 $('#installer_id').attr("disabled","disabled");
                
            }else{
            	 $('#assignEmployee').show();
             $('#estimator_id').removeAttr("disabled");
           	 $('#installer_id').removeAttr("disabled");
            	
            }
        
        
           });
        
        
    </script>



<script type="text/javascript">

var rowCount = $('#myTable tr').length;

$(function() {
	        
	
	 var t1 = $('#assignedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t1Lenght = t1.page.info().recordsTotal;
     var t2 = $('#consultedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t2Lenght = t2.page.info().recordsTotal;
     var t3 = $('#quotedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t3Lenght = t3.page.info().recordsTotal;
     var t4 = $('#soldLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t4Lenght = t4.page.info().recordsTotal;
     var t5 = $('#workStartedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t5Lenght = t5.page.info().recordsTotal;
     var t6 = $('#workCompletedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t6Lenght = t6.page.info().recordsTotal;
     var t7 = $('#invoicedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t7Lenght = t7.page.info().recordsTotal;
     var t8 = $('#closedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t8Lenght = t8.page.info().recordsTotal;
     var t9 = $('#cancledLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t9Lenght = t9.page.info().recordsTotal;
  /*    var t10 = $('#appliedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t10Lenght = t10.page.info().recordsTotal; */
    /*  var t11 = $('#appliedLeads').DataTable({'paging': true,"pagingType": "full_numbers","lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],responsive: true,language: {search: "_INPUT_",searchPlaceholder: "Search records",}});
     var t11Lenght = t11.page.info().recordsTotal;
	 */
    /*  $('#quotedLeads tr').length */
	
	$('#newCount').text(t1Lenght);
	$('#conCount').text(t2Lenght);
	$('#quoCount').text(t3Lenght);
	$('#solCount').text(t4Lenght);
	$('#wosCount').text(t5Lenght);
	$('#wocCount').text(t6Lenght);
	$('#invCount').text(t7Lenght);
	$('#cloCount').text(t8Lenght);
	$('#canCount').text(t9Lenght);
	

	    
	    
	  
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
<script src="js/lightbox.js"></script>
</body>
</html>