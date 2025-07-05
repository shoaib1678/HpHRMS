<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" class="light-style customizer-hide" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Change Password</title>

<meta name="description" content="" />

<jsp:include page="css.jsp"></jsp:include>
<style>
.error {
	position: absolute;
	top: 90%;
	right: 3px;
}
</style>

</head>

<body>
<%
int sno = (int)request.getAttribute("sno");
%>
	<!-- Content -->
<input type="hidden" id="sno" name="sno" value="<%=sno%>">
	<div class="authentication-wrapper authentication-cover">
		<div class="authentication-inner row m-0">
			<!-- /Left Text -->
			<div
				class="d-none d-lg-flex col-lg-7 col-xl-8 align-items-center" style="padding: 0">
				<div class="w-100  justify-content-center">
					<img src="assets/img/callaction.jpg" class="img-fluid"
						alt="Password image" data-app-dark-img="password.jpg"
						data-app-light-img="password.jpg" style="height: 100vh; object-fit: cover;" />
				</div>
			</div>
			<!-- /Left Text -->

			<!-- Login -->
			<div
				class="d-flex col-12 col-lg-5 col-xl-4 align-items-center authentication-bg p-sm-5 p-4">
				<div class="w-px-400 mx-auto">
					<!-- Logo -->
					<div class="app-brand mb-3">
						<a href="home" class="app-brand-link gap-2"> <span
							class="app-brand-logo demo"> <img
								src="assets/img/hlogo.png"
								alt="Jungle Tours" title="Jungle Tours" />
						</span> <!-- <span class="app-brand-text demo text-body fw-bolder">Akash Enterprises</span> -->
						</a>
						<h2 class="m-0">Halicon Publication</h2>
					</div>
					<!-- /Logo -->
					<h4 class="mb-4">Change Password</h4>
					<!-- <p class="mb-4">Confirm your old password to set new password.</p> -->

					<form id="changepassword" name="changepassword" class="mb-3"
						action="adminDashboard" method="POST">
						<div class="mb-3 form-password-toggle">
							<label for="old_password" class="form-label">Current password</label>
							<div class="input-group input-group-merge">
								<input type="password" id="old_password" class="form-control"
									name="old_password"
									placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
									aria-describedby="password" autofocus /> <span class="input-group-text cursor-pointer password-addon" id="curpassword-addon"><i class="fa-solid fa-eye-slash"></i></span>
							</div>
						</div>
						<div class="mb-3 form-password-toggle">
							<label for="new_password" class="form-label">New password</label>
							<div class="input-group input-group-merge ">
								<input type="password" id="new_password" class="form-control"
									name="new_password"
									placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
									aria-describedby="password"  /> <span class="input-group-text cursor-pointer password-addon" id="npassword-addon"><i class="fa-solid fa-eye-slash"></i></span>
							</div>
						</div>
						<div class="mb-5 form-password-toggle">
							<div class="d-flex justify-content-between">
								<label class="form-label" for="confirm_password">Confirm
									New Password</label>
							</div>
							<div class="input-group input-group-merge">
								<input type="password" id="confirm_password"
									class="form-control" name="confirm_password"
									placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
									aria-describedby="password" />
									<span class="input-group-text cursor-pointer password-addon" id="password-addon"><i class="fa-solid fa-eye-slash"></i></span>
							</div>
						</div>
						<!-- <div class="mb-3">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="remember-me" />
								<label class="form-check-label" for="remember-me">
									Remember Me </label>
							</div>
						</div> -->
						<button type="submit" class="btn btn-primary d-grid w-100">Change</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="js.jsp"></jsp:include>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"
		integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript">
	$("#old_password").change(function(){
		var sno = $("#sno").val();
		var old_password = $("#old_password").val();
		var fd = new FormData();
		fd.append("sno",sno);
		fd.append("password",old_password);
		$.ajax({
			url : 'validate_password',
			type : 'post',
			data : fd,
			contentType :  false,
			processData : false,
			success : function(data) {

				if (data['status'] == 'Success') {
					
				} else {
					Swal.fire({
						icon : 'error',
						title : 'Sorry!',
						text : data['message']
					})
					$("#old_password").val("");
				}
			}
		});
	})
		$(function() {
			$("form[name='changepassword']").validate(

			{
				rules : {
					old_password : {
						required : true,
					},
					new_password : {
						required : true,
					},
					confirm_password : {
						required : true,
						equalTo: "#new_password",
					}
				},

				messages : {

					old_password : {
						required : "Please enter old password",
					},
					new_password : {
						required : "Please enter new password.",
					},
					confirm_password : {
						required : "Please enter confirm password.",
					}

				},

			 submitHandler : function(form) {
				var sno = $("#sno").val();
				var new_password = $("#new_password").val();
				var fd = new FormData();
				fd.append("sno",sno);
				fd.append("password",new_password);
				$.ajax({
					url : 'change_password',
					type : 'post',
					data : fd,
					contentType :  false,
					processData : false,
					success : function(data) {

						if (data['status'] == 'Success') {
							Swal.fire({
								icon : 'success',
								title : 'successfully!',
								text : data['message']
							})
							setTimeout(function() {
								location.href = "./";
								  }, 2000);
						} else {
							Swal.fire({
								icon : 'error',
								title : 'Sorry!',
								text : "Please enter valid Old Password."
							})
						}
					}
				});

			} 
			});

		});
	
	$("#curpassword-addon").click(function() {
	    if($("#curpassword i").hasClass('fa-eye-slash')){
	          $("#curpassword i").removeClass('fa-eye-slash');
	          $("#curpassword i").addClass('fa-eye');
	          $('#old_password').attr('type','text');
	        }else{
	          $("#curpassword i").removeClass('fa-eye');
	          $("#curpassword i").addClass('fa-eye-slash');  
	          $('#old_password').attr('type','password');
	        }
	  });
	$("#npassword-addon").click(function() {
	    if($("#npassword-addon i").hasClass('fa-eye-slash')){
	          $("#npassword-addon i").removeClass('fa-eye-slash');
	          $("#npassword-addon i").addClass('fa-eye');
	          $('#new_password').attr('type','text');
	        }else{
	          $("#npassword-addon i").removeClass('fa-eye');
	          $("#npassword-addon i").addClass('fa-eye-slash');  
	          $('#new_password').attr('type','password');
	        }
	  });
	$("#password-addon").click(function() {
	    if($("#password-addon i").hasClass('fa-eye-slash')){
	          $("#password-addon i").removeClass('fa-eye-slash');
	          $("#password-addon i").addClass('fa-eye');
	          $('#confirm_password').attr('type','text');
	        }else{
	          $("#password-addon i").removeClass('fa-eye');
	          $("#password-addon i").addClass('fa-eye-slash');  
	          $('#confirm_password').attr('type','password');
	        }
	  });
	</script>
</body>
</html>
