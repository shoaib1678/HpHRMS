
<%@page import="com.hp.model.LoginCredentials"%>
<%
LoginCredentials login = (LoginCredentials)session.getAttribute("loginData");
%>
<section class="menu_bottom">
      <div class="menu_item" onclick="location.href='emp_dashboard'"><img src="assets/AppData/images/home.svg" alt="">Dashboard</div>
      <div class="menu_item" onclick="location.href='emp_attendance'"><img src="assets/AppData/images/team-record.svg" alt="">Attendance</div>
      <div class="menu_item" onclick="location.href='emp_leave_request'"><img src="assets/AppData/images/order-record.svg" alt="">Leave Request</div>      
      <div class="menu_item" onclick="location.href='log_out'"><img src="assets/AppData/images/account.svg" alt="">Account</div>
  </section>
  <div class="modal fade" id="popup1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Attendance Confirmation</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	             <div class="modal-body" id="modalBodyContent">
	            </div> 
	        </div>
	    </div>
	</div>   
  <input type="hidden" id="employee_id" name="employee_name" value="<%=login.getEmployee_id()%>">
  <input type="hidden" id="user_type" name="user_type" value="<%=login.getUser_type()%>">
  <input type="hidden" id="authentication_id" name="authentication_id" value="<%=login.getAuthentication_id()%>">
  