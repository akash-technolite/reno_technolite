
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


<style type="text/css">
#map-canvas {
	height: 400px;
	margin: 0px;
	padding: 0px
}
</style>


<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwRtNgXpNu4WDyrKnnNX-T_ahtT0PLccE&libraries=places"></script>

</head>
<body>
	<div class="wrapper">
		<div class="">

			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<a class="" href="#validationforms"><img class="img img-fluid"
					style="max-width: 20%;" src="img/reno _logo.png"></a> <span
					class="pull-right"> <a class="navbar-brand" href="login.jsp"><button
							type="button" class="btn btn-info btn-fill">Admin
							Login</button> </a> <a class="navbar-brand" href="contractorLogin.jsp"><button
							type="button" class="btn btn-info btn-fill">Contractor
							Login</button> </a> <a class="navbar-brand" href="estimatorLogin.jsp"><button
							type="button" class="btn btn-info btn-fill">Estimator
							Login</button> </a> <a class="navbar-brand" href="installerLogin.jsp"><button
							type="button" class="btn btn-info btn-fill">Installer
							Login</button> </a> <!-- <a class="navbar-brand" href="ContractorSignUp?action=view"><button type="button" class="btn btn-info btn-fill"
					>Contractor SignUp</button>
					</a>
					 --> <a class="navbar-brand" href="contratactorSignUpEmail.jsp"><button
							type="button" class="btn btn-info btn-fill">Contractor
							SignUp</button> </a>


				</span>
			</div>
			</nav>

			<div class="content">

				<div class="container-fluid">
					<div class="row">

						<div class=" col-sm-12">
							<div class="card">

								<!--  id="LeadRegisterForm" -->
								<form id="LeadRegisterForm" action="IndexLeadRegister"
									method="post" enctype="multipart/form-data">

									<input type="hidden" name="page" value="index">

									<div on class="card-header">
										<center>
											<h2 class="card-title">Register Your Requirement</h2>
											<hr>
										</center>
									</div>



									<div class="card-content">
										<div class="row">
											<div>
												<h3 align="center" class="fadeThis" style="color: green">${SuccessMessage}</h3>
											</div>

											<div>
												<h3 align="center" class="fadeThis" style="color: red">${ErrorMessage}</h3>
											</div>

											<div class="col-sm-12">

												<div class="col-sm-4">
													<div class=form-group">
														<label for="service" class="">Select Service<star>*</star></label>
														
														<select class="selectpicker" id="service" name="service"
															type="text" required="true" autocomplete="off"
															data-live-search="true">
															<c:forEach items="${serviceList}" var="service">
																<option value="${service.serviceId}">${service.serviceName}</option>
															</c:forEach>
														</select>
													</div>

												</div>





												<div class="col-sm-4">
													<label class="control-label">Describe Your
														Requirement<star>*</star>
													</label>
													<div class="form-group">
														<textarea type="text" class="form-control" rows="3"
															name="description" id="description" required="true"
															maxLength="800"></textarea>
													</div>
												</div>


												<div class="col-sm-4 form-group">
													<label class="control-label"> Name <star>*</star>
													</label>

													<div class="form-group">
														<input class="form-control name" id="name" name="name"
															type="text" required="true" autocomplete="off" value=""
															maxlength="80" />
														<p style="color: red" id="name_error"></p>
													</div>

												</div>

											</div>

											<div class="col-sm-12">
												<div class="col-sm-4 form-group">
													<label class="control-label"> Email Address <star>*</star>
													</label>

													<div class="form-group">
														<input class="form-control" id="email" name="email"
															type="text" required="true" email="true"
															autocomplete="off" placeholder="example@email.com"
															email="true" maxLength="50" />
													</div>
												</div>


												<div class="col-sm-4 form-group">
													<label class="control-label">Mobile<star>*</star></label>

													<div class="form-group">
														<input class="form-control" name="mobileNumber"
															id="mobileNumber" type="text" required="true"
															autocomplete="off" minlength="10" maxlength="10"
															number="true" />
													</div>

												</div>

												<div class="col-sm-4">
													<div class=form-group">
														<label class="control-label">Select Budget<star>*</star></label>
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

											</div>

											<div class="col-sm-12">


												<div class="col-sm-4 form-group">
													<!--  <label class="control-label">Select  Location</label> -->
													<!-- <input id="pac-input" class="controls" type="text" placeholder="Search Box">
	                                     <div class="form-control" id="map-canvas"></div>
	                                      -->

													<label class="control-label">Enter Postal Code</label>

													<div class="form-group">
														<input type="text" id="txtPlaces" class="form-control"
															maxlength="7" style="text-transform: uppercase" />
													</div>
													<div id="pinError" class="text-danger"></div>
												</div>


												<div class="col-sm-4 form-group ">

													<label class="  control-label">City<star>*</star></label> <input
														class="form-control" id="city" name="city" type="text"
														required="true" readonly="readonly">

												</div>



												<div class="col-sm-4 form-group ">

													<label class="  control-label">Province<star>*</star></label>
													<input class="form-control" id="postalCode"
														name="postalCode" type="text" required="true"
														readonly="readonly"
														><!-- style="text-transform: uppercase" -->

												</div>
											</div>
											<%-- <div class="form-group">
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
	                                    --%>

											<!--  <div class="form-group">
	                                          <label class="  control-label">Location<star>*</star></label>
	                                        <input  class="form-control"  
	                                               id="locCode"
	                                               name="locCode"
	                                               type="text"
	                                               required="true"
	                                            >
	                                       
	                                    </div> -->

											<%--     <c:forEach items="${LocationList}" var="location">    
	                                       <option value="${location.locatonId}">${location.cityName} (${location.locationName})</option>
	                                         </c:forEach>  --%>

											<!-- <div class="form-group ">
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
											
										
	                                    </div> -->
											<div class="col-sm-12">
												<div class="col-sm-4">
													<label class="control-label">Address<star>*</star></label>
													<div class="form-group">
														<textarea type="text" class="form-control" rows="3"
															name="address" id="address" required="true"
															autocomplete="off" maxLength="200"></textarea>
													</div>
												</div>



												<div class="col-sm-4 form-group">
													<label class="control-label">Upload Images<star>*</star></label>

													<div class="form-group">
														<input class="form-control selectpicker"
															name="uploadImage1" id="uploadImage1" type="file"
															multiple />
														<!--  <input class="form-control selectpicker"
	                                               name="uploadImage2"
	                                               id="uploadImage2"
	                                               type="file"
	                                               
	                                             />
	                                             <input class="form-control selectpicker"
	                                               name="uploadImage3"
	                                               id="uploadImage3"
	                                               type="file"
	                                              
	                                             />
	                                             
	                                             <input class="form-control selectpicker"
	                                               name="uploadImage4"
	                                               id="uploadImage4"
	                                               type="file"
	                                              
	                                             />
	                                              <input class="form-control selectpicker"
	                                               name="uploadImage5"
	                                               id="uploadImage5"
	                                               type="file"
	                                              
	                                             /> -->
													</div>

												</div>
											</div>

											<div class="col-sm-12 form-group">
												<center>
													<div class="category">
														<star>*</star>
														Required fields
													</div>

													<button type="submit" class="btn btn-info btn-fill">Submit</button>
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
<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

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


