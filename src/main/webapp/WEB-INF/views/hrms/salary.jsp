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

<title>Attendance</title>

<meta name="description" content="" />

<jsp:include page="css.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
	<%
	List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) request.getAttribute("employeeDetails");
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
					<section>
						<div class="container-xxl flex-grow-1 container-p-y">
							<div class="card ">



								<div class="row p-4">
									<div class="col-md-4 mb-0">
										<label for="employee" class="form-label">Select
											Employee</label> <select class="form-select change" id="employee"
											aria-label="employee" name="employee">
											<option selected value="">-- select employee --</option>
											<%
											for (EmployeeDetails e : employeeDetails) {
											%>
											<option value="<%=e.getSno()%>"><%=e.getFirst_name()%>
												<%=e.getLast_name()%></option>
											<%
											}
											%>
										</select>
									</div>
									<div class="col-md-4 mb-0">
										<label for="attendance_date" class="form-label">From
											Date</label> <input type="date" id="attendance_date"
											name="attendance_date" class="form-control change"
											placeholder="DD / MM / YY" />
									</div>
									<div class="col-md-4 mb-0">
										<label for="attendance_date" class="form-label">To
											Date</label> <input type="date" id="to_date" name="to_date"
											class="form-control change" placeholder="DD / MM / YY" />
									</div>
								</div>

							</div>
						</div>

						<!-- Content -->
						<div class="container-xxl flex-grow-1 container-p-y">

							<!-- Users List Table -->
							<div class="card ">


								<div class="row p-4">
									<div class="col-12">
										<div class="card-datatable table-responsive">
											<table id="attendance" class="table nowrap"
												style="width: 100%">
												<thead class="bg-primary">
													<tr>
														<th class="text-white">Total Attendance</th>
														<th class="text-white">Month</th>
														<th class="text-white">Year</th>
														<th class="text-white">Employee Name</th>
														<th class="text-white">Total Days</th>
														<th class="text-white">Total Leaves</th>
														<th class="text-white">Monthly Salary</th>
														<!-- <th class="text-white">Travel Expense</th> 
														<th class="text-white">View Expense</th> 
														<th class="text-white">Month Total Income</th>  -->
														<th class="text-white">Status</th>
													</tr>
												</thead>


											</table>
										</div>
									</div>
								</div>

							</div>
							<div class="modal fade" id="NewEmployeeForm"
								data-bs-backdrop="static" tabindex="-1">
								<form name="attendance" id="attendance">
									<div class="modal-dialog modal-xl modal-dialog-centered"
										role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="modalCenterTitle">Employee
													Attendance</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">

												<div class="nav-align-top mb-4">
													<ul class="nav nav-pills mb-3" role="tablist">
														<li class="nav-item" role="presentation">
															<button type="button" class="nav-link active" role="tab"
																data-bs-toggle="tab"
																data-bs-target="#navs-pills-top-home"
																aria-controls="navs-pills-top-home"
																aria-selected="false" tabindex="-1">1. Add
																Attendance Info</button>
														</li>
													</ul>
													<div class="tab-content">
														<div class="tab-pane fade active show"
															id="navs-pills-top-home" role="tabpanel">
															<div class="row g-2">
																<div class="col mb-0">
																	<label for="employee_id" class="form-label">Select
																		Employee</label> <select id="employeeId" name="employeeId"
																		class="form-select">
																		<option value="">--select employee--</option>
																		<%
																		for (EmployeeDetails e : employeeDetails) {
																		%>
																		<option value="<%=e.getSno()%>"><%=e.getFirst_name()%>
																			<%=e.getLast_name()%></option>
																		<%
																		}
																		%>
																	</select>
																</div>
																<div class="col mb-0">
																	<label for="attendance_date1" class="form-label">Select
																		Date</label> <input type="date" id="attendance_date1"
																		name="attendance_date1" class="form-control" />
																</div>
															</div>
															<div class="row g-2">
																<div class="col-md-4 mb-0">
																	<label for="attendance_type" class="form-label">Attendance
																		Type</label> <select id="attendance_type"
																		name="attendance_type" class="form-select">
																		<option value="">--select attendance type--</option>
																		<option value="1">Full Day</option>
																		<option value="0.5">Half Day</option>
																		<option value="0">Absent Day</option>
																	</select>
																</div>
															</div>
														</div>

													</div>
												</div>

											</div>
											<div class="modal-footer">
												<button type="reset" class="btn btn-label-secondary"
													data-bs-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Save
													Attendance</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</section>
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
	<jsp:include page="attendancepopup.jsp"></jsp:include>
	<jsp:include page="js.jsp"></jsp:include>
	<link
		href="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.4/af-2.5.3/b-2.3.6/b-html5-2.3.6/b-print-2.3.6/cr-1.6.2/kt-2.8.2/r-2.4.1/sp-2.1.2/datatables.min.css"
		rel="stylesheet" />

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.4/af-2.5.3/b-2.3.6/b-html5-2.3.6/b-print-2.3.6/cr-1.6.2/kt-2.8.2/r-2.4.1/sp-2.1.2/datatables.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"
		integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>


	<script type="text/javascript">
		let employee_id = $("#employee_id").val();
		let user_type = $("#user_type").val();

		function table() {
			$("#attendance")
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
									url : "getAttendance",
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
								columns : [ {
									"data" : "total_attendance"
								}, {
									"data" : "month"
								}, {
									"data" : "year"
								}, {
									"data" : "employee_name"
								}, {
									"data" : "total_days"
								}, {
									"data" : "total_leaves"
								},{
									"data" : function(data, type,
											dataToSet) {
										var string = data.salary.toFixed(2);
										return string;
									}
								},  {
									"data" : "status"
								} ],
								"lengthMenu" : [ [ 5, 10, 25, 50 ],
										[ 5, 10, 25, 50 ] ],
								select : true
							});
		}
		table();

		function leaveData(id, month, year) {
			$('#tenderform').modal('toggle');
			$("#attendance1")
					.DataTable(
							{
								dom : "Blfrtip",
								destroy : true,
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
									url : "getAttendancefilter",
									type : "POST",
									"data" : {
										"emp_id" : id,
										"month" : month,
										"year" : year,
									},
								},
								columnDefs : [ {
									"defaultContent" : "-",
									"targets" : "_all"
								} ],
								serverSide : true,
								columns : [
										{
											"data" : "employee_name"
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var date = data.attendance_date;
												var dateobj = new Date(date);
												var formattedstring = dateobj
														.getFullYear()
														+ "-"
														+ (dateobj.getMonth() + 1)
														+ "-"
														+ dateobj.getDate();
												var string = "<span id='category'>"
														+ formattedstring
														+ "</span>"
												return string;
											}
										},
										{
											"data" : "status"
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var attendance_type = data.attendance_type;
												var reason = data.reason;

												if (attendance_type == 1) {
													var string = "<span id='category' style='padding:10px; color:white; background-color:green;border-radius: 12px;'><b>FULL DAY</b></span>"
												}
												if (attendance_type == 0.5) {
													var string = "<span id='category' style='padding:10px; color:white; background-color:orange;border-radius: 12px;'><b>HALF DAY</b></span>"
												}
												if (attendance_type == 0) {
													var string = "<span id='category' style='padding:10px; color:white; background-color:red;border-radius: 12px;'><b>ABSENT</b></span>"
												}
												if (attendance_type == 1
														&& reason != '-') {
													var string = "<span id='category' style='padding:10px; color:white; background-color:grey;border-radius: 12px;'><b>"
															+ reason
															+ "</b></span>"
												}

												return string;
											}
										}

								],
								"lengthMenu" : [ [ 5, 10, 25, 50 ],
										[ 5, 10, 25, 50 ] ],
								select : true
							});
		}

		function pay_salary(emp_id, month, year) {
			var fd = new FormData();
			fd.append("emp_id", emp_id);
			fd.append("month", month);
			fd.append("year", year);
			$.ajax({
				url : 'pay_salary',
				type : 'post',
				data : fd,
				contentType : false,
				processData : false,
				success : function(data) {
					if (data['status'] == 'Success') {
						$('#attendance').DataTable().ajax.reload(null, false);
						Swal.fire({
							icon : 'success',
							title : 'successfully!',
							text : data['message']
						})

					} else if (data['status'] == 'Already_Exist') {
						$('#NewEmployeeForm').modal('toggle');
						Swal.fire({
							icon : 'warning',
							title : 'Already!',
							text : data['message']
						})
					} else if (data['status'] == 'Failed') {
						$('#NewEmployeeForm').modal('toggle');
						Swal.fire({
							icon : 'error',
							title : 'Invalid!',
							text : data['message']
						})
					}
				}
			});
		}
	</script>
</body>
</html>

