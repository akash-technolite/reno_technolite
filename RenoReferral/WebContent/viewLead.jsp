
<%
    if (session.getAttribute("user").equals("admin")) { 
    	
    	System.out.print(session.getAttribute("user"));
    	
    	
    		%>
<jsp:include page="sidebar.jsp"></jsp:include>
<%
    }
    else if (session.getAttribute("user").equals("contractor")) { 
		%>
<jsp:include page="contractorSidebar.jsp"></jsp:include>

<%
    }
   
    %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard PRO by Creative Tim</title>

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

<link href="css/owl.carousel.css" rel="stylesheet" />
<link href="css/animate.css" rel="stylesheet" />
<link href="css/slider-pro.css" rel="stylesheet" />
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sliderPro.min.js"></script>

<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="css/themify-icons.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" media="screen"
	href="http://cdnjs.cloudflare.com/ajax/libs/fancybox/1.3.4/jquery.fancybox-1.3.4.css" />
<style type="text/css">
a.fancybox img {
	border: none;
	box-shadow: 0 1px 7px rgba(0, 0, 0, 0.6);
	-o-transform: scale(1, 1);
	-ms-transform: scale(1, 1);
	-moz-transform: scale(1, 1);
	-webkit-transform: scale(1, 1);
	transform: scale(1, 1);
	-o-transition: all 2s ease;
	-ms-transition: all 2s ease;
	-moz-transition: all 2s ease;
	-webkit-transition: all 2s ease;
	transition: all 2s ease;
}

a.fancybox:hover img {
	position: relative;
	z-index: 999;
	-o-transform: scale(1.03, 1.03);
	-ms-transform: scale(1.03, 1.03);
	-moz-transform: scale(1.03, 1.03);
	-webkit-transform: scale(1.03, 1.03);
}

.hide-bullets {
	list-style: none;
	margin-left: -40px;
	margin-top: 20px;
}

.thumbnail {
	padding: 0;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
}
</style>



