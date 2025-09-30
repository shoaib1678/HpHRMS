<!doctype html>
<%@page import="com.hp.model.Leaves"%>
<%@page import="java.util.List"%>
<%@page import="com.hp.model.LoginCredentials"%>
<html lang="en">

<head>
<title>Leave Request</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="css.jsp"></jsp:include>
</head>
<%
LoginCredentials lg = (LoginCredentials)session.getAttribute("loginData");
List<Leaves> lv =(List<Leaves>)request.getAttribute("lv");
%>
<body>

	<section class="main-page">
		<div class="topbar fst-italic">
			<h4>Leave Request</h4>
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
					<button class="btn bg-info text-white" style="float: right; margin-top: -2px;" data-bs-toggle="modal" data-bs-target="#leave_modal">Apply Leave</button>
					<h6 class="mt-3">
						<%=lg.getEmployee_name() %>
					</h6>
					<h3 class="mt-4 mb-2">Leave(Current Month)</h3>
					<div class="row d-flex align-items-center">
                        <div class="col">
							<div class="teambox1" style="background: rgb(201, 201, 201);">
								<h5>Applied</h5>
								<p id="allCount"></p>
							</div>
						</div>
                        <div class="col">
							<div class="teambox1" style="background: yellow;">
								<h5>Pending</h5>
								<p id="pendingCount"></p>
							</div>
						</div>
						<div class="col">
							<div class="teambox1" style="background: rgb(9, 203, 9);">
								<h5>Approved</h5>
								<p id="approvedCount"></p>
							</div>
						</div>
						<div class="col">
							<div class="teambox1" style="background: rgb(255, 95, 95);">
								<h5>Rejected</h5>
								<p id="rejectedCount"></p>
							</div>
						</div>
						
					</div>
					
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="earnings-one"
							role="tabpanel" aria-labelledby="earnings-one-tab" tabindex="0">
                                <h3 class="mt-4">Leave Details</h3>
							<div class="table-responsive">
								<table class="table" id="leaveTable">
									<thead>
										<tr class="table-info border-0">
											<th>Leave Type</th>
											<th>Total</th>
											<th>Remaining</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>

							
						</div>
							</div>
						</div>
						<!-- <div class="tab-pane fade" id="two" role="tabpanel"
							aria-labelledby="two-tab" tabindex="0">dfgdfg</div>
						<div class="tab-pane fade" id="three" role="tabpanel"
							aria-labelledby="three-tab" tabindex="0">fdsfsdf</div> -->
					</div>
					<div>
                        <h3 class="mt-0">Applied Leave</h3>
							<div class="table-responsive">
								<table class="table" id="atttable">
									<thead>
										<tr class="table-info border-0">
											<th>From Date</th>
											<th>To Date</th>
                                            <th>Leave Type</th>
											<th>Status</th>
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
	<input type="hidden" id="user_id" value="0">
