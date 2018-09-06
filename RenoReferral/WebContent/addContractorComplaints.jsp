
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
<head>
<meta charset="utf-8" />
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

						<a class="navbar-brand" href="#validationforms">Complaints</a>
					</div>

					<span class="pull-right"> <!--   <a class="navbar-brand" href="ComplaintAction?action=showComplaint"><button type="button" class="btn btn-info btn-fill"
					>Show All Complaints</button>
					</a> -->



					</span>
				</div>
				</nav>

				<div class="content" style="margin-top: 15px;">

					<div class="container-fluid">
						<div class="row">

							<div class="col-md-12 ">
								<div class="card">

									<!--  id="LeadRegisterForm" -->
									<form id="CreateComplaintForm" action="ComplaintController"
										method="post">

										<input type="hidden" name="action" value="saveComplaint">

										<div on class="card-header">
											<h4 class="card-title">Create Complaint</h4>
										</div>

										<div class="card-content">
											<div>
												<h3 align="center" style="color: green">${SuccessMessage}</h3>
											</div>

											<div>
												<h3 align="center" style="color: red">${ErrorMessage}</h3>
											</div>

											<div class="col-md-12">
												<fieldset style="margin-bottom: 15px !important;">
													<div class="form-group">
														<div class="col-md-3">
															<label class="control-label"
																style="margin-top: 8px !important;"> Lead
																Reference Number <star>*</star>
															</label>
														</div>
														<div class="col-md-9">
															<input class="form-control" id="lead_id" name="lead_id"
																type="text" required="true" autocomplete="off"
																value="${lead.leadID}" readonly="readonly" />
														</div>
													</div>
												</fieldset>
											</div>

											<!-- <div class="form-group ">
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
			                                  </div>   -->
											<div class="row">
												<div class="col-md-12">
													<fieldset style="margin-bottom: 15px !important;">
														<div class="form-group">
															<div class="col-md-3">
																<label class="" style="margin-top: 40px !important;">Text<star>*</star></label>
															</div>
														</div>
														<div class="col-md-9">
															<div class="form-group">
																<textarea type="text" class="form-control" rows="3"
																	name="complaint_text" id="complaint_text"
																	required="true" maxlength="500"></textarea>
															</div>
														</div>
													</fieldset>
												</div>
											</div>

											<div class="row">
												<%-- <div class="col-md-12">
	                                        <fieldset style="margin-bottom:15px !important;">
	                                    <div class="form-group">
	                                    	 <div class="col-md-3">
	                                       <label class="control-label" style="margin-top:8px !important;">Assign Employee<star>*</star></label>
	                                       </div>
	                                        <div class="col-md-9">
	                                        <select  class="selectpicker"  
	                                               id="employee_id"
	                                               name="employee_id"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                           >
	                                          <option value="0" selected>----Select Employee-------</option>  
	                                        <c:forEach items="${employees}" var="emp">     
	                                       <option value="${emp.employee_id}">${emp.employee_name}</option>
	                                         </c:forEach>   
	                                           </select>
	                                           </div>
	                                    </div>
	                                   </fieldset>
	                                     </div> --%>
												<div class="col-sm-12">

													<div class="form-group">
														<div class="col-md-3">
															<label class="control-label">Select Estimator<star>*</star></label>
														</div>
														<div class="col-md-5">
															<select class="selectpicker" id="employee_id"
																name="employee_id" type="text" required="true"
																autocomplete="off">
																<option value="0">----Select Estimator-------</option>
																<c:forEach items="${employees}" var="emp">
																	<option value="${emp.employee_id}">${emp.employee_name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>

												<div class="col-sm-12">

													<div class="form-group">
														<div class="col-md-3">
															<label class="control-label">Select Installer<star>*</star></label>
														</div>
														<div class="col-md-5">
															<select class="selectpicker" id="installer_id"
																name="installer_id" type="text" required="true"
																autocomplete="off">
																<option value="0">----Select Installer-------</option>
																<c:forEach items="${installers}" var="emp">
																	<option value="${emp.employee_id}">${emp.employee_name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>

											<center>
												<div class="category">
													<star>*</star>
													Required fields
												</div>
											</center>
										</div>
										<div class="card-footer">
											<center>
												<button type="submit" class="btn btn-info btn-fill"
													style="background-color: #de7e31; color: white; border-color: #de7e31;">Submit</button>
											</center>
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
<!-- <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/perfect-scrollbar.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
 -->
<!--  Forms Validations Plugin -->
<script src="js/jquery.validate.min.js"></script>


<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="js/moment.min.js"></script>

<!--  Date Time Picker Plugin is included in this js file -->
<script src="js/bootstrap-datetimepicker.js"></script>

<!--  Select Picker Plugin -->
<script src="js/bootstrap-selectpicker.js"></script>



<!--  Plugin for DataTables.net  -->
<script src="js/jquery.datatables.js"></script>



<!-- Paper Dashboard PRO Core javascript and methods for Demo purpose -->
<script src="js/paper-dashboard.js"></script>


<script type="text/javascript">
        $().ready(function(){
			$('#CreateComplaintForm').validate();
          });
        
       
       
        $(function () {
        	$('.datetimepicker').datetimepicker({
                icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-chevron-up",
                    down: "fa fa-chevron-down",
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-screenshot',
                    clear: 'fa fa-trash',
                    close: 'fa fa-remove'
                }
             });
        
        });
        
        
        
    </script>
</body>
</html>