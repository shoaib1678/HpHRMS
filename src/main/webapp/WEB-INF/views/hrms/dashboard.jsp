<!DOCTYPE html>

<%@page import="com.hp.model.LoginCredentials"%>
<%@page import="com.hp.model.Designation"%>
<%@page import="com.hp.model.EmployeeDetails"%>
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

<title>Dashboard</title>

<meta name="description" content="" />



<jsp:include page="css.jsp"></jsp:include>
<jsp:include page="calendercss.jsp"></jsp:include>

<style type="text/css">
#myChart {
	height: 200px !important;
	width: 200px !important;
}
.card{
    border-bottom: 4px solid #0d3562;
        transition: all .3s;
    }
.card:hover{
        box-shadow: 0px 9px 20px 0 rgba(67, 89, 113, 0.12);
        transform: translatey(-5px);
   }
  /*  .dt-buttons, .dataTables_filter{
   	display: none;
   } */
   #rejected_table_wrapper .dt-buttons, #approved_table_wrapper .dt-buttons, #approved_table_filter, #rejected_table_filter, #atttable_info{
   	display: none;
   }
   
</style>
</head>
<body>
<%
int d=0;
int dg=0;
int em=0;
	List<EmployeeDetails> empd = (List<EmployeeDetails>) request.getAttribute("employeeDetails");
	if(empd != null){
		em = empd.size();
	}
	List<Designation> designation = (List<Designation>) request.getAttribute("designation");
	if(designation != null){
		dg = designation.size();
	}
	List<Department> departments = (List<Department>) request.getAttribute("departments");
	if(departments != null){
		d = departments.size();
	}
	LoginCredentials lo = (LoginCredentials)session.getAttribute("login_data");
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
						<div class="row">
							<!--/ Overview & Sales Activity -->
							<div class="row">
							<%if(lo.getUser_type().equalsIgnoreCase("Admin")){ %>
								<div class="col-sm-6 col-md-3 col-lg-4 mb-6  mb-4">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-4">
													<div class="">
														<img src="assets/img/officer.png" alt="cube"
															class="rounded"
															style="height: 140px; width: 150px; margin-top: -7px; margin-left: -10px;" />
													</div>
												</div>
												<div class="col-md-8">
													<span class="fw-semibold d-block mb-1"
														style="text-align: center; margin-top: 20px;">Total
														Departments</span>
													<h4 class="card-title mb-2"
														style="margin-top: 15px; text-align: center;"><%= d %></h4>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-3 col-lg-4 mb-6  mb-4">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-4">
													<div class="">
														<img src="assets/img/tender.png" alt="cube"
															class="rounded"
															style="height: 140px; width: 150px; margin-top: -7px; margin-left: -24px;" />
													</div>
												</div>
												<div class="col-md-8">
													<span class="fw-semibold d-block mb-1"
														style="text-align: center; margin-top: 20px;">Total
														Designation</span>
													<h4 class="card-title mb-2"
														style="margin-top: 15px; text-align: center;"><%= dg %></h4>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-3 col-lg-4 mb-6 mb-4">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-4">
													<div class="">
														<img src="assets/img/emp.png" alt="cube" class="rounded"
															style="height: 140px; width: 150px; margin-top: -7px; margin-left: -24px;" />
													</div>
												</div>
												<div class="col-md-8">
													<span class="fw-semibold d-block mb-1"
														style="text-align: center; margin-top: 20px;">Total
														Employees</span>
													<h4 class="card-title mb-2"
														style="margin-top: 15px; text-align: center;"
														id="totalemp"><%= em%></h4>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-3 col-lg-4 mb-6 mb-4">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<label style="font-weight: bold;">Select Employee</label>
												<select class="form-control" id="empId" name="empId">
													<option Selected disabled>--Select Employee--</option>
													<%if(empd != null){
														for(EmployeeDetails e: empd){%>
														<option value="<%=e.getSno()%>"><%=e.getFirst_name()+" "+e.getLast_name()%></option>
													<%}} %>
												</select>
											</div>
										</div>
									</div>
								</div>
								
								<%} %>
								<div class="col-sm-12 col-md-12 col-lg-12 mb-12 mb-4">
									<div class="card">
										<div class="card-body">
											<div class="row">
											<h5>Working Hours</h5>
												<table class="table table-striped table-bordered"
													id="atttable">
													<thead class="bg-primary text-white">
														<tr>
															<th class="text-center text-white">NO</th>
															<th class="text-center text-white">Name</th>
															<th class="text-center text-white">Attendance Date</th>
															<th class="text-center text-white">Clock In</th>
															<th class="text-center text-white">Clock Out</th>
															<th class="text-center text-white">Total worked hours</th>
														</tr>
													</thead>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-6 mb-6 mb-4">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<h5>Leaves Remaining</h5>
												<table class="table table-striped table-bordered"
													id="leaveTable">
													<thead class="bg-primary text-white">
														<tr>
															<th class="text-center text-white">Leave Name</th>
															<th class="text-center text-white">Total Leave</th>
															<th class="text-center text-white">Remaining Leave</th>
														</tr>
													</thead>
													<tbody></tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-6 mb-6 mb-4">
									<div class="card">
										<div class="card-body">
											<div class="row">
											<h5>Rejected Leaves</h5>
												<table class="table table-striped table-bordered"
													id="rejected_table">
													<thead class="bg-primary text-white">
														<tr>
															<th class="text-center text-white">Leave Name</th>
															<th class="text-center text-white">Rejected Leave</th>
															<th class="text-center text-white">Rejected Date</th>
														</tr>
													</thead>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-6 mb-6 mb-4">
									<div class="card">
										<div class="card-body">
											<div class="wrapper">
												<div class="row">
													<div class="col-3">
														<div style="display: flex;justify-content: space-evenly;">
															<p style="height: 15px;width: 15px; background: green;"></p>
															<p style="margin-top: -3px;">Full Day</p>
														</div>
													</div>
													<div class="col-3">
														<div style="display: flex;justify-content: space-evenly;">
															<p style="height: 15px;width: 15px; background: yellow;"></p>
															<p style="margin-top: -3px;">Half Day</p>
														</div>
													</div>
													<div class="col-3">
														<div style="display: flex;justify-content: space-evenly;">
															<p style="height: 15px;width: 15px; background: gray;"></p>
															<p style="margin-top: -3px;">Holiday</p>
														</div>
													</div>
													<div class="col-3">
														<div style="display: flex;justify-content: space-evenly;">
															<p style="height: 15px;width: 15px; background: red;"></p>
															<p style="margin-top: -3px;">Absent</p>
														</div>
													</div>
												</div>
												<div class="container-calendar">
													<h3 id="monthAndYear"></h3>
						
													<div class="button-container-calendar">
														<button id="previous" onclick="previous()">&#8249;</button>
														<button id="next" onclick="next()">&#8250;</button>
													</div>
						
													<table class="table-calendar" id="calendar" data-lang="en">
														<thead id="thead-month"></thead>
														<tbody id="calendar-body"></tbody>
													</table>
						
													<div class="footer-container-calendar">
														<label for="month">Jump To: </label> <select id="month"
															onchange="jump()">
															<option value=0>Jan</option>
															<option value=1>Feb</option>
															<option value=2>Mar</option>
															<option value=3>Apr</option>
															<option value=4>May</option>
															<option value=5>Jun</option>
															<option value=6>Jul</option>
															<option value=7>Aug</option>
															<option value=8>Sep</option>
															<option value=9>Oct</option>
															<option value=10>Nov</option>
															<option value=11>Dec</option>
														</select> <select id="year" onchange="jump()"></select>
													</div>
						
												</div>
						
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-6 mb-6 mb-4">
									<div class="card">
										<div class="card-body">
											<div class="row">
											<h5>Approved Leaves</h5>
												<table class="table table-striped table-bordered"
													id="approved_table">
													<thead class="bg-primary text-white">
														<tr>
															<th class="text-center text-white">Leave Name</th>
															<th class="text-center text-white">Approved Leave</th>
															<th class="text-center text-white">Approved Date</th>
														</tr>
													</thead>
												</table>
											</div>
										</div>
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
	<jsp:include page="js.jsp"></jsp:include>
	<jsp:include page="calenderjs.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script type="text/javascript">

