<%@page import="com.tlite.connection.DBConnection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ page import="java.sql.*"%>
<jsp:include page="sidebar.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Complaints</title>

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
						<button id="minimizeSidebar" class="btn btn-fill btn-icon">
							<i class="ti-more-alt"></i>
						</button>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>
						<a class="navbar-brand" href="#">Complaints</a>
					</div>
					<span class="pull-right"> <!-- <a class="navbar-brand" href="DefaultLeadAction"><button type="button" class="btn btn-info btn-fill"
					>Default Lead Setting</button>
					</a>
					
					<a class="navbar-brand" href="CreateLeadAction"><button type="button" class="btn btn-info btn-fill"
					>Create Lead</button>
					</a>
					 -->

					</span>
				</div>
				</nav>

				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<h4 class="title">All Complaints</h4>




								<div class="card">
									<div class="card-content">

										<div>
											<h3 align="center" style="color: green">${SuccessMessage}</h3>
										</div>
										<div>
											<h3 align="center" style="color: red">${ErrorMessage}</h3>
										</div>


										<div class="fresh-datatables">



											<table id="datatables1"
												class="table table-striped table-no-bordered table-hover datatables"
												cellspacing="0" width="100%" style="width: 100%">
												<thead>
													<tr>

														<th>Complaint ID</th>
														<th>Lead ID</th>
														<th>Complaint Text</th>
														<th>Status</th>
														<th>Action</th>

													</tr>
												</thead>

												<tbody>


													<c:forEach items="${complaintsList}" var="complaint">
														<tr>

															<td class="complaintId">${complaint.complaintId}</td>
															<td class="leadId">${complaint.leadId}</td>
															<td class="complaintText">${complaint.complaintText}</td>
															<td class="status">${complaint.status}</td>
															<td>
																<!-- <a id="viewBtn" onclick="viewLead(this)" href="#" class="btn btn-simple btn-info btn-icon like">View Details</i></a>
													<a id="assignLead" onclick="assignLead(this)" href="#" class="btn btn-simple btn-info btn-icon like">Assign Lead</i></a> -->
																<a id="editComplaint" onclick="editComplaint(this)"
																class="btn btn-simple btn-warning btn-icon edit"
																data-toggle="modal" data-target="#myModal"><i
																	class="ti-pencil-alt"></i></a> <a id="deleteComplaint"
																onclick="deleteComplaint(this)"
																class="btn btn-simple btn-danger btn-icon remove"><i
																	class="ti-close"></i></a>
															</td>



														</tr>
													</c:forEach>

												</tbody>
											</table>


											<div id="myModal" class="modal fade" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Update Complaint</h4>
														</div>
														<div class="modal-body">

															<div class="col-md-12 ">

																<form id="CreateComplaintForm"
																	action="ComplaintAction?action=update" method="post">


																	<div class="form-group">
																		<label class="control-label"> Complaint Id <star>*</star>
																		</label> <input class="form-control" id="complaintId"
																			name="complaintId" type="text" required="true"
																			autocomplete="off" />
																	</div>






																	<div class="form-group">
																		<label class="control-label"> Lead Reference
																			Number <star>*</star>
																		</label> <input class="form-control" id="leadReferenceNumber"
																			name="leadReferenceNumber" type="text"
																			required="true" autocomplete="off" />
																	</div>





																	<div class="form-group">
																		<label class="">Text<star>*</star></label>
																	</div>
																	<div class="form-group">
																		<textarea type="text" class="form-control" rows="3"
																			name="complaintText" id="complaintText"
																			required="true"></textarea>
																	</div>



																	<div class="form-group">
																		<label class="control-label"> Status <star>*</star>
																		</label> <input class="form-control" id="status" name="status"
																			type="text" required="true" autocomplete="off" />
																	</div>





																	<div class="category">
																		<star>*</star>
																		Required fields
																	</div>


																	<button type="submit" class="btn btn-info btn-fill">Update</button>


																</form>

															</div>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Close</button>
														</div>
													</div>

												</div>
											</div>











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
	

	function deleteComplaint(row) {
		 $tr = $(row).closest('tr');	
		 $complaintId=$tr.find('.complaintId').text();
 	
 	
		 location.href="ComplaintAction?complaintId="+$complaintId+"&action=delete";
  };
	
  
   function editComplaint(row) {
	  
		 $tr = $(row).closest('tr');	
		 
		 complaintId=$tr.find('.complaintId').text();
		 leadId=$tr.find('.leadId').text();
		 complaintText=$tr.find('.complaintText').text();
		 status=$tr.find('.status').text();
		
		      
		 
	     $("#complaintId").val(complaintId);
		 $("#leadReferenceNumber").val(leadId);
		 $("#complaintText").val(complaintText);
		 $("#status").val(status);
	
		
};
  
		 /*  function viewImages(row) {
			  
			  $tr = $(row).closest('tr');	
				 $LeadID=$tr.find('.LeadID').text();  
			  
				
				 
				 
		};  */
	
 
	
	</script>


</body>
</html>