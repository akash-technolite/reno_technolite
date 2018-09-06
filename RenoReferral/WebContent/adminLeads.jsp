<jsp:include page="sidebar.jsp" />
<%@page import="com.tlite.connection.DBConnection"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<link rel="stylesheet" media="screen and (min-width: 900px)"
	href="widescreen.css">
<link rel="stylesheet" media="screen and (max-width: 600px)"
	href="smallscreen.css">


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

						<a class="navbar-brand" href="#validationforms">Leads</a>
					</div>
					<!-- <span class="pull-right">
					
					<a class="navbar-brand" href="DefaultLeadAction"><button type="button" class="btn btn-info btn-fill"
					>Default Lead Setting</button>
					</a>
					
					 <ul class="nav navbar-nav navbar-right">
	                        <li>
	                            <a href="DefaultLeadAction" class=" btn-magnify" >
	                                <i class="ti-settings"></i>
									<p>Default Lead Setting</p>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="CreateLeadAction" class=" btn-magnify" >
	                                <i class="ti-id-badge"></i>
									<p>Create Lead</p>
	                            </a>
	                        </li>
	                  </ul>                
					
				  <span class="navbar-brand" >
                 <form  action="CreateLeadAction" method="post">
				 <input class="btn btn-info btn-fill" type="submit" value="Create Lead">
				</form>
					</span>	
					
	                </span> -->


					<div class="collapse navbar-collapse">

						<ul class="nav navbar-nav navbar-right">
							<li><a href="CreateLeadAction" class=" btn-magnify"> <i
									class="ti-id-badge"></i>
									<p>Create Lead</p>
							</a></li>
							<li><a href="DefaultLeadAction" class="btn-rotate"> <i
									class="ti-settings"></i>
									<p>Default Lead Setting</p>
							</a></li>
						</ul>
					</div>

				</div>
				</nav>
				<!-- <div class="nav-tabs-navigation">
				                        <div class="nav-tabs-wrapper">
					                        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					                            <li class="active"><a href="#home" data-toggle="tab">New Leads</a></li>
					                            <li><a href="#profile" data-toggle="tab">Assigned Leads</a></li>
					                            <li><a href="#messages" data-toggle="tab">APPLIED / BUY LEADS</a></li>
					                        </ul>
				                        </div>
				                    </div> -->
				<nav class="nav nav-stacked">
				<div class="container-fluid">
					<div class="navbar-header"></div>
					<ul id="tabs" class="nav  nav-pills  nav-justified">
						<li class="active"><a href="#home" data-toggle="tab">NEW
								LEADS</a></li>
						<li><a href="#profile" data-toggle="tab">ASSIGNED LEADS</a></li>
						<li><a href="#messages" data-toggle="tab">APPLIED / BUY
								LEADS</a></li>
					</ul>
				</div>
				</nav>

				<nav class="navbar navbar-default">


				<div id="my-tab-content" class="tab-content text-center">
					<div class="tab-pane active" id="home">

						<div class="content">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<!-- 	<h4 class="title">New Leads</h4> -->


										<div class="card">
											<div class="card-content">

												<%--  <div><h3 align="center" style="color:green">${SuccessMessage}</h3></div>
	                                 <div><h3 align="center" style="color:red">${ErrorMessage}</h3></div>
	                                --%>

												<div class="fresh-datatables">
													<table id="datatables1"
														class="table table-striped table-no-bordered table-hover datatables"
														cellspacing="0" width="100%" style="width: 100%">
														<thead>
															<tr>

																<th>Ref No.</th>
																<th>Name</th>
																<!-- <th>Service Id</th> -->
																<th>Service Name</th>
																<!-- <th>Location Id</th> -->
																<th>Registration Time</th>
																<th class="disabled-sorting">Actions</th>
																<!-- <th>Email</th>
												<th>Mobile</th>
												<th>Postal Code</th>
												<th>Image</th>
												<th>Description</th> -->

															</tr>
														</thead>

														<tbody>

															<c:forEach items="${UnAssignedLeadList}" var="lead">


																<tr>


																	<td class="LeadID">${lead.leadID}</td>
																	<td class="Name">${lead.name}</td>
																	<%-- <td class="serviceId">${lead.serviceId}</td> --%>
																	<td class="serviceName">${lead.serviceName}</td>
																	<%-- <td class="locationId">${lead.postalCode}</td> --%>
																	<td class="Timestamp"><time class="timeago"
																			datetime="${lead.timestamp}"></td>
																	<%-- ${fn:substring(lead.timestamp, 0, 16)} --%>
																	<td><a id="viewBtn"
																		href="ViewLeads?LeadID=${lead.leadID}"
																		class="btn btn-simple btn-info btn-icon like">View
																			Details</i>
																	</a> <a id="assignLead"
																		href="AssignLeadAction?LeadID=${lead.leadID}&serviceId=${lead.serviceId}&locationId=${lead.postalCode}"
																		class="btn btn-simple btn-info btn-icon like">Assign
																			Lead</i>
																	</a> <!-- <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="ti-pencil-alt"></i></a>
													<a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="ti-close"></i></a> -->
																	</td>

																	<%-- <td class="Email"><%=rs.getString("Email") %></td>
												<td class="Mobile"><%=rs.getLong("Mobile")%></td>
												<td class="PostalCode"><%=rs.getString("PostalCode") %></td>
												<!-- <td class="Image"><button class="btn btn-success" data-toggle="modal" data-target="#myModal" type="button" onclick="viewImages(this)" >View Images</button></td> -->
												<td class="Description"><%=rs.getString("Description") %></td> --%>

																</tr>

															</c:forEach>


														</tbody>
													</table>







												</div>


											</div>
										</div>
										<!--  end card  -->
									</div>
									<!-- end col-md-12 -->
								</div>
								<!-- end row -->
							</div>
						</div>

					</div>



					<div class="tab-pane" id="profile">

						<div class="content">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<!-- <h4 class="title">Assigned Leads</h4>
							 -->

										<div class="card">
											<div class="card-content">


												<div class="fresh-datatables">

													<table id="datatables2"
														class="table table-striped table-no-bordered table-hover datatables"
														cellspacing="0" width="100%" style="width: 100%">
														<thead>
															<tr>

																<th>Ref No.</th>
																<th>Name</th>
																<!-- <th>Service Id</th> -->
																<th>Service Name</th>
																<!--    <th>Location</th>  -->
																<th>Registration Time</th>
																<!-- 	<th>Count</th> -->
																<th class="disabled-sorting"><center>Actions</center></th>
																<!-- <th>Email</th>
												<th>Mobile</th>
												<th>Postal Code</th>
												<th>Image</th>
												<th>Description</th> -->

															</tr>
														</thead>

														<tbody>

															<c:forEach items="${assignedLeadList}" var="lead">


																<tr>


																	<td class="LeadID">${lead.leadID}</td>
																	<td class="Name">${lead.name}</td>
																	<%-- <td class="serviceId">${lead.serviceId}</td> --%>
																	<td class="serviceName">${lead.serviceName}</td>
																	<%-- <td class="locationId">${lead.postalCode}</td> --%>
																	<td class="Timestamp"><time class="timeago"
																			datetime="${lead.timestamp}"> <%-- <td class="count">${lead.contactorCount}</td> --%>
																		<td><a id="viewBtn"
																			href="ViewLeads?LeadID=${lead.leadID}"
																			class="btn btn-simple btn-info btn-icon like">View
																				Details</i>
																		</a> <!-- <a id="viewBtn" href="adminContractorProfile.jsp" class="btn btn-simple btn-info btn-icon like">View Contractor Profile</i></a> -->
																			<!-- <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="ti-pencil-alt"></i></a>
													<a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="ti-close"></i></a> -->
																		</td>

																		<%-- <td class="Email"><%=rs.getString("Email") %></td>
												<td class="Mobile"><%=rs.getLong("Mobile")%></td>
												<td class="PostalCode"><%=rs.getString("PostalCode") %></td>
												<!-- <td class="Image"><button class="btn btn-success" data-toggle="modal" data-target="#myModal" type="button" onclick="viewImages(this)" >View Images</button></td> -->
												<td class="Description"><%=rs.getString("Description") %></td> --%>
																</tr>

															</c:forEach>


														</tbody>
													</table>







												</div>


											</div>
										</div>
										<!--  end card  -->
									</div>
									<!-- end col-md-12 -->
								</div>
								<!-- end row -->
							</div>
						</div>
					</div>

					<div class="tab-pane" id="messages">

						<div class="content">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<!-- 	<h4 class="title">APPLIED / BUY LEADS</h4> -->


										<div class="card">
											<div class="card-content">


												<div class="fresh-datatables">

													<table id="datatables3"
														class="table table-striped table-no-bordered table-hover datatables"
														cellspacing="0" width="100%" style="width: 100%">
														<thead>
															<tr>

																<th>Ref No.</th>
																<th>Name</th>
																<!-- <th>Service Id</th> -->
																<th>Service Name</th>
																<!-- <th>Location Id</th> -->
																<th>Registration Time</th>
																<!-- <th>Count</th> -->
																<th class="disabled-sorting">Actions</th>


															</tr>
														</thead>

														<tbody>

															<c:forEach items="${appBuyList}" var="lead">


																<tr>


																	<td class="LeadID">${lead.leadID}</td>
																	<td class="Name">${lead.name}</td>
																	<%-- <td class="serviceId">${lead.serviceId}</td> --%>
																	<td class="serviceName">${lead.serviceName}</td>
																	<%-- <td class="locationId">${lead.postalCode}</td> --%>
																	<td class="Timestamp"><time class="timeago"
																			datetime="${lead.timestamp}"> <%-- <td class="count">${lead.contactorCount}</td> --%>
																		<td><a id="viewBtn"
																			href="ViewLeads?LeadID=${lead.leadID}"
																			class="btn btn-simple btn-info btn-icon like">View
																				Details</i>
																		</a>
																			<form action="Admin" method="post">
																				<input type="hidden" name="action"
																					value="contractorProfile"> <input
																					type="hidden" name="contractorId"
																					value="${lead.contractorId}">
																				<button type="submit"
																					class="btn btn-simple btn-info">View
																					Contractor</button>
																			</form> <!-- <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="ti-pencil-alt"></i></a>
													<a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="ti-close"></i></a> -->
																		</td>

																		<%-- <td class="Email"><%=rs.getString("Email") %></td>
												<td class="Mobile"><%=rs.getLong("Mobile")%></td>
												<td class="PostalCode"><%=rs.getString("PostalCode") %></td>
												<!-- <td class="Image"><button class="btn btn-success" data-toggle="modal" data-target="#myModal" type="button" onclick="viewImages(this)" >View Images</button></td> -->
												<td class="Description"><%=rs.getString("Description") %></td> --%>
																</tr>

															</c:forEach>


														</tbody>
													</table>







												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!--  <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    Modal content
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Images</h4>
      </div>
      <div class="modal-body">
        
        
         <iframe class="iframe1" src="" ></iframe> 
          <iframe class="iframe2" src="" ></iframe> 
           <iframe class="iframe3" src="" ></iframe> 
            <iframe class="iframe4" src="" ></iframe> 
             <iframe class="iframe5" src="" ></iframe> 
             
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div> -->



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

