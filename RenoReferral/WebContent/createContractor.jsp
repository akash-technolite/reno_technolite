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

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-omQaNJCLUKuXjkIxtb9-RJpJ-zugBc0&libraries=places&callback=initMap"
	async defer></script>
	
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

						<a class="navbar-brand" href="#validationforms">User: Create
							Contractor</a>
					</div>
				</div>
				</nav>

				<div class="content">

					<div class="container-fluid" style="margin-top: 20px !important;">
						<div class="row">

							<div class="col-md-12 ">
								<div class="card">

									<!--  id="LeadRegisterForm" -->
									<form id="CreateContractorForm" action="CreateContractor"
										method="post">
										<%-- <div on class="card-header">
	                                <center>
										<h4 class="card-title">
										<strong>
											Create Contractor
											</strong>
											<hr>
										</h4>
										</center>
									</div> --%>

										<div class="card-header">
											<h4 class="card-title">Create Contractor</h4>
										</div>

										<div class="card-content">
											<div class="row">

												<div class="col-md-12"
													style="margin-bottom: 15px !important;">
													<div class="col-md-6">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label"
																	style="margin-top: 8px !important;"> Name <star>*</star>
																</label>
															</div>
															<div class="col-md-9">
																<input class="form-control name" id="contractorName"
																	name="contractorName" type="text" required="true"
																	autocomplete="off" maxlength="50" />
																<p style="color: red" id="name_error"></p>
															</div>
														</div>
													</div>


													<div class="col-md-6">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label"
																	style="margin-top: 8px !important;">Company<star>*</star></label>
															</div>
															<div class="col-md-9">
																<input class="form-control" name="contractorCompany"
																	id="contractorCompany" type="text" required="true"
																	autocomplete="off" maxlength="40" />
															</div>
														</div>
													</div>


												</div>


												<div class="col-md-12"
													style="margin-bottom: 15px !important;">
													<div class="col-md-6">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label"
																	style="margin-top: 8px !important;">Mobile<star>*</star></label>
															</div>
															<div class="col-md-9">
																<input class="form-control"
																	name="contractorMobileNumber"
																	id="contractorMobileNumber" type="text" required="true"
																	autocomplete="off" number="true" minlength="10"
																	maxlength="10" />
															</div>
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group">

															<div class="col-md-3">
																<label class="control-label">Enter City </label>
															</div>
															<div class="col-md-9">
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



													<div class="col-md-6">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label"> Email Address <star>*</star>
																</label>
															</div>
															<div class="col-md-9">
																<input class="form-control" id="contractorEmail"
																	name="contractorEmail" type="text" required="true"
																	email="true" autocomplete="off" maxlength="40"
																	style="text-transform: lowercase;" />
															</div>
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label">Cities<star>*</star></label>
															</div>
															<div class="col-md-9">
																<select multiple title="Multiple Select"
																	id="contractorLocations" name="contractorLocations"
																	class="selectpicker" data-size="5"
																	data-live-search="true" required="true">


																</select>
															</div>


														</div>
													</div>

												</div>


												<div class="col-md-12"
													style="margin-bottom: 15px !important;">

													<div class="col-md-6">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label"
																	style="margin-top: 8px !important;">Password<star>*</star></label>
															</div>
															<div class="col-md-9">
																<input class="form-control" name="contractorPassword"
																	id="contractorPassword" type="password" required="true"
																	autocomplete="off" maxlength="15" />
															</div>
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label"> Select
																	Subscription:<star>*</star>
																</label>
															</div>
															<div class="col-md-9">
																<select class="selectpicker" id="contractorSubscription"
																	name="contractorSubscription" type="text"
																	required="true" autocomplete="off" required="true">

																	<c:forEach items="${subscriptionsList}" var="sub">

																		<option value="${sub.subscriptionId}">${sub.subscriptionName}</option>

																	</c:forEach>
																</select>
															</div>
														</div>
													</div>

												</div>


												<%--   <div class="form-group">
	                                     <label class="control-label">Select City<star>*</star></label>
	                                        <select    class="selectpicker"  data-size="10"  
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
	                                          <label class="control-label">Postal Code<star>*</star></label>
	                                        
											
											<select multiple  class="selectpicker" 
	                                               id="contractorLocations"
	                                               name="contractorLocations"
	                                               type="text"
	                                               required="true"
	                                               autocomplete="off"
	                                               data-live-search="true"
	                                           >
	                                           </select>
										</div> 
	                                      --%>

												<%--  <label class="control-label">Select Locations:<star>*</star></label>
	                                    
	                                    <c:forEach items="${LocationList}" var="location">
	                                    
	                                      <div class="checkbox">
													    <input id="contractorLocations" name="contractorLocations" type="checkbox" value="${location.locatonId}">
													    <label for="checkbox2">
													 		${location.locationName}
													    </label>
													</div>
	                                     </c:forEach> --%>

												<%--  <div class="form-group">
	                                        <label class="control-label">
												Select Locations::<star>*</star>
											</label>
											 <select multiple
											       title="Select Locations" 
	                                               class="selectpicker"  
	                                               id="contractorLocations"
	                                               name="contractorLocations"
	                                               type="text"
	                                               required="true"
	                                                data-live-search="true"
	                                            >
	                                         <c:forEach items="${LocationList}" var="location">
	                                           
	                                           <option value="${location.locatonId}">${location.locationName}</option>
	                                       </c:forEach>      
	                                           </select>
	                                    </div> --%>











												<%--  <label class="control-label">Select Subscription:<star>*</star></label>
	                                     
	                                       <c:forEach items="${subscriptionsList}" var="sub">
	                                     
	                                         <div class="radio">
													    <input type="radio" name="contractorSubscription" id="contractorSubscription" value="${sub.subscriptionId}" >
													    <label for="radio">
													    ${sub.subscriptionName}
													    </label>
													</div>
                                      </c:forEach> --%>

												<div class="col-md-12"
													style="margin-bottom: 15px !important;">
													<div class="col-md-6">
														<div class="col-md-3">
															<label class="control-label">Address<star>*</star></label>
														</div>
														<div class="col-md-9">
															<div class="form-group">
																<textarea type="text" class="form-control" rows="3"
																	name="address" id="address" required="true"
																	autocomplete="off" maxlength="250"></textarea>
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<div class="col-md-3">
																<label class="control-label">Select Services:<star>*</star></label>
															</div>
															<div class="col-md-9">
																<select multiple class="selectpicker" data-size="10"
																	id="contractorServices" name="contractorServices"
																	type="text" required="true" autocomplete="off"
																	data-live-search="true">
																	<c:forEach items="${serviceList}" var="service">
																		<option value="${service.serviceId}">${service.serviceName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>

												</div>

											</div>
										</div>


										<div class="card-footer">
											<center>
												<div class="col-sm-12 category">
													<star>*</star>
													Required fields
												</div>
												<button type="submit" class="btn btn-info btn-fill"
													style="background-color: #de7e31; border-color: #de7e31;">Submit</button>
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
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwRtNgXpNu4WDyrKnnNX-T_ahtT0PLccE"></script> -->

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

<!-- Custom Validation-->
<script src="js/custom-validations.js"></script>

<script type="text/javascript">
        $().ready(function(){
			$('#CreateContractorForm').validate();
           /*  $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
        });
    </script>
<!--    <script type="text/javascript">
   
      $("#city").on("change",function(){
    	  
    	  
    	  var cityName=$("#city").val();
    	  
    	  /* alert(cityName); */
    	  $('#contractorLocations').empty();
        		$.get('AjaxForLocations',{
        		
        			cityName:cityName
        			
        	    	},function(response) {
        	    		
        	             $.each(response, function(index, value) {
        	            	  $('#contractorLocations').append($('<option>', { 
        	            	        value: value.locatonId,
        	            	        text : value.locationName 
        	            	    })); 
        	            	   
        	            	  $('.selectpicker').selectpicker('refresh');
							});
						});
        			});
        	
    </script> -->






<!--     
     <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwRtNgXpNu4WDyrKnnNX-T_ahtT0PLccE &libraries=places"></script>
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
                        	
                      	
                      	  $("#pinError").text("*Enter Accurate Location and Inside Canada Only");
                      	  
                        }else{
                      	  
                      	  $("#pinError").empty();
                      
                      	 /* $("#city").val(city); */
                        /* $("#contractorLocations").val(postal_code); */
                           
                        	
						     if(checkoptionExist(postal_code)){
						    	 $("#pinError").text("*Already Added"); 
						     }else{
						    	 
						    	 $("#pinError").empty();
								   $('#contractorLocations').append($("<option selected></option>").attr("value",city+':'+postal_code).text(postal_code)); 
			 	            	   
			 	            	  $('.selectpicker').selectpicker('refresh');
						     }
							   
							   
						  
                        }
                    	 	
                    }
                }
            });
        }
        
        
        function checkoptionExist(option){
        	
        	var result=false;
        
			$('#contractorLocations option').each(function(){
			  
				if($(this).text()==option){
					
					result=true;
				}
			  
        	
			   });
            
			return result;
        }
        
      
        
        
        
        
        
    </script> -->

