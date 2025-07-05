<!DOCTYPE html>



<%@page import="com.hp.model.Department"%>
<%@page import="java.util.List"%>
<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template-starter">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>All Employee</title>

<meta name="description" content="" />


<jsp:include page="css.jsp"></jsp:include>
<style type="text/css">
table, td, th {
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px;
}

table {
	/* border-radius: 5px 5px 0 0 !important; overflow: hidden !important; */
	margin-bottom: 10px;
}
</style>
</head>

<body>

	<%
	List<Department> departments = (List<Department>) request.getAttribute("departments");
	%>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<jsp:include page="header.jsp"></jsp:include>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<jsp:include page="navbar.jsp"></jsp:include>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">


					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">

						<!-- Users List Table -->
						<div class="card ">

							<form name="employee" id="employee">
								<div class="row p-4">
									<h5>
										<b><u>General Details</u></b>
									</h5>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">First
											Name</label> <input type="text" id="FirstName" name="FirstName"
											class="form-control" placeholder="Enter First Name" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">Last
											Name</label> <input type="text" id="LastName" name="LastName"
											class="form-control" placeholder="Enter Last Name" />
									</div>

									<div class="col-md-4 mb-2">
										<label for="emailWithTitle" class="form-label">Email</label> <input
											type="email" id="Email" name="Email" class="form-control"
											required="required" placeholder="xxxx@xxx.xx"
											onblur="varifyEmpDetails()" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">Father
											Name</label> <input type="text" id="FatherName" name="FatherName"
											class="form-control" placeholder="Father Name" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">Address</label>
										<input type="text" id="Address" name="Address"
											class="form-control" placeholder="Address" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">Contact
											Number</label> <input type="text" id="ContactNo" name="ContactNo"
											class="form-control" placeholder="Contact Number"
											onblur="varifyEmpDetails()" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">Gender</label> <select
											class="form-select" id="gender" aria-label="Designation"
											name="gender">
											<option value="">--select gender--</option>
											<option value="Male">Male</option>
											<option value="Female">Female</option>
										</select>
									</div>
								</div>
								<div class="row p-4">
									<h5>
										<b><u>Joining Details</u></b>
									</h5>
									<div class="col-md-4 mb-2">
										<label for="department" class="form-label">Department</label>
										<select id="department" name="department" class="form-control">
											<option value="" selected>--Select--</option>
											<%
											for (Department d : departments) {
											%>
											<option value="<%=d.getSno()%>"><%=d.getDepartment()%></option>
											<%
											}
											%>
										</select>
									</div>
									<div class="col-md-4 mb-2">
										<label for="Designation" class="form-label">Designation</label>
										<select class="form-select" id="Designation"
											aria-label="Designation" name="Designation">
											<option value="">--select designation--</option>
										</select>
									</div>
									<div class="col-md-4 mb-2">
										<label for="grade" class="form-label">Grade</label> <input
											type="text" id="grade" name="grade" class="form-control"
											disabled="disabled" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="JoiningDate" class="form-label">Date Of
											Joining</label> <input type="date" id="JoiningDate"
											name="JoiningDate" class="form-control"
											placeholder="DD / MM / YY" />
									</div>

									<div class="col-md-4 mb-2">
										<label for="Designation" class="form-label">Salary
											Package(Annually)</label> <input type="number" id="salary" name="salary"
											class="form-control  sum  monthly_salary"
											placeholder="xxxxxxxx" />
									</div>
								</div>
								<div class="row p-4">
									<h5>
										<b><u>Kyc Details</u></b>
									</h5>
									<div class="col-md-6 mb-2">
										<label for="nameWithTitle" class="form-label">Aadhar
											No</label> <input type="text" id="AadharNo" name="AadharNo"
											class="form-control" placeholder="Aadhar No"
											onblur="varifyEmpDetails()" />
									</div>
									<div class="col-md-6 mb-2">
										<label for="nameWithTitle" class="form-label">PAN No</label> <input
											type="text" id="PANNo" name="PANNo" class="form-control"
											placeholder="PAN No" onblur="varifyEmpDetails()" />
									</div>
									<div class="col-md-6 mb-2">
										<label for="nameWithTitle" class="form-label">Aadhar
											Document</label> <input type="file" id="aadharDocument"
											name="aadharDocument" class="form-control"
											accept="image/png,image/jpeg" onchange="displayImage(this)">
									</div>
									<div class="col-md-6 mb-2">
										<label for="nameWithTitle" class="form-label">PAN
											Document</label> <input type="file" id="panDocument"
											name="panDocument" class="form-control"
											accept="image/png,image/jpeg" onchange="displayImage1(this)" />
									</div>
									<div class="col-md-6 mb-2">
										<img id="aadharview" height="100px;" width="150px;" />
									</div>

									<div class="col-md-6 mb-2">
										<img id="panview" height="100px;" width="150px;" />
									</div>
								</div>

								<div class="row p-4">
									<div class="col-md-6 mb-2">
										<label for="nameWithTitle" class="form-label">Profile
											Picture</label> <input type="file" id="profile_picture"
											name="profile_picture" class="form-control"
											accept="image/png,image/jpeg" onchange="displayImage2(this)" />
									</div>
								</div>
								<div class="row p-4">
									<div class="col-md-6 mb-2">
										<img id="profileview" height="100px;" width="150px;" />
									</div>
								</div>

								<div class="row p-4">
									<h5>
										<b><u>Bank Details</u></b>
									</h5>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">Bank
											Name</label> <input type="text" id="BankName" name="BankName"
											class="form-control" placeholder="Bank Name" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">Bank
											Account No</label> <input type="text" id="BankAccountNo"
											name="BankAccountNo" class="form-control"
											placeholder="Bank Account No" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">IFSC
											Code</label> <input type="text" id="IFSCCode" name="IFSCCode"
											class="form-control" placeholder="IFSC Code" />
									</div>
									<!-- <div class="col-md-4 mb-2">
										<label for="nameWithTitle" class="form-label">EPF No</label> <input
											type="text" id="EPFNo" name="EPFNo" class="form-control"
											placeholder="EPF No" />
									</div>
									<div class="col-md-4 mb-2">
										<label for="esic_no" class="form-label">ESIC No</label> <input
											type="text" id="esic_no" name="esic_no" class="form-control"
											placeholder="ESIC No" />
									</div> -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-label-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Save
										changes</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			
			<!-- / Content -->
			<!-- Footer -->
			<jsp:include page="footer.jsp"></jsp:include>
			<!-- / Footer -->

			<div class="content-backdrop fade"></div>
		</div>
		<!-- Content wrapper -->
	</div>
	<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>

	<!-- Drag Target Area To SlideIn Menu On Small Screens -->
	<div class="drag-target"></div>
	<input type="hidden" id="sno" name="sno" value="0">
	<!-- / Layout wrapper -->

	<jsp:include page="js.jsp"></jsp:include>

	<script type="text/javascript">
		let companyCode = $("#company_code").val();
		let branchCode = $("#branch_id").val();
		let employee_id = $("#employee_id").val();

		$(function() {
			$("form[name='employee']").validate({
				rules : {
					FirstName : {
						required : true,
					},
					LastName : {
						required : true,
					},
					Email : {
						required : true,
					},
					FatherName : {
						required : true,
					},
					Address : {
						required : true,
					},
					gender : {
						required : true,
					},
					department : {
						required : true,
					},
					Designation : {
						required : true,
					},
					JoiningDate : {
						required : true,
					},
					salary : {
						required : true,
					},
					
					AadharNo : {
						required : true,
					},
					
					PANNo : {
						required : true,
					},
					aadharDocument : {
						required : true,
					},
					panDocument : {
						required : true,
					},
					BankName : {
						required : true,
					},
					BankAccountNo : {
						required : true,
					},
					IFSCCode : {
						required : true,
					},
					ContactNo : {
						required : true,
					},
					profile_picture : {
						required : true,
					},
					grade : {
						required : true,
					}
					
				},
				messages : {
					FirstName : {
						required : "Please enter first name.",
					},
					LastName : {
						required : "Please enter last name.",
					},
				
					Email : {
						required : "Please enter email.",
					},
					FatherName : {
						required : "Please enter father name.",
					},
					Address : {
						required : "Please enter address.",
					},
					grade : {
						required : "Please enter grade.",
					},
					
					department : {
						required : "Please enter department.",
					},
					Designation : {
						required : "Please enter designation.",
					},
					JoiningDate : {
						required : "Please enter joining date.",
					},
					salary : {
						required : "Please enter salary.",
					},
					
					AadharNo : {
						required : "Please enter aadhar no.",
					},
					PANNo : {
						required : "Please enter pan no.",
					},
					aadharDocument : {
						required : "Please upload aadhar image.",
					},
					panDocument : {
						required : "Please enter pan document.",
					},
					BankName : {
						required : "Please enter bank name.",
					},
					BankAccountNo : {
						required : "Please enter account number.",
					},
					IFSCCode : {
						required : "Please enter ifsc code.",
					},
					
					profile_picture : {
						required : "Please upload profile picture.",
					},
					ContactNo : {
						required : "Please upload profile picture.",
					}
					
				},
				submitHandler : function(form) {
					var ContactNo = $("#ContactNo").val();
					var FirstName = $("#FirstName").val();
					var LastName = $("#LastName").val();
					var esic_no = $("#esic_no").val();
					var Email = $("#Email").val();
					var FatherName = $("#FatherName").val();
					var Address = $("#Address").val();
					var gender = $("#gender").val();
					var department = $("#department").val();
					var Designation = $("#Designation").val();
					var JoiningDate = $("#JoiningDate").val();
					var salary = $("#salary").val();
					var grade = $("#grade").val();
					var AadharNo = $("#AadharNo").val();
					var PANNo = $("#PANNo").val();
					var aadharDocument = $("#aadharDocument")[0].files[0];
					var panDocument = $("#panDocument")[0].files[0];
					var profile_picture = $("#profile_picture")[0].files[0];
					var BankName = $("#BankName").val();
					var BankAccountNo = $("#BankAccountNo").val();
					var IFSCCode = $("#IFSCCode").val();

					var obj = {};
					obj.first_name=  FirstName;
					obj.last_name=  LastName;
					obj.email=  Email;
					obj.grade=  grade;
					obj.contact_number=  ContactNo;
					obj.father_name=  FatherName;
					obj.address=  Address;
					obj.gender=  gender;
					obj.department_id=  department;
					obj.designation_id=  Designation;
					obj.joining_date=  JoiningDate;
					obj.salary_package=  salary;
					obj.adhar_number=  AadharNo;
					obj.pan_number=  PANNo;
					obj.bank_name=  BankName;
					obj.account_number=  BankAccountNo;
					obj.ifsc_code=  IFSCCode;
					obj.employeeSalary=  []; 
					obj.employeeSalary.push({

						"employee_id" : employee_id,
						"basic_annual_package" : salary,
						"total_salary" : salary
					});
					var fd = new FormData();
					fd.append("adhar_document", aadharDocument);
					fd.append("pan_document", panDocument);
					fd.append("profile_picture", profile_picture);
					fd.append("employee", JSON.stringify(obj));
					$.ajax({
						url : 'addEmployee',
						type : 'post',
						data : fd,
						contentType : false,
						processData : false,
						success : function(data) {

							if (data['status'] == 'Success') {
								$("form[name='employee']").trigger("reset");
								Swal.fire({
									icon : 'success',
									title : 'successfully!',
									text : data['message']
								})
								setTimeout(function() {
									 window.location.href = "view_employee";
								  }, 3000);

							} else if (data['status'] == 'Already_Exist') {
								Swal.fire({
									icon : 'warning',
									title : 'Already!',
									text : data['message']
								})
							} else {
								Swal.fire({
									icon : 'Sorry',
									title : 'Invalid!',
									text : data['message']
								})
							}
						}
					});
				}
			});
		});

		function VerifyPassword(userpassword) {
			const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@@$!%*?&])[A-Za-z\d@@$!%*?&]{8,}$/;
			var password = userpassword; // Replace with the password you want to test

			if (passwordPattern.test(password)) {
				return true;
			} else {
				return false;
			}
		}
		function VerifyPhoneNumber(userphone) {
			const passwordPattern = /^(?:(?:\+|0{0,2})91(\s*|[\-])?|[0]?)?([6789]\d{2}([ -]?)\d{3}([ -]?)\d{4})$/;
			var password = userphone; // Replace with the password you want to test

			if (passwordPattern.test(password)) {
				return true;
			} else {
				return false;
			}
		}

		function VerifySalary(usersalary) {
			const passwordPattern = /^(?!0+(?:\.0+)?$)[0-9]+(?:\.[0-9]+)?$/;
			var password = usersalary; // Replace with the password you want to test

			if (passwordPattern.test(password)) {
				return true;
			} else {
				return false;
			}
		}

		function displayImage(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('aadharview').src = e.target.result;
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		function displayImage1(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('panview').src = e.target.result;
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		function displayImage2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('profileview').src = e.target.result;
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
var depart = [];
		$("#department")
				.change(
						function() {
							var department = $(this).val();
							var fd = new FormData();
							fd.append("sno", department);
							fd.append("company_code", companyCode);
							fd.append("branch_id", branchCode);

							$
									.ajax({
										async : false,
										url : 'get_department_designation',
										type : 'post',
										data : fd,
										contentType : false,
										processData : false,
										success : function(data) {
											if (data['status'] == 'Already_Exist') {
												if (data["message"] == "Email") {
													$("#Email").val(" ");
												}
												$("#messagebox").html(
														data["message"]);
												$("#messagebox").css("display",
														"block");

											} else if (data['status'] == 'Success') {
												
												depart = data['data'];
												
												$("#Designation").empty();
												$("#Designation")
														.append(
																"<option value=''>--select designation--</option");
												for (var i = 0; i < data['data'].length; i++) {
													$("#Designation")
															.append(
																	"<option value='"+data['data'][i].sno+"'>"
																			+ data['data'][i].designation_name
																			+ "</option>");
												}
											

											} else {
												$("#Designation")
														.append(
																"<option value=''>--select designation--</option");
												$("#Designation").empty();
											}
										}
									});
						});
		
		$("#Designation").change(function () {
			var sno = $("#Designation").val();
			var filteredData = depart.filter(item => item.sno == sno);
 			$("#grade").val(filteredData[0].grade); 
		});
	</script>
</body>
</html>

