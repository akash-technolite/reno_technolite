<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--  <c:choose>
	<c:when test="${sessionScope.user=='contractor'}">
	<jsp:include page="contractorSidebar.jsp" />
	</c:when>
	<c:when test="${sessionScope.user=='estimator'}">
	<jsp:include page="estimatorSidebar.jsp" />
	 </c:when>
	<c:otherwise> --%>
<jsp:include page="installerSidebar.jsp" />
<%-- </c:otherwise>
	</c:choose> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Documents</title>

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

					<a class="navbar-brand" href="#validationforms">Documents</a>
				</div>
				<span class="pull-right"> </span>
			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">

						<div class="col-md-12">
							<!-- <h2><b>Add Institute</b></h2> -->
							<!-- <h4>Document Center
					<button class="btn btn-info pull-right" data-toggle="modal"
                                            data-target="#myModal">Add Document</button>
				</h4> -->

							<br>

							<div class="card">
								<div class="card-content">
									<div class="toolbar">
										<!--Here you can write extra buttons/actions for the toolbar-->
									</div>
									<div class="fresh-datatables">
										<table
											class="table table-striped table-no-bordered table-hover datatables"
											cellspacing="0" width="100%" style="width: 100%">
											<thead>
												<tr>
													<!-- <th>Sr</th> -->
													<th>Id</th>
													<th>Name</th>
													<th>Type</th>
													<th>Description</th>
													<th class="disabled-sorting">Actions</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${documentlist}" var="doc">
													<tr>

														<td>${doc.document_id}</td>
														<td>${doc.document_name}</td>
														<td>${doc.document_type}</td>
														<td>${doc.document_description}</td>
														<td><a href="${doc.document_path}" target="_blank"
															class="btn btn-simple btn-success btn-icon like"> <i
																class="ti-image" title="view"></i></a> <a
															href="${doc.document_path}"
															class="btn btn-simple btn-danger btn-icon like" download>
																<i class="ti-download" title="download"></i>
														</a> <%--  <button id="editbtn" value="${doc.document_id}" class="btn btn-simple btn-warning btn-icon editbtn" data-toggle="modal"data-target="#editModal"><i class="ti-pencil-alt" title="Edit"></i></button>
												    
												    <form action="DocumentController" method="post"
												    onsubmit="return confirm('Please confirm your action');"
												    >
												    <input type="hidden" name="action" value="delete"> 
												    <input type="hidden" name="document_id" value="${doc.document_id}"> 
												    <button class="btn btn-simple btn-danger btn-icon remove" type="submit"><i class="ti-close" title="Close"></i></button>
												    </form> --%></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!--fresh-datatables end-->
								</div>
								<!--card-content end-->
							</div>
							<!--card end-->
						</div>
						<!--col-md-9-->
					</div>
					<!--row-->
				</div>
				<!--container-fluid-->
			</div>
			<!--content end-->


		</div>
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

<script>
  /* $(function() {
    $('#toggle-two').bootstrapToggle({
      on: 'Enabled',
      off: 'Disabled'
    });
  }) */
</script>

<!--Add Modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add Document</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<div class="container-fluid">

					<div class="col-md-12">
						<div class="row">
							<form id="addDocumentForm" action="DocumentUploader"
								method="post" enctype="multipart/form-data">


								<div class="">
									<div class="form-group">
										<label class="control-label">Document Name<star>*</star>
										</label> <input class="form-control" type="text" name="docname"
											required="true" autocomplete="off" maxlength="50" />
									</div>
								</div>

								<div class="">
									<div class="form-group">
										<label class="control-label"> Document Type<star>*</star>
										</label> <input class="form-control" type="text" name="doctype"
											required="true" autocomplete="off" maxlength="50" />
									</div>
								</div>


								<div class="">
									<label class="control-label">Document Discription</label>

									<div class="form-group">
										<textarea type="text" class="form-control" rows="3"
											name="description" id="description" required="true"
											maxlength="250"></textarea>
									</div>
								</div>

								<div class="">
									<label class="control-label">Upload Document<star>*</star></label>

									<div class="form-group">
										<input class="form-control selectpicker" name="file" id="file"
											type="file" />
									</div>
								</div>

								<div class="">
									<div class="category">
										<star>*</star>
										Required fields
									</div>
								</div>

								<div class="">
									<div class="modal-footer">
										<button type="submit" class="btn btn-success btn-fill">Upload</button>
										<button type="reset" class="btn btn-default btn-fill">Clear</button>
										<div class="form-group pull-left">
											<label class="checkbox"> <input type="checkbox"
												data-toggle="checkbox" value="subscribe">

											</label>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--Edit Modal -->

<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Edit Document</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<div class="container-fluid">

					<div class="col-md-12">
						<div class="row">
							<form id="editDocumentForm" action="DocumentUpdater"
								method="post" enctype="multipart/form-data">


								<div class="">
									<div class="form-group">
										<label class="control-label">Document Name<star>*</star>
										</label> <input class="form-control" type="text" name="docname"
											id="edocname" required="true" autocomplete="off"
											maxlength="50" />
									</div>
								</div>

								<div class="">
									<div class="form-group">
										<label class="control-label"> Document Type<star>*</star>
										</label> <input class="form-control" type="text" name="doctype"
											id="edoctype" required="true" autocomplete="off"
											maxlength="50" />
									</div>
								</div>


								<div class="">
									<label class="control-label">Document Discription</label>

									<div class="form-group">
										<textarea type="text" class="form-control" rows="3"
											name="description" id="edescription" required="true"
											maxlength="500"></textarea>
									</div>
								</div>

								<div class="col-sm-12 form-group">

									<a target="_blank" id="viewDoc" class="btn btn-success">View
										Old Document</a>

								</div>

								<div class="">
									<label class="control-label">Upload Document<star>*</star></label>

									<div class="form-group">
										<input class="form-control selectpicker" name="file" id="file"
											type="file" />
									</div>
								</div>




								<input type="hidden" id="edocument_id" name="document_id">


								<div class="">
									<div class="category">
										<star>*</star>
										Required fields
									</div>
								</div>

								<div class="">
									<div class="modal-footer">
										<button type="submit" class="btn btn-success btn-fill">Upload</button>
										<button type="reset" class="btn btn-default btn-fill">Clear</button>
										<div class="form-group pull-left">
											<label class="checkbox"> <input type="checkbox"
												data-toggle="checkbox" value="subscribe">

											</label>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<script type="text/javascript">

      $().ready(function(){
    		 
    	   	 
  		$('#addDocumentForm').validate();
  	    $('#editDocumentForm').validate();
  	    
     });
      
      $(".editbtn").click(function(){
    	  
     	 var document_id=parseInt($(this).val());
     	  
     	
     	  
                 $.post("AjaxForDocument",
     		    {
                	 document_id:document_id,
     		        
     		    },
     		    function(data){
     		    	
     		         $("#edocument_id").val(data.document_id);
     		    	 $("#edocname").val(data.document_name);
     		    	 $("#edoctype").val(data.document_type);
     		    	 $("#edescription").val(data.document_description);
     		    	 $("#viewDoc").attr("href",data.document_path);
     		    	
     		    	 
     		    		
     		       
     		    });
       });
      
      
      
      
      
      
      
      

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

</html>