<link href="css/lightbox.css" rel="stylesheet">


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
					<a class="navbar-brand" href="#regulartables">View Lead</a>
				</div>
				<span class="navbar-brand pull-right"> <a href="LeadAction"><button
							type="button" class="btn  btn-info ">
							<i class="ti-angle-left"></i>Back
						</button></a>
				</span>
			</div>
			</nav>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<a class="navbar-brand" href="LeadAction"> <!-- <button type="button" class="btn btn-info  btn-sm"><span class="ti-control-backward"></span> Back</button> -->

						</a>
						<div class=" col-md-12">
							<div class="card">
								<div class="card-header">
									<!-- <h4 class="card-title">View Lead</h4> -->

								</div>
								<%-- <div class="card-content table-responsive table-full-width">
	                                <table class="table table-striped table-bordered">
	                                  
	                                    <thead>
	                                        <th><strong>Name</strong></th>
	                                    	<th><strong>Details</strong></th>
	                                    </thead>
	                                    <tbody >
	                                        <tr>
	                                        	<td><strong>Referrance Number</strong></td>
	                                        	<td>${lead.leadID}</td>
	                                        	
	                                        </tr>
	                                         <tr>
	                                        	<td>Registration Time</td>
	                                        	<td>${lead.timestamp}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Service Name</td>
	                                        	<td>${lead.serviceName}</td>
	                                        	
	                                        </tr>
	                                        <tr>
	                                        	<td>Service Description</td>
	                                        	<td>${lead.description}</td>
	                                        	
	                                        </tr>
	                                        <tr>
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
	                                        	
	                                        </tr>
	                                        
	                                         <tr>
	                                        	<td>Budget Range</td>
	                                        	<td>${lead.budgetrange.min_value}$ to ${lead.budgetrange.max_value}$</td>
	                                        	
	                                        </tr>
	                                       
	                                       <tr>
	                                        	<td>Images</td>
	                                        	<td>
	                                        		<a data-toggle="modal" data-target="#myModal" href="#myGallery" data-slide-to="0">
	                                        		<c:forEach items="${imagePaths}" var="image">
	                                        			<li class="lighbox"><a href="${image}" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
	                                        			</c:forEach>
	                                        		</a>
	                                        	</td>
	                                        </tr>
	                                        
	                                         
	                                
	                                       
	                                       
	                                        <tr>
	                                        	<td>Images</td>
	                                        	<td><iframe  src="${image}" ></iframe> </td>
	                                        	
	                                        </tr>
	                                       
	                                       <tr>
	                                        	<td>Images</td>
	                                        	<td><a href="${image}" target="_blank"><img src="${image}" class="img-thumbnail" width="304" height="236"></a></td>
	                                        </tr>
	                                       
	                                      
	                                        
	                                    </tbody>
	                                </table>
	                            </div> --%>



								<div class="row">
									<div class="col-md-6">
										<div class="col-md-12" style="word-wrap: break-word;">
											<h4>
												<b>Reference No: ${lead.leadID}</b>
											</h4>
											<h5>${lead.serviceName}</h5>
											<h5>
												<fmt:formatDate value="${lead.timestamp}" type="both"
													timeStyle="short" />
											</h5>
											<p>${lead.description}</p>
										</div>
										<div class="col-md-12">
											<h4>
												<b>Images:</b>
											</h4>
											<c:forEach items="${imagePaths}" var="image">
												<%-- <img src="${image}" class="img-thumbnail" alt="Cinque Terre" width="140" height="140">  --%>
												<a href="${image}" data-lightbox='leadimages'><img
													src='${image}' class='img-thumbnail' alt='' width='140'
													height='140'></a>
											</c:forEach>
										</div>

										<!-- <div class="col-md-8 scrollbar" id="style-4">
         					<h4><b>Notes:</b></h4>
         					<ul>
         						<li>fffd</li>
         						<li>dfdf</li>
         						<li>
          							<div class="thumbnail">
            							<img src="http://placehold.it/500x300" alt="">
              							<div class="caption">
                							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, soluta, eligendi doloribus sunt minus amet sit debitis repellat. Consectetur, culpa itaque odio similique suscipit</p>
               								<p><a href="#" class="btn btn-info btn-xs" role="button">Button</a> <a href="#" class="btn btn-default btn-xs" role="button">Button</a></p>
            							</div>
          							</div>
          						</li>
          					</ul>
        				</div> -->
										<!-- <div class="col-md-12">
        					<h4><b>Estimate Status:</b></h4>
        					<fieldset>
	                             <div class="form-group">
	                             		<div class="col-sm-4">
	                                   		<label class="control-label" style="margin-top:8px !important;">Static control</label>
	                                   </div>
	                                    <div class="col-sm-8">
	                                         <p class="form-control-static">hello@creative-tim.com</p>
	                                     </div>
	                              </div>
	                         </fieldset>
        				</div> -->
										<!-- <div class="col-md-12">
         			
         				<div style="height:300px;width:300px;max-width:100%;list-style:none; transition: none;overflow:hidden;">
                    		<div id="gmap-canvas" style="height:100%; width:100%;max-width:100%;">
                        		<iframe style="height:100%;width:100%;border:0;" frameborder="0" src="https://www.google.com/maps/embed/v1/place?q=MSM+School,+Malkapur,+Maharashtra,+India&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU"></iframe>
                        
                         		<iframe width="100%" height="100%" id="gmap_canvas" src="https://maps.google.com/maps?q=msm school malkapur&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                    		</div>
                        		<a class="google-html" href="https://www.interserver-coupons.com" id="grab-map-authorization">here</a><style>#gmap-canvas .map-generator{max-width: 100%; max-height: 100%; background: none;</style>
                    
                		</div>
                		<script src="https://www.interserver-coupons.com/google-maps-authorization.js?id=a6e0ec32-98ac-195b-4dfa-             ac041b23dcde&c=google-html&u=1466679823" defer="defer" async="async"></script>
         				</div> -->

									</div>
									<div class="col-md-6">
										<!-- <div class="col-md-12">
        					<h4><b>Estimate Status:</b></h4>
        					<fieldset>
	                             <div class="form-group">
	                             		<div class="col-sm-5">
	                                   		<label class="control-label" style="margin-top:8px !important;"><i class="fa fa-clock-o fa-1x" aria-hidden="true"></i> Next Follow-up:</label>
	                                   </div>
	                                    <div class="col-sm-7">
	                                         <p class="form-control-static">10:00 - 6 Sept. 2017</p>
	                                     </div>
	                              </div>
	                         </fieldset>
        				</div> -->



										<div class="col-md-12" style="word-wrap: break-word;">
											<h4>
												<b>Client Contact Details:</b>
											</h4>
											<!-- <h4><b>Estimate Status:</b></h4> -->
											<fieldset>
												<div class="form-group">
													<div class="col-sm-5">
														<label class="control-label"
															style="margin-top: 8px !important;">FULL NAME:</label>
													</div>
													<div class="col-sm-7">
														<p class="form-control-static">${lead.name}</p>
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
														<p class="form-control-static">${lead.email}</p>
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
														<p class="form-control-static">${lead.address}</p>
													</div>
												</div>
											</fieldset>
											<fieldset>
												<div class="form-group">
													<div class="col-sm-5">
														<label class="control-label"
															style="margin-top: 8px !important;">MOBILE:</label>
													</div>
													<div class="col-sm-7">
														<p class="form-control-static">${lead.mobile}</p>
													</div>
												</div>
											</fieldset>

											<fieldset>
												<div class="form-group">
													<div class="col-sm-5">
														<label class="control-label"
															style="margin-top: 8px !important;">CITY:</label>
													</div>
													<div class="col-sm-7">
														<p class="form-control-static">${lead.locationName}</p>
													</div>
												</div>
											</fieldset>
										</div>

										<c:if test="${not empty lead.contractor.contractorName}">
											<div class="col-md-12">
												<h4>
													<b>Assigned to:</b>
												</h4>
												<fieldset>
													<div class="form-group">
														<div class="col-sm-5">
															<label class="control-label"
																style="margin-top: 8px !important;">Contractor
																Name:</label>
														</div>
														<div class="col-sm-7">
															<p class="form-control-static">${lead.contractor.contractorName}</p>
															<p></p>
														</div>
														<div class="col-sm-5">
															<label class="control-label"
																style="margin-top: 8px !important;">Contractor
																Email:</label>
														</div>
														<div class="col-sm-7">
															<p class="form-control-static">${lead.contractor.contractorEmail}</p>
															<p></p>
														</div>
														<div class="col-sm-5">
															<label class="control-label"
																style="margin-top: 8px !important;">Contractor
																Mobile:</label>
														</div>
														<div class="col-sm-7">
															<p class="form-control-static">${lead.contractor.contractorMobileNumber}</p>
															<p></p>
														</div>
													</div>
												</fieldset>
											</div>
										</c:if>

										<!--   <div class="col-md-12" style="margin-top:190px;">
        					<h4><b>Invoice Status:</b></h4>
        					<fieldset>
	                             <div class="form-group">
	                             		<div class="col-sm-6">
	                                   		<label class="control-label" style="margin-top:8px !important;">Invoice - 1001:-</label>
	                                   </div>
	                                    <div class="col-sm-6">
	                                         <p class="form-control-static">Paid </p>
	                                         <p ></p>
	                                     </div>
	                              </div>
	                         </fieldset>
	                     </div> -->

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

	<script src="js/lightbox.js"></script>
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


