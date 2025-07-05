
<!DOCTYPE html>

<%@page import="com.hp.model.EmployeeDetails"%>
<%@page import="com.hp.model.LoginCredentials"%>
<%@page import="java.util.List"%>
<html
  lang="en"
  class="light-style layout-navbar-fixed layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="assets/"
  data-template="vertical-menu-template-starter"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>OffBoarding</title>

    <meta name="description" content="" />
    <jsp:include page="css.jsp"></jsp:include>
  <style type="text/css">
  	  .modal-xxl {
        --bs-modal-width: 95vw !important;
    }
    
    
    input {
    	text-transform: uppercase;
    }
  	
  </style>
    
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
<%
	LoginCredentials loginCredentials = (LoginCredentials) request.getAttribute("loginData");
	List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) request.getAttribute("employeeDetails");
%>
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

                 <div class="row p-4 pb-0" >
                    <div class="col-3"><button class="btn btn-xs btn-secondary add-new btn-primary" id="clear_btn" data-bs-toggle="modal" type="button" data-bs-target="#tenderform" >
                     <span><i class="bx bx-plus me-0 me-sm-1"></i><span class="d-none d-sm-inline-block">Request Resignation</span></span></button></div>
                 </div>
                 <div class="row p-4" >
                    <div class="col-12">
                     <div class="card-datatable table-responsive">
               <table id="tenderdata_table" class="table nowrap" style="width:100%">
                 <thead class="bg-primary">
                    <tr>
                     <th class="text-white">Employee Name</th>
                       <th class="text-white">Requested Date</th>
                       <th class="text-white">Reason</th>
                     	  <th class="text-white">Status</th>
                     </tr>
                 </thead>
               </table>
               </div>
              </div></div>
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
		<div class="modal-dialog modal-md "
			role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Request Resignation</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="branch" id="branch">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row">
								 <%
                            	if(!loginCredentials.getUser_type().equals("Employee")){
                            %>
                                <div class="col-12 col-lg-12 mb-3">
                                    <label class="form-label" for="company_name">Employee Id<span class="mandatory">*</span></label>
                                    <select class="form form-select" id="employeeId" name="employeeId">
                                    <option value="">--select employee--</option>
                                    <%
                                    	for(EmployeeDetails e : employeeDetails){
                                    %>
                                    	<option value="<%= e.getSno() %>"><%= e.getFirst_name()+" "+e.getLast_name() %></option>
                                    <%} %>
                                    </select>
                                </div>
                                <%} %>
                                 <div class="col-12 col-lg-12 mb-3">
                                    <label class="form-label" for="owner_name">Date of Request<span class="mandatory">*</span></label>
                                    <input type="date"
                                           class="form-control"
                                           id="requested_date"
                                           placeholder=" "
                                           name="requested_date"
                                           aria-label=" " />
                                </div>
                                   <div class="col-12 col-lg-12 mb-3">
                                    <label class="form-label" for="email_address">Reason<span class="mandatory">*</span></label>
                                    <input type="text"
                                           class="form-control"
                                           id="reason"
                                           placeholder=" "
                                           name="reason"
                                           aria-label=" " />
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
	
	<div class="modal fade" id="tenderform1" data-bs-backdrop="static"
		tabindex="-1">
		<div class="modal-dialog modal-md "
			role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 1px solid lightgray;">
					<h6>Change status of Resignation Request</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="designation" id="designation">
					<div class="modal-body">
						<div class="nav-align-top mb-4">

							<div class="row g-2">
                            
                                <div class="col-12 col-lg-12 mb-3">
                                    <label class="form-label" for="department_name">Relieving Date<span class="mandatory">*</span></label>
                                    <input type="date"
                                           class="form-control"
                                           id="relieving_date"
                                           placeholder=" "
                                           name="relieving_date"
                                           aria-label=" " />
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
   <%--  <jsp:include page="relievepopup.jsp"></jsp:include> --%>
<jsp:include page="js.jsp"></jsp:include>
<script type="text/javascript">
let employee_id = $("#employee_id").val();
let user_type = $("#user_type").val();


