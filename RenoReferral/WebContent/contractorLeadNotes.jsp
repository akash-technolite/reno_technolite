<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${sessionScope.user=='contractor'}">
		<jsp:include page="contractorSidebar.jsp" />
	</c:when>
	<c:when test="${sessionScope.user=='estimator'}">
		<jsp:include page="estimatorSidebar.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="installerSidebar.jsp" />
	</c:otherwise>
</c:choose>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title></title>

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
<link href="css/lightbox.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
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
					<a class="navbar-brand" href="#validationforms">Lead Notes</a>
				</div>
				<%-- <span class="nav navbar-nav navbar-right"> 
						
						 <a class="navbar-brand" href="ContractorController?action=createLeadAction"><button type="button"
								class="btn btn-info "></button> </a>
						
						   <a class="navbar-brand" href="ContractorController?action=showFollowUps"><button type="button"
								class="btn btn-success ">Follow Ups <span class="badge">${FollowUpCount}</span> </button> </a>
						
						
						<!-- <button type="button" onclick="showNotification('Notification')" class="btn btn-success ">Show Notification</button>  -->
						
						</span> --%>



			</div>



			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-4">
								<div class="card">
									<div class="card-content">

										<form id="notesForm" action="LeadNotesController"
											method="post" enctype="multipart/form-data">


											<div class="form-group">
												<label>Lead Reference Number</label> <input
													id="notes_lead_id" name="notes_lead_id"
													class="form-control" type="text" value="${lead.leadID}"
													readonly="readonly" />
											</div>


											<label class="control-label">Note</star></label>



											<div id="notesDiv" class="form-group">
												<textarea type="text" class="form-control" rows="3"
													name="notes_Note" id="notes_Note" maxlength="500"
													required="true"></textarea>
											</div>




											<div class="form-group">
												<input type="file" class="form-control" name="image"
													id="image"></input>
											</div>

											<input type="hidden" name="contractor_id"
												value="${contractor_id}"> <input type="hidden"
												name="employee_id" value="${employee_id}">

											<div class="card-footer">
												<center>
													<input type="submit" value="Add Note" class="btn btn-fill"
														style="background-color: #de7e31; color: white; border-color: #de7e31;">
												</center>
												<!-- <button  type="button"  onclick="addNote()" class="btn btn-fill">Add Note</button> -->
											</div>
										</form>
									</div>
								</div>
							</div>


							<div class="col-md-8">
								<div class="card">
									<div class="card-content" style="word-wrap: break-word;">
																
										<table id="notesTable"
											class="table table-striped table-no-bordered table-hover datatables"
											cellspacing="0" width="100%" style="width: 100%">
											<thead>
												<tr>
													<th>Time</th>
													<th>Note</th>
													<th>Files</th>
													<th>Download</th>
													<c:if test="${sessionScope.user!='installer'}">
													<th>Action</th>
													<th>Share Status</th>
													</c:if>
												</tr>
											</thead>

											<tbody>
											
												<c:forEach items="${notesList}" var="note">

													<tr>
														<td class="LeadID">${fn:substring(note.note_timestamp, 0,16)}</td>
														<td class="">${note.note}</td>
														<td class="">
															<%-- <img style="display:block;" width="100%" height="100%"  src="${note.imagepath}" class="rounded float-left" alt="No Image"> --%>
																
																 <c:set var = "path" value = "${note.imagepath}"/>
																 
                                                                 <c:set var = "fileType" value = "${fn:substringAfter(path, '.')}" />
                                                                 
                                                                 
															 <c:choose>
															 <c:when test="${fileType=='jpg' || fileType=='png'}">
															 
															 <a href="${path}" data-lightbox='images'><img
																src='${path}' class='img-thumbnail'
																width='80' height='80'></a>
															 
															  </c:when>
															   <c:when test="${fileType=='pdf'}">
															 
															 <a href="${path}"><img
																src='img/pdf_logo.png' class='img-thumbnail'
																width='40' height='40'></a>
															 
															  </c:when>
															  <c:when test="${empty path}">
															 
														<p>No File</p>
															 
															    </c:when>
																<c:otherwise>
																 <a href="${path}">View File</a>
																
																</c:otherwise>
																</c:choose>
                                                                  
														 <%--  </c:if> --%>
																
																
																
																
																
																
														</td>
														<td class="">
															<%-- <img style="display:block;" width="100%" height="100%"  src="${note.imagepath}" class="rounded float-left" alt="No Image"> --%>
															 <c:if test=" ${not  empty path}">  
															<a href="${path}" download>Download</a>   </c:if>
														</td>
														
															<c:if test="${sessionScope.user!='installer'}">
															
														<td class="">

															<form action="ContractorFlowController" method="post"
																onsubmit="return confirm('Please confirm your action');">
																<input type="hidden" name="action" value="deleteNote">
																<input type="hidden" name="lead_id"
																	value="${note.leadId}"> <input type="hidden"
																	name="notes_id" value="${note.lead_notes_id}">
																<input type="hidden" name="employee_id"
																	value="${employee_id}">
																<button
																	class="btn btn-simple btn-danger btn-icon remove"
																	type="submit">
																	<i class="ti-close" title="Close"></i>
																</button>
																<!-- <button class="btn btn-simple btn-danger btn-icon remove" onclick="showSwal('warning-message-and-confirmation')"><i class="ti-close" title="Close"></i></button> -->
															</form>


														</td>
														
													
														
														<td class="">
														
															  <form action="ContractorFlowController" method="post">
																<input type="hidden" name="action" value="shareNote">
																<input type="hidden" name="lead_id"
																	value="${note.leadId}"> <input type="hidden"
																	name="notes_id" value="${note.lead_notes_id}">
																<%-- <input type="hidden" name="employee_id"
																	value="${employee_id}"> --%>
															    <input type="hidden" name="notes_id" value="${note.lead_notes_id}">
															      <c:choose>
																	 <c:when test="${note.share=='1'}">
																	 
																	  <input onChange="this.form.submit()" type="checkbox" name="shareStatus" checked="checked">
																	  
																	  </c:when>
																		<c:otherwise>
																		 <input onChange="this.form.submit()" type="checkbox" name="shareStatus">
																		</c:otherwise>
																		</c:choose>
															    
																
																
																<!-- <button class="btn btn-simple btn-danger btn-icon remove" onclick="showSwal('warning-message-and-confirmation')"><i class="ti-close" title="Close"></i></button> -->
															</form>
														
														</td>
														
														</c:if>
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


<script language="javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>
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
-->

<!-- <!--  Google Maps Plugin   
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
-->
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
    
        
        
        $('#notesForm').validate();
        
        
        
        
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

<script type="text/javascript">
        $().ready(function(){
			/* $('#form_id').validate(); */
         });
    </script>

<script type="text/javascript">
     
    </script>
<script src="js/lightbox.js"></script>
</body>
</html>