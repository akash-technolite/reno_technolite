<%@page import="com.tlite.connection.DBConnection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.sql.*"%>
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

<title>Contractor:Profile</title>

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
						<a class="navbar-brand" href="#">Edit Profile</a>
					</div>
					<span class="pull-right"> <!-- <a class="navbar-brand" href="DefaultLeadAction"><button type="button" class="btn btn-info btn-fill"
					>Default Lead Setting</button>
					</a>
					
					<a class="navbar-brand" href="CreateLeadAction"><button type="button" class="btn btn-info btn-fill"
					>Create Lead</button>
					</a>
					 -->

					</span>


					<!--  <div class="collapse navbar-collapse">
						
	                    <ul class="nav navbar-nav navbar-right">
							<li>
	                            <a href="ContractorController?action=showFollowUps" class="btn-rotate">
									<i class="ti-pencil-alt" title="Edit"></i>
									<p>
										Edit Profile <span class="badge"></span>
									</p>
	                            </a>
	                        </li>
	                    </ul>
	                </div> -->

				</div>
				</nav>

				<div class="content" style="margin-top: 15px;">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Profile Details</h4>
									</div>
									<div class="card-content">
										<form id="updateForm" action="ContractorController"
											class="form" method="post">
											<div class="row">

												<input type="hidden" name="action" value="updateProfile">
												<input type="hidden" name="contractorId"
													value="${contractor.contractorId}">

												<div class="col-md-12"
													style="margin-bottom: 15px !important;">
													<div class="form-group">
														<div class="col-md-2">
															<label style="margin-top: 8px !important;">Contractor
																Name<star>*</star>
															</label>
														</div>
														<div class="col-md-10">
															<input type="text" name="contractorName"
																class="form-control border-input" maxlength="50"
																value="${contractor.contractorName}">
														</div>
													</div>
												</div>
												<!-- <div class="col-md-3">
	                                            <div class="form-group">
	                                                <label>Username</label>
	                                                <input type="text" class="form-control border-input" placeholder="Username" value="michael23">
	                                            </div>
	                                        </div> -->
												<!-- <div class="col-md-12" style="margin-bottom:15px !important;">
	                                            <div class="form-group">
	                                            	<div class="col-md-2">
	                                                	<label for="exampleInputEmail1" style="margin-top:8px !important;">Contractor Email</label>
	                                                </div>
	                                                <div class="col-md-10">
	                                                	<input type="email" class="form-control border-input" disabled placeholder="Enter Email Address">
	                                            	</div>
	                                            </div>
	                                        </div> -->

												<!-- <div class="col-md-12" style="margin-bottom:15px !important;">
	                                            <div class="form-group">
	                                            	<div class="col-md-2">
	                                                	<label for="exampleInputEmail1">Another Contractor Email<star>*</star></label>
	                                                </div>
	                                                <div class="col-md-10">
	                                                	<input type="email" class="form-control border-input"  placeholder="Enter Email Address" required="true">
	                                            	</div>
	                                            </div>
	                                        </div> -->

												<div class="col-md-12"
													style="margin-bottom: 15px !important;">
													<div class="form-group">
														<div class="col-md-2">
															<label style="margin-top: 8px !important;">Phone
																Number<star>*</star>
															</label>
														</div>
														<div class="col-md-10">
															<input type="text" name="contractorMobile"
																class="form-control border-input" number="true"
																maxlength="10"
																value="${contractor.contractorMobileNumber}"
																required="true">
														</div>
													</div>
												</div>
												<div class="col-md-12"
													style="margin-bottom: 15px !important;">
													<div class="form-group">
														<div class="col-md-2">
															<label style="margin-top: 8px !important;">Company
																Name<star>*</star>
															</label>
														</div>
														<div class="col-md-10">
															<input type="text" name="contractorCompany"
																class="form-control border-input" maxlength="70"
																value="${contractor.contractorCompany}" required="true">
														</div>
													</div>
												</div>


												<div class="col-md-12"
													style="margin-bottom: 15px !important;">


													<div class="form-group">
														<div class="col-md-2 ">
															<label class="control-label"
																style="margin-top: 8px !important;">Select
																Service<star>*</star>
															</label>
														</div>
														<div class="col-md-10 ">
															<select multiple class=" selectpicker" id="service"
																name="contractorServices" type="text" required="true"
																autocomplete="off" data-live-search="true">
																<c:forEach items="${serviceList}" var="service">
																	<c:choose>
																		<c:when
																			test="${fn:contains(contractorServices,service.serviceId)}">

																			<option selected value="${service.serviceId}">${service.serviceName}</option>

																		</c:when>
																		<c:otherwise>

																			<option value="${service.serviceId}">${service.serviceName}</option>


																		</c:otherwise>

																	</c:choose>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>



												<div class="col-md-12">
													<div class="form-group">
														<div class="col-md-6">
															<div class="col-md-4">
																<label class="control-label">Enter Postal Code </label>
															</div>
															<div class="col-md-8">
																<div class="input-group ">
																	<input type="text" id="txtPlaces" class="form-control"
																		placeholder="Enter a location" /> <span
																		class="input-group-btn">
																		<button class="btn" id="pinBtn" type="button">Add</button>
																	</span>
																</div>
																<div id="pinError" class="col-sm-12 text-danger"></div>
															</div>
														</div>
													</div>
												</div>

												<div class="col-md-12"
													style="margin-bottom: 15px !important;">
													<div class="form-group">
														<div class="col-md-2 ">
															<label class="control-label"
																style="margin-top: 8px !important;">Postal Codes<star>*</star></label>
														</div>
														<div class="col-md-10 ">
															<select multiple class=" selectpicker" id="location"
																name="contractorLocations" type="text" required="true"
																autocomplete="off" data-live-search="true">
																<c:forEach items="${contractorLocations}" var="location">

																	<option
																		value="${location.locatonId}:${location.locationName}"
																		selected>${location.locationName}</option>

																</c:forEach>
															</select>
														</div>
													</div>
												</div>






												<div class="col-md-12"
													style="margin-bottom: 15px !important;">
													<div class="form-group">
														<div class="col-md-2">
															<label style="margin-top: 50px !important;">Address<star>*</star></label>
														</div>
														.
														<div class="col-md-10">
															<textarea rows="3" name="contractorAddrerss"
																class="form-control border-input" maxlength="250"
																required="true">${contractor.contractorAddress}</textarea>
														</div>
													</div>
												</div>

												<%--  <div class="col-md-12" style="margin-bottom:15px !important;">
	                                            <div class="form-group">
	                                            	<div class="col-md-2">
	                                               	 	<label style="margin-top:8px !important;">Subscription Name<star>*</star></label>
	                                                </div>
	                                                <div class="col-md-10">
	                                                	<input type="text" class="form-control border-input" value="${contractor.contractorName}" required="true">
	                                            	</div>
	                                            </div>
	                                        </div> --%>



												<div class="text-center">
													<div class=" text-danger">
														<star>*</star>
														Required fields
													</div>
													<button type="submit" class="btn btn-info btn-fill btn-wd"
														style="background-color: #de7e31; border-color: #de7e31;">Update
														Profile</button>
												</div>
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


