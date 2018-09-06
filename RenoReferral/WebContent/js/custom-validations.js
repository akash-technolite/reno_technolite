
$(document).ready(function(){
	var name_regex = /^[a-zA-Z ]+$/;
	
	
	$(".name").on("keyup",function(){
		
		var name=$(".name").val()
		
		if (!name.match(name_regex)) {
			
			$('#name_error').text("*Please use alphabets only"); 
			
			$(".name").focus();
			
			return false;
			
		}else{
			
			$('#name_error').empty(); 
		}
		
	});
	
	
	/*
	 
	 <p style="color:red" id="name_error"></p> 
	
	<!-- Custom Validation-->
	<script src="js/custom-validations.js"></script> 
	
	*/
	
});