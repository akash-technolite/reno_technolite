<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="sidebar.jsp"></jsp:include>

<%-- <%
    if (session.getAttribute("user").equals("admin")) { 
    	
    	System.out.print(session.getAttribute("user"));
    	
    	
    		%>
        <jsp:include  page="sidebar.jsp"></jsp:include>   
   <%
    }
    else if (session.getAttribute("user").equals("contractor")) { 
		%>
   <jsp:include  page="contractorSidebar.jsp"></jsp:include>   
   
   <%
    }
   
    %>  --%>

<!--  HI FIRST svn CHECK -->

<%-- <c:choose>      
    <c:when test=" ${sessionScope.user}.equals('admin')" >    
        <jsp:include  page="sidebar.jsp"></jsp:include>   
    </c:when>

    <c:when test="${sessionScope.user}='contractor'}">   
        <jsp:include page="contractorSidebar.jsp"></jsp:include>   
    </c:when>
</c:choose>   --%>







<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Home:Lead Registration</title>

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
.thumb {
	width: 80px;
	height: 80px;
	margin: 0.2em -0.7em 0 0;
}

.remove_img_preview {
	position: relative;
	top: -25px;
	right: 5px;
	background: red;
	color: white;
	border-radius: 50px;
	font-size: 0.9em;
	padding: 0 0.3em 0;
	text-align: center;
	cursor: pointer;
}

.remove_img_preview:before {
	content: "×";
}

