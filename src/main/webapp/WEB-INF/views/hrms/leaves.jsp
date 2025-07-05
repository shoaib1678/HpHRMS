
<!DOCTYPE html>

<%@page import="java.util.List"%>
<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template-starter">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Leaves</title>

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
											class="d-none d-sm-inline-block">Leave Detail</span></span>
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
													<th class="text-white">Leave</th>
													<th class="text-white">Total Leaves</th>
													<th class="text-white">Progressive Leave</th>
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
		<div class="modal-dialog modal-md " role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Manage Leaves</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="designation" id="designation">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row">
								<div class="col-12 mb-0">
									<label for="department" class="form-label">Leave</label> <input
										type="text" class="form-control" id="leave" placeholder=" "
										name="leave" aria-label=" " />
								</div>
								<div class="col-12 col-lg-12 mb-3">
									<label class="form-label" for="department_name">Total
										Leaves (Days)<span class="mandatory">*</span>
									</label> <input type="text" class="form-control" id="leave_count"
										placeholder=" " name="leave_count" aria-label=" " />
								</div>
								<div class="col-12 col-lg-12">
									<div class="form-check form-switch mb-2 pl-0">
										<h6 class="d-inline-block">Progressive Leave</h6>
										<input class="form-check-input" type="checkbox"
											id="progressive_leave" name="progressive_leave">

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
	<input type="hidden" id="sno" name="sno">
	<jsp:include page="js.jsp"></jsp:include>
	<script type="text/javascript">
		let employee_id = $("#employee_id").val();

		$(function() {
			$("form[name='designation']")
					.validate(
							{
								rules : {
									leave : {
										required : true,
									},
									leave_count : {
										required : true,
									}
								},
								messages : {
									leave : {
										required : "Please enter leave name.",
									},
									leave_count : {
										required : "Please enter count.",
									}
								},
								submitHandler : function(form) {
									var leave = $("#leave").val();
									var leave_count = $("#leave_count").val();
									var progressive_leave = $(
											'#progressive_leave')
											.is(":checked");

									var obj = {
										"leaves_name" : leave,
										"leaves_count" : leave_count,
										"progressive_leave" : progressive_leave,
										"employee_id" : employee_id
									};
									$
											.ajax({
												url : 'add_leaves',
												type : 'post',
												data : JSON.stringify(obj),
												dataType : 'json',
												contentType : 'application/json',
												success : function(data) {

													if (data['status'] == 'Success') {
														$('#tenderform').modal(
																'toggle');
														$('#allownces_table')
																.DataTable().ajax
																.reload(null,
																		false);
														Swal
																.fire({
																	icon : 'success',
																	title : 'successfully!',
																	text : data['message']
																})

													} else if (data['status'] == 'Already_Exist') {
														$('#tenderform').modal(
																'toggle');
														Swal
																.fire({
																	icon : 'warning',
																	title : 'Already!',
																	text : data['message']
																})
													} else if (data['status'] == 'Failed') {
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
					url : "get_leaves",
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
					"data" : "leaves_name"
				}, {
					"data" : "leaves_count"
				}, {
					"data" : "progressive_leave"
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