let user_type = $("#user_type").val();
let employee_id = $("#employee_id").val();
$("#empId").change(function(){
	employee_id = $(this).val();
	empdata();
	
})
function empdata(){
	var today = new Date();
	var currentMonth = today.getMonth(); // 0-based
	var currentYear = today.getFullYear();
	if (currentMonth === 11) {
        currentMonth = 0;
        currentYear += 1;
    } else {
        currentMonth += 1;
    }
	 var mm = parseInt(currentMonth);
	 getcalanderdata(mm,currentYear);
	 viewWorkingH(mm,currentYear);
	getRemainingLeave();
	rejectedtable();
	approvedtable();
	earnLeave();
}
if(parseInt(employee_id) > 0){
	var today = new Date();
	var currentMonth = today.getMonth(); // 0-based
	var currentYear = today.getFullYear();
	if (currentMonth === 11) {
        currentMonth = 0;
        currentYear += 1;
    } else {
        currentMonth += 1;
    }
	 var mm = parseInt(currentMonth);
	 getcalanderdata(mm,currentYear);
	 viewWorkingH(mm,currentYear);
	getRemainingLeave();
	rejectedtable();
	approvedtable();
	earnLeave();
}
function next() {
    currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
    currentMonth = (currentMonth + 1) % 12;
    var mm = parseInt(currentMonth) +1;
    getcalanderdata(mm, currentYear);
    showCalendar(currentMonth, currentYear);
}

