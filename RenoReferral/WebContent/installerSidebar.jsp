<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>RenoReFerral</title>

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

	<div class="sidebar" data-background-color="brown"
		data-active-color="danger">
		<!--
			Tip 1: you can change the color of the sidebar's background using: data-background-color="white | brown"
			Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
		-->
		<div style="background-color: #F8F8F8;" class="logo">
			<center>
				<a href="#" class="logo-normal"> <img
					class="img img-fluid" style="max-width: 82%;"
					src="img/reno _logo.png">
				</a>
			</center>
			<a href="#" class="logo-mini"> RR </a>

		</div>
		<div class="sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<img src="img/faces/face-1.jpg" />
				</div>
				<div class="info">
					<%--< a href="ContractorController?action=profile" > 
	                        <span>
									${sessionScope.emp.employee_name}
		                       <b class="caret"></b>
							</span>
	                    </a>  --%>
					<a data-toggle="collapse" href="#collapseExample" class="collapsed">
						<span> ${sessionScope.employee_name} <b class="caret"></b>
					</span>
					</a>
					<div class="clearfix"></div>

					<div class="collapse" id="collapseExample">
						<ul class="nav">
							<!--   <li>
									<a href="ContractorController?action=profile">
										<span class="sidebar-mini">Mp</span>
										<span class="sidebar-normal">My Profile</span>
									</a>
								</li> -->
							<!-- <li>
									<a href="#edit">
										<span class="sidebar-mini">Ep</span>
										<span class="sidebar-normal">Edit Profile</span>
									</a>
								</li>
	                            <li>
									<a href="#settings">
										<span class="sidebar-mini">S</span>
										<span class="sidebar-normal">Settings</span>
									</a>
								</li> -->
							<li><a href="LogoutController"> <span
									class="sidebar-mini"><i class="ti-shift-left"></i></span> <span
									class="sidebar-normal">Logout</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<ul class="nav">
				<!-- <li>
	                    <a  href="installerDashboard.jsp">
	                        <i class="ti-panel"></i>
	                        <p>DASHBOARD
                                
                            </p>
	                    </a>
                     </li> -->

				<li><a href="InstallerController?action=showLeads"> <i
						class="ti-id-badge"></i>
						<p>LEADS</p>
				</a></li>

				<!--  <li>
						<a href="EmployeeController">
	                        <i class="ti-user"></i>
	                        <p>
								EMPLOYEE
	                           
	                        </p>
	                    </a>
	                   
	                </li>
	                
					<li>
						<a  href="PromotionAction?action=view">
	                        <i class="ti-star"></i>
	                        <p>
							 PROMOTION
	                          
	                        </p>
	                    </a>
	                    
	                </li>
	                
	              <li>
						<a  href="ContractorController?action=contractorSales">
	                        <i class="ti-shopping-cart"></i>
	                        <p>
								SALES
	                           
	                        </p>
	                    </a>
	                    
	                </li> -->



				<li><a href="InstallerController?action=installerComplaints">
						<i class="ti-email"></i>
						<p>COMPLAINTS</p>
				</a></li>


				<li><a href="InstallerController?action=showAllDocuments">
						<i class="ti-clipboard"></i>
						<p>DOCUMENTS</p>
				</a></li>


				<li><a href="InstallerController?action=showAllStores"> <i
						class="ti-home"></i>
						<p>STORES</p>
				</a></li>



				<!--  <li>
						<a  href="#">
	                        <i class="ti-clipboard"></i>
	                        <p>
								REPORT
	                           
	                        </p>
	                    </a>
	                   
	                </li>
	                  -->
				<!-- <li>
						<a  href="#">
	                        <i class="ti-settings"></i>
	                        <p>
								SETTING
	                           
	                        </p>
	                    </a>
	                   
	                </li>  -->

				<!-- <li>
						<a  href="LogoutController">
	                        <i class="ti-shift-left"></i>
	                        <p>
								LOGOUT
	                           
	                        </p>
	                    </a>
	                   
	                </li>    -->


			</ul>
		</div>
	</div>
</body>

<!--   Core JS Files. Extra: TouchPunch for touch library inside jquery-ui.min.js   -->
<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script>
$(document).ready(function () {
    var activeli;
    $('.nav li').each(function () {
        url = $(this).find("a").attr("href");
        if (url != "/" && location.href.indexOf(url) > 0) activeli = $(this);
    });
    if (!activeli) activeli = $("#navbar li:first-child");
    activeli.addClass("active");
});
    </script>

</html>