<!-- Vector Map plugin -->
<script src="js/jquery-jvectormap.js"></script>


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


	        var table = $('#datatables').DataTable();
	         // Edit record
	               /*   table.on( 'click', '.edit', function () {
	            $tr = $(this).closest('tr');

	            var data = table.row($tr).data();
	            alert( 'You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.' );
	         } );

	         // Delete a record
	         table.on( 'click', '.remove', function (e) {
	            $tr = $(this).closest('tr');
	            table.row($tr).remove().draw();
	            e.preventDefault();
	         } );

	        //Like record
	 table.on( 'click', '.like', function () {
		            alert('You clicked on Like button');
		         }); */

	        });
	</script>
<script>
	

/* 	function viewLead(row) {
		 $tr = $(row).closest('tr');	
		 $LeadID=$tr.find('.LeadID').text();
 	
 	
		 location.href="ViewLeads?LeadID="+$LeadID;
  }; */
	
  
  /* function assignLead(row) {
	  
		 $tr = $(row).closest('tr');	
		 LeadID=$tr.find('.LeadID').text();
		 serviceId=$tr.find('.serviceId').text();
		 locationId=$tr.find('.locationId').text();
		   
		 location.href="AssignLeadAction?LeadID="+LeadID+"&serviceId="+serviceId+"&locationId="+locationId;
}; */
  
		  function viewImages(row) {
			  
			  $tr = $(row).closest('tr');	
				 $LeadID=$tr.find('.LeadID').text();  
				 
				
				 
				 
		};
	
 
	
	</script>


<script src="js/timeago.js" type="text/javascript"></script>

<script>

jQuery(document).ready(function() {
	
  jQuery("time.timeago").timeago();
  
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

</body>
</html>