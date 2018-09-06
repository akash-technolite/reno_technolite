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

<title>Contractor:Manage Leads</title>

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
				<!-- <span
					class="pull-right"> <a class="navbar-brand" href="login.jsp"><button
							type="button" class="btn btn-info btn-fill">Admin
							Login</button> </a> <a class="navbar-brand" href="contractorLogin.jsp"><button
							type="button" class="btn btn-info btn-fill">Contractor
							Login</button> </a> <a class="navbar-brand" href="ContractorSignUp?action=view"><button
							type="button" class="btn btn-info btn-fill">Contractor
							SignUp</button> </a>

				</span> -->
			</div>
			</nav>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<center>
							<h2 class="card-title">Choose Subscription</h2>
							<div class="col-md-12">
								<div class="card">


									<div class="card-block">

										<table id="subTable"
											class="table table-striped table-bordered table-hover datatables"
											cellspacing="0" width="100%" style="width: 100%">
											<thead>
												<tr>

												</tr>
												<tr>
													<th hidden>Id</th>
													<th><strong>Subscription Name</strong></th>
													<th><strong>RenoReferral Leads</strong></th>
													<th><strong>Purchase Leads</strong></th>
													<th><strong>Create Leads</strong></th>
													<th><strong>Create Employees</strong></th>
													<th><strong>Create Sub-Contractor</strong></th>
													<th><strong>Sign Contracts</strong></th>
													<th><strong>Price (CAD)</strong></th>
													<th><strong>Payment</strong></th>
												</tr>
											</thead>



											<tbody>
												<c:forEach items="${subscriptionsView}" var="sub">
													<tr>
														<td hidden>${sub.subscriptionId}</td>
														<td>${sub.subscriptionName}</td>
														<td>${sub.renoRefLeads}(${sub.renoLeadLimit})</td>
														<td>${sub.purchaseLeads}(${sub.purchaseLeadLimit})</td>
														<td>${sub.createLeads}(${sub.createLeadLimit})</td>
														<td>${sub.createEmployees}
															(${sub.createEmployeeLimit})</td>
														<td>${sub.createSubcontractors}
															(${sub.createSubConLimit})</td>
														<td>${sub.signContact}</td>
														<td>${sub.price/100}</td>
														<td><c:choose>
																<c:when test="${sub.price==0}">

																	<a
																		href="ContractorSignUp?action=add&subscriptionId=${sub.subscriptionId}"><button
																			class="btn btn-info btn-fill">Sign Up</button></a>

																</c:when>



																<c:otherwise>

																	<form action="ContractorSignUp" method="post">
																		<script src="https://checkout.stripe.com/checkout.js"
																			class="stripe-button"
																			data-key="pk_test_6pRNASCoBOKtIshFeQd4XMUh"
																			data-amount="${sub.price}" data-name="Reno Referral"
																			data-description="Subscription"
																			data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
																			data-locale="auto" data-zip-code="true"
																			data-label="Buy Now" data-currency="CAD"
																			data-email="${contractorEmail}">
													  </script>

																		<input type="hidden" name="button" value="add">

																		<input type="hidden" name="subscriptionId"
																			value="${sub.subscriptionId}">


																	</form>

																	<!-- <input type="submit" class="btn btn-info btn-fill"  value="Sign Up"> -->



																</c:otherwise>
															</c:choose> <%-- 							c
												
													
												<a href="ContractorSignUp?action=add&subscriptionId=${sub.subscriptionId}"><button
															class="btn btn-info btn-fill">Sign Up</button></a></td>
													 --%>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</center>
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



			<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
			<script src="js/jquery-ui.min.js" type="text/javascript"></script>
			<script src="js/perfect-scrollbar.min.js" type="text/javascript"></script>
			<script src="js/bootstrap.min.js" type="text/javascript"></script>
			<script language="javascript"
				src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>

			<!--  Forms Validations Plugin -->
			<script src="js/jquery.validate.min.js"></script>



			<!--  Bootstrap Table Plugin    -->
			<script src="js/bootstrap-table.js"></script>

			<!--  Plugin for DataTables.net  -->
			<script src="js/jquery.datatables.js"></script>




			<script type="text/javascript">
	    $(document).ready(function() {

	        $('.datatables').DataTable();
	        
	    });
	      </script>




		</div>
	</div>
</body>
</html>