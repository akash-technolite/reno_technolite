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
				<!-- <span class="pull-right">
					<a class="navbar-brand" href="login.jsp"><button type="button" class="btn btn-info btn-fill"
					>Admin Login</button>
					</a>
					
					<a class="navbar-brand" href="contractorLogin.jsp"><button type="button" class="btn btn-info btn-fill"
					>Contractor Login</button>
					</a>
					
					<a class="navbar-brand" href="contrctorSign.jsp"><button type="button" class="btn btn-info btn-fill"
					>Contractor SignUp</button>
					</a>
					
	                </span> -->
			</div>
			</nav>

			<div class="content">

				<div class="container-fluid">
					<div class="row">


						<div class="col-md-6 col-md-offset-3">
							<div class="card" style="border: 2px solid black">
								<div class="card-block">
									<div align="center">
										<h4 class="card-text">
											<font size="3">Thank You for submitting your details,
												you will receive username and password from us within 48Hrs.</font>
										</h4>

										<p class="card-text">
											<font size="2">Feel free to call us with following
												reference number for any questions or query: </font>
										</p>
										<center>
											<h1 class="card-title">
												<c:out value="${requestScope.contractorId}" />
											</h1>
											<a href="Index"><button class="btn btn-success">Return
													Home</button></a>


											<%-- <h2 class="card-title text-info">Your Stripe Token is: <strong class="card-title">${stripeToken}</strong> </h2> --%>
										</center>
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
		</div>

	</div>

</body>
</html>