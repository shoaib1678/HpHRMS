<!doctype html>
<html lang="en">

<head>
<title>login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha514-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="assets/AppData/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="assets/AppData/css/style.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/x-icon" href="assets/images/hlogo.png" />
<style>
.error{
	color: red !important;
}
</style>
</head>

<body style="background-image: url(assets/AppData/images/topban.jpg); background-repeat: no-repeat;background-size: cover;">

<section class="main-page" style="background-image: none;">
  <div class="home-top">
 <div class="flex-item" style="display: flex; margin: auto; background: none;"><img src="assets/AppData/images/hlogo.png" alt="" style="height: 185px;"></div> 
  <!-- <div class="flex-item"><h5>English</h5></div> -->
</div>  
  <div class="login-bg" style="background: none;">
    <div class="container">
      <div class="login-cont">
        <div class="form-style">
        <h2 class="pb-3 text-center fst-italic" style="font-size: 20px;">Welcome to Halicon Publication !!</h2>
        <p class="pb-3 text-center text-gray">Please sign-in to your account</p>
        <form id="login" name="login" action="emp_dashboard" autocomplete="off" method="post">
          <div class="form-group pb-3">    
            <input type="text" placeholder="Email" class="form-control" id="email" name="email">  
          </div>
          <div class="form-group pb-2"> 
            <input type="password" placeholder="Password" class="form-control" id="password" name="password">
            <i class="fa fa-eye-slash me-1 eye-icon" aria-hidden="true"></i>
          </div>
            <div class="float-end"><a href="reset_password">Forgot Password?</a></div>
           <div class="mb-1">
          <button type="submit" class="btn bg-info w-100 font-weight-bold mt-2 text-white" id="bttnn">Log in</a>
          
           </div>
        </form>
          <div>
          </div>
        </div>
          <div class="modal fade" id="popup1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Welcome To Your Panel</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	             <div class="modal-body" id="modalBodyContent">
	            </div> 
	        </div>
	    </div>
	</div>   
      </div>
    </div>
  </div>
</section>
	
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <!-- All JS -->
 	
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <script type="text/javascript">
    
	$(function() {
		$("form[name='login']").validate({
			rules : {
				email : {
					required : true,
				},
				password : {
					required : true,
				}
			},
			messages : {
				email : "Please enter valid email id",
				password : "Please enter password",

			},
			submitHandler : function(form) {
				$("#bttnn").html("Please Wait..");
				var email = $("#email").val();
				var password = $("#password").val();
				
				var fd = new FormData();
				
				fd.append("email",email);
				fd.append("password",password);
				

				$.ajax({
					url : 'checklogin',
					type : 'post',
					data : fd,
					contentType : false,
					processData : false,
					success : function(data) {

						if (data['status'] == 'Success') {
							$("#bttnn").html("Success");
							form.submit();
						
						} else{
							$("#bttnn").html("Invalid Login Credentials");
							setTimeout(function() {
								$("#bttnn").html("Login");
						      }, 3000);
						}
						
					}
				});
			}
		});
	});
    
    
    $(".eye-icon").click(function() {
		
      	if($(this).hasClass('fa-eye-slash')){
            $(this).toggleClass('fa-eye-slash fa-eye');
            $(this).siblings('input').attr('type','text');
          }else{
          	$(this).toggleClass('fa-eye fa-eye-slash ');
          	$(this).siblings('input').attr('type','password');
          }
    });
    
    </script>	

</body>
</html>