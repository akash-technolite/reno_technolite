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

<title>RenoReferral Dashboard</title>

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
	<!-- <div class="wrapper">

<div class="main-panel">

          <nav class="navbar navbar-default">
	            <div class="container-fluid">
					<div class="navbar-minimize">
						<button id="minimizeSidebar" class="btn btn-fill btn-icon" style="padding:10px !important;"><i class="ti-more-alt"></i></button>
					</div>
	                <div class="navbar-header">
	                    <button type="button" class="navbar-toggle">
	                        <span class="sr-only">Toggle navigation</span>
	                        <span class="icon-bar bar1"></span>
	                        <span class="icon-bar bar2"></span>
	                        <span class="icon-bar bar3"></span>
	                    </button>
	                    <a class="navbar-brand" href="#">
							Dashboard
						</a>
	                </div>
	                
	                </div> -->
	<!--   <div class="collapse navbar-collapse">

						<form class="navbar-form navbar-left navbar-search-form" role="search">
	    					<div class="input-group">
	    						<span class="input-group-addon"><i class="fa fa-search"></i></span>
	    						<input type="text" value="" class="form-control" placeholder="Search...">
	    					</div>
	    				</form>

	                    <ul class="nav navbar-nav navbar-right">
	                        <li>
	                            <a href="#stats" class="dropdown-toggle btn-magnify" data-toggle="dropdown">
	                                <i class="ti-panel"></i>
									<p>Stats</p>
	                            </a>
	                        </li>
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
							<li>
	                            <a href="#settings" class="btn-rotate">
									<i class="ti-settings"></i>
									<p class="hidden-md hidden-lg">
										Settings
									</p>
	                            </a>
	                        </li>
	                    </ul>
	                </div> -->
	</div>
	<!--         </nav>
  <div class="content">
  </div>