[hidden] {
	display: none !important;
}
</style>


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
						<a class="navbar-brand" href="#validationforms">Manage Leads</a>
					</div>
				</div>
				</nav>

				<div class="content">

					<div class="container-fluid" style="margin-top: 20px !important;">
						<div class="row">

							<div class="col-sm-12">
								<div class="card">

									<!--  id="LeadRegisterForm" -->
									<form id="LeadRegisterForm" action="LeadRegister" method="post"
										enctype="multipart/form-data">

										<div class="card-header">
											<h4 class="card-title">Create Lead</h4>
										</div>


										<input type="hidden" name="page" value="adminLead">

										<%-- <div  class="card-header">
	                               		<center>
										<h3 class="card-title">
										<strong>
											Create Lead
											</strong>
										</h3>
										<hr>
										</center>
									</div> --%>


										<div class="card-content">
											<div class="row">
												<%-- <div><h3 align="center" class="fadeThis" style="color:green">${SuccessMessage}</h3></div> 
	                                 
	                                <div><h3 align="center" class="fadeThis" style="color:red">${ErrorMessage}</h3></div> 
	                                  --%>

												<div class="col-md-12">

													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class=" form-group">
																<div class="col-md-4 ">
																	<label class="control-label"
																		style="margin-top: 8px !important;">Select
																		Service<star>*</star>
																	</label>
																</div>
																<div class="col-md-8">
																	<select class="selectpicker" id="service"
																		name="service" type="text" required="true"
																		autocomplete="off" data-live-search="true">
																		<c:forEach items="${serviceList}" var="service">
																			<option value="${service.serviceId}">${service.serviceName}</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</fieldset>
													</div>

													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group">
																<div class="col-md-4">
																	<label class="control-label"
																		style="margin-top: 8px !important;">Select
																		Budget<star>*</star>
																	</label>
																</div>
																<div class="col-md-8 form-group">
																	<select class="selectpicker" id="budget" name="budget"
																		type="text" required="true" autocomplete="off"
																		data-live-search="true">
																		<c:forEach items="${budgetRanges}" var="budget">
																			<option value="${budget.budget_ranges_id}">${budget.min_value}$
																				to ${budget.max_value}$</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</fieldset>
													</div>

												</div>


												<div class="col-md-12">
													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group">
																<div class="col-md-4">
																	<label class="control-label"
																		style="margin-top: 8px !important;"> Name <star>*</star>
																	</label>
																</div>

																<div class=" col-md-8 form-group ">
																	<input class="form-control name" id="name" name="name"
																		type="text" required="true" autocomplete="off"
																		maxlength="80" value="" />
																	<p style="color: red" id="name_error"></p>
																</div>

															</div>
														</fieldset>
													</div>



													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group">
																<div class="col-md-4">
																	<label class="control-label"
																		style="margin-top: 8px !important;">Enter
																		Postal Code</label>
																</div>

																<div class="col-md-8 form-group">
																	<input type="text" id="txtPlaces" class="form-control"
																		placeholder="Enter a location" maxlength="7"
																		style="text-transform: uppercase" />

																	<div id="pinError" class="text-danger"></div>
																</div>

															</div>
														</fieldset>
													</div>


												</div>


												<div class="col-md-12">
													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group">
																<div class="col-md-4">
																	<label class="control-label"
																		style="margin-top: 10px !important;">Mobile<star>*</star></label>
																</div>

																<div class="col-md-8 form-group">
																	<input class=" form-control" name="mobileNumber"
																		id="mobileNumber" type="text" required="true"
																		autocomplete="off" minlength="10" maxlength="10"
																		number="true" />
																</div>

															</div>
														</fieldset>
													</div>

													<%-- <div class="form-group">
	                                          <label class="  control-label">Postal Code<star>*</star></label>
	                                        <!-- <input class="form-control"
	                                               name="postalCode"
	                                               id="postalCode"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
											/> -->
											
											
											<select  class="col-sm-8 selectpicker"  
	                                               id="postalCode"
	                                               name="postalCode"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                           >
	                                           
	                                        <c:forEach items="${LocationList}" var="location">    
	                                       <option value="${location.locatonId}">${location.locationName}</option>
	                                         </c:forEach>   
	                                           </select>
											
										
	                                    </div> --%>


													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group ">
																<div class="col-md-4">
																	<label class=" control-label"
																		style="margin-top: 8px !important;">Province<star>*</star>
																	</label>
																</div>
																<div class="col-md-8 form-group">
																	<input class="form-control" id="postalCode"
																		name="postalCode" type="text" required="true"
																		readonly="readonly"
																		><!-- style="text-transform: uppercase" -->
																</div>
															</div>
														</fieldset>
													</div>

												</div>


												<div class="col-md-12">

													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group">
																<div class="col-md-4">
																	<label class="control-label"
																		style="margin-top: 8px !important;"> Email
																		Address <star>*</star>
																	</label>
																</div>

																<div class="col-md-8 form-group">
																	<input class="form-control" id="email" name="email"
																		type="text" required="true" email="true"
																		autocomplete="off" placeholder="example@email.com"
																		maxlength="40" email="true" />
																</div>
															</div>

														</fieldset>
													</div>

													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group">
																<div class="col-md-4">
																	<label class="  control-label"
																		style="margin-top: 8px !important;">City<star>*</star></label>
																</div>
																<div class="col-md-8 form-group">
																	<input class="form-control" id="city" name="city"
																		type="text" required="true" readonly="readonly">
																</div>
															</div>
														</fieldset>
													</div>
												</div>

												<div class="col-md-12">

													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group">
																<div class="col-md-4 ">
																	<label class="control-label"
																		style="margin-top: 16px !important;">Describe
																		Your Requirement<star>*</star>
																	</label>
																</div>
																<div class="col-md-8">
																	<textarea type="text" class="form-control" rows="3"
																		name="description" id="description" required="true"
																		maxlength="800"></textarea>
																</div>
															</div>
														</fieldset>
													</div>
													
													<div class="col-md-6">
														<fieldset style="margin-bottom: 15px !important;">
															<div class="form-group">
																<div class="col-md-4">
																	<label class="control-label"
																		style="margin-top: 25px !important;">Address<star>*</star></label>
																</div>
																<div class="col-md-8 form-group">
																	<textarea type="text" class="form-control" rows="3"
																		name="address" id="address" required="true"
																		autocomplete="off" maxlength="200"></textarea>
																</div>
															</div>
														</fieldset>
													</div>


												</div>












												<%--  <div class="form-group">
	                                     <label class="control-label">Select City<star>*</star></label>
	                                        <select   class="selectpicker"  data-size="10"  
	                                               id="city"
	                                               name="city"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                               data-live-search="true"
	                                              
	                                           >
	                                        <option value="0" selected>--Select Your City--</option>
	                                        <c:forEach items="${cities}" var="city">     
	                                       <option value="${city.cityName}">${city.cityName}</option>
	                                         </c:forEach>   
	                                           </select>
	                                    </div>
	                                   
	                                   
	                                
	                                   <div class="form-group ">
	                                          <label class="  control-label">Postal Code<star>*</star></label>
	                                        
											
											<select  class="selectpicker" 
	                                               id="postalCode"
	                                               name="postalCode"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                               data-live-search="true"
	                                           >
	                                           </select>
										</div> 
	                              --%>

												<div class="col-md-12">

													<fieldset style="margin-bottom: 15px !important;">
														<div class="form-group">
															<div class="col-md-2">
																<label class="control-label"
																	style="margin-top: 8px !important;">Upload
																	Images<star>*</star>
																</label>
															</div>
															<!--  <div class="col-md-6 form-group">
	                                        <input class="form-control selectpicker"
	                                               name="uploadImage1"
	                                               id="uploadImage1"
	                                               type="file"
	                                               required="true"
	                                               multiple
	                                             />
	                                       </div>  -->

															<div class="col-md-6">
																<label class="btn btn-default"> Choose File <input
																	type="file" id="files" name="image_file_arr[]" multiple
																	hidden>
																</label>
																<!-- <input type="file" id="files" name="image_file_arr[]" multiple> -->
																<br>
																<output id="list"></output>
															</div>
														</div>
													</fieldset>

												</div>

												<div class="col-sm-12">
													<center>
														<div class="category">
															<star>*</star>
															Required fields
														</div>

														<button type="submit" class="btn btn-info btn-fill"
															style="background-color: #de7e31; border-color: #de7e31;">Submit</button>
													</center>
												</div>


											</div>
										</div>

										<div class="card-footer">

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