<input type="hidden" id="number1" value="0">
<section class="menu_bottom">
      <div class="menu_item" onclick="location.href='index?number=0'"><img src="assets/images/home.svg" alt="">Dashboard</div>
      <div class="menu_item" onclick="location.href='order_record';"><img src="assets/images/team-record.svg" alt="">Attendance</div>
      <div class="menu_item" onclick="location.href='team_report';"><img src="assets/images/order-record.svg" alt="">Leave Request</div>      
      <div class="menu_item" onclick="location.href='account';"><img src="assets/images/account.svg" alt="">Account</div>
  </section>
  <div class="modal fade" id="leave_modal" data-bs-backdrop="static"
		tabindex="-1">
		<div class="modal-dialog modal-lg " role="document" style="margin-top: 60px;">
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
								
								<div class="col-md-6 mb-3">
									<label for="attendance_type" class="form-label">Leave
										Type</label> <select id="leave_id" name="leave_id" class="form-select">
										<option value="">--select Leave type--</option>
										<%
										for (Leaves l : lv) {
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
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal" aria-label="Close">Close</button>
								<button type="submit" class="btn btn-primary" id="sbtm">Submit
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	  <div class="modal fade" id="popup" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel1">Leave Request Confirmation</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	             <div class="modal-body" id="modalBodyContent1">
	            </div> 
	        </div>
	    </div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="js.jsp"></jsp:include>
	
	<script type="text/javascript">
	let user_type = $("#user_type").val();
	let employee_id = $("#employee_id").val();
	$(function() {
		$("form[name='attendance']")
				.validate(

						{
							rules : {
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

							submitHandler : function(form) {
								$("#sbtm").html("Please Wait...");
								$("#sbtm").prop("disabled", true);
								var leave_id = $("#leave_id").val();
								var to_date = $("#to_date").val();
								var from_date = $("#from_date").val();
								var reason = $("#reason").val();
								var obj = {
										"leave_id" : parseInt(leave_id),
										"fromDate" : from_date,
										"toDate" : to_date,
										"reason" : reason,
										"employee_id" : parseInt(employee_id)
									};
								$.ajax({
											url : 'send_leave_request',
											type : 'post',
											dataType : 'JSON',
											data : JSON.stringify(obj),
											contentType : "application/json",
											success : function(data) {
												 var modalBody = $("#modalBodyContent1");
													if (data['status'] == 'Success') {
														$("#sbtm").html("Submit");
														$("#sbtm").prop("disabled", false);
														 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
										                 $('#popup').modal('show');
										                 setTimeout(function() {
										                	    location.reload();
										                	}, 2000);

													} else if (data['status'] == 'Already_Exist') {
														$("#sbtm").html("Submit");
														$("#sbtm").prop("disabled", false);
														 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
										                 $('#popup').modal('show');
													} else if (data['status'] == 'Failed') {
														$("#sbtm").html("Submit");
														$("#sbtm").prop("disabled", false);
														 modalBody.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
										                 $('#popup').modal('show');
													}
											}
										});

							}
						});

	});
	
	
	getRemainingLeave();
	
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
		            	if(item.leave_name != "Short Leave"){
		            		var row = "<tr>" +
		                    "<td>" + item.leave_name + "</td>" +
		                    "<td>" + item.total_leaves + "</td>" +
		                    "<td>" + item.remaining_leave + "</td>" +
		                    "</tr>";
		                tbody.append(row);
		            	}
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
	getleaverequest();
	function getleaverequest() {
	    $.ajax({
	        url: "get_leave_request",
	        type: "POST",
	        data: {
	            start: 0,
	            length: -1,
	            employee_id: employee_id,
	            user_type: user_type
	        },
	        success: function (data) {
	            if (data['status'] == 'Success') {
	                $("#atttable tbody").empty();

	                // counters
	                var pendingCount = 0;
	                var approvedCount = 0;
	                var rejectedCount = 0;

	                for (var i = 0; i < data['data'].length; i++) {
	                    var status = data['data'][i].status ?? "-";

	                    // count status
	                    if (status.toLowerCase() === "pending") {
	                        pendingCount++;
	                    } else if (status.toLowerCase() === "approved") {
	                        approvedCount++;
	                    } else if (status.toLowerCase() === "rejected") {
	                        rejectedCount++;
	                    }

	                    // create row
	                    var row = "<tr>" +
	                        "<td>" + data['data'][i].fromDate + "</td>" +
	                        "<td>" + (data['data'][i].toDate ?? "-") + "</td>" +
	                        "<td>" + (data['data'][i].leave_name ?? "-") + "</td>" +
	                        "<td>" + status + "</td>" +
	                        "</tr>";

	                    $("#atttable tbody").append(row);
	                }

	                // total (All)
	                var allCount = data['data'].length;

	                // show counts somewhere
	                $("#pendingCount").text(pendingCount);
	                $("#approvedCount").text(approvedCount);
	                $("#rejectedCount").text(rejectedCount);
	                $("#allCount").text(allCount);
	            }
	        },
	        error: function () {
	            alert("Error fetching leave request data!");
	        }
	    });
	}

	</script>
</body>
</html>