<footer class="footer">
	            <div class="container-fluid">
	                <div class="copyright pull-right">
	                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by 
	                    <a href="#">RenoReferral</a>
	                </div>
	            </div>
	        </footer>
	</div> -->

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
					<a class="navbar-brand" href="#Dashboard"> Dashboard </a>
				</div>
				<!-- <div class="collapse navbar-collapse">

						<form class="navbar-form navbar-left navbar-search-form" role="search">
	    					<div class="input-group">
	    						<span class="input-group-addon"><i class="fa fa-search"></i></span>
	    						<input type="text" value="" class="form-control" placeholder="Search...">
	    					</div>
	    				</form>

	                    <ul class="nav navbar-nav navbar-right">
	                        <li>
	                            <a href="#stats" class="dropdown-toggle btn-magnify" data-toggle="dropdown">
	                                <i class="ti-panel"></i>
									<p>Stats</p>
	                            </a>
	                        </li>
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
							<li>
	                            <a href="#settings" class="btn-rotate">
									<i class="ti-settings"></i>
									<p class="hidden-md hidden-lg">
										Settings
									</p>
	                            </a>
	                        </li>
	                    </ul>
	                </div> -->
			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="card-content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-warning text-center">
												<i class="ti-server"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>RR New Leads</p>
												${rr_24new}
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<hr />
									<div class="stats">
										<i class="ti-reload"></i> Last 24 Hrs
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="card-content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-success text-center">
												<i class="ti-wallet"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>New Subscription</p>
												${new_7con}
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<hr />
									<div class="stats">
										<i class="ti-calendar"></i> Last 7 day
									</div>
								</div>
							</div>
						</div>
						<!--  <div class="col-lg-3 col-sm-6">
	                        <div class="card">
	                            <div class="card-content">
	                                <div class="row">
	                                    <div class="col-xs-5">
	                                        <div class="icon-big icon-danger text-center">
	                                            <i class="ti-pulse"></i>
	                                        </div>
	                                    </div>
	                                    <div class="col-xs-7">
	                                        <div class="numbers">
	                                            <p>Lead Revenue</p>
	                                             $23
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
								<div class="card-footer">
									<hr />
									<div class="stats">
										<i class="ti-timer"></i> Last 24Hrs
									</div>
								</div>
	                        </div>
	                    </div>
	                    <div class="col-lg-3 col-sm-6">
	                        <div class="card">
	                            <div class="card-content">
	                                <div class="row">
	                                    <div class="col-xs-5">
	                                        <div class="icon-big icon-info text-center">
	                                            <i class="ti-twitter-alt"></i>
	                                        </div>
	                                    </div>
	                                    <div class="col-xs-7">
	                                        <div class="numbers">
	                                            <p>Subscription Revenue</p>
	                                             45
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
								<div class="card-footer">
									<hr />
									<div class="stats">
										<i class="ti-reload"></i> Last 7 day
									</div>
								</div>
	                        </div>
	                    </div>
	                </div>
	                
	                
	                Tables
	                <div class="row">
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="card-content">
									<div class="row">
										<div class="col-xs-7">
											<div class="numbers pull-left">
												$34,657
											</div>
										</div>
										<div class="col-xs-5">
											<div class="pull-right">
												<span class="label label-success">
		 											+18%
												</span>
											</div>
										</div>
									</div>
									<h6 class="big-title">total earnings <span class="text-muted">in last</span> ten <span class="text-muted">quarters</span></h6>
		                            <div id="chartTotalEarnings"></div>
								</div>
								<div class="card-footer">
									<hr>
									<div class="footer-title"> Lead Revenue - Since Last Month</div>
									<div class="pull-right">
										<button class="btn btn-info btn-fill btn-icon btn-sm">
											<i class="ti-plus"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="card-content">
									<div class="row">
										<div class="col-xs-7">
											<div class="numbers pull-left">
												169
											</div>
										</div>
										<div class="col-xs-5">
											<div class="pull-right">
												<span class="label label-danger">
		 											-14%
												</span>
											</div>
										</div>
									</div>
									<h6 class="big-title">total subscriptions <span class="text-muted">in last</span> 7 days</h6>
		                            <div id="chartTotalSubscriptions"></div>
								</div>
								<div class="card-footer">
									<hr>
									<div class="footer-title"> Subscription Revenue -Since Last Month</div>
									<div class="pull-right">
										<button class="btn btn-default btn-fill btn-icon btn-sm">
											<i class="ti-angle-right"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="card-content">
									<div class="row">
										<div class="col-xs-7">
											<div class="numbers pull-left">
												8,960
											</div>
										</div>
										<div class="col-xs-5">
											<div class="pull-right">
												<span class="label label-warning">
		 											~51%
												</span>
											</div>
										</div>
									</div>
									<h6 class="big-title">total downloads <span class="text-muted">in last</span> 6 years</h6>
		                            <div id="chartTotalDownloads" ></div>
								</div>
								<div class="card-footer">
									<hr>
									<div class="footer-title"> Total Revenue - Since Last Month</div> -->
						<!-- <div class="pull-right">
										<button class="btn btn-success btn-fill btn-icon btn-sm">
											<i class="ti-info"></i>
										</button>
									</div> -->
						<!-- </div>
							</div> -->
					</div>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- container-fluid -->
	</div>
	<footer class="footer">
	<div class="container-fluid">
		<div class="copyright pull-right">
			&copy;
			<script>document.write(new Date().getFullYear())</script>
			, made with <i class="fa fa-heart heart"></i> by <a
				href="http://www.creative-tim.com">Creative Tim</a>
		</div>
	</div>
	</footer>
	</div>
	<!-- main-panel -->
	</div>
	<!-- wrapper -->

</body>

<!--    Core JS Files. Extra: TouchPunch for touch library inside jquery-ui.min.js   -->
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

<script type="text/javascript">
    	$(document).ready(function(){
			demo.initOverviewDashboard();
			demo.initCirclePercentage();

    	});
	</script>



</html>