function previous() {
    currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
    currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
    var mm = parseInt(currentMonth) +1;
    getcalanderdata(mm, currentYear);
    showCalendar(currentMonth, currentYear);
}

function jump() {
    currentYear = parseInt(selectYear.value);
    currentMonth = parseInt(selectMonth.value);
    var mm = parseInt(currentMonth) +1;
    getcalanderdata(mm, currentYear);
    showCalendar(currentMonth, currentYear);
}

function service_popup(){
	
	$('#CompanyServicesForm').modal('toggle');
}

function AddNewRow(){
	var count = $('#responserowpane > li').length;
	var i = parseInt(count);
	var name = $("#name" + count).val();
	var group = $("#group" + count).val();
	var department = $("#department" + count).val();
	var html = '';
	if (name != null && name != ""
			&& group != null && group != ""
				&& department != null && department != "") {
		html += '<li id="rowss'+i+'">';
		html += '<div class="row">';
		html += '<input type="hidden" id="sno'+(i+1)+'" value="0">';
		html += '<div class="col-md-5"> <input placeholder="Product Name" type="text" class="form-control req-field" id="name'+(i+1)+'"  required="" ></div>';
		html += '<div class="col-md-3"> <input placeholder="Product Group" type="text" class="form-control req-field" id="group'+(i+1)+'" required="" " ></div>';
		html += ' <div class="col-md-3"> <select class="form-select req-field" id="department'+(i+1)+'" required=""></select></div>';
		html += '</div>';
		html += '</li>';
		$('#responserowpane').append(html);
		var iddata = "department" + (i+1);
		console.log(select1);
		var select1 = document.getElementById("department1");
		var select2 = document.getElementById(iddata);
		select2.innerHTML = select1.innerHTML;
	} else {
		alert("Please Enter name, group or department.");
	}
}

function earnLeave(){
    const today = new Date();
    const currentDay = today.getDate();

    if (currentDay >= 1 && currentDay <= 10) {

    	var formData = new FormData();
    	formData.append("employee_id", employee_id);

    	$.ajax({
    	    url: "earn_leave", // Replace with your actual API
    	    type: "POST",
    	    data: formData,
    	    processData: false,
    	    contentType: false,
            success: function (response) {
                console.log('Success:', response);
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
            }
        });

    } else {
        console.log("API not called – today is after the 10th");
    }
}
function getRemainingLeave(){
var formData = new FormData();
formData.append("employee_id", employee_id);

$.ajax({
    url: "get_remaining", // Replace with your actual API
    type: "POST",
    data: formData,
    processData: false,
    contentType: false,
    success: function (data) {
        if (data['status'] === "Success") {
            var tbody = $("#leaveTable tbody");
            tbody.empty();

            $.each(data.data, function (index, item) {
                var row = "<tr>" +
                    "<td class='text-center'>" + item.leave_name + "</td>" +
                    "<td class='text-center'>" + item.total_leaves + "</td>" +
                    "<td class='text-center'>" + item.remaining_leave + "</td>" +
                    "</tr>";
                tbody.append(row);
            });
        } else {
            alert("No leave data found.");
        }
    },
    error: function (err) {
        console.error("Error:", err);
        alert("Failed to fetch leave data.");
    }
});
}

