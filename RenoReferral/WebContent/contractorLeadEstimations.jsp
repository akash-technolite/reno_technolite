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

<title>Create User</title>

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
						<a class="navbar-brand" href="#validationforms">Estimations</a>
					</div>
					<span class="navbar-brand pull-right">

						<form action="ContractorController" method="post">
							<input type="hidden" name="action" value="createEstimate">
							<input type="hidden" name="leadId" value="${lead.leadID}">
							<button class="btn btn-info btn-fill" type="submit">Create
								Estimation</button>
						</form>

					</span>


				</div>
				</nav>

				<div class="content">

					<div class="container-fluid" style="margin-top: 15px !important;">
						<div class="row">

							<div class="col-md-12 ">
								<div class="card">
									<div class="card-content">


										<h3>
											<strong>All Estimations</strong>
										</h3>
										<hr>

										<div class="col-md-12 ">

											<div class="form-group col-md-4">
												<label class="control-label">Lead Reference Number</label>

												<div class="form-group">
													<input class=" form-control" name="lead_id" id="lead_id"
														type="text" value="${lead.leadID}" readonly />
												</div>

											</div>

											<div class="form-group col-md-4">
												<label class="control-label">Customer Name</label>

												<div class="form-group">
													<input class=" form-control" name="customer_name"
														id="customer_name" type="text" value="${lead.name}"
														readonly />
												</div>

											</div>

											<div class="form-group col-md-4">
												<label class="control-label">Service Name</label>

												<div class="form-group">
													<input class=" form-control" name="service_name"
														id="service_name" type="text" value="${lead.serviceName}"
														readonly />
												</div>

											</div>

										</div>

										<table id="estimationTable"
											class="table table-striped table-bordered datatables">

											<thead>
												<th><strong>Estimation ID</strong></th>
												<th><strong>Estimation Title</strong></th>
												<th><strong>Date</strong></th>
												<!--  <th><strong>Contractor ID </strong></th> -->
												<th><strong>Total</strong></th>
												<th><strong>Status</strong></th>
												<th><strong>Change Status</strong></th>
												<th><strong>Action</strong></th>
											</thead>
											<tbody>
												<c:forEach items="${estimationList}" var="est">
													<tr>
														<td class="estId">${est.estimation_id}</td>
														<td>${est.estimation_title}</td>
														<td>${est.estimation_date}</td>
														<td>${est.total}</td>
														<td>${est.estimation_status}</td>
														<td>

															<form action="EstimateController" method="post">

																<input type="hidden" name="lead_id"
																	value="${lead.leadID}"> <input type="hidden"
																	name="action" value="changeStatus"> <input
																	type="hidden" value="${est.estimation_id}"
																	name="estimation_id"> <select
																	class="selectpicker" name="estimation_status">
																	<option selected>-----select-----</option>
																	<option>Sent</option>
																	<option>Draft</option>
																	<option>Unapproved</option>
																	<option>Approved</option>
																	<option>Cancelled</option>
																</select> <input type="submit" class="btn" value="update">
															</form>

														</td>

														<td>
															<form target="_blank" action="PrintEstimation"
																method="post">
																<input class="btn btn-simple btn-info btn-icon like"
																	type="submit" value="Print"> <input
																	name="estimation_id" id="print_estimation_id"
																	type="hidden" value="${est.estimation_id}" />
															</form> <a target="_blank" href="${est.web_path}"
															class="btn btn-simple btn-info btn-icon like">View</a> <a
															href="${est.web_path}"
															class="btn btn-simple btn-info btn-icon like" download>Download</a>

															<form action="EstimateController" method="post">
																<input type="hidden" name="action" value="sendMail">
																<input type="hidden" name="lead_id"
																	value="${lead.leadID}"> <input
																	name="estimation_id" id="print_estimation_id"
																	type="hidden" value="${est.estimation_id}" /> <input
																	class="btn btn-simple btn-info btn-icon like"
																	type="submit" value="Send Mail">
															</form>

														</td>



														<!-- <td><button type="button" class="btn btn-info btn-fill" onclick="viewService(this)" data-toggle="modal" data-target="#myModal" >View Services</button></td>
														<td><button type="button" class="btn btn-info btn-fill" onclick="viewLocations(this)" data-toggle="modal" data-target="#myModal2">View Locations</button></td> -->

													</tr>

												</c:forEach>

											</tbody>

										</table>



										<!-- <div class="modal fade" id="myModal" role="dialog">
									    <div class="modal-dialog">
									    
									      Modal content
									      <div class="modal-content">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h4 class="modal-title">Services List</h4>
									        </div>
									        <div class="modal-body">
									         
									         
									         <div id="servicesList">
												  <ol class="list">
												    
												  </ol>
												</div> 
									         
									         
									       
									        </div>
									        <div class="modal-footer">
									          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									        </div>
									      </div>
										
										 </div>
									      </div>
										
										
										
										
										
										<div class="modal fade" id="myModal2" role="dialog">
									    <div class="modal-dialog">
									    
									      Modal content
									      <div class="modal-content">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h4 class="modal-title">Location List</h4>
									        </div>
									        <div class="modal-body">
									         
									         
									         <div id="locationList">
												  <ol class="list">
												    
												  </ol>
												</div> 
									         
									         
									       
									        </div>
									        <div class="modal-footer">
									          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									        </div>
									      </div>
										
										 </div>
									      </div>
										 -->








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

<script>
	
	
	   function viewService(row){
		
		
		var $row = $(row).closest("tr");    // Find the row
	    var contractorId = $row.find(".contractorId").text();
		
		
		
    	$.get('AjaxForContractorServices',{
    		contractorId:contractorId
 		},function(responseJson) {
 			
           

 			 $('#servicesList .list li').remove();

 			  $.each(responseJson, function(index,responseJson) {
 			    $('#servicesList .list').append('<li><h3 class="name">'+responseJson+'</h3></li>')
 			  });

 			
 			
 			
 			
 	}); 
		
		
	}
	
		</script>



<script>
	   function viewLocations(row){
			
			
			
			var $row = $(row).closest("tr");    
		    var contractorId = $row.find(".contractorId").text();
			
		   
			
	    	$.get('AjaxContractorLocations',{
	    		contractorId:contractorId
	 		},function(responseJson) {
	 			
	           

	 			 $('#locationList .list li').remove();

	 			  $.each(responseJson, function(index,responseJson) {
	 			    $('#locationList .list').append('<li><h3 class="name">'+responseJson+'</h3></li>')
	 			  });

	 			
	 			
	 			
	 			
	 	}); 
			
			
		}
		 
	   
	   
	   
	   
	   
	   
	
	
	</script>




<script type="text/javascript">
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

<!-- <script type="text/javascript">
        $().ready(function(){
			$('#LeadRegisterForm').validate();
            $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate();
        });
    </script> -->
</body>
</html>