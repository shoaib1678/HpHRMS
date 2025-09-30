<!doctype html>
<%@page import="com.hp.model.LoginCredentials"%>
<html lang="en">

<head>
<title>Attendance</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="css.jsp"></jsp:include>
</head>
<%
LoginCredentials lg = (LoginCredentials)session.getAttribute("loginData");
%>

<body>

	<section class="main-page">
		<div class="topbar fst-italic">
			<h4>Attendance</h4>
		</div>
		<div class="main-div">
			 <!-- <ul class="nav nav-team mt-2 mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="one-tab" data-bs-toggle="pill"
						data-bs-target="#one" type="button" role="tab" aria-controls="one"
						aria-selected="true">Daily</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="two-tab" data-bs-toggle="pill"
						data-bs-target="#two" type="button" role="tab" aria-controls="two"
						aria-selected="false">Monthly</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="three-tab" data-bs-toggle="pill"
						data-bs-target="#three" type="button" role="tab"
						aria-controls="three" aria-selected="false">Yearly</button>
				</li>
			</ul> -->
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="one" role="tabpanel"
					aria-labelledby="one-tab" tabindex="0">
					<button class="btn bg-info text-white" style="float: right; margin-top: -2px;" id="clockin">Clock-in</button>
					<button class="btn bg-info text-white" style="float: right; margin-top: -2px;" id="clockout">Clock-out</button>
					<h6 class="mt-3">
						<%=lg.getEmployee_name() %>
					</h6>
					<h3 class="mt-4 mb-2">My Presence(Current Month)</h3>
					<div class="row d-flex align-items-center">
						<div class="col">
							<div class="teambox1" style="background: rgb(9, 203, 9);">
								<h5>Present</h5>
								<p id="fullDayCount"></p>
							</div>
						</div>
						<div class="col">
							<div class="teambox1" style="background: rgb(255, 95, 95);">
								<h5>Absent</h5>
								<p id="absentCount"></p>
							</div>
						</div>
						<div class="col">
							<div class="teambox1" style="background: rgb(201, 201, 201);">
								<h5>Leave</h5>
								<p id="leaveCount"></p>
							</div>
						</div>
                        <div class="col">
							<div class="teambox1" style="background: yellow;">
								<h5>Half Day</h5>
								<p id="halfDayCount"></p>
							</div>
						</div>
					</div>
					
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="earnings-one"
							role="tabpanel" aria-labelledby="earnings-one-tab" tabindex="0">
                                 <h3 class="mt-4" style="margin-bottom: -16px;">Your Attendance</h3>
								<div class="container-calendar">
							<h3 id="monthAndYear" style="transform: translateY(35px);"></h3>

							<div class="button-container-calendar" style="background:  #0000ff85; margin-bottom: 0;">
								<button id="previous" onclick="previous()">&#8249;</button>
								<button id="next" onclick="next()">&#8250;</button>
							</div>

							<table class="table-calendar" id="calendar" data-lang="en">
								<thead id="thead-month"></thead>
								<tbody id="calendar-body"></tbody>
							</table>

							<div class="footer-container-calendar">
								<label for="month" style="display: none;">Jump To: </label> <select id="month"
									onchange="jump()" style="display: none;">
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
								</select> 
                                <select id="year" onchange="jump()" style="display: none;"></select>
							</div>
						</div>
							</div>
						</div>
						<!-- <div class="tab-pane fade" id="two" role="tabpanel"
							aria-labelledby="two-tab" tabindex="0">dfgdfg</div>
						<div class="tab-pane fade" id="three" role="tabpanel"
							aria-labelledby="three-tab" tabindex="0">fdsfsdf</div> -->
					</div>
					<div>
                        <h3 class="mt-0">Working Hours</h3>
							<div class="table-responsive">
								<table class="table" id="atttable">
									<thead>
										<tr class="table-info border-0">
											<th>Date</th>
											<th>In Time</th>
                                            <th>Out Time</th>
											<th>Working Hours</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
                    </div>
				</div>
			</div>
		</div>
	</section>
	<input type="hidden" id="latitude" name="latitude" value="0">
	<input type="hidden" id="longitude" name="longitude" value="0">
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="js.jsp"></jsp:include>
<script type="text/javascript">
let authentication_id = $("#authentication_id").val();
let user_type = $("#user_type").val();
let employee_id = $("#employee_id").val();

