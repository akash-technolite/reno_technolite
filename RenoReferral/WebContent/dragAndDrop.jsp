<jsp:include page="sidebar.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link href="css/imageuploadify.min.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<a class="navbar-brand" href="#validationforms">DRAG AND DROP
						FILES</a>

				</div>
				</nav>

				<div class="content">

					<div class="container-fluid">
						<div class="row">

							<div class="col-md-offset-1 col-md-10">
								<div class="card">

									<div>
										<h3 align="center" style="color: green">${msg}</h3>
									</div>

									<form class="" id="" action="#" method="post"
										enctype="multipart/form-data">
										<div on class="card-header">
											<center>
												<h3 class="card-title">
													<strong> UPLOAD FILES </strong>
												</h3>
											</center>
										</div>

										<div class="card-content">

											<fieldset>
												<div class="col-md-12 form-group">
													<label class="control-label"> Select Document<star>*</star>
													</label> <input class="form-control selectpicker"
														id="uploadContact" name="uploadContact" type="file"
														required="true" autocomplete="off">
												</div>
											</fieldset>
										</div>
									</form>
									<div class="card-footer">
										<button type="submit" class="btn btn-info btn-fill">Submit</button>
										<div class="clearfix"></div>
									</div>
								</div>




								<div class="category">
									<star>*</star>
									Required fields
								</div>
							</div>


						</div>
					</div>
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


<script type="text/javascript">
            $(document).ready(function() {
                $('input[type="file"]').imageuploadify();
            })
        </script>
</body>
</html>