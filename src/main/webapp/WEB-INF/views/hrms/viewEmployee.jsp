<!DOCTYPE html>

<%@page import="com.hp.model.EmployeeDetails"%>
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
.doc_img {
	height: 350px;
	cursor: pointer;
}

.carousel-indicators [data-bs-target] {
	background-color: #184375;
}

#image-popup {
	position: fixed;
	top: 0px;
	left: 0;
	background-color: rgba(0, 0, 0, 0.8);
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	display: none;
	cursor: zoom-out;
	z-index: 9999;
}

#image-popup span {
	display: inline-block;
	position: fixed;
	top: 10px;
	color: #fff;
	right: 10px;
	font-weight: 600;
	/* height: 10px; */
	cursor: pointer;
	font-size: 50px;
}

#image-popup img {
	cursor: auto !important;
	animation: zoom 1s;
	transform: scalex(1.2);
	width: 60%;
    height: 100%;
}

@keyframes zoom { 
	0%{
		transform: scale(0);
	}
	100%{
		transform:scalex(1.2);
	}
}

.card-container {
	background-color: #231E39;
	border-radius: 5px;
	box-shadow: 0px 10px 20px -10px rgba(0,0,0,0.75);
	color: #B3B8CD;
	padding-top: 30px;
	position: relative;
	width: 350px;
	max-width: 100%;
	text-align: center;
}

.card-container .pro {
	color: #231E39;
	background-color: #FEBB0B;
	border-radius: 3px;
	font-size: 14px;
	font-weight: bold;
	padding: 3px 7px;
	position: absolute;
	top: 30px;
	left: 30px;
}