getLocation();
function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        // Set values into input fields
        document.getElementById("latitude").value = position.coords.latitude;
        document.getElementById("longitude").value = position.coords.longitude;
        console.log("Latitude="+position.coords.latitude);
        console.log("longitude="+position.coords.longitude);
      }, function(error) {
        alert("Location access denied or failed.");
        console.error(error);
      });
    } else {
      alert("Geolocation is not supported by this browser.");
    }
  }

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
            $('[data-date]').css({ 'background': '', 'color': '' });

            // Initialize counters
            let fullDayCount = 0;
            let halfDayCount = 0;
            let absentCount = 0;
            let leaveCount = 0;

            // Get today's date
            const today = new Date();
            const todayDay = today.getDate();
            const todayMonth = today.getMonth() + 1; // months are 0-indexed
            const todayYear = today.getFullYear();

            let isTodayFullDay = false;

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
                                fullDayCount++;

                                // Check if today's attendance is full day
                                if (parseInt(d[2]) == todayDay && parseInt(d[1]) == todayMonth && parseInt(d[0]) == todayYear) {
                                    isTodayFullDay = true;
                                }
                            } else if (type == "0.5") {
                                targetElement.css({ 'background': 'yellow', 'color': 'white' });
                                halfDayCount++;
                            } else if (type == "0") {
                                targetElement.css({ 'background': 'red', 'color': 'white' });
                                absentCount++;
                            } else {
                                targetElement.css({ 'background': 'gray', 'color': 'white' });
                                leaveCount++;
                            }
                        }
                    }

                    // Update counts on UI
                    $("#fullDayCount").text(fullDayCount);
                    $("#halfDayCount").text(halfDayCount);
                    $("#absentCount").text(absentCount);
                    $("#leaveCount").text(leaveCount);

                    // Toggle Clock-In / Clock-Out buttons
                    if (isTodayFullDay) {
                        $("#clockin").hide();
                        $("#clockout").show();
                    } else {
                        $("#clockin").show();
                        $("#clockout").hide();
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

$("#clockin").click(function() {
	var latitude = $("#latitude").val();
	var longitude = $("#longitude").val();
	var obj = {};
	obj.employee_id = employee_id;
	obj.attendance_date = new Date();
	obj.user_type = user_type;
	obj.lat = latitude;
	obj.lon = longitude;
	obj.authentication_id = authentication_id;
	obj.attendance_type = 1;
	$.ajax({
		url : 'add_attendance',
		type : 'post',
		dataType : 'JSON',
		data : JSON.stringify(obj),
		contentType : "application/json",
		success : function(data) {
			 var modalBody = $("#modalBodyContent");
			if (data['status'] == 'Success') {
				 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
                 $('#popup1').modal('show');
                 setTimeout(function() {
                	    location.reload();
                	}, 2000);

			} else if (data['status'] == 'Already_Exist') {
				 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
                 $('#popup1').modal('show');
			} else if (data['status'] == 'Failed') {
				 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
                 $('#popup1').modal('show');
			}
		}
	});
})

$("#clockout").click(function() {
			var latitude = $("#latitude").val();
			var longitude = $("#longitude").val();
			var fd = new FormData();
			fd.append("employee_id", employee_id);
			fd.append("user_type", user_type);
			fd.append("userLat", latitude);
			fd.append("userLon", longitude);
			fd.append("authentication_id", authentication_id);
			$.ajax({
				url : 'clock_Out',
				type : 'post',
				data : fd,
				contentType : false,
				processData : false,
				success : function(data) {
					 var modalBody = $("#modalBodyContent");
						if (data['status'] == 'Success') {
							 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
			                 $('#popup1').modal('show');
			                 setTimeout(function() {
			                	    location.reload();
			                	}, 2000);

						} else if (data['status'] == 'Already_Exist') {
							 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
			                 $('#popup1').modal('show');
						} else if (data['status'] == 'Failed') {
							 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
			                 $('#popup1').modal('show');
						}
				}
			});
		})

function viewWorkingH(month, year) {
    $.ajax({
        url: "getAttendancefilter",
        type: "POST",
        data: {
            start: 0,
            length: -1,
            emp_id: employee_id,
            month: month,
            year: year
        },
        success: function (data) {
        	if (data['status'] == 'Success') {
            $("#atttable tbody").empty();
			for(var i=0; i<data['data'].length; i++){
               /*  var formattedDate =
                    dateobj.getFullYear() + "-" +
                    String(dateobj.getMonth() + 1).padStart(2, '0') + "-" +
                    String(dateobj.getDate()).padStart(2, '0'); */
                var row = "<tr>" +
                    "<td>" + data['data'][i].attendance_date + "</td>" +
                    "<td>" + (data['data'][i].clock_in ?? "-") + "</td>" +
                    "<td>" + (data['data'][i].clock_out ?? "-") + "</td>" +
                    "<td>" + (data['data'][i].total_hours ?? "-") + "</td>" +
                    "</tr>";

                $("#atttable tbody").append(row);
           
        	}
        	}
        },
        error: function () {
            alert("Error fetching attendance data!");
        }
    });
}

</script>
</body>
</html>