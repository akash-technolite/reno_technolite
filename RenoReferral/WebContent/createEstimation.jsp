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

						<a class="navbar-brand" href="#validationforms">Estimation</a>
					</div>




					<span class="navbar-brand pull-right">
						<form action="ContractorController" method="post">
							<input type="hidden" name="action" value="estimate"> <input
								type="hidden" name="leadId" value="${lead.leadID}">
							<button type="submit" class="btn  btn-info">
								<i class="ti-arrow-left"></i> Back
							</button>
						</form>
					</span>




				</div>
				</nav>

				<div class="content">

					<div class="container-fluid" style="margin-top: 15px !important;">
						<div class="row">

							<div class="col-sm-3">
								<div class="card">

									<!--  id="LeadRegisterForm" -->
									<form id="createEstimationForm" action="EstimateController"
										method="post">
										<div on class="card-header">
											<h4 class="card-title">Create Estimation</h4>
										</div>



										<div class="card-content">
											<div class="">
												<div>
													<h3 align="center" class="fadeThis" style="color: green">${SuccessMessage}</h3>
												</div>

												<div>
													<h3 align="center" class="fadeThis" style="color: red">${ErrorMessage}</h3>
												</div>





												<div class="form-group">
													<label class="control-label">Lead Reference Number</label>
													<input class=" form-control" name="lead_id" id="lead_id"
														type="text" value="${lead.leadID}" readonly />
												</div>


												<!--  <div class="form-group">
	                                      -->
												<input class=" form-control" name="invoice_id"
													id="invoice_id" type="hidden"
													value="${estimation.estimation_id}" readonly />
												<!--    </div> -->

												<div class="form-group ">
													<label class="control-label">Estimation Title<star>*</star></label>

													<div class="form-group">
														<input class=" form-control" name="estimation_title"
															id="estimation_title" type="text"
															value="${estimation_title}" required="true"
															maxlength="50" />
													</div>

												</div>

												<div class="form-group ">
													<label class="control-label">Customer Name</label>

													<div class="form-group">
														<input class=" form-control" name="customer_name"
															id="customer_name" type="text" value="${lead.name}"
															maxlength="50" readonly />
													</div>

												</div>

												<div class="form-group ">
													<label class="control-label">Service Name</label>

													<div class="form-group">
														<input class=" form-control" name="service_name"
															id="service_name" type="text" value="${lead.serviceName}"
															readonly />
													</div>

												</div>


												<div class="form-group ">
													<label class="control-label"> Date <star>*</star>
													</label>

													<div class="form-group">
														<input class="form-control datetimepicker" id="date"
															name="date" type="text" required="true"
															autocomplete="off" />
													</div>
												</div>


												<div class="form-group">
													<label class="control-label">Select Service from
														Notes<star>*</star>
													</label> <select class="  selectpicker" id="serviceNotes"
														name="serviceNotes" type="text" autocomplete="off">
														<option value="0">---Select Note---</option>
														<c:forEach items="${notesList}" var="note">
															<option value="${note.note}">${note.note}</option>
														</c:forEach>
													</select>
												</div>





												<label class="control-label">Other Description<star>*</star></label>
												<div class="form-group ">
													<textarea type="text" class="form-control" rows="3"
														name="serviceDescription" id="serviceDescription"
														maxlength="250"></textarea>
												</div>


												<div class="form-group ">
													<label class="control-label">Quantity<star>*</star></label>

													<div class="form-group">
														<input class=" form-control" name="quantity" id="quantity"
															type="text" required="true" autocomplete="off"
															maxlength="10" number="true" />
													</div>

												</div>




												<div class="form-group ">
													<label class="control-label"> Price<star>*</star>
													</label>

													<div class="form-group">
														<input class="form-control" id="price" name="price"
															type="text" required="true" value="0" autocomplete="off"
															maxlength="10"
															\
	                                               number="true" />
													</div>
												</div>

												<!--    
	                                   <div class="form-group ">
	                                       <label class="control-label">
												Tax(%)<star>*</star>
											</label>
											
											  <div class="form-group">
	                                        <input class="form-control"
	                                               id="tax"
	                                               name="tax"
	                                               type="text"
	                                               required="true"
	                                                value="0"
	                                               autocomplete="off"
	                                              
											/>
	                                    </div>
	                                    </div> -->



												<div class="form-group ">
													<label class="control-label">Amount<star>*</star></label>

													<div class="form-group">
														<input class=" form-control" name="amount" id="amount"
															type="text" required="true" autocomplete="off" value="0"
															number="true" maxlength="10" />
													</div>

												</div>



												<input class="form-control" id="total" name="total"
													type="hidden" value="${estimation.total}" maxlength="10"
													number="true" />

												<input type="hidden" name="action" value="createEstimation">

												<div class="category">
													<star>*</star>
													Required fields
												</div>

												<button type="submit" class="btn btn-info btn-fill"
													style="background-color: #de7e31; color: white; border-color: #de7e31;">Submit</button>

											</div>

										</div>
								</div>


								<div class="card-footer">

									<div class="clearfix"></div>
								</div>





								</form>
							</div>



							<div class="col-sm-9">
								<div class="card">


									<div on class="card-header">
										<h4 class="card-title">Estimation</h4>
										<div class="pull-right card-title">
											<form target="_blank" action="PrintEstimation" method="post"
												onsubmit="return validateForm()">
												<input class="btn" type="submit" value="Save"> <input
													name="estimation_id" id="print_estimation_id" type="hidden"
													value="${estimation.estimation_id}" />
											</form>
										</div>
									</div>
									<div class="card-content">

										<table id=""
											class="table datatables table-striped table-bordered table-hover "
											cellspacing="0" width="100%" style="width: 100%">
											<thead>
												<tr>
													<th>Item Code</th>
													<!-- <th>Date</th> -->
													<th>Service Name</th>
													<th>Quantity</th>
													<th>Price</th>
													<!-- <th>Tax(%)</th> -->
													<th>Amount</th>
													<th>Actions</th>




												</tr>
											</thead>

											<tbody>

												<c:forEach items="${elementList}" var="ele">

													<tr>
														<td class="">${ele.item_code}</td>
														<%-- <td class="">${ele.date}</td> --%>
														<td class="">${ele.service_description}</td>
														<td class="">${ele.quantity}</td>
														<td class="">${ele.price}</td>
														<%--  <td class="">${ele.tax}</td> --%>
														<td class="">${ele.amount}</td>
														<td>
															<form action="EstimateController" method="post">
																<input id="delEstTitle" type="hidden"
																	name="estimation_title" value="${estimation_title}">
																<input type="hidden" name="action" value="deleteElement">
																<input type="hidden" name="estimation_id"
																	value="${ele.estimation_id}"> <input
																	type="hidden" name="element_total"
																	value="${ele.amount}"> <input type="hidden"
																	name="item_code" value="${ele.item_code}">
																<button type="submit"
																	class="btn btn-simple btn-danger btn-icon remove">
																	<i class="ti-close"></i>
																</button>
															</form>
														</td>
													</tr>
												</c:forEach>
											</tbody>

											<thead>
												<tr>

													<th colspan="4"><span class="pull-right"><strong>Total</strong></span></th>
													<th id="estTotal">${estimation.total}</th>
													<th></th>
												</tr>
											</thead>


										</table>





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