function approvedtable() {
	 if ($.fn.DataTable.isDataTable("#approved_table")) {
	        $('#approved_table').DataTable().clear().destroy();
	    }
	$("#approved_table")
			.DataTable(
					{
						dom : "Blfrtip",
						destroy : false,
						autoWidth : true,
						responsive : true,
						lengthChange : false,
						ordering : false,
						scrollX : false,
						ajax : {
							url : "get_leave_approval",
							type : "POST",
							data : {
								"employee_id" : employee_id,
								"status" : "Approved"
							}
						},
						columnDefs : [ {
							"defaultContent" : "-",
							"targets" : "_all"
						} ],
						serverSide : true,
						columns : [
								{
									"data" : "leave_name"
								},
								{
									"data" : "leave_days"
								},
								{
									"data" : "date"
								},

						],
						"lengthMenu" : [ [ 5, 10, 25, 50 ],
								[ 5, 10, 25, 50 ] ],
						select : true
					});
}
function rejectedtable() {
	 if ($.fn.DataTable.isDataTable("#rejected_table")) {
	        $('#rejected_table').DataTable().clear().destroy();
	    }
	$("#rejected_table")
			.DataTable(
					{
						dom : "Blfrtip",
						destroy : false,
						autoWidth : true,
						responsive : true,
						lengthChange : false,
						ordering : false,
						scrollX : false,
						ajax : {
							url : "get_leave_approval",
							type : "POST",
							data : {
								"employee_id" : employee_id,
								"status" : "Rejected"
							}
						},
						columnDefs : [ {
							"defaultContent" : "-",
							"targets" : "_all"
						} ],
						serverSide : true,
						columns : [
								{
									"data" : "leave_name"
								},
								{
									"data" : "leave_days"
								},
								{
									"data" : "date"
								},

						],
						"lengthMenu" : [ [ 5, 10, 25, 50 ],
								[ 5, 10, 25, 50 ] ],
						select : true
					});
}
function getcalanderdata(month, year) {
    var fd = new FormData();
    fd.append("emp_id", employee_id);
    fd.append("month", month);
    fd.append("year", year);

    $.ajax({
        url: 'getEmployeeAttendance',
        type: 'post',
        data: fd,
        contentType: false,
        processData: false,
        success: function (data) {
            // 🧹 Clear previous calendar styles
            $('[data-date]').css({ 'background': '', 'color': '' });

            if (data.status === 'Success') {
                if (data.data && data.data.length) {
                    for (var i = 0; i < data.data.length; i++) {
                        var d = data.data[i].attendance_date.split("-");
                        d[2] = d[2].startsWith("0") ? d[2][1] : d[2];
                        d[1] = d[1].startsWith("0") ? d[1][1] : d[1];

                        var selector = '[data-date="' + d[2] + '"][data-month="' + d[1] + '"][data-year="' + d[0] + '"]';
                        const targetElement = $(selector);

                        if (targetElement.length) {
                            const type = data.data[i].attendance_type;
                            const reason = data.data[i].reason;

                            if (type == "1" && reason == "-") {
                                targetElement.css({ 'background': 'green', 'color': 'white' });
                            } else if (type == "0.5") {
                                targetElement.css({ 'background': 'yellow', 'color': 'white' });
                            } else if (type == "0") {
                                targetElement.css({ 'background': 'red', 'color': 'white' });
                            } else {
                                targetElement.css({ 'background': 'gray', 'color': 'white' });
                            }
                        }
                    }
                } else {
                    console.warn('No attendance data found.');
                }
            } else {
                console.error('Failed to retrieve attendance data. Status:', data.status);
            }
        },
        error: function (xhr, status, error) {
            console.error('Error occurred during the AJAX request:', error);
        }
    });
}

function viewWorkingH(month, year) {
	 if ($.fn.DataTable.isDataTable("#atttable")) {
	        $('#atttable').DataTable().clear().destroy();
	    }
	$("#atttable")
	.DataTable(
			{
				dom : "Blfrtip",
				destroy : false,
				autoWidth : true,
				responsive : true,
				buttons : [ {
					extend : 'pdf',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4,5 ]
					}
				}, {
					extend : 'csv',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4,5 ]
					}

				}, {
					extend : 'print',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4,5 ]
					}

				}, {
					extend : 'excel',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4 ]
					}
				}, {
					extend : 'pageLength'
				} ],
				lengthChange : false,
				ordering : false,
				scrollX : false,
				ajax : {
					 url: "getAttendancefilter",
			            type: "POST",
			            data: {
			                emp_id: employee_id,
			                month: month,
			                year: year
			            }
				},
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all"
				} ],
				serverSide : true,
				columns : [
					{
			            data: 'SrNo',
			            render: function (data, type, row, meta) {
			                return meta.row + meta.settings._iDisplayStart + 1;
			            }
			        },
			        { data: "employee_name" },
			        {
			            data: function (data, type, dataToSet) {
			                var date = data.attendance_date;
			                var dateobj = new Date(date);
			                var formattedstring = dateobj.getFullYear() + "-"
			                    + String(dateobj.getMonth() + 1).padStart(2, '0') + "-"
			                    + String(dateobj.getDate()).padStart(2, '0');
			                return "<span id='category'>" + formattedstring + "</span>";
			            }
			        },
			        { data: "clock_in" },
			        { data: "clock_out" },
			        { data: "total_hours" }

				],
				"lengthMenu" : [ [ 5, 10, 25, 50 ],
						[ 5, 10, 25, 50 ] ],
				select : true
			});
}
</script>
</body>

</html>
