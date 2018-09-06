<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="contractorSidebar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<a class="navbar-brand" href="#validationforms">Employee</a>
					</div>



					<div class="collapse navbar-collapse">

						<ul class="nav navbar-nav navbar-right">

							<c:choose>
								<c:when test="${sessionScope.conSub.createEmployees=='Allowed'}">

									<c:choose>
										<c:when test="${sessionScope.conLimit.createEmployeeLimit>0}">
											<li><a class=" btn-magnify" href="createEstimator.jsp">
													<i class="ti-user"></i> Create Employee
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a class=" btn-magnify" href="#"
												onclick="alert('Your subscription limit to create new employee is over!');">
													<i class="ti-user"></i> Create Employee
											</a> <!-- <a class=" btn-magnify" href="contractorDashboard.jsp">
									<p>Limit Expired</p>
								</a> --></li>
										</c:otherwise>
									</c:choose>

								</c:when>
								<c:when
									test="${sessionScope.conSub.createEmployees=='Unlimited'}">
									<li><a class=" btn-magnify" href="createEstimator.jsp">
											<i class="ti-user"></i> <>Create Employee
											</p>
									</a></li>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>


						</ul>
					</div>


				</div>
				</nav>

				<div class="content" style="margin-top: 15px;">

					<div class="container-fluid">
						<div class="row">

							<div class="col-md-12 ">
								<div class="card">
									<div class="card-content">


										<h3>
											<strong>All Employee</strong>
										</h3>
										<hr>


										<table id="contractorTable"
											class="table table-striped table-bordered">

											<thead>
												<th><strong>Employee ID</strong></th>
												<th><strong>Employee Type</strong></th>
												<!--  <th><strong>Contractor ID </strong></th> -->
												<th><strong>Employee Name</strong></th>
												<th><strong>Employee Email</strong></th>
												<th><strong>Employee Password</strong></th>
												<th><strong>Employee Mobile </strong></th>



											</thead>
											<tbody>
												<c:forEach items="${employeeList}" var="emp">
													<tr>
														<td class="empId">${emp.employee_id}</td>
														<td>${emp.employee_type}</td>
														<%-- <td>${emp.contractor_id}</td> --%>
														<td>${emp.employee_name}</td>
														<td>${emp.employee_email}</td>
														<td>${emp.employee_password}</td>
														<td>${emp.employee_mobile}</td>

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

	        $("#contractorTable").DataTable({
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

<!-- <script type="text/javascript">
        $().ready(function(){
			$('#LeadRegisterForm').validate();
            $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate();
        });
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



</body>
</html>