function data() {
$("#tenderdata_table").DataTable({
dom : "Blfrtip",
autoWidth : true,
responsive: true, 
buttons : [ {
extend : 'pdf',
exportOptions : {
columns : [ 0, 1, 2, 3, 4]
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
url : "get_resignations",
type : "POST",	
"data" : {
	"employee_id" : employee_id,
	"user_type" : user_type
}

},
columnDefs : [ {
"defaultContent" : "-",
"targets" : "_all"
} ],
serverSide : true,
columns : [{
"data" : "employee_name"
},
{
	"data" : "requested_date"
},  
{
	"data" : "reason"
},  
{
	"data" : function(data, type,
			dataToSet) {
			var string = ""; 
			var status = data.status;
			var sno = data.sno;
			if (user_type != 'Employee'){
				if (status == 'Pending'){
					string += "<button class='btn btn-xs btn-secondary  add-new btn-success' type='button'  onclick='update_resignation("+sno+",\"Approved\")'>Approve</button>";
					string += "&nbsp;&nbsp;<button class='btn btn-xs btn-secondary  add-new btn-danger' type='button'  onclick='update_resignation("+sno+", \"Rejected\")'>Reject</button>";
				}
			}else{
				if (status == 'Rejected'){
					string = "<span class='btn btn-xs btn-secondary  add-new btn-danger'>"+status+"</span>";
				}else if(status == 'Approved'){
					string = "<span class='btn btn-xs btn-secondary  add-new btn-success'>"+status+"</span>";
				}else{
					string = "<span>"+status+"</span>";
				}
			}
			return string;
			}
		}

],
"lengthMenu" : [ [ 5, 10, 25, 50 ], [ 5, 10, 25, 50 ] ],
select : true
});
}
data();



function getLocationData() {
	var pincodedata = $("#pincode").val();
	if (pincodedata.length == 6) {
		var fd = new FormData();
		fd.append("pincode", pincodedata);
		$.ajax({
			url : 'getdatafrompincode', //get data from pincode
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data['status'] == 'success') {
					$("#state").val(data['state']);
					$("#district").val(data['district']);

				} else if (data['status'] == 'failure') {
					$("#state").val("");
					$("#district").val("");
					Swal.fire({
						icon : 'warning',
						title : 'OOPS!',
						text : data['message']
					})
				} else {
					$("#state").val("");
					$("#district").val("");
					Swal.fire({
						icon : 'error',
						title : 'OOPS!',
						text : data['message']
					})
				}
			}
		});
	} else {
		$("#state").val("");
		$("#district").val("");
	}

}



	$(function() {
		$("form[name='branch']").validate(
				{
					rules : {
						requested_date : {
							required : true,
						},
						reason : {
							required : true,
						}
					
					},

					messages : {
													
						requested_date : {
							required : "Please select date",
						},														
						reason : {
							required : "Please enter reason."
						}
						
					},

					submitHandler : function(form) {
		
						var requested_date = $("#requested_date").val();
						var reason = $("#reason").val();
						var employeeids = 0;
						if (user_type == 'Employee'){
							employeeids = employee_id;
						}else{
							employeeids = $("#employeeId").val();
						}
						

						 var obj = {
								 "employee_id" :employeeids,
								 "requested_date" :requested_date,
								 "reason" :reason
						 };
						$.ajax({
							url : 'add_offboarding',
							type : 'post',
							dataType : 'JSON',
							data : JSON.stringify(obj),
							contentType :  'application/json',
							success : function(data) {

								if (data['status'] == 'Success') {
								 Swal.fire({
										icon : 'success',
										title : 'successfully!',
										text : data['message']
									})
									$('#tenderform').modal('toggle');
								 $('#tenderdata_table').DataTable().ajax.reload( null, false );
								
								} else if(data['status'] == 'Already_Exist'){
									Swal.fire({
										icon : 'warning',
										title : 'Already!',
										text : data['message']
									})
									$('#tenderform').modal('toggle');
								}
								else{
									Swal.fire({
										icon : 'Sorry',
										title : 'Invalid!',
										text : data['message']
									})
									$('#tenderform').modal('toggle');
								}
							}
						});

					}
				});

	});

	var srno = 0;
	var status_name = "";
	
	function update_resignation(sno,status){
		srno = sno;
		status_name = status;
		if(status_name == "Rejected"){
			var today = new Date();
			var currentDate = today.toISOString().split('T')[0];
				var fd = new FormData();
				fd.append("sno",srno);
				fd.append("status",status_name);
				fd.append("date",currentDate);
				$.ajax({
					url : 'update_resignation',
					type : 'post',
					data : fd,
					contentType :  false,
					processData : false,
					success : function(data) {
						if (data['status'] == 'Success') {
							 $('#tenderdata_table').DataTable().ajax.reload( null, false );
							 Swal.fire({
									icon : 'success',
									title : 'successfully!',
									text : data['message']
								})
						} else {
							Swal.fire({
								icon : 'Opps',
								title : 'Warning!',
								text : 'Invalid Details'
							})
						}
					}
				});
		}else{
			$('#tenderform1').modal('toggle');
		}
	}
	
	 function update(){
		 var date = $("#relieving_date").val();
			var fd = new FormData();
			fd.append("sno",srno);
			fd.append("status",status_name);
			fd.append("date",date);
			$.ajax({
				url : 'update_resignation',
				type : 'post',
				data : fd,
				contentType :  false,
				processData : false,
				success : function(data) {
					if (data['status'] == 'Success') {
						 $('#tenderdata_table').DataTable().ajax.reload( null, false );
						 Swal.fire({
								icon : 'success',
								title : 'successfully!',
								text : data['message']
							})
					} else {
						Swal.fire({
							icon : 'Opps',
							title : 'Warning!',
							text : 'Invalid Details'
						})
					}
				}
			});
			
			 
		}

	
	$("#clear_btn").click(function() {
        $("input[type='text'], input[type='hidden'],input[type='number']").val("");
      });
</script>
</body>
</html>
