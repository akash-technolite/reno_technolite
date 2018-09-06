<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="/StripeController" method="POST">
		<script src="https://checkout.stripe.com/checkout.js"
			class="stripe-button" data-key="pk_test_6pRNASCoBOKtIshFeQd4XMUh"
			data-amount="20000" data-name="Stripe.com"
			data-description="2 widgets"
			data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
			data-locale="auto" data-zip-code="true">
</script>
	</form>
</body>
</html>