</body>

<script type="text/javascript">   
     
        $("#pinBtn").on('click',function(){
        	
        	var geocoder;
            var map; 
            var city;
            geocoder = new google.maps.Geocoder();
            var address = document.getElementById('txtPlaces').value;
            
            geocoder.geocode({ 'address': address }, function (results, status) {
            	
                if (status == google.maps.GeocoderStatus.OK) {                       
                 
                	for (var component in results[0]['address_components']) {
                		
                        for (var i in results[0]['address_components'][component]['types']) {
                        	
                        	
                        	 if (results[0]['address_components'][component]['types'][i] == "administrative_area_level_1") {
                        		 
                        		 city= results[0]['address_components'][component]['long_name'];
                        		 
                        	 }
                        	 
                        	
                        	
                            if (results[0]['address_components'][component]['types'][i] == "country") {
								
                            console.log(JSON.stringify(results));
							
                                //state = results[0]['address_components'][component]['long_name'];
                                country = results[0]['address_components'][component]['long_name'];
								
                                if(country=="canada" || country=="Canada") {
                                	
                                	var postal_code=$("#txtPlaces").val().trim();
                                	
                                /* 	var pin2=pincode.split(' ')[1];
                                	
                                	if(pin2.length==3){
                                		
                                		$("#postalCode").val(pincode);
                                		 $("#city").val(city);
                                	
                                	}else{
                                		
                                		 
                                		 
                                		 $("#address").val("");
                                    	 $("#city").val("");
                                    	 $("#postalCode").val("");
                                    	
                                    }
                                	
                                } else {
                                	
                                	$("#pinError").text("*Enter correct canadian postal code ");
                                	
                                } */
                                
                                
                                
                                
                                
                                if(postal_code.length!=7){
                                	
                                	/*  $("#postalCode").val("");
                                	$("#city").val(""); */
                                  	
                                	$("#pinError").text("*Enter Accurate Location and Inside Canada Only");
                                	  
                                  }else{
                                	  
                                  	 $("#pinError").empty();
                                       
                                    	 /* $("#city").val(city); */
                                      /* $("#contractorLocations").val(postal_code); */
                                         
                                      	
              						     if(checkoptionExist(postal_code)){
              						    	 
              						    	 $("#pinError").text("*Already Added"); 
              						    	$("#txtPlaces").val("");
              						    	 
              						     }else{
              						    	 
              						    	 $("#pinError").empty();
              								   $('#location').append($("<option selected></option>").attr("value",city+':'+postal_code).text(postal_code)); 
              			 	            	  $('.selectpicker').selectpicker('refresh');
              			 	            	  
              			 	            	$("#txtPlaces").val("");
              						     }
              							   
              							   
              						  
                                      }
                                 }
                        }
                    }                                           
                }
            }else {
                	
                	$("#pinError").text("*Enter correct canadian postal code ");
                }
            });
        	
        	
        		
        });
        
        function checkoptionExist(option){
        	
        	var result=false;
        
			$('#location option').each(function(){
			  
				if($(this).text()==option){
					
					result=true;
				}
			  
        	
			   });
            
			return result;
        }
    
        
        
    </script>

<script type="text/javascript">
        $().ready(function(){
			$('#updateForm').validate();
           
        });
    </script>

</html>