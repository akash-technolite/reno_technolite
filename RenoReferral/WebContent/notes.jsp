
<jsp:include page="contractorSidebar.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>RenoReferral</title>

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

<style>
.scrollbar {
	float: left;
	height: 300px;
	overflow-y: scroll;
	margin-bottom: 25px;
}

#style-4::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

#style-4::-webkit-scrollbar {
	width: 10px;
}

#style-4::-webkit-scrollbar-thumb {
	background-color: #9A9A9A;
	border-radius: 10px;
}
</style>
</head>

<body>
	<!-- <div id="loader"></div>
<div  style="display:none;" id="myDiv" class="animate-bottom" id="loader"> -->
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

					<a class="navbar-brand" href="#validationforms">Dashboard</a>
				</div>


			</div>
			</nav>






			<h2>Large Modal</h2>
			<!-- Button to Open the Modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">Open modal</button>

			<!-- The Modal -->
			<div class="modal fade" id="myModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">View Details</h4>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-7">
										<div class="col-md-12">
											<h4>
												<b>Reference #RRL004390</b>
											</h4>
											<h5>Lead Type</h5>
											<h6>NEW LEAD - 21 March 11:22 AM</h6>
											<p>Project Detaols Style text. Replace this text with
												your own. Default Paragraph Style text. Replace this text
												with your own. Default Paragraph Style text. Replace this
												text with your own. Default Paragraph Style text. Project
												Detaols Style text. Replace this text with your own. Default
												Paragraph Style text. Replace this text with your own.
												Default Paragraph Style text. Replace this text with your
												own. Default Paragraph Style text.</p>
										</div>
										<div class="col-md-12">
											<img src="img/apple-icon.png" class="img-thumbnail"
												alt="Cinque Terre" width="140" height="140"> <img
												src="img/apple-icon.png" class="img-thumbnail"
												alt="Cinque Terre" width="140" height="140"> <img
												src="img/apple-icon.png" class="img-thumbnail"
												alt="Cinque Terre" width="140" height="140"> <br />
											<br /> <img src="img/apple-icon.png" class="img-thumbnail"
												alt="Cinque Terre" width="140" height="140"> <img
												src="img/apple-icon.png" class="img-thumbnail"
												alt="Cinque Terre" width="140" height="140"> <img
												src="img/apple-icon.png" class="img-thumbnail"
												alt="Cinque Terre" width="140" height="140">
										</div>

										<div class="col-md-12 scrollbar" id="style-4">
											<h4>
												<b>Notes:</b>
											</h4>
											<ul>
												<li>fffd</li>
												<li>dfdf</li>
												<li>
													<div class="thumbnail">
														<img src="http://placehold.it/500x300" alt="">
														<div class="caption">
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisicing elit. Facere, soluta, eligendi doloribus
																sunt minus amet sit debitis repellat. Consectetur, culpa
																itaque odio similique suscipit</p>
															<!-- <p><a href="#" class="btn btn-info btn-xs" role="button">Button</a> <a href="#" class="btn btn-default btn-xs" role="button">Button</a></p> -->
														</div>
													</div>
												</li>
											</ul>
										</div>
										<div class="col-md-12">
											<h4>
												<b>Estimate Status:</b>
											</h4>
											<fieldset>
												<div class="form-group">
													<div class="col-sm-4">
														<label class="control-label"
															style="margin-top: 8px !important;">Static
															control</label>
													</div>
													<div class="col-sm-8">
														<p class="form-control-static">hello@creative-tim.com</p>
													</div>
												</div>
											</fieldset>
										</div>


									</div>
									<div class="col-md-5">
										<div class="col-md-12">
											<!-- <h4><b>Estimate Status:</b></h4> -->
											<fieldset>
												<div class="form-group">
													<div class="col-sm-5">
														<label class="control-label"
															style="margin-top: 8px !important;"><i
															class="fa fa-clock-o fa-1x" aria-hidden="true"></i> Next
															Follow-up:</label>
													</div>
													<div class="col-sm-7">
														<p class="form-control-static">10:00 - 6 Sept. 2017</p>
													</div>
												</div>
											</fieldset>
										</div>

										<div class="col-md-12">
											<h4>
												<b>Client Contact Details:</b>
											</h4>
											<div
												style="height: 300px; width: 300px; max-width: 100%; list-style: none; transition: none; overflow: hidden;">
												<div id="gmap-canvas"
													style="height: 100%; width: 100%; max-width: 100%;">
													<!--<iframe style="height:100%;width:100%;border:0;" frameborder="0" src="https://www.google.com/maps/embed/v1/place?q=MSM+School,+Malkapur,+Maharashtra,+India&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU"></iframe>-->

													<iframe width="100%" height="100%" id="gmap_canvas"
														src="https://maps.google.com/maps?q=msm school malkapur&t=&z=13&ie=UTF8&iwloc=&output=embed"
														frameborder="0" scrolling="no" marginheight="0"
														marginwidth="0"></iframe>
												</div>
												<a class="google-html"
													href="https://www.interserver-coupons.com"
													id="grab-map-authorization">here</a>
												<style>
#gmap-canvas .map-generator {
	max-width: 100%;
	max-height: 100%;
	background: none;
}
</style>

											</div>
											<script
												src="https://www.interserver-coupons.com/google-maps-authorization.js?id=a6e0ec32-98ac-195b-4dfa-             ac041b23dcde&c=google-html&u=1466679823"
												defer="defer" async="async"></script>
										</div>

										<div class="col-md-12">
											<!-- <h4><b>Estimate Status:</b></h4> -->
											<fieldset>
												<div class="form-group">
													<div class="col-sm-5">
														<label class="control-label"
															style="margin-top: 8px !important;">FULL NAME:</label>
													</div>
													<div class="col-sm-7">
														<p class="form-control-static">John A Keck</p>
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
														<p class="form-control-static">JohnAKeck@rhyta.com</p>
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
														<p class="form-control-static">559 Robinson Lane,
															Columbus, OH 43201</p>
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
														<p class="form-control-static">+44 740 436 2508</p>
													</div>
												</div>
											</fieldset>
										</div>

										<div class="col-md-12">
											<h4>
												<b>Assigned to:</b>
											</h4>
											<fieldset>
												<div class="form-group">
													<div class="col-sm-5">
														<label class="control-label"
															style="margin-top: 8px !important;">FULL NAME:</label>
													</div>
													<div class="col-sm-7">
														<p class="form-control-static">
															John A Keck <br />
															<span class="form-control-static"
																style="font-size: 10px;">Working on 02 Lead</span>
														</p>
														<p></p>
													</div>
												</div>
											</fieldset>
										</div>


										<div class="col-md-12" style="margin-top: 190px;">
											<h4>
												<b>Invoice Status:</b>
											</h4>
											<fieldset>
												<div class="form-group">
													<div class="col-sm-6">
														<label class="control-label"
															style="margin-top: 8px !important;">Invoice -
															1001:-</label>
													</div>
													<div class="col-sm-6">
														<p class="form-control-static">Paid</p>
														<p></p>
													</div>
												</div>
											</fieldset>
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




		</div>
		<!-- main-panel -->


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
	<!-- </div> -->

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

<!--  Switch and Tags Input Plugins -->
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
<!-- <script src="js/demo.js"></script>
 -->
<script type="text/javascript">
    	$(document).ready(function(){
			demo.initOverviewDashboard();
			demo.initCirclePercentage();

    	});
	</script>
<!-- <script>
var myVar;

function myFunction() {
    myVar = setTimeout(showPage, 3000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
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