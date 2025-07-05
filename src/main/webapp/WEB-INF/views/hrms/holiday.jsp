<!DOCTYPE html>

<%@page import="com.hp.model.LoginCredentials"%>
<%@page import="java.util.List"%>
<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template-starter">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>All Holidays</title>

<meta name="description" content="" />

<jsp:include page="css.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
	<%
	LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
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
							<%
							if (loginData.getUser_type().equalsIgnoreCase("Admin")) {
							%>
							<div class="row p-4">
								<div class="col-3">
									<button class="btn btn-secondary   add-new btn-primary btn-sm"
										tabindex="0" aria-controls="DataTables_Table_0"
										data-bs-toggle="modal" data-bs-target="#NewEmployeeForm">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Add Holiday</span></span>
									</button>
								</div>
							</div>
							<%
							}
							%>

							<div class="row p-4">
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="emplyeedata_table" class="table nowrap"
											style="width: 100%">
											<thead class="bg-primary">
												<tr>
													<th class="text-white">Date</th>
													<th class="text-white">Occasion</th>
												</tr>
											</thead>


										</table>
									</div>
								</div>
							</div>

						</div>
						<div class="modal fade" id="NewEmployeeForm"
							data-bs-backdrop="static" tabindex="-1">
							<div class="modal-dialog modal-md " role="document">
								<div class="modal-content">
									<div class="modal-header"
										style="border-bottom: 1px solid lightgray;">
										<h6>Add Holiday</h6>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form name="attendance" id="attendance">
										<div class="modal-body">
											<div class="nav-align-top mb-4">

												<div class="row">
													<div class="col-md-12 mb-3">
														<label for="date" class="form-label">Select Date</label> <input
															type="date" id="date" name="date" class="form-control" />
													</div>

													<div class="col-md-12 mb-0">
														<label for="emailWithTitle" class="form-label">Occasion</label>
														<input type="text" id="occasion" name="occasion"
															class="form-control" placeholder="occasion" />
													</div>

												</div>
											</div>
										</div>
										<div class="modal-footer"
											style="border-top: 1px solid lightgray;">
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
	</div>
	<!-- / Layout wrapper -->

	<jsp:include page="js.jsp"></jsp:include>

	<script type="text/javascript">
		$(function() {
			$("form[name='attendance']")
					.validate(

							{
								rules : {
									date : {
										required : true,
									},
									occasion : {
										required : true,
									}
								},

								messages : {

									date : {
										required : "Please select date",
									},
									occasion : {
										required : "Please enter occasion"
									}

								},

								submitHandler : function(form) {
									var date = $("#date").val();
									var occasion = $("#occasion").val();
									var obj = {
										"holiday_date" : date,
										"occasion" : occasion

									};
									$
											.ajax({
												url : 'add_holiday',
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
														Swal
																.fire({
																	icon : 'warning',
																	title : 'Already!',
																	text : data['message']
																})
													} else if (data['status'] == 'Failed') {
														$('#NewEmployeeForm')
																.modal('toggle');
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
									url : "getHoliday",
									type : "POST",
								},
								columnDefs : [ {
									"defaultContent" : "-",
									"targets" : "_all"
								} ],
								serverSide : true,
								columns : [

										{
											"data" : function(data, type,
													dataToSet) {
												var date = data.holiday_date;
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
										}, {
											"data" : "occasion"
										}

								],
								"lengthMenu" : [ [ 5, 10, 25, 50 ],
										[ 5, 10, 25, 50 ] ],
								select : true
							});
		}
		table();
	</script>
</body>
</html>