<!-- <!--  Google Maps Plugin    -->
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


<!-- Custom JS -->
<script src="js/utility.js"></script>

<!-- Custom Validation-->
<script src="js/custom-validations.js"></script>


<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-omQaNJCLUKuXjkIxtb9-RJpJ-zugBc0&libraries=places&callback=initMap"
	async defer></script>
	
	
<script type="text/javascript">
        $().ready(function(){
			$('#LeadRegisterForm').validate();
         /*    $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
        });
    </script>
<!--  <script type="text/javascript">
   
      $("#city").on("change",function(){
    	  
    	  
    	  var cityName=$("#city").val();
    	  
    	  /* alert(cityName); */
    	  $('#postalCode').empty();
        		$.get('AjaxForLocations',{
        		
        			cityName:cityName
        			
        	    	},function(response) {
        	    		
        	             $.each(response, function(index, value) {
        	            	  $('#postalCode').append($('<option>', { 
        	            	        value: value.locatonId,
        	            	        text : value.locationName 
        	            	    })); 
        	            	   
        	            	  $('.selectpicker').selectpicker('refresh');
							});
						});
        			});
        	
    </script> -->

<!--  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwRtNgXpNu4WDyrKnnNX-T_ahtT0PLccE &libraries=places"></script>
     <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('txtPlaces'));
            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
                var address = place.formatted_address;
                var latitude = place.geometry.location.lat();
                var longitude = place.geometry.location.lng();
                GetPinCodeFromLatLong(latitude, longitude);
                document.getElementById('txtPlaces').value = '';
            });
        });
        function GetPinCodeFromLatLong(lat, lng) {
            var latlng = new google.maps.LatLng(lat, lng);
            var geocoder = geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                        var address = results[0].formatted_address;
                        var city = results[0].formatted_address.split(',')[1].trim();
                        var pin1 = results[0].formatted_address.split(',')[2].split(' ')[2];
                        var pin2 = results[0].formatted_address.split(',')[2].split(' ')[3];
                        var postal_code=pin1+" "+pin2;
                       /*  [results[0].formatted_address.split(',').length - 2].trim().split(' ')[1]; */
                        /* alert("Address: " + address + "\n\nPinCode: " + pin); */
                       
                        
                        if(postal_code.length!=7){
                      	  $("#postalCode").val("");
                      	$("#city").val("");
                        	$("#address").val("");
                      	
                      	  $("#pinError").text("*Enter Accurate Location and Inside Canada Only");
                      	  
                        }else{
                      	  
                      	  $("#pinError").empty();
                      	 $("#address").val(address);
                      	 $("#city").val(city);
                        $("#postalCode").val(postal_code);
                        
                        }
                    	 	
                    }
                }
            });
        }
    </script>   -->
    
    <script type="text/javascript">


    function changeAddress(){ 
	
	 var mAddress=$("#mAddress").val(); 
	 
	 $("#address").val(mAddress);
	
    }



</script>

