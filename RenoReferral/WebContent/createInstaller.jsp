<jsp:include page="sidebar.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Reno Referral</title>

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
						<button id="minimizeSidebar" class="btn btn-fill btn-icon">
							<i class="ti-more-alt"></i>
						</button>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>

						<a class="navbar-brand" href="#validationforms">Create
							Installer</a>
					</div>
				</div>
				</nav>

				<div class="content">

					<div class="container-fluid">
						<div class="row">

							<div class="col-md-12 ">
								<div class="card">

									<!--  id="LeadRegisterForm" -->
									<form id="CreateContractorForm" action="CreateContractor"
										method="post">
										<div on class="card-header">
											<h4 class="card-title"></h4>
										</div>

										<div class="card-content">


											<div>
												<h3 align="center" style="color: green">${msg}</h3>
											</div>

											<div>
												<h3 align="center" style="color: red">${ErrorMessage}</h3>
											</div>

											<div class="form-group">
												<label class="control-label"> Name <star>*</star>
												</label> <input class="form-control" id="contractorName"
													name="contractorName" type="text" required="true"
													autocomplete="off" />
											</div>

											<div class="form-group">
												<label class="control-label"> Email Address <star>*</star>
												</label> <input class="form-control" id="contractorEmail"
													name="contractorEmail" type="text" required="true"
													email="true" autocomplete="off" />
											</div>

											<div class="form-group">
												<label class="control-label">Mobile<star>*</star></label> <input
													class="form-control" name="contractorMobileNumber"
													id="contractorMobileNumber" type="text" required="true"
													autocomplete="off" />
											</div>


											<%--  <div class="form-group">
	                                        <label class="control-label">Company<star>*</star></label>
	                                        <input class="form-control"
	                                               name="contractorCompany"
	                                               id="contractorCompany"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
											/>
	                                    </div>
	                                     
	                                  
	                                  
	                                    <label class="control-label">Select Services:<star>*</star></label>
	                                    
	                                    <c:forEach items="${serviceList}" var="service">
	                                    
	                                      <div class="checkbox">
													    <input id="contractorServices" name="contractorServices" type="checkbox" value="${service.serviceId}">
													    <label for="checkbox">
													 		${service.serviceName}
													    </label>
													</div>
	                                     </c:forEach>
	                                    
	                                     
	                                    
	                                      <label class="control-label">Select Locations:<star>*</star></label>
	                                    
	                                    <c:forEach items="${LocationList}" var="location">
	                                    
	                                      <div class="checkbox">
													    <input id="contractorLocations" name="contractorLocations" type="checkbox" value="${location.locatonId}">
													    <label for="checkbox2">
													 		${location.locationName}
													    </label>
													</div>
	                                     </c:forEach>
	                                    
	                                    
	                                    
	                                    
	                                    <div class="form-group">
	                                        <label class="control-label">
												Select Subscription:<star>*</star>
											</label>
	                                        <select  class="selectpicker"  
	                                               id="contractorSubscription"
	                                               name="contractorSubscription"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                           >
	                                           
	                                          <c:forEach items="${subscriptionsList}" var="sub">  
	                                          
	                                          <option value="${sub.subscriptionId}">${sub.subscriptionName}</option>
	                                       
	                                           </c:forEach>      
	                                           </select>
	                                    </div>
	                                    
	                                    
	                                    
	                                    
	                                    
	                                    
	                                    
	                                    
	                                     <label class="control-label">Select Subscription:<star>*</star></label>
	                                     
	                                       <c:forEach items="${subscriptionsList}" var="sub">
	                                     
	                                         <div class="radio">
													    <input type="radio" name="contractorSubscription" id="contractorSubscription" value="${sub.subscriptionId}" >
													    <label for="radio">
													    ${sub.subscriptionName}
													    </label>
													</div>
                                      </c:forEach> --%>


											<div class="form-group">
												<label class="control-label">Password<star>*</star></label>
												<input class="form-control" name="contractorPassword"
													id="contractorPassword" type="password" required="true"
													autocomplete="off" />
											</div>

										</div>

										<div class="category">
											<star>*</star>
											Required fields
										</div>

										<div class="card-footer">
											<button type="submit" class="btn btn-info btn-fill">Submit</button>
											<div class="clearfix"></div>

										</div>
									</form>
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
		</div>
	</div>
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

<script type="text/javascript">
        $().ready(function(){
			$('#CreateContractorForm').validate();
           /*  $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
        });
    </script>
</body>
</html>