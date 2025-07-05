<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="assets/admin/assets"
  data-template="vertical-menu-template"
>
  <head>
  <title>Login</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
<jsp:include page="css.jsp"></jsp:include>

<style type="text/css">
	#password-error{
		position: absolute;
	    top: 88%;
	}
</style>
  </head>

  <body>
    <!-- Content -->

    <div class="authentication-wrapper authentication-cover">
      <div class="authentication-inner row m-0">
        <!-- /Left Text -->
        <div class="d-none d-lg-flex col-lg-7 col-xl-8 align-items-centern p-0">
          <div class="d-flex justify-content-center">
            <img
              src="assets/img/callaction.jpg"
              class="img-fluid"
              alt="Login image"
              width="1000"
              data-app-dark-img="callaction.jpg"
              data-app-light-img="callaction.jpg"
             style="height: 100vh; object-fit: cover;"/>
          </div>
        </div>
        <!-- /Left Text -->

        <!-- Login -->
        <div class="d-flex col-12 col-lg-5 col-xl-4 align-items-center authentication-bg p-sm-5 p-4">
          <div class="w-px-400 mx-auto">
            <!-- Logo -->
            <div class="app-brand mb-5">
              <a href="" class="app-brand-link gap-2">
                <span class="app-brand-logo demo mw-100">
                  <img src="assets/img/hlogo.png" alt="Halicon Publication" title="Halicon Publication" style="width: 75%;"/>
                </span>
                <!-- <span class="app-brand-text demo text-body fw-bolder">Deebash Fashion</span> -->
              </a>
            </div>
            <!-- /Logo -->
            <h4 class="mb-2">Welcome to Halicon Publication !! </h4>
            <p class="mb-4">Please sign-in to your account and start the adventure</p>

            <form  class="mb-3" name="admin_login" id="admin_login" method ="post" action="dashboard">
              <div class="mb-3">
                <label for="email" class="form-label">Email or Username</label>
                <input
                  type="email"
                  class="form-control"
                  id="email"
                  name="email"
                  placeholder="Enter your email or username"
                  autofocus
                />
              </div>
              <div class="mb-3 form-password-toggle">
                <div class="d-flex justify-content-between">
                  <label class="form-label" for="password">Password</label>
                 <!--  <a href="auth-forgot-password-cover.html">
                    <small>Forgot Password?</small>
                  </a> -->
                </div>
                <div class="input-group input-group-merge">
                  <input
                    type="password"
                    id="password"
                    class="form-control"
                    name="password"
                    placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                    aria-describedby="password"/>
                  <span class="input-group-text cursor-pointer" id="password-addon"><i class="fa-solid fa-eye-slash"></i></span>
                </div>
              </div>
              <div class="mb-3">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="remember-me" />
                  <label class="form-check-label" for="remember-me"> Remember Me </label>
                </div>
              </div>
              <button class="btn btn-primary d-grid w-100" id="bttnn">Log In</button>
            </form>

           
          </div>
        </div>
        <!-- /Login -->
      </div>
    </div>

    <!-- / Content -->

   <jsp:include page="js.jsp"></jsp:include>
   <script>
		$(function() {
			$("form[name='admin_login']").validate({
				rules : {
					email : {
						required : true,
					},
					password : {
						required : true,
					}
				},
				messages : {
					email : "Please enter valid username",
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
		
		/* Show password input value */

		$("#password-addon").click(function() {
		    if($("#password-addon i").hasClass('fa-eye-slash')){
		          $("#password-addon i").removeClass('fa-eye-slash');
		          $("#password-addon i").addClass('fa-eye');
		          $('#password').attr('type','text');
		        }else{
		          $("#password-addon i").removeClass('fa-eye');
		          $("#password-addon i").addClass('fa-eye-slash');  
		          $('#password').attr('type','password');
		        }
		  });
	</script>
   
  </body>
</html>
