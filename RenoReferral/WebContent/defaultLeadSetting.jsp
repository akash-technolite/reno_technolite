<jsp:include page="sidebar.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title></title>

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
						<a class="navbar-brand" href="#validationforms">Admin</a>
					</div>
				</div>
				</nav>

				<div class="content">

					<div class="container-fluid" style="margin-top: 30px">
						<div class="row">

							<div class="col-md-12 ">
								<div class="card" style="padding: 20px;">
									<div class="row">
										<form id="defaultLeadForm" action="SaveDefaultLeadSetting"
											method="post">
											<div class="card-header">
												<h4 class="card-title">Default Lead Setting</h4>
											</div>

											<div class="card-content">

												<%--    <div><h3 align="center" style="color:green">${SuccessMessage}</h3></div>
	                                 <div><h3 align="center" style="color:red">${ErrorMessage}</h3></div>
	                                   
	                                     --%>

												<c:forEach items="${defaultLeadSetting}"
													var="defaultSetting">

													<div class="row">
														<div class="col-md-12">
															<fieldset style="margin-bottom: 15px !important;">
																<div class="form-group">
																	<div class="col-md-3">
																		<label class="control-label"> Set Timeout(In
																			hrs) <star>*</star>
																		</label>
																	</div>
																	<div class="col-md-9">
																		<input class="form-control" id="timeoutLimit"
																			name="timeoutLimit" type="text" required="true"
																			autocomplete="off" maxlength="3" number="true"
																			value="${defaultSetting.timeout}" />
																	</div>
																</div>
															</fieldset>
														</div>
													</div>



													<div class="row">
														<div class="col-md-12" style="margin-bottom: 15px;">
															<div class="form-group">
																<div class="col-md-3">
																	<label class="control-label"> Set Subscriber
																		Limit <star>*</star>
																	</label>
																</div>
																<div class="col-md-9">
																	<input class="form-control" id="subscriberLimit"
																		name="subscriberLimit" type="text" required="true"
																		autocomplete="off" maxlength="4" number="true"
																		value="${defaultSetting.maxBuyers}" />
																</div>
															</div>
														</div>
													</div>

												</c:forEach>

												<div class="row">
													<div class="col-md-12" style="margin-bottom: 15px;">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label">Select
																	Subscription:<star>*</star>
																</label>
															</div>
															<div class="col-md-9">
																<select multiple data-live-search="true"
																	id="defaultSubsctriptions" R
																	name="defaultSubsctriptions" class="selectpicker">

																	<c:forEach items="${subscriptionsList}" var="sub">
																		<c:choose>
																			<c:when
																				test="${fn:contains(defaulSubIds,sub.subscriptionId)}">
																				<option selected value="${sub.subscriptionId}">${sub.subscriptionName}</option>
																			</c:when>
																			<c:otherwise>

																				<option value="${sub.subscriptionId}">${sub.subscriptionName}</option>


																			</c:otherwise>

																		</c:choose>


																	</c:forEach>
																</select>
																<div class="text-danger">
																	<star>*</star>
																	this will override your previous setting
																</div>
															</div>
														</div>
													</div>
												</div>


												<%-- <label class="control-label">Select Subscription:<star>*</star></label>
	                                    
	                                    <c:forEach items="${subscriptionsList}" var="sub"> 
	                                    
	                                      <div class="checkbox">
													    <input id="defaultSubsctriptions" name="defaultSubsctriptions" type="checkbox" value="${sub.subscriptionId}">
													    <label for="checkbox2">
													 		${sub.subscriptionName}
													    </label>
													</div>
	                                     </c:forEach> --%>


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
														style="background-color: #de7e31; border-color: #de7e31;">Submit</button>
													<div class="clearfix"></div>
												</center>
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
			$('#defaultLeadForm').validate();
           /*  $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
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








</body>
</html>