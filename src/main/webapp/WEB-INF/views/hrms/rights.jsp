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

<title>All Rights</title>

<meta name="description" content="" />
<jsp:include page="css.jsp"></jsp:include>
<style type="text/css">
.modal-xxl {
	--bs-modal-width: 95vw !important;
}

input {
	text-transform: uppercase;
}
</style>

</head>

<body>

	<%
	List<EmployeeDetails> data = (List<EmployeeDetails>) request.getAttribute("employeeDetails");
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
									<button class="btn btn-secondary add-new btn-primary"
										id="clear_btn" data-bs-toggle="modal" type="button"
										data-bs-target="#rightsform">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Add Rights Detail</span></span>
									</button>
								</div>
							</div>
							<div class="row p-4">
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="rightsTable" class="table nowrap "
											style="width: 100%">
											<thead class="bg-primary">
												<tr>
													<th class="text-white">Sr.No</th>
													<th class="text-white">Employee name</th>
													<th class="text-white">Department</th>
													<th class="text-white">Designation</th>
													<th class="text-white">Leaves</th>
													<th class="text-white">Add Employee</th>
													<th class="text-white">View Employee</th>
													<th class="text-white">Add Attendance</th>
													<th class="text-white">View Leaves</th>
													<th class="text-white">Action</th>

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
	 <div class="modal fade" id="rightsform" data-bs-backdrop="static"
		tabindex="-1">
		<div class="modal-dialog modal-md "
			role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Employee Rights</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="rightsform" id="rightsform">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row">
										<div class="col-12 col-lg-12 mb-3">
											<label class="form-label" for="department_name">Employee
												<span class="mandatory">*</span>
											</label> <select class="form-control" id="employee_code"
												name="employee_code" aria-label=" ">
												<option value="">Select Employee</option>
												<%
												for (EmployeeDetails e : data) {
												%>
												<option
													value="<%= e.getSno() %>"><%=e.getFirst_name() +" "+ e.getLast_name()%></option>
												<%
												}
												%>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-check form-switch mb-2">
												<input class="form-check-input empRights organization mt-2"
													type="checkbox" id="organization" value="on"
													name="organization"> <label
													class="form-check-label fs-4" for="organization"><b
													style="font-weight: 600!important;">Organization</b></label>
											</div>
											<div class="form-check form-switch mb-2">
												<input class="form-check-input empRights organization"
													type="checkbox" id="department" value="on"
													name="department"> <label class="form-check-label"
													for="department">Department</label>
											</div>
											<div class="form-check form-switch mb-2">
												<input class="form-check-input empRights organization"
													type="checkbox" id="designation" value="on"
													name="designation"> <label class="form-check-label"
													for="designation">Designation</label>
											</div>
											<div class="form-check form-switch mb-2">
												<input class="form-check-input empRights organization"
													type="checkbox" id="leaves" value="on" name="leaves">
												<label class="form-check-label" for="leaves">Leaves</label>
											</div>
											<div class="form-check form-switch mb-2">
												<input class="form-check-input empRights organization"
													type="checkbox" id="addEmployee" value="on"
													name="addEmployee"> <label class="form-check-label"
													for="addEmployee">Add Employee</label>
											</div>
											<div class="form-check form-switch mb-2 organization">
												<input class="form-check-input empRights organization"
													type="checkbox" id="viewEmployee" value="on"
													name="viewEmployee"> <label
													class="form-check-label" for="viewEmployee">View
													Employee</label>
											</div>
										</div>

										<div class="col-md-6">
											<h4>Attendance</h4>
											<div class="form-check form-switch mb-2">
												<input class="form-check-input empRights" type="checkbox"
													id="attendance_approval" value="on"
													name="attendance_approval"> <label
													class="form-check-label" for="attendance_approval">Attendance
													Approval</label>
											</div>
											<div class="form-check form-switch mb-2">
												<input class="form-check-input empRights" type="checkbox"
													id="attendance_srearch" value="on"
													name="attendance_srearch"> <label
													class="form-check-label" for="attendance_srearch">Attendance
													Search</label>
											</div>
											<div class="form-check form-switch mb-2">
												<input class="form-check-input empRights" type="checkbox"
													id="leave_approval" value="on" name="leave_approval">
												<label class="form-check-label" for="leave_approval">Leave
													Approval</label>
											</div>


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
	<input type="hidden" id="sno" name="sno" value="0">
	<jsp:include page="js.jsp"></jsp:include>
	<script type="text/javascript">
		let employee_id = $("#employee_id").val();
		let user_type = $("#user_type").val();

		function data() {
			$("#rightsTable")
					.DataTable(
							{
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
									url : "get_rights",
									type : "POST",
								},
								columnDefs : [ {
									"defaultContent" : "-",
									"targets" : "_all"
								} ],
								serverSide : true,
								columns : [
										{
											data : 'SrNo',
											render : function(data, type, row,
													meta) {
												return meta.row
														+ meta.settings._iDisplayStart
														+ 1;
											}
										},
										{
											"data" : "emp_name"
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var block = data.department;
												var sno = data.sno;
												var string = "off";
												if (block != null
														&& block != "") {
													string = "on";
												} else {
													return string;
												}
												return string;
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var text = data.designation;
												var sno = data.sno;
												var string = "off";
												if (text != null && text != "") {
													string = "on";
												} else {
													return string;
												}
												return string;
											}
										},
										
										{
											"data" : function(data, type,
													dataToSet) {
												var text = data.leaves;
												var sno = data.sno;
												var string = "off";
												if (text != null && text != "") {
													string = "on";
												} else {
													return string;
												}
												return string;
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var text = data.addEmployee;
												var sno = data.sno;
												var string = "off";
												if (text != null && text != "") {
													string = "on";
												} else {
													return string;
												}
												return string;
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var text = data.viewEmployee;
												var sno = data.sno;
												var string = "off";
												if (text != null && text != "") {
													string = "on";
												} else {
													return string;
												}
												return string;
											}
										},
										
										{
											"data" : function(data, type,
													dataToSet) {
												var text = data.attendance;
												var sno = data.sno;
												var string = "off";
												if (text != null && text != "") {
													string = "on";
												} else {
													return string;
												}
												return string;
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var text = data.viewleaves;
												var sno = data.sno;
												var string = "off";
												if (text != null && text != "") {
													string = "on";
												} else {
													return string;
												}
												return string;
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var sno = data.sno;
												var string = "<button class='btn btn-secondary add-new btn-primary btn-xs' type='button'  onclick='edit("
														+ sno
														+ ")'>Edit</button>";
												return string;
											}
										}

								],
								"lengthMenu" : [ [ 5, 10, 25, -1 ],
										[ 5, 10, 25, "All" ] ],
								select : true
							});
		}
		data();

		$(function() {
			$("form[name='rightsform']")
					.validate(
							{
								rules : {
									employee_code : {
										required : true,
									},

								},
								messages : {
									employee_code : {
										required : "Please select employee",
									},
								},

								submitHandler : function(form) {
									var sno = $("#sno").val();
									var employee_code = $("#employee_code").val();
									var employee_code = $("#employee_code").val();

									var department = "";
									if ($('#department').is(":checked")) {
										department = "department";
									}
									var designation = "";
									if ($('#designation').is(":checked")) {
										designation = "designation";
									}
									var leaves = "";
									if ($('#leaves').is(":checked")) {
										leaves = "leaves";
									}
									var addEmployee = "";
									if ($('#addEmployee').is(":checked")) {
										addEmployee = "addEmployee";
									}
									var viewEmployee = "";
									if ($('#viewEmployee').is(":checked")) {
										viewEmployee = "viewEmployee";
									}
									var attendance_approval = "";
									if ($('#attendance_approval')
											.is(":checked")) {
										attendance_approval = "attendance_approval";
									}

									var attendance_srearch = "";
									if ($('#attendance_srearch').is(":checked")) {
										attendance_srearch = "attendance_srearch";
									}
									var leave_approval = "";
									if ($('#leave_approval').is(":checked")) {
										leave_approval = "leave_approval";
									}

									var obj = {
										"employee_id" : employee_id,
										"employee_code" : employee_code,
										"sno" : sno,
										"department" : department,	
										"designation" : designation,
										"leaves" : leaves,
										"addEmployee" : addEmployee,
										"viewEmployee" : viewEmployee,
										"attendance_approval" : attendance_approval,
										"leave_approval" : leave_approval,
										"attendance_srearch" : attendance_srearch,
									};
									$
											.ajax({
												url : 'add_rights',
												type : 'post',
												data : JSON.stringify(obj),
												dataType : 'json',
												contentType : 'application/json',
												success : function(data) {
													if (data['status'] == 'Success') {
														$('#rightsTable')
																.DataTable().ajax
																.reload(null,
																		false);
														Swal
																.fire({
																	icon : 'success',
																	title : 'successfully!',
																	text : data['message']
																})
														$('#rightsform').modal(
																'toggle');

													} else if (data['status'] == 'Already_Exist') {
														$('#rightsform').modal(
																'toggle');
														Swal
																.fire({
																	icon : 'warning',
																	title : 'Already!',
																	text : data['message']
																})
													} else if (data['status'] == 'Failed') {
														$('#rightsform').modal(
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

		function edit(i) {
			$("input[type='checkbox']").attr("checked", false)
			$("#sno").val(i);
			var fd = new FormData();
			fd.append("sno", i);
			$
					.ajax({
						url : 'edit_rights',
						type : 'post',
						data : fd,
						contentType : false,
						processData : false,
						success : function(data) {
							if (data['status'] == 'Success') {
								$('#rightsform').modal('toggle');
								$("#department_name > option")
										.each(
												function() {
													if (this.value == data['data'].department_id
															+ "--"
															+ data['data'].roles) {
														$(this).prop(
																"selected",
																"selected");
													}
												});
								if (data['data'].department == "department") {
									$("#department").attr("checked", true)
								}
								if (data['data'].designation == "designation") {
									$("#designation").attr("checked", true)
								}
								if (data['data'].designation == "designation") {
									$("#designation").attr("checked", true)
								}
								if (data['data'].leaves == "leaves") {
									$("#leaves").attr("checked", true)
								}
								if (data['data'].addEmployee == "addEmployee") {
									$("#addEmployee").attr("checked", true)
								}
								if (data['data'].viewEmployee == "viewEmployee") {
									$("#viewEmployee").attr("checked", true)
								}
								if (data['data'].attendance == "attendance") {
									$("#attendance").attr("checked", true)
								}
								if (data['data'].viewleaves == "viewleaves") {
									$("#viewleaves").attr("checked", true)
								}
							} else {
								alert("no");
							}
						}
					});

		}

		$("#organization").click(function() {
			if ($('#organization').prop("checked")) {
				$('.organization').prop("checked", true);
			} else {
				$('.organization').prop("checked", false);
			}
		});

		$("#clear_btn")
				.click(
						function() {
							$("#rolesId > option").prop("selected", false);
							$("input[type='checkbox']").attr("checked", false)
							$(
									"input[type='text'], input[type='hidden'],input[type='number']")
									.val("");
						});
	</script>
</body>
</html>
