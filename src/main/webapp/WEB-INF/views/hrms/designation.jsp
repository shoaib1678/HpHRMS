
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

<title>Designation</title>

<meta name="description" content="" />
<jsp:include page="css.jsp"></jsp:include>
<style type="text/css">
.modal-xxl {
	--bs-modal-width: 95vw !important;
}

input {
	text-transform: uppercase;
}

.btn-close {
	right: 20px !important;
	top: 1.5rem !important;
}
</style>

</head>

<body>
	<%
	List<Department> departments = (List<Department>) request.getAttribute("department");
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

						<!-- Tender List Table -->
						<div class="card ">

							<div class="row p-4 pb-0">
								<div class="col-3">
									<button class="btn btn-sm btn-secondary add-new btn-primary"
										id="clear_btn" data-bs-toggle="modal" type="button"
										data-bs-target="#tenderform">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Add New Designation</span></span>
									</button>
								</div>
							</div>




							<div class="row p-4">
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="allownces_table" class="table nowrap"
											style="width: 100%">
											<thead class="bg-primary">
												<tr>
													<th class="text-white">Department Name</th>
													<th class="text-white">Designation Name</th>
													<th class="text-white">Grade</th>
													<th class="text-white">Status</th>
												</tr>
											</thead>
										</table>
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

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>

	<!-- Drag Target Area To SlideIn Menu On Small Screens -->
	<div class="drag-target"></div>
	<!-- / Layout wrapper -->
	<div class="modal fade" id="tenderform" data-bs-backdrop="static"
		tabindex="-1">
		<div class="modal-dialog modal-md "
			role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Add New Designation</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="designation" id="designation">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row">
								<div class="col-12 mb-3">
									<label for="department" class="form-label">Department</label> <select
										id="department" name="department" class="form-control">
										<option value="" selected>--select designation--</option>
										<%
										for (Department d : departments) {
										%>
										<option value="<%=d.getSno()%>"><%=d.getDepartment()%></option>
										<%
										}
										%>
									</select>
								</div>
								<div class="col-12 col-lg-12">
									<label class="form-label" for="department_name">Designation
										Name<span class="mandatory">*</span>
									</label> <input type="text" class="form-control" id="designation_name"
										placeholder=" " name="designation_name" aria-label=" " />
								</div>

							</div>
						</div>
					</div>
					<div class="modal-footer" style="border-top: 1px solid lightgray;">
						<div class="col-md-12">
							<div class=" " style="float: right; margin-top: 1rem;">
								<button type="button" class="btn btn-secondary btn-sm"
									data-bs-dismiss="modal" aria-label="Close">Close</button>
								<button type="submit" class="btn btn-primary btn-sm">Save
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<input type="hidden" id="sno" name="sno">
	<jsp:include page="js.jsp"></jsp:include>
	<script type="text/javascript">
		let employee_id = $("#employee_id").val();

		$(function() {
			$("form[name='designation']")
					.validate(
							{
								rules : {
									designation_name : {
										required : true,
									},
									department : {
										required : true,
									}
								},
								messages : {
									designation_name : {
										required : "Please enter designation.",
									},
									department : {
										required : "Please enter department.",
									}
								},
								submitHandler : function(form) {
									var designation_name = $(
											"#designation_name").val();
									var department = $("#department").val();
									var obj = {
										"designation_name" : designation_name,
										"department_id" : department,
										"employee_id" : employee_id
									};
									$
											.ajax({
												url : 'add_designation',
												type : 'post',
												data : JSON.stringify(obj),
												dataType : 'json',
												contentType : 'application/json',
												success : function(data) {

													if (data['status'] == 'Success') {

														Swal
																.fire({
																	icon : 'success',
																	title : 'successfully!',
																	text : data['message']
																})
														$('#tenderform').modal(
																'toggle');
														$('#allownces_table')
																.DataTable().ajax
																.reload(null,
																		false);
													} else if (data['status'] == 'Already_Exist') {
														$('#tenderform').modal(
																'toggle');
														Swal
																.fire({
																	icon : 'warning',
																	title : 'Already!',
																	text : data['message']
																})
													} else {
														$('#tenderform').modal(
																'toggle');
														Swal
																.fire({
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

		function data() {
			$("#allownces_table").DataTable({
				dom : "Blfrtip",
				autoWidth : true,
				responsive : true,
				buttons : [ {
					extend : 'pdf',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4 ]
					}
				}, {
					extend : 'csv',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4 ]
					}

				}, {
					extend : 'print',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4 ]
					}

				}, {
					extend : 'excel',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4 ]
					}
				}, {
					extend : 'pageLength'
				} ],
				lengthChange : true,
				ordering : false,
				ajax : {
					url : "get_designation",
					type : "POST",
					"data" : {
						"employee_id" : employee_id
					}

				},
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all"
				} ],
				serverSide : true,
				columns : [ {
					"data" : "employee_name"
				}, {
					"data" : "designation_name"
				}, {
					"data" : "grade"
				}, {
					"data" : "status"
				} ],
				"lengthMenu" : [ [ 5, 10, 25, 50 ], [ 5, 10, 25, 50 ] ],
				select : true
			});
		}
		data();
	</script>
</body>
</html>
