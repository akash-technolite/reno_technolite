<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<head>
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Create Complaint</title>

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
					<a class="navbar-brand" href="#Dashboard"> <b>Store
							Information</b>
					</a>
				</div>
				<div class="collapse navbar-collapse">

					<ul class="nav navbar-nav navbar-right">
						<!--  <li>
            					<a  title="Sign-Out"class="logout" href="login.jsp">
              						<i class="fa fa-sign-out"></i>
            					</a>
         					</li>
         					<li>
             					<a  title="Lock-Screen" class="lock-screen" href="lock.jsp">
              						<i class="fa fa-lock"></i>
            					</a>
         					</li>
	                         -->
					</ul>
				</div>
			</div>
			</nav>



			<div class="content">
				<div class="container-fluid">
					<div class="row">

						<div class="col-md-12">
							<!-- <h2><b>Add Institute</b></h2> -->
							<h4>
								Store Information
								<button class="btn btn-info pull-right" data-toggle="modal"
									data-target="#myModal">Add Store</button>
							</h4>

							<br>

							<div class="card">
								<div class="card-content">

									<div class="fresh-datatables">
										<table id="datatables"
											class="table table-striped table-no-bordered table-hover datatables"
											cellspacing="0" width="100%" style="width: 100%">
											<thead>
												<tr>
													<th>Store Id</th>
													<th>Store Name</th>
													<th>Address</th>
													<th>Phone</th>
													<th>Item</th>
													<th>Email</th>
													<th class="disabled-sorting">Actions</th>
												</tr>
											</thead>
											<!-- <tfoot>
											<tr>
												<th>Sr</th>
												<th>Store Name</th>
												<th>Address</th>
												<th>Phone</th>
												<th>What</th>
												<th>Email</th>
												<th>Actions</th>
											</tr>
										</tfoot> -->
											<tbody>
												<c:forEach items="${storeslist}" var="store">
													<tr>
														<td>${store.stores_id}</td>
														<td>${store.store_name}</td>
														<td>${store.store_address}</td>
														<td>${store.store_mobile}</td>

														<td>
															<button id="itemsbtn" value="${store.stores_id}"
																class="btn btn-info itemsbtn" data-toggle="modal"
																data-target="#itemsModal">Items</button>
														</td>

														<!--  -->

														<td>${store.store_email}</td>
														<td>
															<!-- <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="ti-download" title="download"></i></a>
													<a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="ti-pencil-alt" title="Edit"></i></a>
													<a href="#"><button class="btn btn-simple btn-warning  btn-icon" data-toggle="modal"  data-target="#editModal"><i class="ti-pencil-alt" title="Edit"></i></button></a>
													<a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="ti-close" title="Close" onclick="demo.showSwal('warning-message-and-confirmation')"></i></a>
													 -->

															<button id="itemsbtn" value="${store.stores_id}"
																class="btn btn-simple btn-warning btn-icon editbtn"
																data-toggle="modal" data-target="#editModal">
																<i class="ti-pencil-alt" title="Edit"></i>
															</button>

															<button id="sharebtn" value="${store.stores_id}"
																class="btn btn-simple btn-info btn-icon sharebtn"
																data-toggle="modal" data-target="#shareModal">
																<i class="ti-share" title="share"></i>
															</button>
															
															<button id="shareListbtn" value="${store.stores_id}"
																class="btn btn-simple btn-success btn-icon shareListbtn"
																data-toggle="modal" data-target="#shareListModal">
																<i class="ti-list" title="Shared list"></i>
															</button>

															<form action="StoreController" method="post"
																onsubmit="return confirm('Please confirm your action');">
																<input type="hidden" name="action" value="delete">
																<input type="hidden" name="store_id"
																	value="${store.stores_id}">
																<button
																	class="btn btn-simple btn-danger btn-icon remove"
																	type="submit">
																	<i class="ti-close" title="Close"></i>
																</button>
															</form>



														</td>
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

	        $('#datatables').DataTable({
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
  $(function() {
    $('#toggle-two').bootstrapToggle({
      on: 'Enabled',
      off: 'Disabled'
    });
  })
</script>

<!--Add Modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Store</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="exampleModalLabel">Add Store</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<form id="addStoreValidation" action="StoreController"
								method="post">


								<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label"> Store Name<star>*</star>
										</label> <input class="form-control" type="text" name="store_name"
											id="store_name" required="true" autocomplete="off"
											maxlength="40" />
									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label"> Address<star>*</star>
										</label> <input class="form-control" type="text" name="store_address"
											id="store_address" required="true" autocomplete="off"
											maxlength="100" />
									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label"> Email <star>*</star>
										</label> <input class="form-control" name="store_email"
											id="store_email" type="text" required="true" email="true"
											autocomplete="off" maxlength="40" />
									</div>
								</div>


								<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label"> Phone no.<star>*</star>
										</label> <input class="form-control" type="text" name="store_mobile"
											id="store_mobile" number="true" required="true"
											autocomplete="off" maxlength="10" />
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label">Add Items Names<star>*</star></label>
										<div style="border: 1px solid #E8E7E3; background: #F3F2EE">
											<input name="items" maxlength="200" id="items" type="text"
												class="tagsinput" data-role="tagsinput" data-color="success" />
										</div>
									</div>
								</div>

								<input type="hidden" name="action" value="addStore">


								<div class="col-lg-12 col-md-12 col-sm-4 col-xs-12 PD">
									<div class="category">
										<star>*</star>
										Required fields
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-4 col-xs-12 PD">
									<div class="modal-footer">
										<button type="submit" class="btn btn-success btn-fill"
											style="background-color: #de7e31; border-color: #de7e31;">Add</button>
										<button type="reset" class="btn btn-default btn-fill">Clear</button>

										<div class="clearfix"></div>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- modal-body end-->
			<!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
		</div>
	</div>
</div>
<!--Add modal-end -->

<!--Edit Modal -->

<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!--  <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Store</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="exampleModalLabel">Update Store</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<form id="editStoreValidation" action="StoreController"
								method="post">

								<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label"> Store Name<star>*</star>
										</label> <input class="form-control" type="text" name="store_name"
											id="estore_name" required="true" autocomplete="off"
											maxlength="50" />
									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label"> Address<star>*</star>
										</label> <input class="form-control" type="text" name="store_address"
											id="estore_address" required="true" autocomplete="off"
											maxlength="100" />
									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label"> Email <star>*</star>
										</label> <input class="form-control" name="store_email"
											id="estore_email" type="text" required="true" email="true"
											autocomplete="off" maxlength="40" />
									</div>
								</div>


								<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label"> Phone no.<star>*</star>
										</label> <input class="form-control" type="text" name="store_mobile"
											id="estore_mobile" number="true" required="true"
											autocomplete="off" maxlength="10" />
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 PD">
									<div class="form-group">
										<label class="control-label">Add Items Names<star>*</star></label>
										<div style="border: 1px solid #E8E7E3; background: #F3F2EE">
											<input name="items" id="eitems" type="text" class="tagsinput"
												data-role="tagsinput" data-color="success" />
										</div>
									</div>
								</div>

								<input type="hidden" name="action" value="update"> <input
									type="hidden" id="estore_id" name="store_id">

								<div class="col-lg-12 col-md-12 col-sm-4 col-xs-12 PD">
									<div class="category">
										<star>*</star>
										Required fields
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-4 col-xs-12 PD">
									<div class="modal-footer">
										<button type="submit" class="btn btn-success btn-fill"
											style="background-color: #de7e31; border-color: #de7e31;">Update</button>
										<button type="reset" class="btn btn-default btn-fill">Clear</button>

										<div class="clearfix"></div>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- modal-body end-->
			<!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
		</div>
	</div>
</div>
<!--Edit modal-end -->


<!--Show Items Modal -->
<div id="itemsModal" class="modal fade" role="dialog">
	<div class="modal-dialog .modal-sm">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Items</h4>
			</div>
			<div class="modal-body">

				<div id="itemsList">
					<ol class="list">

					</ol>
				</div>




			</div>
			<div class="modal-footer">
				<!--  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
			</div>
		</div>

	</div>
</div>

<!--     Share Modal -->
<div class="modal fade" id="shareModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Share Store</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="exampleModalLabel">Share Store</h4>
			</div>
			<div class="modal-body">

				<div class="container-fluid">

					<div class="col-md-12">
						<div class="row">
							<form id="editDocumentForm" action="StoreController"
								method="post"">

								<div class=form-group">
									<label class="control-label">Select Employee<star>*</star></label>
									<select class="selectpicker" id="employee_id"
										name="employee_id" type="text" required="true"
										autocomplete="off" data-live-search="true">
									</select>
								</div>

								<input type="hidden" id="share_store_id" name="store_id">

								<input type="hidden" name="action" value="share">


								<div class="">
									<div class="category">
										<star>*</star>
										Required fields
									</div>
								</div>

								<div class="">
									<div class="modal-footer">
										<button type="submit" class="btn btn-info btn-fill">Share</button>
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

<!--     Share List Modal -->
<div class="modal fade" id="shareListModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Share Document</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="exampleModalLabel">Shared List</h4>
			</div>
			<div class="modal-body">
			<div class="container-fluid">
				<div class="col-md-12">
						<div class="row">
							<div id="sharedList">
								<ol class="list">
			
								</ol>
							</div>
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
     
 $().ready(function(){
	 
   	 
		$('#addStoreValidation').validate();
	    $('#editStoreValidation').validate();
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

<script type="text/javascript">
      $(".itemsbtn").click(function(){
    	  
    	 var stores_id=parseInt($(this).val());
    	  
    	
    	  
                $.post("AjaxForStoreItems",
    		    {
                	stores_id:stores_id,
    		        
    		    },
    		    function(data){
    		    	
    		    	 $('#itemsList .list li').remove();
    		    	
    		    	   $.each(data, function (key, val) {
    		    	        
    		    		  
    		    		   $('#itemsList .list').append('<li><h5 class="name">'+val.item_name+'</h5></li>')
    		    		   
    		    		   
    		    	    });
    		    	
    		       
    		    });
      });
      
     
      $(".editbtn").click(function(){
    	  
    	 var stores_id=parseInt($(this).val());
    	  
    	
    	  
                $.post("AjaxForStoreInfo",
    		    {
                	stores_id:stores_id,
    		        
    		    },
    		    function(data){
    		    	
    		    	 $("#estore_id").val(data.stores_id);
    		    	 $("#estore_name").val(data.store_name);
    		    	 $("#estore_email").val(data.store_email);
    		    	 $("#estore_address").val(data.store_address);
    		    	 $("#estore_mobile").val(data.store_mobile);
    		    	 
    		    	$.each(data.store_items,function (key, val) {
    		    		
	    				$('#eitems').tagsinput('add', val.item_name);
	    				
	    				}); 
    		    	 
	    			
    		       
    		    });
      });
      
      
      
      $(".sharebtn").click(function(){
    	  
       	 var store_id=parseInt($(this).val());
       	  
       	 $("#share_store_id").val(store_id);
       	
       	 $('#employee_id').empty();
       	  
       	 $.post("AjaxGetEmployees",
      		    {},
      		    function(data){
      		    	
      		    	$.each(data, function(key, value) {   
      		    		
      		    		 $('#employee_id').append($("<option></option>")
      		    	                    .attr("value",value.employee_id)
      		    	                    .text(value.employee_name)); 
      		    	}); 
      		    	
      		    	 $('#employee_id').selectpicker('refresh');
      		    	
      		  });
         }); 
      
      
      
      
      $(".shareListbtn").click(function(){
    	  
     	 var store_id=parseInt($(this).val());
     	  
     	
     	 
     	 $('#sharedList .list li').remove();
     	 
     	 $.post("AjaxGetStoreSharedList",
     			 
    		    {stores_id:store_id},
    		
    		    function(data){
    		    	
    		    	   $.each(data, function(key, value) {   
    		    		
    		    		 $('#sharedList .list').append('<li><h5 class="name">'+value.employee_name+' ('+value.employee_type+')</h5></li>')
   		    		   
   		    				
    		    	}); 
    		    	
    		    	 
    		    	
    		  });
       }); 
      
      
      
      
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