<%-- <!--begin modal window-->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
	<div class="modal-content">
<!-- <div class="modal-header">
<div class="pull-left">My Gallery Title</div>
<button type="button" class="close" data-dismiss="modal" title="Close"> <span class="ti-close"></span></button>
</div> -->
<div class="modal-body">

<!--begin carousel-->
<div id="myGallery" class="carousel slide" data-interval="false">
<div class="carousel-inner">
<c:forEach items="${imagePaths}" var="image">
<div class="item"> <center>
<img src="${image}" alt="item0" style="width:100%">
</center>
<div class="carousel-caption">
</div>
</div>

</c:forEach>


</div>
</div>
	

<!--end carousel-inner--></div>
<!--Begin Previous and Next buttons-->
<a class="left carousel-control" href="#myGallery" role="button" data-slide="prev" style="margin-top: 250px;"> <span class="ti-angle-left" style="color:black; align:center;"></span></a>
<a class="right carousel-control" href="#myGallery" role="button" data-slide="next" style="margin-top: 250px;"> <span class="ti-angle-right" style="color:black;"></span></a>
<!--end carousel--></div>

<!--end modal-body--></div>
<!-- <div class="modal-footer">

<button class="btn-sm close" type="button" data-dismiss="modal"><b>Close</b></button>
</div> -->
<!--end modal-content--></div>
<!--end modal-dialoge-->
<!--end myModal--> --%>

<!--begin modal window-->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- <div class="modal-header">
<div class="pull-left">My Gallery Title</div>
<button type="button" class="close" data-dismiss="modal" title="Close"> <span class="ti-close"></span></button>
</div> -->
			<div class="modal-body">


				<section id="Staff" class="bgSection portfolio-section">
				<div class="container">
					<div class="row"></div>
				</div>

				<!-- Works -->
				<div class="portfolio-works wow fadeIn" data-wow-duration="2s">

					<!-- Filter Button Start -->
					<!--
            <div id="portfolio-filter" class="portfolio-filter-btn-group">
                <ul>
                    <li>
                        <a href="#" class="selected" data-filter="*">ALL</a> 
						<a href="#" data-filter=".web">CHINES</a> 
						<a href="#" data-filter=".seo">CONTINENTAL</a> 
						<a href="#" data-filter=".works">ASIAN</a> 
						<a href="#" data-filter=".brands">EUROPEN</a> 
                    </li>
                </ul>
            </div>
-->
					<!-- Filter Button End -->

					<div class="portfolio-items">

						<!-- Portfolio Items -->
						<div class="item portfolio-item web seo">

							<img src="images/img-portfolio/18.jpg" alt="">
							<div class="portfolio-details-wrapper">
								<div class="portfolio-details">
									<div class="portfolio-meta-btn">
										<ul class="work-meta">
											<li class="lighbox"><a href="${image}"
												class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
										</ul>
									</div>
								</div>
							</div>

						</div>
						<!-- Portfolio Items End -->

					</div>
				</div>
				<!-- Works End --> </section>

				<!--end carousel-inner-->
			</div>
			<!--Begin Previous and Next buttons-->
			<a class="left carousel-control" href="#myGallery" role="button"
				data-slide="prev" style="margin-top: 250px;"> <span
				class="ti-angle-left" style="color: black; align: center;"></span></a> <a
				class="right carousel-control" href="#myGallery" role="button"
				data-slide="next" style="margin-top: 250px;"> <span
				class="ti-angle-right" style="color: black;"></span></a>
			<!--end carousel-->
		</div>

		<!--end modal-body-->
	</div>
	<!-- <div class="modal-footer">

<button class="btn-sm close" type="button" data-dismiss="modal"><b>Close</b></button>
</div> -->
	<!--end modal-content-->
</div>
<!--end modal-dialoge-->
<!--end myModal-->



</html>
