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

						<a class="navbar-brand" href="#validationforms">Complaints</a>
					</div>
					<span class="pull-right"> <!--  <a class="navbar-brand" href="ComplaintAction?action=showComplaint"><button type="button" class="btn btn-info btn-fill"
					>Show All Complaints</button>
					</a> -->



					</span>
				</div>
				</nav>

				<div class="content">

					<div class="container-fluid">
						<div class="row">

							<div class="col-md-10 col-md-offset-1">
								<div class="card">

									<!--  id="LeadRegisterForm" -->
									<form id="CreateComplaintForm" action="CreateComplaint"
										method="post">

										<input type="hidden" name="action" value="createComplaint">

										<div on class="card-header">
											<h4 class="card-title">
												<strong>Create Complaint</strong>
											</h4>
										</div>

										<div class="card-content">

											<div class="">
												<%-- <div><h3 align="center" style="color:green">${SuccessMessage}</h3></div> 
	                                 
	                                <div><h3 align="center" style="color:red">${ErrorMessage}</h3></div> 
	                                  --%>


												<div class="form-group">
													<label class="control-label"> Lead Reference Number
														<star>*</star>
													</label> <input class="form-control" id="lead_id" name="lead_id"
														type="text" required="true" autocomplete="off"
														value="${lead.leadID}" readonly="readonly" />
												</div>





												<div class="form-group">
													<label class="">Text<star>*</star></label>
												</div>
												<div class="form-group">
													<textarea type="text" class="form-control" rows="3"
														name="complaintText" id="complaintText" required="true"
														maxlength="500"></textarea>
												</div>


												<div class="form-group">
													<label class="control-label">Assign Contractor<star>*</star></label>
													<select class="selectpicker" id="contractor_id"
														name="contractor_id" type="text" required="true"
														autocomplete="off">
														<option value="0" selected>----Select
															Contractor-------</option>
														<c:forEach items="${conList}" var="con">
															<option value="${con.contractorId}">${con.contractorName}</option>
														</c:forEach>
													</select>
												</div>


												<div class="category">
													<star>*</star>
													Required fields
												</div>
											</div>
											<div class="card-footer">
												<button type="submit" class="btn btn-info btn-fill">Submit</button>
												<div class="clearfix"></div>
											</div>
										</div>
									</form>
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

<script type="text/javascript">
        $().ready(function(){
			$('#CreateComplaintForm').validate();
            $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate();
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