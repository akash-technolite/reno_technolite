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
</head>
<body>
	<form id="LeadRegisterForm" action="LeadRegister" method="post">
		<div class="card-header">
			<h4 class="card-title">Create Lead</h4>
		</div>

		<div class="card-content">
			<div>
				<h3 align="center" style="color: green">${SuccessMessage}</h3>
			</div>
			<div>
				<h3 align="center" style="color: red">${ErrorMessage}</h3>
			</div>
			<div class="form-group">
				<label class="control-label"> Select Service<star>*</star>
				</label> <select class="selectpicker" id="service" name="service"
					type="text" required="true" autocomplete="off">
					<option value="1">Painting</option>
					<option value="2">Flooring</option>
					<option value="3">Kitchen</option>
					<option value="4">Roof</option>
					<option value="5">Doors & Windows</option>


				</select>
			</div>

			<div class="form-group">
				<label class="control-label"> Name <star>*</star>
				</label> <input class="form-control" id="name" name="name" type="text"
					required="true" autocomplete="off" />
			</div>

			<div class="form-group">
				<label class="control-label"> Email Address <star>*</star>
				</label> <input class="form-control" id="email" name="email" type="text"
					required="true" email="true" autocomplete="off" />
			</div>

			<div class="form-group">
				<label class="control-label">Mobile<star>*</star></label> <input
					class="form-control" name="mobileNumber" id="mobileNumber"
					type="text" required="true" autocomplete="off" number="true" />
			</div>


			<div class="form-group">
				<label class="control-label">Postal Code<star>*</star></label> <input
					class="form-control" name="postalCode" id="postalCode" type="text"
					required="true" autocomplete="off" />
			</div>


			<div class="form-group">
				<label class="">Describe Your Requirement<star>*</star></label>
			</div>
			<div class="form-group">
				<textarea type="text" class="form-control" rows="3"
					name="description" id="description" required="true"></textarea>
			</div>
			<!--    
	                                     <div class="form-group">
	                                        <label class="control-label">Upload Images<star>*</star></label>
	                                        <input class="form-control selectpicker"
	                                               name="file[]"
	                                               id="uploadImages"
	                                               type="file"
	                                               size="10"
	                                              multiple
	                                           />
	                                    </div> -->

			<div class="category">
				<star>*</star>
				Required fields
			</div>
		</div>
		<div class="card-footer">
			<button type="submit" class="btn btn-info btn-fill">Submit</button>
			<div class="clearfix"></div>
		</div>
	</form>
	<footer class="footer">
	<div class="container-fluid">
		<div class="copyright pull-right">
			&copy;
			<script>document.write(new Date().getFullYear())</script>
			, made with <i class="fa fa-heart heart"></i> by <a href="#">RenoReferral</a>
		</div>
	</div>
	</footer>
</body>
</html>