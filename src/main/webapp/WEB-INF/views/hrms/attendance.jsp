<!DOCTYPE html>
<%@page import="com.hp.model.EmployeeDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<jsp:include page="calendercss.jsp"></jsp:include>
</head>

<body>
	<%
	List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) request.getAttribute("employeeDetails");
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
					<section>
						<div class="container-xxl flex-grow-1 container-p-y">
							<div class="card ">


								<h4 class=" m-0 mt-4 ms-4">Search Attendance</h4>
								<div class="row p-4">
									<div class="col-md-4 mb-0">
										<label for="employee" class="form-label">Select
											Employee</label> <select class="form-select change" id="employee"
											aria-label="employee" name="employee">
											<option selected disabled selected>-- select
												employee --</option>
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
									<%
									if (!user_type.equals("Employee")) {
									%>
									<div class="col-3">
										<button class="btn btn-secondary btn-sm  add-new btn-primary"
											tabindex="0" aria-controls="DataTables_Table_0"
											data-bs-toggle="modal" data-bs-target="#NewEmployeeForm">
											<span><i class="bx bx-plus me-0 me-sm-1"></i><span
												class="d-none d-sm-inline-block">Clock In</span></span>
										</button>
										<button
											class="btn btn-secondary btn-sm add-new btn-primary Aclock_out"
											type="button" data-bs-toggle="modal" data-bs-target="#clockout_modal">
											<span><i class="bx bx-plus me-0 me-sm-1"></i><span
												class="d-none d-sm-inline-block">Clock out</span></span>
										</button>
									</div>
									<%
									} else {
									%>
									<div class="col-3">
										<button
											class="btn btn-secondary btn-sm add-new btn-primary attendence"
											type="button">
											<span><i class="bx bx-plus me-0 me-sm-1"></i><span
												class="d-none d-sm-inline-block">Clock in</span></span>
										</button>
										<button
											class="btn btn-secondary btn-sm add-new btn-primary clock_out"
											type="button">
											<span><i class="bx bx-plus me-0 me-sm-1"></i><span
												class="d-none d-sm-inline-block">Clock out</span></span>
										</button>
									</div>
									<%
									}
									%>
								</div>


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
														<th class="text-white">Pay Status</th>
														<th class="text-white">Action</th>
													</tr>
												</thead>


											</table>
										</div>
									</div>
								</div>

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
	<div class="modal fade" id="NewEmployeeForm" data-bs-backdrop="static"
		tabindex="-1">
		<div class="modal-dialog modal-md " role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Add Employee Attendance</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="attendance" id="attendance">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row">
								<div class="col-12 mb-3">
									<label for="employee_id" class="form-label">Select
										Employee</label> <select id="employeeId" name="employeeId"
										class="form-select">
										<option disabled="disabled" selected="selected">--select
											employee--</option>
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
								<div class="col-12 mb-3">
									<label for="attendance_date1" class="form-label">Select
										Date</label> <input type="date" id="attendance_date1"
										name="attendance_date1" class="form-control" />
								</div>
								<div class="col-md-12 mb-0">
									<label for="attendance_type" class="form-label">Attendance
										Type</label> <select id="attendance_type" name="attendance_type"
										class="form-select">
										<option disabled="disabled" selected="selected">--select
											attendance type--</option>
										<option value="1">Full Day</option>
										<option value="0.5">Half Day</option>
										<option value="0">Absent Day</option>
									</select>
								</div>
								<div class="col-12 mb-3">
									<label for="in_time" class="form-label">Clock In</label> 
									<input type="time" id="in_time" name="in_time" class="form-control" />
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
	<div class="modal fade" id="clockout_modal" data-bs-backdrop="static"
		tabindex="-1">
		<div class="modal-dialog modal-md " role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Clock out Employee Attendance</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="clock_form" id="clock_form">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row">
								<div class="col-12 mb-3">
									<label for="cemployee_id" class="form-label">Select
										Employee</label> <select id="cemployeeId" name="cemployeeId"
										class="form-select">
										<option disabled="disabled" selected="selected">--select
											employee--</option>
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
								<div class="col-12 mb-3">
									<label for="attendance_date1" class="form-label">Select
										Date</label> <input type="date" id="cattendance_date1"
										name="cattendance_date1" class="form-control" />
								</div>
								<div class="col-12 mb-3">
									<label for="in_time" class="form-label">Clock Out</label> 
									<input type="time" id="out_time" name="out_time" class="form-control" />
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

	<div class="modal fade" id="tenderform" data-bs-backdrop="static"
		tabindex="-1">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
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
	</div>
	
	<div class="modal fade" id="att_modal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Attendance Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
					<div class="modal-body">
						<div class="row g-2">
							<div class="row g-2">
								<div class="col-md-12 mb-2">
									<div class="col-12 mb-0">
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
													<%if(user_type.equalsIgnoreCase("Admin")){%>
													<th class="text-center text-white">Action</th>
													<%} %>
												</tr>
											</thead>

										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="modal-footer">
					</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="updateAttendance" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: 1px solid lightgray;">
            <h6>Update Attendance</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
             <form name="zone_form" id="zone_form">
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row">
								 <div class="col-md-12 mb-3">
                                  		<label class="form-label" for="a_type">Attendance Type<span style="color: red;">*</span></label> 
                                  		<select class="form-control" id="a_type" name="a_type">
                                  			<option disabled selected>--Select Attendance Type--</option>
                                  			<option value="1">Full Day</option>
                                  			<option value="0.5">Half Day</option>
                                  			<option value="0">Absent</option>
                                  		</select>
                                  	
                                </div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="border-top: 1px solid lightgray;">
                	 <div class="col-md-12">
                          <div class=" " style="float: right; margin-top:1rem;" >
                               <button type="button"  class="btn btn-secondary btn-sm"  data-bs-dismiss="modal"  aria-label="Close">Close </button>
                               <button type="submit"  class="btn btn-primary btn-sm" >Save </button>
                          </div>
                      </div>
                </div>
                 </form>
            </div>
       
        </div>
    </div>
	
	<input type="hidden" id="emp_id" name="emp_id" value="0">
	<input type="hidden" id="latitude" name="latitude" value="0">
	<input type="hidden" id="longitude" name="longitude" value="0">
	<input type="hidden" id="sno" name="sno">
	<%-- <jsp:include page="attendancepopup.jsp"></jsp:include> --%>
	<jsp:include page="js.jsp"></jsp:include>
	<jsp:include page="calenderjs.jsp"></jsp:include>
	<script type="text/javascript">
		let employee_id = $("#employee_id").val();
		let user_type = $("#user_type").val();
		let attendance_approval = $("#attendance_approval").val();
		$('#NewEmployeeForm').on('shown.bs.modal', function () {
			 var now = new Date();
			    var hours = ('0' + now.getHours()).slice(-2);
			    var minutes = ('0' + now.getMinutes()).slice(-2);
			    var seconds = ('0' + now.getSeconds()).slice(-2);
			    var currentTime = hours + ':' + minutes + ':' + seconds;
			    $("#in_time").val(currentTime);
		});
		$('#clockout_modal').on('shown.bs.modal', function () {
			 var now = new Date();
			    var hours = ('0' + now.getHours()).slice(-2);
			    var minutes = ('0' + now.getMinutes()).slice(-2);
			    var seconds = ('0' + now.getSeconds()).slice(-2);
			    var currentTime = hours + ':' + minutes + ':' + seconds;
			    $("#out_time").val(currentTime);
		});
		
		
		getLocation();
		function getLocation() {
		    if (navigator.geolocation) {
		      navigator.geolocation.getCurrentPosition(function(position) {
		        // Set values into input fields
		        document.getElementById("latitude").value = position.coords.latitude;
		        document.getElementById("longitude").value = position.coords.longitude;
		      }, function(error) {
		        alert("Location access denied or failed.");
		        console.error(error);
		      });
		    } else {
		      alert("Geolocation is not supported by this browser.");
		    }
		  }
		
		function next() {
		    currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
		    currentMonth = (currentMonth + 1) % 12;
		    var mm = parseInt(currentMonth) +1;
		    getcalanderdata($("#emp_id").val(), mm, currentYear);
		    showCalendar(currentMonth, currentYear);
		}

		function previous() {
		    currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
		    currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
		    var mm = parseInt(currentMonth) +1;
		    getcalanderdata($("#emp_id").val(), mm, currentYear);
		    showCalendar(currentMonth, currentYear);
		}

		function jump() {
		    currentYear = parseInt(selectYear.value);
		    currentMonth = parseInt(selectMonth.value);
		    var mm = parseInt(currentMonth) +1;
		    getcalanderdata($("#emp_id").val(), mm, currentYear);
		    showCalendar(currentMonth, currentYear);
		}

		$(function () {
		    $("form[name='attendance']").validate({
		        rules: {
		            employeeId: {
		                required: true
		            },
		            attendance_date1: {
		                required: true
		            },
		            attendance_type: {
		                required: true
		            }
		        },

		        messages: {
		            employeeId: {
		                required: "Please select employee"
		            },
		            attendance_date1: {
		                required: "Please select date"
		            },
		            attendance_type: {
		                required: "Please select attendance type"
		            }
		        },

		        submitHandler: function (form) {
		            const employeeId = $("#employeeId").val();
		            const attendance_date = $("#attendance_date1").val();
		            const attendance_type = $("#attendance_type").val();
		            const in_time = $("#in_time").val();

		            const obj = {
		                attendance_date: attendance_date,
		                user_type: user_type,
		                clock_in: in_time,
		                attendance_type: attendance_type,
		                employee_id: user_type === "Employee" ? employee_id : employeeId
		            };

		            $.ajax({
		                url: 'add_attendance',
		                type: 'POST',
		                dataType: 'json',
		                data: JSON.stringify(obj),
		                contentType: "application/json",
		                success: function (data) {
		                    $("form[name='attendance']").trigger("reset");
		                    $('#NewEmployeeForm').modal('toggle');

		                    if (data.status === 'Success') {
		                        $('#attendance').DataTable().ajax.reload(null, false);
		                        Swal.fire({
		                            icon: 'success',
		                            title: 'Successfully!',
		                            text: data.message
		                        });
		                    } else if (data.status === 'Already_Exist') {
		                        Swal.fire({
		                            icon: 'warning',
		                            title: 'Already Exists!',
		                            text: data.message
		                        });
		                    } else if (data.status === 'Failed') {
		                        Swal.fire({
		                            icon: 'error',
		                            title: 'Invalid!',
		                            text: data.message
		                        });
		                    }
		                },
		                error: function (xhr, status, error) {
		                    console.error("Error while submitting attendance:", error);
		                    Swal.fire({
		                        icon: 'error',
		                        title: 'Error!',
		                        text: 'Something went wrong during submission.'
		                    });
		                }
		            });
		        }
		    });
		});
		$(function () {
		    $("form[name='clock_form").validate({
		        rules: {
		            cemployeeId: {
		                required: true
		            },
		            cattendance_date1: {
		                required: true
		            }
		        },

		        messages: {
		            cemployeeId: {
		                required: "Please select employee"
		            },
		            cattendance_date1: {
		                required: "Please select date"
		            }
		        },

		        submitHandler: function (form) {
		            const employeeId = $("#cemployeeId").val();
		            const attendance_date = $("#cattendance_date1").val();
		            const out_time = $("#out_time").val();
		            const obj = {
		                attendance_date: attendance_date,
		                clock_out: out_time,
		                employee_id : employeeId
		            };

		            $.ajax({
		                url: 'clock_out_attendance',
		                type: 'POST',
		                dataType: 'json',
		                data: JSON.stringify(obj),
		                contentType: "application/json",
		                success: function (data) {
		                    $("form[name='clock_form']").trigger("reset");
		                    $('#clockout_modal').modal('toggle');

		                    if (data.status === 'Success') {
		                        Swal.fire({
		                            icon: 'success',
		                            title: 'Successfully!',
		                            text: data.message
		                        });
		                    } else if (data.status === 'Already_Exist') {
		                        Swal.fire({
		                            icon: 'warning',
		                            title: 'Already Exists!',
		                            text: data.message
		                        });
		                    } else if (data.status === 'Failed') {
		                        Swal.fire({
		                            icon: 'error',
		                            title: 'Invalid!',
		                            text: data.message
		                        });
		                    }
		                },
		                error: function (xhr, status, error) {
		                    console.error("Error while submitting attendance:", error);
		                    Swal.fire({
		                        icon: 'error',
		                        title: 'Error!',
		                        text: 'Something went wrong during submission.'
		                    });
		                }
		            });
		        }
		    });
		});


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
								columns : [
										{
											"data" : "total_attendance"
										},
										{
											"data" : "month"
										},
										{
											"data" : "year"
										},
										{
											"data" : "employee_name"
										},
										{
											"data" : "total_days"
										},
										{
											"data" : "total_leaves"
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
												var status = data.status;
												var string = "<button type='button' class='btn btn-xs btn-primary' onclick='leaveData("
														+ emp_id
														+ ","
														+ month_no
														+ ","
														+ year
														+ ")'>View </button>";
												string += "<button type='button' class='btn btn-xs btn-primary mx-1' onclick='viewWorkingH("+ emp_id+ ","+ month_no+ ","+ year+ ")'>Working Hours </button>";
												if (status == "Pending"
														&& (user_type == 'Admin' || attendance_approval == 'attendance_approval')) {
													string += "&nbsp;&nbsp;<button type='button' class='btn btn-xs btn-primary' onclick='pay_salary("
															+ emp_id
															+ ","
															+ month_no
															+ ","
															+ year
															+ ")'>Pay</button>";
												}
												return string;
											}
										} ],
								"lengthMenu" : [ [ 5, 10, 25, 50 ],
										[ 5, 10, 25, 50 ] ],
								select : true
							});
		}
		table();

		function leaveData(id, month, year) {
			$("#emp_id").val(id);
		    var fd = new FormData();
		    fd.append("emp_id", id);
		    fd.append("month", month);
		    fd.append("year", year);

		    $.ajax({
		        url: 'getEmployeeAttendance',
		        type: 'post',
		        data: fd,
		        contentType: false,
		        processData: false,
		        success: function(data) {
		            if (data.status === 'Success') {
		                $('#tenderform').modal('toggle');
		                if (data.data && data.data.length) {
		                    for (var i = 0; i < data.data.length; i++) {
		                        var d = data.data[i].attendance_date.split("-");
		                        var sd = d[2].split("");
		                        if (sd[0] === "0") {
		                            d[2] = sd[1];
		                        }
		                        var md = d[1].split("");
		                        if (md[0] === "0") {
		                            d[1] = md[1];
		                        }

		                        var selector = '[data-date="' + d[2] + '"][data-month="' + d[1] + '"][data-year="' + d[0] + '"]';
		                        const targetElement = $(selector);
		                        if (targetElement.length) {
		                        	if(data.data[i].attendance_type == "1" && data.data[i].reason == "-"){
		                        		targetElement.css('background','green');
										targetElement.css('color', 'white');
		                        	}else{
		                        		targetElement.css('background','gray');
										targetElement.css('color', 'white');
		                        	}
		                        	if(data.data[i].attendance_type == "0.5"){
		                        		targetElement.css('background','yellow');
										targetElement.css('color', 'white');
		                        	}
		                        	if(data.data[i].attendance_type == "0"){
		                        		targetElement.css('background','red');
										targetElement.css('color', 'white');
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
		        error: function(xhr, status, error) {
		            console.error('Error occurred during the AJAX request:', error);
		        }
		    });
		}
		function getcalanderdata(id, month, year) {
			$("#emp_id").val(id);
		    var fd = new FormData();
		    fd.append("emp_id", id);
		    fd.append("month", month);
		    fd.append("year", year);

		    $.ajax({
		        url: 'getEmployeeAttendance',
		        type: 'post',
		        data: fd,
		        contentType: false,
		        processData: false,
		        success: function(data) {
		            if (data.status === 'Success') {
		                if (data.data && data.data.length) {
		                    for (var i = 0; i < data.data.length; i++) {
		                        var d = data.data[i].attendance_date.split("-");
		                        var sd = d[2].split("");
		                        if (sd[0] === "0") {
		                            d[2] = sd[1];
		                        }
		                        var md = d[1].split("");
		                        if (md[0] === "0") {
		                            d[1] = md[1];
		                        }

		                        var selector = '[data-date="' + d[2] + '"][data-month="' + d[1] + '"][data-year="' + d[0] + '"]';
		                        const targetElement = $(selector);
		                        if (targetElement.length) {
		                        	if(data.data[i].attendance_type == "1" && data.data[i].reason == "-"){
		                        		targetElement.css('background','green');
										targetElement.css('color', 'white');
		                        	}else{
		                        		targetElement.css('background','gray');
										targetElement.css('color', 'white');
		                        	}
		                        	if(data.data[i].attendance_type == "0.5"){
		                        		targetElement.css('background','yellow');
										targetElement.css('color', 'white');
		                        	}
		                        	if(data.data[i].attendance_type == "0"){
		                        		targetElement.css('background','red');
										targetElement.css('color', 'white');
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
		        error: function(xhr, status, error) {
		            console.error('Error occurred during the AJAX request:', error);
		        }
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

		$(".attendence").click(function() {
			var latitude = $("#latitude").val();
			var longitude = $("#longitude").val();
			var obj = {};
			obj.employee_id = employee_id;
			obj.attendance_date = new Date();
			obj.user_type = user_type;
			obj.lat = latitude;
			obj.lon = longitude;
			obj.attendance_type = 1;
			$.ajax({
				url : 'add_attendance',
				type : 'post',
				dataType : 'JSON',
				data : JSON.stringify(obj),
				contentType : "application/json",
				success : function(data) {
					if (data['status'] == 'Success') {
						$('#attendance').DataTable().ajax.reload(null, false);
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
						$("form[name='attendance']").trigger("reset");
						Swal.fire({
							icon : 'error',
							title : 'Invalid!',
							text : data['message']
						})
					}
				}
			});
		})
		$(".clock_out").click(function() {
			var latitude = $("#latitude").val();
			var longitude = $("#longitude").val();
			var fd = new FormData();
			fd.append("employee_id", employee_id);
			fd.append("user_type", user_type);
			fd.append("userLat", latitude);
			fd.append("userLon", longitude);
			$.ajax({
				url : 'clock_Out',
				type : 'post',
				data : fd,
				contentType : false,
				processData : false,
				success : function(data) {
					if (data['status'] == 'Success') {
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
						$("form[name='attendance']").trigger("reset");
						Swal.fire({
							icon : 'error',
							title : 'Invalid!',
							text : data['message']
						})
					}
				}
			});
		})
		
function viewWorkingH(id, month, year, attendance_type) {
    $('#att_modal').modal('toggle');
    var columnsArr = [
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
    ];

    if (user_type === "Admin") {
    
        columnsArr.push({
            data: function (data, type, dataToSet) {
                var sno = data.sno;
                var string = "<button type='button' class='btn btn-xs btn-primary' onclick='editAttendace(" + sno + ")'>Edit</button>";
                return string;
            }
        });
    }

    $("#atttable").DataTable({
        dom: "Blfrtip",
        destroy: true,
        autoWidth: false,
        responsive: true,
        buttons: [
            { extend: 'pdf', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } },
            { extend: 'csv', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } },
            { extend: 'print', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } },
            { extend: 'excel', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } },
            { extend: 'pageLength' }
        ],
        lengthChange: false,
        ordering: false,
        scrollX: false,
        ajax: {
            url: "getAttendancefilter",
            type: "POST",
            data: {
                emp_id: id,
                month: month,
                year: year
            }
        },
        columnDefs: [{
            defaultContent: "-",
            targets: "_all"
        }],
        serverSide: true,
        columns: columnsArr,
        lengthMenu: [[30, 50], [30, 50]],
        select: true
    });
}
		
		function editAttendace(sno){
			$("#sno").val(sno);
			$("#updateAttendance").modal('toggle');
			
		}
		$(function() {
			$("form[name='zone_form']")
					.validate(

							{
								rules : {
									a_type : {
										required : true,
									},
								},

								messages : {

									a_type : {
										required : "Please Select Attendance Type",
									},

								},

								submitHandler : function(form) {
									var sno = $("#sno").val();
									var a_type = $("#a_type").val();
									var fd = new FormData();
									fd.append("sno",sno);
									fd.append("a_type",a_type);
									$.ajax({
										url : 'update_attendance',
										type : 'post',
										data : fd,
										contentType :  false,
										processData : false,
												success : function(data) {
													if (data['status'] == 'Success') {
														Swal
																.fire({
																	icon : 'success',
																	title : 'successfully!',
																	text : data['message']
																})
																$("#updateAttendance").modal('toggle');

													} else if (data['status'] == 'Already_Exist') {

														$(
																"form[name='attendance']")
																.trigger(
																		"reset");
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
														$(
																"form[name='attendance']")
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
	</script>
</body>
</html>

