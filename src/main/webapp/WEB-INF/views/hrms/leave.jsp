<!DOCTYPE html>

<%@page import="com.hp.model.Leaves"%>
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

<title>Apply Leaves</title>

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
	List<Leaves> leaves = (List<Leaves>) request.getAttribute("leaves");
	String user_type = (String) request.getAttribute("user_type");
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
					<%--    <div class="container-xxl flex-grow-1 container-p-y">
              <div class="card ">



 					<div class="row p-4" >
                    <div class="col-md-4 mb-0">
                                    <label for="employee" class="form-label">Select Employee</label>
                                    <select class="form-select change" id="employee" aria-label="employee" name="employee">
                                        <option selected value="">-- select employee --</option>
                                        <%  for (EmployeeDetails e : employeeDetails){ %>
                                        <option value="<%= e.getSno() %>"><%= e.getFirstName() %> <%= e.getLastName() %></option>
                                        <%} %>
                                    </select>
                      </div>
                    
                    </div>
               
               </div>
               </div> --%>

					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">

						<!-- Users List Table -->
						<div class="card ">
							<div class="row p-4">
								<div class="col-3">
									<button class="btn btn-secondary btn-sm  add-new btn-primary"
										tabindex="0" aria-controls="DataTables_Table_0"
										data-bs-toggle="modal" data-bs-target="#NewEmployeeForm">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Apply Leave</span></span>
									</button>
								</div>
							</div>
							<!--  <div class="row p-4" >
                     <div class="col-3"><button class="btn btn-secondary   add-new btn-primary" tabindex="0" aria-controls="DataTables_Table_0" data-bs-toggle="modal" data-bs-target="#NewEmployeeForm"><span><i class="bx bx-plus me-0 me-sm-1"></i><span class="d-none d-sm-inline-block">Add New User</span></span></button></div>
                  </div> -->


							<div class="row p-4">
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="emplyeedata_table" class="table nowrap"
											style="width: 100%">
											<thead class="bg-primary">
												<tr>
													<th class="text-white">Employee Name</th>
													<th class="text-white">Leave Type</th>
													<th class="text-white">Remaining Leave</th>
													<th class="text-white">Leave Requested</th>
													<th class="text-white">From Date</th>
													<th class="text-white">To Date</th>
													<th class="text-white">Status</th>

													<th class="text-white">Action</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>

						</div>
						<%-- <div class="modal fade" id="NewEmployeeForm"
							data-bs-backdrop="static" tabindex="-1">
							<form name="attendance" id="attendance">
								<div class="modal-dialog modal-xl modal-dialog-centered"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="modalCenterTitle">Apply
												Leave</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<div class="nav-align-top mb-4">
												
												<div class="tab-content">
													<div class="tab-pane fade active show"
														id="navs-pills-top-home" role="tabpanel">
														<div class="row g-2">
															<%
															if (!user_type.equals("Employee")) {
															%>
															<div class="col-md-4  mb-0">
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
															<%
															}
															%>
															<div class="col-md-4 mb-0">
																<label for="attendance_type" class="form-label">Leave
																	Type</label> <select id="leave_id" name="leave_id"
																	class="form-select">
																	<option value="">--select Leave type--</option>
																	<%
																	for (Leaves l : leaves) {
																	%>
																	<option value="<%=l.getSno()%>"><%=l.getLeaves_name()%></option>
																	<%
																	}
																	%>
																</select>
															</div>
															<div class="col-md-4  mb-0">
																<label for="attendance_date1" class="form-label">From
																	Date</label> <input type="date" id="from_date" name="from_date"
																	class="form-control" />
															</div>
															<div class="col-md-4 mb-0">
																<label for="attendance_date1" class="form-label">To
																	Date</label> <input type="date" id="to_date" name="to_date"
																	class="form-control" />
															</div>
															<div class="col-md-4 mb-0">
																<label for="reason" class="form-label">Reason </label> <input
																	type="text" id="reason" name="reason"
																	class="form-control" />
															</div>
														</div>

													</div>

												</div>
											</div>

										</div>
										<div class="modal-footer">
											<button type="reset" class="btn btn-label-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Save</button>
										</div>
									</div>
								</div>
							</form>
						</div> --%>

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
	<div class="modal fade" id="NewEmployeeForm" data-bs-backdrop="static"
		tabindex="-1">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Apply Leave</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="attendance" id="attendance">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row">
								<%
								if (!user_type.equals("Employee")) {
								%>
								<div class="col-md-6  mb-3">
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
								<%
								}
								%>
								<div class="col-md-6 mb-3">
									<label for="attendance_type" class="form-label">Leave
										Type</label> <select id="leave_id" name="leave_id" class="form-select">
										<option value="">--select Leave type--</option>
										<%
										for (Leaves l : leaves) {
										%>
										<option value="<%=l.getSno()%>"><%=l.getLeaves_name()%></option>
										<%
										}
										%>
									</select>
								</div>
								<div class="col-md-6  mb-3">
									<label for="attendance_date1" class="form-label">From
										Date</label> <input type="date" id="from_date" name="from_date"
										class="form-control" />
								</div>
								<div class="col-md-6 mb-">
									<label for="attendance_date1" class="form-label">To
										Date</label> <input type="date" id="to_date" name="to_date"
										class="form-control" />
								</div>
								<div class="col-md-6 mb-0">
									<label for="reason" class="form-label">Reason </label> <input
										type="text" id="reason" name="reason" class="form-control" />
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
	<%-- <jsp:include page="attendancepopup.jsp"></jsp:include> --%>
	<jsp:include page="remarks.jsp"></jsp:include>
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
		let leave_approval_right = $("#leave_approval").val();

		$(function() {
			$("form[name='attendance']")
					.validate(

							{
								rules : {
									employeeId : {
										required : true,
									},
									leave_id : {
										required : true,
									},
									from_date : {
										required : true,
									},
									to_date : {
										required : true,
									},
									reason : {
										required : true,
									}
								},

								messages : {

									employeeId : {
										required : "Please select employee",
									},
									leave_id : {
										required : "Please select  leave"
									},
									to_date : {
										required : "please select attendance date",
									},
									from_date : {
										required : "please select attendance date",
									},
									reason : {
										required : "please enter reason",
									}

								},

								submitHandler : function(form) {
									var employeeId = $("#employeeId").val();
									var leave_id = $("#leave_id").val();
									var to_date = $("#to_date").val();
									var from_date = $("#from_date").val();
									var reason = $("#reason").val();

									var obj = {};
									if (user_type == "Employee") {
										obj.employee_id = employee_id;
									} else {
										obj.employee_id = employeeId;
									}

									obj.leave_id = leave_id;
									obj.fromDate = from_date;
									obj.toDate = to_date;
									obj.reason = reason;
									$
											.ajax({
												url : 'leave_request',
												type : 'post',
												dataType : 'JSON',
												data : JSON.stringify(obj),
												contentType : "application/json",
												success : function(data) {
													if (data['status'] == 'Success') {
														$('#emplyeedata_table')
																.DataTable().ajax
																.reload(null,
																		false);
														$(
																'form[name="attendance"]')
																.trigger(
																		"reset");
														Swal
																.fire({
																	icon : 'success',
																	title : 'successfully!',
																	text : data['message']
																})
														$('#NewEmployeeForm')
																.modal('toggle');

													} else if (data['status'] == 'Already_Exist') {
														$('#NewEmployeeForm')
																.modal('toggle');
														$(
																'form[name="attendance"]')
																.trigger(
																		"reset");
														Swal
																.fire({
																	icon : 'warning',
																	title : 'Already!',
																	text : data['message']
																})
													} else if (data['status'] == 'Failed') {
														$('#NewEmployeeForm')
																.modal('toggle');
														$(
																'form[name="attendance"]')
																.trigger(
																		"reset");
														Swal
																.fire({
																	icon : 'error',
																	title : 'Invalid!',
																	text : data['message']
																})
													}
												}
											});
								}
							});

		});

		function table() {
			$("#emplyeedata_table")
					.DataTable(
							{
								dom : "Blfrtip",
								destroy : false,
								autoWidth : true,
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
									url : "get_leave_request",
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
											"data" : "employee_name"
										},
										{
											"data" : "leave_name"
										},
										{
											"data" : "remaining_leave"
										},
										{
											"data" : "leave_days"
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var date = new Date(
														data.fromDate);
												var date1 = date.toDateString();
												return date1;
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var date = new Date(
														data.fromDate);
												var date1 = date.toDateString();
												return date1;
											}
										},
										{
											"data" : "status"
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var sno = data.sno;
												var emp_id = data.employee_id;
												var month_no = data.month_no;
												var year = data.year;
												var status = data.status;
												var string = " ";
												if (user_type == 'Admin') {
													if (status == 'Pending') {
														string += "<button type='button' class='btn btn-xs btn-primary' onclick='leave_approval(\"yes\","
																+ sno
																+ ")'>Approve</button>";

														string += "&nbsp;&nbsp;<button type='button' class='btn btn-xs btn-primary'  onclick='leave_approval(\"no\","
																+ sno
																+ ")'>Reject</button>";
													}
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
		table();

		function leave_approval(status, sno) {
			$('#tenderform').modal('toggle');
			$("#val1").val(sno);
			$("#val2").val(status);
		}

		function hitting() {
			var remarks = $("#remarks").val();
			var sno = $("#val1").val();
			var status = $("#val2").val();
			var fd = new FormData();
			fd.append("status", status);
			fd.append("sno", sno);
			fd.append("remarks", remarks);
			$.ajax({

				url : 'leave_approval',
				type : 'post',
				data : fd,
				contentType : false,
				processData : false,
				success : function(data) {
					if (data['status'] == 'Success') {
						$('#emplyeedata_table').DataTable().ajax.reload(null,
								false);
						Swal.fire({
							icon : 'success',
							title : 'successfully!',
							text : data['message']
						})

					} else if (data['status'] == 'Already_Exist') {

						Swal.fire({
							icon : 'warning',
							title : 'Already!',
							text : data['message']
						})
					} else if (data['status'] == 'Failed') {
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