<!-- <script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-omQaNJCLUKuXjkIxtb9-RJpJ-zugBc0&libraries=places&callback=initMap"
	async defer></script>
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
              						     }else{
              						    	 
              						    	 $("#pinError").empty();
              								   $('#contractorLocations').append($("<option selected></option>").attr("value",city+':'+postal_code).text(postal_code)); 
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
        
			$('#contractorLocations option').each(function(){
			  
				if($(this).text()==option){
					
					result=true;
				}
			  
        	
			   });
            
			return result;
        }
    
        
        
    </script> -->
<script type="text/javascript">   
     
        $("#pinBtn").on('click',function(){
        	
        	var geocoder;
            var map; 
            var city;
            var subcity;
            var  mcity;
            geocoder = new google.maps.Geocoder();
            var address = document.getElementById('txtPlaces').value+", Canada";
            
            geocoder.geocode({ 'address': address }, function (results, status) {
            	
                if (status == google.maps.GeocoderStatus.OK) {                       
                 
                	for (var component in results[0]['address_components']) {
                		
                        for (var i in results[0]['address_components'][component]['types']) {
                        	
                        		
                        	/* administrative_area_level_1 */
                        	 if (results[0]['address_components'][component]['types'][i] == "locality") {
                        		 
                        		 city= results[0]['address_components'][component]['long_name'];
                        		 
                        		
                        	 }
                        	 
                            if (results[0]['address_components'][component]['types'][i] == "sublocality_level_1") {
                        		 
                        		 subcity= results[0]['address_components'][component]['long_name'];
                        		 
                        		
                        	 }
                            
                           
                            
                              if(subcity == null || subcity == ""){
                            	  
                            	  mcity=city;
                            	  
                              }else{
                            	  
                            	  mcity=subcity; 
                              }
                            
                            
                            if (results[0]['address_components'][component]['types'][i] == "country") {
								
                            console.log(JSON.stringify(results));
							
                                //state = results[0]['address_components'][component]['long_name'];
                                country = results[0]['address_components'][component]['long_name'];
								
                                if(country=="canada" || country=="Canada") {
                                	
                                	if(!$.isEmptyObject(mcity)){
                                		
                                	      if(mcity!=""){
                                		
                                		   
                                		$("#pinError").empty();
                                		
                                		 if(checkoptionExist(mcity)){
                                			 
              						    	 $("#pinError").text("*Already Added"); 
              						    	 
              						     }else{
              						    	 
                                		$('#contractorLocations').append($("<option selected></option>").attr("value",mcity).text(mcity)); 
          			 	            	$('.selectpicker').selectpicker('refresh');
          			 	            	$("#txtPlaces").val("");
              						     
              						     }
                                		 
                                		 
                                	}else{
                                		
                                		
                                		$("#pinError").text("*Enter correct canadian city");
                                		
                                	}
                                 }else {
                                	
                                	$("#pinError").text("*Please enter more specific location");
                                } 
                                	
                                }else {
                                	
                                	$("#pinError").text("*Enter correct canadian city");
                                }  	
                        }
                    }                                           
                }
            }
            });
        	
        	
        		
        });
        
        function checkoptionExist(option){
        	
        	var result=false;
        
			$('#contractorLocations option').each(function(){
			  
				if($(this).text()==option){
					
					result=true;
				}
			  
        	
			   });
            
			return result;
        }
    
        
        
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