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

<title>All Attendance</title>

<meta name="description" content="" />

<jsp:include page="css.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
						<div class="card col-md-12">

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
					</div>


				</div>
				<!-- Footer -->
					<jsp:include page="footer.jsp"></jsp:include>
				<!-- / Footer -->

			</div>
			<!-- / Content -->

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
	<%-- <jsp:include page="attendancepopup.jsp"></jsp:include> --%>
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
		let company_code = $("#company_code").val();
		let branch_id = $("#branch_id").val();
		let employee_id = $("#employee_id").val();
		let user_type = $("#user_type").val();

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
												var date = new Date(data.fromDate) ;
												var date1 = date.toDateString();
												return date1;
											}
										},
										{
											"data" : function(data, type,
													dataToSet) {
												var date = new Date(data.toDate) ;
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
												var emp_id = data.employee_id;
												var month_no = data.month_no;
												var year = data.year;
												var string = "<button type='button' class='btn  btn-xs btn-primary action'>Approve</button>";
												string += "&nbsp;&nbsp;<button type='button' class='btn btn-xs btn-primary action' >Reject</button>";
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


		 $(".action").change(function(){
			 var tax_regime = $(this).val();
			 var salary = $("#salary").val();
			 var gender = $("#gender").val();
			 var obj = {
					 "tax_id": tax_regime,
					 "company_code":companyCode,
					 "branch_id":branchCode,
					 "salary":salary
			 };
				 $.ajax({
				  		url : 'get_income_tax_amount',
				  		type : 'post',
				  		data : JSON.stringify(obj),
				  		dataTye : 'JSON',
				  		contentType :  'application/json',
				  		success : function(data) {
				  		 if(data['status'] == 'Success'){
							$("#income_tax").html(data['tax']);
				  		}
				  		}
				  	});
			});

	
	</script>
</body>
</html>

