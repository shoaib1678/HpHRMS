
<%@page import="com.hp.model.LoginCredentials"%>
<style>

.account-popup {
    display: none;
    position: fixed;
    bottom: 70px; /* height of footer menu */
    right: 10px;
    width: 220px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 12px 12px 0px 12px;
    box-shadow: 0 -4px 16px rgba(0,0,0,0.15);
    z-index: 9999;
    padding: 10px;
    animation: slideUp 0.2s ease;
}

.account-popup.show {
    display: block;
}

@keyframes slideUp {
    from { opacity: 0; transform: translateY(20px); }
    to   { opacity: 1; transform: translateY(0); }
}

.account-popup ul {
    list-style: none;
    padding: 0;
    margin: 0 0 10px 0;
}

.account-popup ul li {
    border-bottom: 1px solid #f0f0f0;
}

.account-popup ul li:last-child {
    border-bottom: none;
}

.account-popup ul li a {
    display: block;
    padding: 10px 12px;
    text-decoration: none;
    color: #333;
    font-size: 14px;
    border-radius: 8px;
    transition: background 0.2s;
}

.account-popup ul li a:hover {
    background: #f5f5f5;
}

/* Active menu item highlight */
.menu_item.active {
    color: #0dcaf0;
}

/* Overlay to close popup on outside click */
.account-overlay {
    display: none;
    position: fixed;
    inset: 0;
    z-index: 9998;
}

.account-overlay.show {
    display: block;
}
</style>
<%
LoginCredentials login = (LoginCredentials)session.getAttribute("loginData");
%>
<!-- Overlay -->
<div class="account-overlay" id="accountOverlay" onclick="closeAccountPopup()"></div>
<div class="account-popup" id="accountPopup">
  <ul>
    <li>
      <a href="personal_information">
        <span class="icon-wrap"><i class="fa fa-user"></i></span>
        Personal Information
      </a>
    </li>
    <li>
      <a href="assets/img/Leave_Policy.pdf">
        <span class="icon-wrap"><i class="fa fa-file-text"></i></span>
        Leave Policy
      </a>
    </li>
  </ul>
  <a href="log_out" class="btn-logout">
    <i class="fa fa-sign-out"></i> Logout
  </a>
</div>
<section class="menu_bottom" style="background: linear-gradient(90deg, var(--navy) 0%, #1a2d6d 100%);">
      <div class="menu_item" onclick="location.href='emp_dashboard'"><img src="assets/AppData/images/home.svg" alt="">Dashboard</div>
      <div class="menu_item" onclick="location.href='emp_attendance'"><img src="assets/AppData/images/team-record.svg" alt="">Attendance</div>
      <div class="menu_item" onclick="location.href='emp_leave_request'"><img src="assets/AppData/images/order-record.svg" alt="">Leave Request</div>      
      <div class="menu_item" id="accountBtn" onclick="toggleAccountPopup()" onclick="javascript:void(0)'"><img src="assets/AppData/images/account.svg" alt="">Account</div>
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
  <script>
function toggleAccountPopup() {
    const popup   = document.getElementById('accountPopup');
    const overlay = document.getElementById('accountOverlay');
    const btn     = document.getElementById('accountBtn');

    const isOpen = popup.classList.contains('show');
    if (isOpen) {
        popup.classList.remove('show');
        overlay.classList.remove('show');
        btn.classList.remove('active');
    } else {
        popup.classList.add('show');
        overlay.classList.add('show');
        btn.classList.add('active');
    }
}

function closeAccountPopup() {
    document.getElementById('accountPopup').classList.remove('show');
    document.getElementById('accountOverlay').classList.remove('show');
    document.getElementById('accountBtn').classList.remove('active');
}
</script>
  