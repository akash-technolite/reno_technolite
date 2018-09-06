<%@page import="com.tlite.connection.DBConnection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ page import="java.sql.*"%> --%>
<jsp:include page="contractorSidebar.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Contractor Profile</title>

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
						<a class="navbar-brand" href="#">Profile</a>
					</div>
					<span class="pull-right"> <!-- <a class="navbar-brand" href="DefaultLeadAction"><button type="button" class="btn btn-info btn-fill"
					>Default Lead Setting</button>
					</a>
					
					<a class="navbar-brand" href="CreateLeadAction"><button type="button" class="btn btn-info btn-fill"
					>Create Lead</button>
					</a>
					 -->

					</span>


					<div class="collapse navbar-collapse">

						<ul class="nav navbar-nav navbar-right">
							<li>
								<div class="navbar-brand">
									<form action="ContractorController" method="post">
										<input type="hidden" name="action" value="editProfile">
										<input type="hidden" name="contractorId"
											value="${contractorList[0].contractorId}">
										<button type="submit" class="btn btn-simple ">
											<i class="ti-pencil-alt" title="Edit"></i> Edit Profile <span
												class="badge"></span>
										</button>

									</form>
								</div> <!-- <a href="contractorEditProfile.jsp" class="btn-rotate">
									<i class="ti-pencil-alt" title="Edit"></i>
									<p>
										
									</p>
	                            </a> -->
							</li>
						</ul>
					</div>

				</div>
				</nav>

				<div class="content" style="margin-top: 15px;">
					<div class="container-fluid">
						<%--<div class="row">
							<div class="col-md-12">
								 <h4 class="title">Contractor Profile</h4>
								<div class="card">
									<div class="card-content">
                               <table class="table table-striped table-bordered">
	                                  
	                                    <thead>
	                                        <th><strong>Parameter Name</strong></th>
	                                    	<th><strong>Details</strong></th>
	                                    </thead>
	                                    <tbody >
	                                        <tr>
	                                        	<td><strong>Name</strong></td>
	                                        	
	                                        	<td>${contractorList[0].contractorName}</td>
	                                        	
	                                        </tr>
	                                         <tr>
	                                        	<td>Email</td>
	                                        	<td>${contractorList[0].contractorEmail}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Password</td>
	                                        	<td>${contractorList[0].password}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Mobile</td>
	                                        	<td>${contractorList[0].contractorMobileNumber}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Company</td>
	                                        	<td>${contractorList[0].contractorCompany}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Subscription Name</td>
	                                        	
	                                        	<td>${contractorList[0].subscriptionName}</td>
	                                        	
	                                        </tr>
	                                        
	                                        
	                                        <tr>
	                                        	<td>Services</td>
	                                        	<td><c:forEach items="${contractorServices}" var="contractorServices">
	                                        	
	                                        	
	                                        	  ${contractorServices},
	                                        	
	                                        	  </c:forEach>
	                                        	  </td>
	                                        </tr>
	                                      
                                              <tr>
	                                        	<td>Locations</td>
	                                        	<td> <c:forEach items="${contractorLocations}" var="contractorLocations">
	                                        	     ${contractorLocations},
	                                        	 </c:forEach>
	                                        	 </td>
	                                        </tr>
	                                       
	                                        
	                                        
	                                       
	                                
	                                       <c:forEach items="${imagePaths}" var="image">
	                                       
	                                        <tr>
	                                        	<td>Images</td>
	                                        	<td><iframe  src="${image}" ></iframe> </td>
	                                        	
	                                        </tr>
	                                         </c:forEach>
	                                        
	                                    </tbody>
	                                </table>
										

									</div>
								</div>
							</div> 
						<!--  end card  -->
						</div>
						<!-- end col-md-12 -->
					</div>--%>
						<!-- end row -->

						<div class="row">
							<div class="col-lg-5 col-md-5">
								<div class="card card-user">
									<div class="image">
										<img src="img/background.jpg" alt="..." />
									</div>
									<div class="card-content">
										<div class="author">

											<c:choose>
												<c:when
													test="${not empty contractorList[0].contractorPicture}">
													<img class="avatar border-white"
														src="${contractorList[0].contractorPicture}" />

												</c:when>
												<c:otherwise>
													<img class="avatar border-white" src="img/faces/face-1.jpg"
														alt="" />

												</c:otherwise>
											</c:choose>
											<i class="ti-pencil-alt" data-toggle="modal"
												data-target="#uploadModal" title="Edit"></i>
											<h4 class="card-title">${contractorList[0].contractorName}<br />
												<small>${contractorList[0].subscriptionName}</small><br>
												<small>${contractorList[0].contractorRegDate}</small>
											</h4>
										</div>

										<p class="description text-center">
											${contractorList[0].contractorEmail} <br>
											${contractorList[0].contractorMobileNumber} <br>
										</p>
									</div>
									<hr>
									<div class="text-center">
										<div class="row">
											<div class="col-md-4 col-md-offset-1">
												<h5 style="color: orange">${buyCount}<br />
													<small>Buy/Applied<br>RR Leads
													</small>
												</h5>
											</div>
											<div class="col-md-3">
												<h5 style="color: orange">${closeCount}<br />
													<small>Closed<br>RR Leads
													</small>
												</h5>
											</div>
											<!-- <div class="col-md-3">
	                                        <h5><btn class="btn btn-sm btn-success btn-icon" data-toggle="modal" data-target="#msgModal"><i class="fa fa-envelope"></i></btn><br /><small>Send<br>Message</small></h5>
	                                    </div> -->
										</div>
									</div>
								</div>
								<!--  <div class="card">
	                            <div class="card-header">
	                                <h4 class="card-title">Team Members</h4>
	                            </div>
	                            <div class="card-content">
	                                <ul class="list-unstyled team-members">
                                        <li>
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <div class="avatar">
                                                        <img src="../../assets/img/faces/face-0.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    DJ Khaled
                                                    <br />
                                                    <span class="text-muted"><small>Offline</small></span>
                                                </div>
                                                <div class="col-xs-3 text-right">
                                                    <btn class="btn btn-sm btn-success btn-icon"><i class="fa fa-envelope"></i></btn>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <div class="avatar">
                                                        <img src="../../assets/img/faces/face-1.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    Creative Tim
                                                    <br />
                                                    <span class="text-success"><small>Available</small></span>
                                                </div>
                                                <div class="col-xs-3 text-right">
                                                    <btn class="btn btn-sm btn-success btn-icon"><i class="fa fa-envelope"></i></btn>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <div class="avatar">
                                                        <img src="../../assets/img/faces/face-3.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    Flume
                                                    <br />
                                                    <span class="text-danger"><small>Busy</small></span>
                                                </div>
                                                <div class="col-xs-3 text-right">
                                                    <btn class="btn btn-sm btn-success btn-icon"><i class="fa fa-envelope"></i></btn>
                                                </div>
                                            </div>
                                        </li>
	                                </ul>
	                            </div>
	                        </div> -->
							</div>
							<div class="col-lg-7 col-md-7">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Profile Details</h4>
									</div>
									<div class="card-content">
										<form>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Name</label> <input type="text"
															class="form-control border-input" disabled
															value="${contractorList[0].contractorName}">
													</div>
												</div>
												<!-- <div class="col-md-3">
	                                            <div class="form-group">
	                                                <label>Username</label>
	                                                <input type="text" class="form-control border-input" placeholder="Username" value="michael23">
	                                            </div>
	                                        </div> -->
												<div class="col-md-12">
													<div class="form-group">
														<label for="email">Email</label> <input type="email"
															class="form-control border-input" disabled
															value="${contractorList[0].contractorEmail}">
													</div>
												</div>

												<!--   <div class="col-md-12">
	                                            <div class="form-group">
	                                                <label for="exampleInputEmail1">Another Contractor Email</label>
	                                                <input type="email" class="form-control border-input" disabled placeholder="Enter Email Address">
	                                            </div>
	                                        </div> -->

												<div class="col-md-12">
													<div class="form-group">
														<label>Mobile</label> <input type="text" disabled
															class="form-control border-input"
															value="${contractorList[0].contractorMobileNumber}">
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label>Company Name</label> <input type="text" disabled
															class="form-control border-input"
															value="${contractorList[0].contractorCompany}">
													</div>
												</div>


												<div class="col-md-12">
													<div class="form-group">
														<label>Services</label><br>
														<!-- <input type="text" class="form-control border-input" placeholder="Home Address" value="Melbourne, Australia"> -->
														<c:forEach items="${contractorServices}"
															var="contractorServices">
															<span class="label label-info">
																${contractorServices} </span>
														</c:forEach>

													</div>
												</div>




												<div class="col-md-12">
													<div class="form-group">
														<label>Location of Service</label><br>
														<!-- <input type="text" class="form-control border-input" placeholder="City" value="Melbourne"> -->
														<c:forEach items="${contractorLocations}"
															var="contractorLocations">
															<span class="label label-info">${contractorLocations}
															</span>
														</c:forEach>


													</div>
												</div>
												<div class="col-md-12">
													<label>Address</label>
													<div class="form-group">
														<input class="form-control" disabled
															value="${contractorList[0].contractorAddress}">
														<!-- </textarea> -->
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label>Subscription Name</label> <input type="text"
															disabled value="${contractorList[0].subscriptionName}"
															class="form-control border-input" placeholder="ZIP Code">
													</div>
												</div>


												<!-- <div class="text-center">
	                                        <button type="submit" class="btn btn-info btn-fill btn-wd">Update Profile</button>
	                                    </div> -->
												<div class="clearfix"></div>
											</div>

										</form>
									</div>
								</div>
							</div>


							<div class="col-lg-offset-5 col-md-offset-5 col-lg-7 col-md-7">
								<div class="card">
									<h4 class="card-title">Account Summery</h4>
									<div class="card-content">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>Reno Lead Limit</label>
													<c:choose>
														<c:when test="${conSub.renoRefLeads=='Unlimited'}">
															<input type="text" class="form-control border-input"
																disabled value="Unlimited">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control border-input"
																disabled value="${conSubLimit.renoLeadLimit}">
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Purchase Lead Limit</label>
													<c:choose>
														<c:when test="${conSub.purchaseLeads=='Unlimited'}">
															<input type="text" class="form-control border-input"
																disabled value="Unlimited">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control border-input"
																disabled value="${conSubLimit.purchaseLeadLimit}">
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Create Lead Limit</label>
													<c:choose>
														<c:when test="${conSub.createLeads=='Unlimited'}">
															<input type="text" class="form-control border-input"
																disabled value="Unlimited">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control border-input"
																disabled value="${conSubLimit.createLeadLimit}">
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Create Employee Limit</label>
													<c:choose>
														<c:when test="${conSub.createEmployees=='Unlimited'}">
															<input type="text" class="form-control border-input"
																disabled value="Unlimited">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control border-input"
																disabled value="${conSubLimit.createEmployeeLimit}">
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Create Sub Contractor Lead Limit</label>
													<c:choose>
														<c:when test="${conSub.createSubcontractors=='Unlimited'}">
															<input type="text" class="form-control border-input"
																disabled value="Unlimited">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control border-input"
																disabled value="${conSubLimit.createSubConLimit}">
														</c:otherwise>
													</c:choose>
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


	<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Add Document</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">Upload Picture</h4>
				</div>
				<div class="modal-body">

					<div class="container-fluid">

						<div class="col-md-12">
							<div class="row">
								<form id="uploadPicture" action="UploadProfilePicture"
									method="post" enctype="multipart/form-data">
									<div class="">
										<label class="control-label">Upload Profile Picture<star>*</star></label>

										<div class="form-group">
											<input type="file" class="form-control" name="file" required>
										</div>
									</div>
									<div class="">
										<div class="category">
											<star>*</star>
											Required fields
										</div>
									</div>
									<div class="">
										<div class="modal-footer">
											<button type="submit" class="btn btn-success btn-fill"
												style="background-color: #de7e31; color: white; border-color: #de7e31;">Upload</button>
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
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwRtNgXpNu4WDyrKnnNX-T_ahtT0PLccE"></script>

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