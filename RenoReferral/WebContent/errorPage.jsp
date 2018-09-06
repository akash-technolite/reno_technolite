<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<link href="css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
	<div class="wrapper">
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">RenoReferral</a>
		</div>
		</nav>

		<div class="content">
			<div class="container-fluid">
				<div class="card">
					<div class="card-content">
						<center>

							<h1 style="font-size: 100px" class="text-danger">OOPS!</h1>
							<br />
							<h1 class="text-danger">
								Error Occurred,Something is not right please contact <br /> <strong
									class="text-info"> Technolite Software Solutions</strong>
							</h1>

							<div>
								<h2 class="text-info">Error Discription For Developers:</h2>
								<h3 class="text-danger">${error}</h3>
								<a href="Index"><button class="btn btn-success">Return
										Home</button></a>
							</div>

						</center>
					</div>
				</div>
			</div>

			<footer class="footer">
			<div class="container-fluid">
				<div class="copyright pull-right">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>
					, made with <i class="fa fa-heart heart"></i> by <a href="#">RenoReferral</a>
				</div>
			</div>
			</footer>
		</div>

	</div>






	<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>