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

<title>Sign Up</title>

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
				<a class="navbar-brand" href="Index">Reno Referral</a>

			</div>
			</nav>

			<div class="content" style="padding-top: 10%">

				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="card">
								<div class="card-block">
									<div class="row">
										<div class="col-md-10 col-md-offset-1">
											<form id="form" action="ContractorSignUp" method="get">

												<input type="hidden" name="action" value="view">



												<div class="form-group">

													<label class="control-label"> Enter Email <star>*</star>
													</label> <input class="form-control" id="email" name="email"
														type="text" required="true" autocomplete="off"
														email="true" maxlength="40" />
												</div>





												<div class="card-footer">
													<button type="submit" class="btn btn-info btn-fill">Submit</button>
													<div class="clearfix"></div>
												</div>

											</form>
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
	<footer class="footer">
	<div class="container-fluid">
		<div class="copyright pull-right">
			&copy;
			<script>document.write(new Date().getFullYear())</script>
			, made with <i class="fa fa-heart heart"></i> by <a href="#">RenoReferral</a>
		</div>
	</div>
	</footer>

	<!--   Core JS Files. Extra: TouchPunch for touch library inside jquery-ui.min.js   -->
	<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/perfect-scrollbar.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Forms Validations Plugin -->
	<script src="js/jquery.validate.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="js/bootstrap-notify.js"></script>

	<!-- Paper Dashboard PRO Core javascript and methods for Demo purpose -->
	<script src="js/paper-dashboard.js"></script>

	<script type="text/javascript">
        $().ready(function(){
			$('#form').validate();
           
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