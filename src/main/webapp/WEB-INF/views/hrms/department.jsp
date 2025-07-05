
<!DOCTYPE html>

<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template-starter">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Department</title>

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
									<button class="btn btn-sm  add-new btn-primary" id="clear_btn"
										data-bs-toggle="modal" type="button"
										data-bs-target="#tenderform">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Add New Department</span></span>
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
		<div class="modal-dialog modal-lg "
			role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Add New Department</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="designation" id="designation">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row">
								<div class="col-12 col-lg-12 mb-3">
									<label class="form-label" for="department_name">Department
										Name<span class="mandatory">*</span>
									</label> <input type="text" class="form-control" id="department_name"
										placeholder=" " name="department_name" aria-label=" " />
								</div>
								<div class="col-12 col-lg-12">
									<table class="table table-bordered" id="stockentrytable">
										<thead class="bg-primary text-white">
											<tr>
												<th class="text-center text-white">NO</th>
												<th class="text-center text-white">Designation</th>
												<th class="text-center text-white">Grade</th>
											</tr>
										</thead>
										<tbody id="tbody">
											<tr>
												<td>
													<p id="sno1">1</p>
												</td>
												<td><input type="text" class="form-control"
													name="designation1" id="designation1"></td>
												<td><input type="text" class="form-control"
													name="grade1" id="grade1"></td>
											</tr>
										</tbody>
	
									</table>
									<div class="space-between">
	
										<div style="text-align: end;">
											<button type="button"
												class=" btn btn-primary btn-xs add bx bx-plus"
												onclick="addrow()" name="add"></button>
											<button type="button"
												class="btn btn-danger btn-xs remove1 bx bx-minus"></button>
										</div>
	
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

		function addrow() {
			var count = $('#tbody > tr').length;
			var i = parseInt(count) + 1;
			var quantity = $("#designation" + count).val();
			var item = $("#grade" + count).val();
			var html = '';
			if (quantity != null && quantity != "" && item != null
					&& item != "") {
				html += '<tr id="rowss'+i+'">';
				html += '<td><p>' + i + '</p></td>'
				html += '<td><input type="text" name="designation'+i+'" class="form-control "  id="designation'+i+'" /></td>';
				html += '<td><input type="text" name="grade'+ i+ '" class="form-control "  id="grade'+ i+ '"/></td>';
				html += '</tr>';
				$('#tbody').append(html);
			} else {
				alert("Please Enter Designation and Grade.");
			}
		}

		$(document).on('click', '.remove1', function() {
			var count = $('#tbody > tr').length;
			$('#tbody > tr:last').remove();
		});

		$(function() {
			$("form[name='designation']")
					.validate(
							{
								rules : {
									department_name : {
										required : true,
									}
								},
								messages : {
									department_name : {
										required : "Please enter department.",
									}
								},
								submitHandler : function(form) {
									var department_name = $("#department_name")
											.val();
									var totaldata2 = $('#tbody > tr').length;
									var totalrows2 = parseInt(totaldata2);
									var obj = {
										"department" : department_name,
										"employee_id" : employee_id,
										"designations" : []
									};
									for (var i = 1; i <= totalrows2; i++) {
										var str = "#designation" + i;
										var str1 = "#grade" + i;

										var designation = $(str).val();
										var grade = $(str1).val();
										obj.designations.push({
											'designation_name' : designation,
											'grade' : grade,
										});
									}
									$
											.ajax({
												url : 'add_department',
												type : 'post',
												data : JSON.stringify(obj),
												dataType : 'json',
												contentType : 'application/json',
												success : function(data) {
													$('#tenderform').modal(
															'toggle');
													$('#allownces_table')
															.DataTable().ajax
															.reload(null, false);
													if (data['status'] == 'Success') {
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
					url : "get_department",
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
					"data" : "department"
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