<!-- Custom JS -->
<script src="js/utility.js"></script>

<!-- Custom Validation-->
<script src="js/custom-validations.js"></script>


<script type="text/javascript">
        $().ready(function(){
			$('#LeadRegisterForm').validate();
         /*    $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
        });
    </script>
<script type="text/javascript">
   
       /*  $(function() {
        		$.get('AjaxForLocations',{
        		
        	    	},function(data) {
        	    		
        	    		 $("#locCode").autocomplete({
        	                 source: data
        	               });
        	    		
        	 		});
        	
           
        
			}); */
    
    </script>


<!-- <script type="text/javascript">
   
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
        
    </script>
     -->





<script type="text/javascript">
     /* 
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
                        var country=results[0].formatted_address.split(',')[results[0].formatted_address.split(',').length-1].trim();
                        var city = results[0].formatted_address.split(',')[1].trim();
                       /* var pin1 = results[0].formatted_address.split(',')[2].split(' ')[2];
                        var pin2 = results[0].formatted_address.split(',')[2].split(' ')[3];
                        var postal_code=pin1+" "+pin2; */
                       /*  [results[0].formatted_address.split(',').length - 2].trim().split(' ')[1]; */
                        /* alert("Address: " + address + "\n\nPinCode: " + pin); */
                       
                       /*  $("#address").val(address); */
                       
                         /*   if(country=="canada" || country=="Canada") {
                        	
                        	 $("#pinError").empty();
                        	 
                          	 $("#address").val(address);
                          	 $("#city").val(city);
                          	 
                            	
                            
                                }else {
                                	
                                	$("#postalCode").val("");
                                	 $("#address").val("");
                                 	 $("#city").val("");
                                 	$("#pinError").text("*Enter Canadian Postal Code Only");
                                }
               
                      	  
                      	  
                     
                    }
                }
            });
            
            
            
        } */
        
        </script>



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
            var province;
            geocoder = new google.maps.Geocoder();
            var address = document.getElementById('txtPlaces').value+", Canada";;
            
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
                                		
                                		
                                		/* $("#address").val(address); */
                                		$("#postalCode").val(province);
                                		 $("#city").val(city);
                                		 $("#pinError").empty();
                                		 
                                		 
                                	/* 	 swal({
                                             title: 'Address Confirmation',
                                             html: '<div class="form-group">' +
                                                       "<input id='input-field' valur="+address+" type='text' class='form-control' />" +
                                                   '</div>',
                                             showCancelButton: true,
                                             confirmButtonClass: 'btn btn-success btn-fill',
                                             cancelButtonClass: 'btn btn-danger btn-fill',
                                             buttonsStyling: false
                                         }).then(function(result) {
                                            
                                        	
                                        	 $("#address").val($('#input-field').val());
                                        	 
                                         }) */
                                		  
                                		 
                                		/*  var addresspmt = prompt("Please modify your address:",address);
                                		    if (addresspmt == null || addresspmt == "") {
                                		    	
                                		      alert("varify your address in address field");
                                		        
                                		    } else {
                                		    	
                                		    	$("#address").val(addresspmt);
                                		        
                                		    } */
                                		    
                                		 $("#mAddress").val(address);  
                                		 $('#addressModal').modal('show');	    
                                		    
                                		    
                                		    
                                		    
                                	
                                	}else{
                                		
                                		  $("#address").val("");
                                    	 $("#city").val("");
                                    	 $("#postalCode").val("");
                                    	
                                    }
                                	
                                } else {
                                	 $("#address").val("");
                                	$("#pinError").text("*Enter correct canadian postal code ");
                                	 $("#city").val("");
                                	 $("#postalCode").val("");
                                }
                                
                            }
                        }
                    }                                           
                } else {
                	 $("#address").val("");
                	$("#pinError").text("*Enter correct canadian postal code ");
                	 $("#city").val("");
                	 $("#postalCode").val("");
                }
            });
        	
        	
        		
        });
        
        
        
        
    </script>