.card-container .round {
	border: 1px solid #03BFCB;
	border-radius: 50%;
	padding: 7px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<%
List<EmployeeDetails> data = (List<EmployeeDetails>)request.getAttribute("data");
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
							<div class="row p-4">
								<%if(data.size() > 0){ 
									for(EmployeeDetails e : data){%>
									<div class="col-md-3">
										<div class="card-container">
											<img class="round" src="displaydocument?url=<%=e.getProfile_picture()%>" alt="user" style="width: 120px;height: 120px;object-fit: cover;"/>
											<h3><%=e.getFirst_name()+" "+e.getLast_name() %></h3>
											<h6><%=e.getDesignation_name()%></h6>
											<p><%=e.getAddress() %></p>
											<div class="buttons" style="padding-bottom: 25px;">
												<button class="btn btn-info btn-sm" onclick="openPopup(<%=e.getSno()%>)"> <i class="fa-solid fa-eye me-0 me-sm-1"></i>
													View
												</button>
												<%if(e.getStatus().equalsIgnoreCase("Active")){ %>
												<button class="btn btn-danger btn-sm" onclick="updatestatus(<%=e.getSno()%>,'Deactive')">
													Deactive
												</button>
												<%}else{ %>
													<button class="btn btn-success btn-sm" onclick="updatestatus(<%=e.getSno()%>,'Active')">Active</button>
												<%} %>
											</div>
										</div>
									</div>
								<%}} %>
							</div>
							<!-- <div class="row p-4">
								<h4>Employee Data</h4>
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="emplyeedata_table" class="table nowrap"
											style="width: 100%">
											<thead class="bg-primary">
												<tr>
													<th class="text-white">Employee Id</th>
													<th class="text-white">Employee Name</th>
													<th class="text-white">Email</th>
													<th class="text-white">password</th>
													<th class="text-white">Father Name</th>
													<th class="text-white">Salary</th>
													<th class="text-white">Contact</th>
													<th class="text-white">Address</th>
													<th class="text-white">Bank Name</th>
													<th class="text-white">Account no.</th>
													<th class="text-white">Ifsc no.</th>
													<th class="text-white">epf no.</th>
													<th class="text-white">Profile Image</th>
													<th class="text-white">Aadhar Image</th>
													<th class="text-white">Pan Image</th>
													<th class="text-white">Action</th>
											</thead>


										</table>
									</div>
								</div>
							</div> -->

						</div>
						<div class="modal fade" id="NewEmployeeForm"
							data-bs-backdrop="static" tabindex="-1">
							<div class="modal-dialog modal-xl modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="modalCenterTitle">Employee
											Data</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">

										<div class="nav-align-top">
											<ul class="nav nav-pills mb-3" role="tablist">
												<li class="nav-item" role="presentation">
													<button type="button" class="nav-link active" role="tab"
														data-bs-toggle="tab" data-bs-target="#navs-pills-top-home"
														aria-controls="navs-pills-top-home" aria-selected="false"
														tabindex="-1">Employee Info</button>
												</li>
												<li class="nav-item" role="presentation">
													<button type="button" class="nav-link" role="tab"
														data-bs-toggle="tab"
														data-bs-target="#navs-pills-top-messages"
														aria-controls="navs-pills-top-messages"
														aria-selected="true">Employee Documents</button>
												</li>
												<!-- <li class="nav-item" role="presentation">
														<button type="button" class="nav-link" role="tab"
															data-bs-toggle="tab"
															data-bs-target="#navs-pills-top-profile"
															aria-controls="navs-pills-top-profile"
															aria-selected="false" tabindex="-1">Personal
															Info</button>
													</li> -->
												<li class="nav-item" role="presentation">
													<button type="button" class="nav-link" role="tab"
														data-bs-toggle="tab"
														data-bs-target="#navs-pills-top-banking"
														aria-controls="navs-pills-top-banking"
														aria-selected="true">Salary and Banking</button>
												</li>

											</ul>
											<div class="tab-content">
												<div class="tab-pane fade active show"
													id="navs-pills-top-home" role="tabpanel">
													<div class="row g-2">
														<div class="col-md-4 mb-0">
															<div class="card mb-4 shadow-none ">
																<div class="card-body py-0">
																	<div class="user-avatar-section">
																		<div class="d-flex align-items-center flex-column">
																			<img class="img-fluid rounded mb-4"
																				id="profile_picture" height="110" width="110"
																				alt="User avatar" />
																			<div class="user-info text-center">
																				<h4 class="mb-2" id="employee_name"></h4>
																				<span class="badge bg-label-secondary"
																					id="designation"></span>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<div class="col-md-4 mb-0">
															<div class="info-container">
																<ul class="list-unstyled">
																	<li class="mb-3"><span class="fw-bold me-2">Username:</span>
																		<span id="username">sumit</span></li>
																	<li class="mb-3"><span class="fw-bold me-2">Email:</span>
																		<span id="email">sumit@lms</span></li>
																	<li class="mb-3"><span class="fw-bold me-2">Password:</span>
																		<span id="password">*******</span></li>
																	<!-- <li class="mb-3"><span class="fw-bold me-2">Status:</span>
																			<span class="badge bg-label-success">Active</span></li> -->
																	<li class="mb-3"><span class="fw-bold me-2">Role:</span>
																		<span id="role">developer</span></li>
																	<li class="mb-3"><span class="fw-bold me-2">Joining
																			Date :</span> <span id="joining_date">April 2023</span></li>

																</ul>
															</div>
														</div>
														<div class="col-md-4 mb-0">
															<div class="info-container">
																<ul class="list-unstyled">

																	<li class="mb-3"><span class="fw-bold me-2">Father
																			Name :</span> <span id="father_name">______________</span></li>
																	<li class="mb-3"><span class="fw-bold me-2">Contact:</span>
																		<span id="contact">(123) 456-7890</span></li>
																	<li class="mb-3"><span class="fw-bold me-2">Languages:</span>
																		<span id="language">French</span></li>
																	<li class="mb-3"><span class="fw-bold me-2">Location:</span>
																		<span id="location">Palwal</span></li>
																</ul>
															</div>
														</div>
													</div>


												</div>
												<div class="tab-pane fade" id="navs-pills-top-messages"
													role="tabpanel">
													<div class="row g-2 justify-content-center">
														<div class="col-md-7 mb-0">
															<div class="card shadow-none ">
																<div class="card-body ">
																	<div id="carouselExample" class="carousel slide"
																		data-bs-ride="carousel">
																		<!-- <ol class="carousel-indicators">
																			<li data-bs-target="#carouselExample"
																				data-bs-slide-to="0" class="active"></li>
																			<li data-bs-target="#carouselExample"
																				data-bs-slide-to="1"></li>
																			<li data-bs-target="#carouselExample"
																				data-bs-slide-to="2"></li>
																		</ol> -->
																		<div class="carousel-inner" id="image_carousal">

																		</div>
																		<a class="carousel-control-prev"
																			href="#carouselExample" role="button"
																			data-bs-slide="prev"> <span
																			class="carousel-control-prev-icon" aria-hidden="true"></span>
																			<span class="visually-hidden">Previous</span>
																		</a> <a class="carousel-control-next"
																			href="#carouselExample" role="button"
																			data-bs-slide="next"> <span
																			class="carousel-control-next-icon" aria-hidden="true"></span>
																			<span class="visually-hidden">Next</span>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												
												<!-- <div class="tab-pane fade" id="navs-pills-top-profile"
														role="tabpanel">
														<div class="row g-2">
															<div class="col mb-0">
																<label for="nameWithTitle" class="form-label">Father
																	Name</label> <input type="text" id="FatherName"
																	name="FatherName" class="form-control"
																	placeholder="Father Name" />
															</div>
															<div class="col mb-0">
																<label for="nameWithTitle" class="form-label">Address</label>
																<input type="text" id="Address" name="Address"
																	class="form-control" placeholder="Address" />
															</div>
															<div class="col mb-0">
																<label for="nameWithTitle" class="form-label">Contact
																	Number</label> <input type="text" id="ContactNo"
																	name="ContactNo" class="form-control"
																	placeholder="Contact Number"
																	onblur="varifyEmpDetails()" />
															</div>
															<div class="col mb-0">
																<label for="employeeType" class="form-label">Employee
																	Type</label> <select id="employeeType" name="employeeType"
																	class="form-control">
																	<option value="" selected>--Select--</option>
																	<option value="Site Employee">Site Employee</option>
																	<option value="Office Employee">Office
																		Employee</option>
																</select>
															</div>
														</div>
													</div> -->

												<div class="tab-pane fade" id="navs-pills-top-banking"
													role="tabpanel">
													<div class="row g-2">
														<div class="col mb-0">
															<h6>Salary</h6>
															<span id="salary">200000</span>
														</div>
														<div class="col mb-0">
															<h6>Bank Name</h6>
															<span id="bank_name">__</span>
														</div>
														<div class="col mb-0">
															<h6>IFSC No.</h6>
															<span id="ifsc_code">___</span>
														</div>
														<div class="col mb-0">
															<h6>EPF No.</h6>
															<span id="epf_no">___</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-label-secondary"
											data-bs-dismiss="modal">Close</button>
										<!-- <button type="button" onclick="saveEmployee()"
												class="btn btn-primary">Save changes</button> -->
									</div>
								</div>
							</div>
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
	<div id="image-popup">
													<span id="close-btn">&times;</span>
													<img src="" alt="documents" id="popup-img">                        
												</div>
	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>

	<!-- Drag Target Area To SlideIn Menu On Small Screens -->
	<div class="drag-target"></div>
	</div>
	<input type="hidden" id="sno" name="sno" value="0">
	<!-- / Layout wrapper -->

	<jsp:include page="js.jsp"></jsp:include>

	<script type="text/javascript">
		let employee_id = $("#employee_id").val();
		let user_type = $("#user_type").val();

		function table() {
			$("#emplyeedata_table")
					.DataTable(
							{
								dom : "Blfrtip",
								destroy : false,
								autoWidth : false,
								responsive : true,
								buttons : [
										{
											extend : 'pdf',
											exportOptions : {
												columns : [ 0, 1, 2, 3, 4, 5,
														6, 7, 8, 9, 10, 11, 12,
														13, 14, 15, 16 ]
											}
										},
										{
											extend : 'csv',
											exportOptions : {
												columns : [ 0, 1, 2, 3, 4, 5,
														6, 7, 8, 9, 10, 11, 12,
														13, 14, 15, 16 ]
											}

										},
										{
											extend : 'print',
											exportOptions : {
												columns : [ 0, 1, 2, 3, 4, 5,
														6, 7, 8, 9, 10, 11, 12,
														13, 14, 15, 16 ]
											}

										},
										{
											extend : 'excel',
											exportOptions : {
												columns : [ 0, 1, 2, 3, 4, 5,
														6, 7, 8, 9, 10, 11, 12,
														13, 14, 15, 16 ]
											}
										}, {
											extend : 'pageLength'
										} ],
								lengthChange : false,
								ordering : false,
								scrollX : false,
								ajax : {
									url : "getEmployee",
									type : "POST",
									data : {
										"employee_id" : employee_id,
										"user_type" : user_type
									}
								},
								columnDefs : [ {
									"defaultContent" : "-",
									"targets" : "_all"
								} ],
								serverSide : true,
								columns : [
										{
											"data" : "employee_id"
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var fname = data.first_name;
												var lname = data.last_name;
												var name = fname + " " + lname;
												var string = "<span id='category'>"
														+ name + "</span>"
												return string;
											}
										},
										{
											"data" : "email"
										},
										{
											"data" : "password"
										},
										{
											"data" : "father_name"
										},
										{
											"data" : "salary_package"
										},
										{
											"data" : "contact_number"
										},
										{
											"data" : "address"
										},
										{
											"data" : "bank_name"
										},
										{
											"data" : "account_number"
										},
										{
											"data" : "ifsc_code"
										},
										{
											"data" : "epf_no"
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var imageName = data.profile_picture;
												return '<a href="displaydocument?url='
														+ imageName
														+ '" download="'
														+ imageName
														+ '"><img src="displaydocument?url='
														+ imageName
														+ '" width="60" height="50"/></a>';
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var imageName = data.adhar_document;
												return '<a href="displaydocument?url='
														+ imageName
														+ '" download="'
														+ imageName
														+ '"><img src="displaydocument?url='
														+ imageName
														+ '" width="60" height="50"/></a>';
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var imageName = data.pan_document;
												return '<a href="displaydocument?url='
														+ imageName
														+ '" download="'
														+ imageName
														+ '"><img src="displaydocument?url='
														+ imageName
														+ '" width="60" height="50"/></a>';
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var sno = data.sno;
												var string = '<button class="btn btn-secondary btn-xs   add-new btn-primary" onclick="openPopup('
														+ sno
														+ ')"> <span><i class="fa-solid fa-eye me-0 me-sm-1"></i><span class="d-none d-sm-inline-block fs-6">View</span></span> 	</button>';
												return string;
											}
										}

								],
								"lengthMenu" : [ [ 5, 10, 25, 50 ],
										[ 5, 10, 25, 50 ] ],
								select : true
							});
		}
		table();

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

		function varifyEmpDetails() {
			var Email = $("#Email").val();
			var ContactNo = $("#ContactNo").val();
			var AadharNo = $("#AadharNo").val();
			var PANNo = $("#PANNo").val();
			var sno = $("#sno").val();
			var fd = new FormData();
			fd.append("Email", Email);
			fd.append("ContactNo", ContactNo);
			fd.append("AadharNo", AadharNo);
			fd.append("PANNo", PANNo);
			if (sno == 0) {
				$.ajax({
					url : 'varifyEmployeeDetails',
					type : 'post',
					data : fd,
					contentType : false,
					processData : false,
					success : function(data) {
						if (data['status'] == 'Already_Exist') {
							if (data["message"] == "Email") {
								$("#Email").val(" ");
							}
							$("#messagebox").html(data["message"]);
							$("#messagebox").css("display", "block");
							//$('#messagebox1').addClass('display', "none");

						} else if (data['status'] == 'Success') {
							$("#messagebox").css("display", "none");
						}
					}
				});
			}

		}

		function openPopup(sno) {
			$('#NewEmployeeForm').modal('toggle');
			var obj = {
				"sno" : sno
			};
			$.ajax({
				async : false,
				url : 'get_employeedata',
				type : 'post',
				data : JSON.stringify(obj),
				dataTye : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					if (data['status'] == 'Success') {
						var data1 = data['data'];
						var data3 = data['data2'];
						var documents = data['documents'];
						$("#employee_name").html(data1.first_name + " "+data1.last_name);
						$("#designation").html(data3.designation_name);
						$("#profile_picture").attr(
								"src",
								'displaydocument?url=' + data1.profile_picture
										+ '');
						$("#username").html(
								data1.first_name + " " + data1.last_name);
						$("#email").html(data1.email);
						$("#password").html(data1.password);
						$("#role").html(data3.designation_name);
						$("#joining_date").html(data1.joining_date);
						$("#father_name").html(data1.father_name);
						$("#contact").html(data1.contact_number);
						$("#language").html("English");
						$("#location").html(data1.address);
						$("#bank_name").html(data1.bank_name);
						$("#ifsc_code").html(data1.ifsc_code);
						$("#epf_no").html(data1.epf_no);
						$("#salary").html(data1.salary_package);
						for (var i = 0; i < documents.length; i++) {
							var id = 'item';
							if (i == 0) {
								var newDiv = $('<div></div>');
								newDiv.addClass('carousel-item active');
								var newImg = $('<img onclick="hello(this)">');
								newImg.addClass('doc_img d-block w-100');
								newImg.attr('src', 'displaydocument?url='
										+ documents[i] + '');
								newDiv.append(newImg);
								$("#image_carousal").append(newDiv);
							} else {
								var newDiv = $('<div></div>');
								newDiv.addClass('carousel-item');
								var newImg = $('<img onclick="hello(this)">');
								newImg.addClass('d-block w-100');
								newImg.attr('src', 'displaydocument?url='
										+ documents[i] + '');
								newDiv.append(newImg);
								$("#image_carousal").append(newDiv);
							}
						}
					} else {
						$("#income_tax").html(data['tax']);
					}
				}
			});
		}
	
	function hello(e){
		  $('#image-popup').css("display", "flex");
		      $('#popup-img').attr('src', e.src);
		
	}
	
			    $('#image-popup, #close-btn').click(function () {
			      $('#image-popup').hide();
			    });

	</script>
</body>
</html>

