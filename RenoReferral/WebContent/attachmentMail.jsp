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
</head>
<body>
	<div class="wrapper">
		<div class="">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<a class="navbar-brand" href="#validationforms">Reno Referral</a>

			</div>
			</nav>

			<div class="content">

				<div class="container-fluid">
					<div class="row">


						<div class="col-md-6 col-md-offset-3">
							<div class="card">
								<div class="card-block">
									<form action="EmailTester" method="post"
										enctype="multipart/form-data">

										<div class="form-group">
											<label class="control-label">To<star>*</star>
											</label> <input class="form-control" type="text" name="to"
												required="true" autocomplete="off" maxlength="50" />
										</div>

										<div class="form-group">
											<label class="control-label">Subject<star>*</star>
											</label> <input class="form-control" type="text" name="Subject"
												required="true" autocomplete="off" maxlength="50" />
										</div>

										<div class="form-group">
											<label class="control-label">Message<star>*</star>
											</label> <input class="form-control" type="text" name="to"
												required="true" autocomplete="off" maxlength="50" />
										</div>

										<div class="form-group">
											<label class="control-label">Attachments<star>*</star></label>
											<input class="form-control" name="files" id="file"
												type="file" multiple />
										</div>

										<button type="submit" class="btn btn-success btn-fill"
											style="background-color: #de7e31; color: white; border-color: #de7e31;">Send
											Mail</button>

									</form>


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

</body>
</html>