<script type="text/javascript">   
        
        $("#txtPlaces").on('change',function(){
        	
        	
        	var geocoder;
            var map; 
            var city;
            geocoder = new google.maps.Geocoder();
            var address = document.getElementById('txtPlaces').value;
            
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {                       
                	  var address = results[0].formatted_address;
                	for (var component in results[0]['address_components']) {
                		
                        for (var i in results[0]['address_components'][component]['types']) {
                        	
                        	/* administrative_area_level_1 */
                        	 if (results[0]['address_components'][component]['types'][i] == "locality") {
                        		 
                        		 city= results[0]['address_components'][component]['long_name'];
                        		 
                        	 }
                        	 
 							if (results[0]['address_components'][component]['types'][i] == "administrative_area_level_1") {
                        		 
                            	 province= results[0]['address_components'][component]['long_name'];
                        		 
                        	 }
                        	
                            if (results[0]['address_components'][component]['types'][i] == "country") {
								
                            console.log(JSON.stringify(results));
							
                                //state = results[0]['address_components'][component]['long_name'];
                                country = results[0]['address_components'][component]['long_name'];
								
                                if(country=="canada" || country=="Canada") {
                                	
                                	var pincode=$("#txtPlaces").val().trim();
                                	
                                	var pin2=pincode.split(' ')[1];
                                	
                                	
                                	 
                                	if(pin2.length==3){
                                		
                                		$("#postalCode").val(province);
                                		 $("#city").val(city);
                                		/*  $("#address").val(address); */
                                		 $("#pinError").empty();
                                		$("#mAddress").val(address);  
                             		     $('#addressModal').modal('show');
                                		 
                                		 
                                	
                                	}else{
                                		
                                		  $("#address").val("");
                                    	 $("#city").val("");
                                    	 $("#postalCode").val("");
                                    	
                                    }
                                	
                                } else {
                                	
                                	$("#pinError").text("*Enter correct canadian postal code ");
                                	 $("#city").val("");
                                	 $("#address").val("");
                                	 $("#postalCode").val("");
                                }
                                
                            }
                        }
                    }                                           
                } else {
                	
                	$("#pinError").text("*Enter correct canadian postal code ");
                	 $("#city").val("");
                	 $("#postalCode").val("");
                	 $("#address").val("");
                }
            });
        	
        	
        		
        });
        
        
        
        
    </script>

<!-- <script type="text/javascript">   
        $("#txtPlaces").on('change',function(){
        	
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
                                	
                                	var pincode=$("#txtPlaces").val().trim();
                                	
                                	var pin2=pincode.split(' ')[1];
                                	
                                	if(pin2.length==3){
                                		
                                		$("#postalCode").val(pincode);
                                		 $("#city").val(city);
                                		 $("#pinError").empty();
                                	
                                	}else{
                                		
                                		 
                                		 
                                		 $("#address").val("");
                                    	 $("#city").val("");
                                    	 $("#postalCode").val("");
                                    	
                                    }
                                	
                                } else {
                                	
                                	$("#pinError").text("*Enter correct canadian postal code ");
                                	 $("#city").val("");
                                	 $("#postalCode").val("");
                                }
                                
                            }
                        }
                    }                                           
                } else {
                	
                $("#pinError").text("*Enter correct canadian postal code ");
               	 $("#city").val("");
               	 $("#postalCode").val("");
                }
            });
        	
        	
        		
        });
        
        
    </script> -->

<script type="text/javascript"></script>




<script>
 var count=0;
	function handleFileSelect(evt) {
		var $fileUpload = $("input#files[type='file']");
		count=count+parseInt($fileUpload.get(0).files.length);
		
		if (parseInt($fileUpload.get(0).files.length) > 6 || count>5) {
			alert("You can only upload a maximum of 5 files");
			count=count-parseInt($fileUpload.get(0).files.length);
			evt.preventDefault();
			evt.stopPropagation();
			return false;
		}
		var files = evt.target.files;
		for (var i = 0, f; f = files[i]; i++) {
			if (!f.type.match('image.*')) {
				continue;
			}
			var reader = new FileReader();

			reader.onload = (function (theFile) {
				return function (e) {
					var span = document.createElement('span');
					span.innerHTML = ['<img class="thumb" src="', e.target.result, '" title="', escape(theFile.name), '"/><span class="remove_img_preview"></span>'].join('');
					document.getElementById('list').insertBefore(span, null);
				};
			})(f);

			reader.readAsDataURL(f);
		}
	}
	
	$('#files').change(function(evt){
		handleFileSelect(evt);
	});	 

	$('#list').on('click', '.remove_img_preview',function () {
		$(this).parent('span').remove();
     
     //this is not working...
     var i = array.indexOf($(this));
     if(i != -1) {
         array.splice(i, 1);
     }
     // tried this too:
     //$(this).parent('span').splice( 1, 1 );
     
     count--;
	});
</script>

           <div class="container">
			
			  <!--Address Modal -->
			  <div class="modal fade" id="addressModal" role="dialog" data-backdrop="static" data-keyboard="false">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			         <!--  <button type="button" class="close" data-dismiss="modal">&times;</button> -->
			          <h4 class="modal-title">Address Verification</h4>
			        </div>
			        <div class="modal-body">
			        
			        
			        <label>Verify Your Address and Modify Accordingly</label>
			        <div class="form-group">
			        <textarea rows="4" class="form-control" type="text" id="mAddress"></textarea>			        
			         </div>
			       
			           
			        </div>
			        <div class="modal-footer">
			        <button type="button" class="btn btn-success" id="mBtn" onclick="changeAddress()" data-dismiss="modal">Ok</button>
			         <!--  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
			        </div>
			      </div>
			      
			    </div>
			  </div>
			  
			</div>


</body>
</html>