<!--  <script type="text/javascript">
    
    function initAutocomplete() {

     var myLatlng = new google.maps.LatLng(51.862924,-106.040039);
    var myOptions = {
      zoom: 5,
      center: myLatlng
    }
    var map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
    var geocoder = new google.maps.Geocoder();
   
    
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function() {
      searchBox.setBounds(map.getBounds());
    });

    var markers = [];
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener('places_changed', function() {
      var places = searchBox.getPlaces();

      if (places.length == 0) {
        return;
      }

      // Clear out the old markers.
      markers.forEach(function(marker) {
        marker.setMap(null);
      });
      markers = [];

      // For each place, get the icon, name and location.
      var bounds = new google.maps.LatLngBounds();
      places.forEach(function(place) {
        if (!place.geometry) {
          console.log("Returned place contains no geometry");
          return;
        }
        var icon = {
          url: place.icon,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(25, 25)
        };

        // Create a marker for each place.
        markers.push(new google.maps.Marker({
          map: map,
          icon: icon,
          title: place.name,
          position: place.geometry.location
        }));

        if (place.geometry.viewport) {
          // Only geocodes have viewport.
          bounds.union(place.geometry.viewport);
        } else {
          bounds.extend(place.geometry.location);
        }
      });
      map.fitBounds(bounds);
    });

    
    google.maps.event.addListener(map, 'click', function(event) {
      geocoder.geocode({
        'latLng': event.latLng
      }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[0]) {
        	  var address = results[0].formatted_address;
              var pin1 = results[0].formatted_address.split(',')[2].split(' ')[2];
              var pin2 = results[0].formatted_address.split(',')[2].split(' ')[3];
              var postal_code=pin1+" "+pin2;
             /*  [results[0].formatted_address.split(',').length - 2].trim().split(' ')[1]; */
              /* alert("Address: " + address + "\n\nPinCode: " + pin); */
              $("#address").val(address);
              
          
              if(postal_code.length!=7){
            	  $("#postalCode").val("");
            	  $("#pinError").text("Select Accurate Location (By Zooming ) and Inside Canada Only");
            	  
              }else{
            	  
            	  $("#pinError").empty();
            	  
              $("#postalCode").val(postal_code);
              
              }
              
          }
        }
      });
    });
    
    };
    </script> -->



<!--  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwRtNgXpNu4WDyrKnnNX-T_ahtT0PLccE&libraries=places&callback=initAutocomplete"
         async defer></script> -->


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