<!-- Sweet Alert 2 plugin -->
<!-- 	<script src="js/sweetalert2.js"></script> -->

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


<!-- Custom JS -->
<script src="js/utility.js"></script>


<script type="text/javascript">
        $().ready(function(){
			$('#createEstimationForm').validate();
         /*    $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate(); */
            
            
		
	            
	            // Init DatetimePicker
	             /* demo.initFormExtendedDatetimepickers();  */
	            
	            
	           /*  $(".datepicker").datepicker().datepicker("setDate", new Date()); */
	    
	        
            
        });
        
        
        $(document).ready(function() {

	        $('.datatables').DataTable({
	            "pagingType": "full_numbers",
	            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
	            responsive: true,
	            language: {
	            search: "_INPUT_",
		            searchPlaceholder: "Search records",
		        }
	        });
        
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

<script type="text/javascript">
            $(function () {
            	$('.datetimepicker').datetimepicker({
                    format: 'YYYY-MM-DD',
                    defaultDate: new Date(),
              });
            	
            	
            });
            
              
           $("#serviceNotes").change(function(){
                
             var note = $(this).find("option:selected").text();	 
            	
            	$("#serviceDescription").val(note);
            	
            	
            }); 
           
          /*  $("#serviceDescription").on('input',function(){
               
           	/* var note = $(this).find("option:selected").text();	
           	
           	$("#serviceNotes").prop("readonly",true);
          
           
           });  */
            
            
        </script>

<!-- Calculation Script -->
<script type="text/javascript">

      $("#quantity").on('input',function(){
    	  
    	 if($("#quantity").val()!=""){
    	  
         var quantity=parseInt($("#quantity").val());
         var price=parseFloat($("#price").val());
         var amount=parseFloat($("#amount").val());
         var total=parseFloat($("#total").val());
        /*  var tax=parseFloat($("#tax").val()); */
         
         
         /* var newAmount=(quantity*price)+((quantity*price)*(tax/100)); */
         
         var newAmount=quantity*price;
        
         $("#amount").val(newAmount.toFixed(2));
         
         
    	  }
          
      });
     
       $("#price").on('input',function(){
    	   
    	 if($("#price").val()!=""){
    		 
    		  
             var quantity=parseInt($("#quantity").val());
             var price=parseFloat($("#price").val());
             var amount=parseFloat($("#amount").val());
             var total=parseFloat($("#total").val());
            /*  var tax=parseFloat($("#tax").val()); */
             
             
             /* var newAmount=(quantity*price)+((quantity*price)*(tax/100)); */
             
             var newAmount=quantity*price;
            
             $("#amount").val(newAmount.toFixed(2));
             
               
       } 
     });
     
     
    /*   $("#tax").on('input',function(){
      	 
    	  if($("#tax").val()!=""){
    		  
    	  var quantity=parseInt($("#quantity").val());
          var price=parseFloat($("#price").val());
          var amount=parseFloat($("#amount").val());
          var total=parseFloat($("#total").val());
          var tax=parseFloat($("#tax").val());
          
          
          var newAmount=(quantity*price)+((quantity*price)*(tax/100));
          
         
          $("#amount").val(newAmount);
          
           
    	  }
    	  
       });
     
       */
      
      
      
      
      $(function () {
    	  
     
      	if($("#estimation_title").val()!=""){
      		
      		$("#estimation_title").attr("readonly","readonly");
      		
      	}
              
        });
      
      
      
       function  validateForm(){
    	   
    	   if($("#estTotal").text()==""){
    		   
    		   showNotification('Please add an element first','danger');
    		   
    		   return false;
    	   } 
    	   
    	   
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