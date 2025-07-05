<%@page import="com.hp.model.LoginCredentials"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
String purchase="";
String receiving="";
	LoginCredentials loginCredentials = (LoginCredentials) session.getAttribute("login_data");
	Set<String> rights_set = (Set<String>)session.getAttribute("rights_set");
	String[] name = (String[]) session.getAttribute("name");
	
	
	 String[] rights_set1 = rights_set.toArray(new String[rights_set.size()]);
%>

<input type="hidden" id="user_type" name="user_type" value="<%= loginCredentials.getUser_type() %>" />
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="dashboard" class="app-brand-link">
              <span class="app-brand-logo demo ms-0">
                <img src="assets/img/wlogo.png" width="45" height="45" alt="Halicon Publication" title="Halicon Publication" style="height: auto;"/>
              </span>
              <span class="app-brand-text demo menu-text text-white fw-bolder ms-2 lh-sm fs-5" >Halicon Publication</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

         <!--  <div class="menu-inner-shadow"></div> -->

          <ul class="menu-inner py-1">
            <!-- Dashboards -->
            <li class="menu-item">
             <a href="dashboard" class="menu-link"> 
                  <i class="menu-icon tf-icons bx bxs-dashboard"></i>
                  <div data-i18n="Dashboard">Dashboard</div>
               </a>
            </li>
            <%if(loginCredentials.getUser_type().equalsIgnoreCase("Admin")){ %>
             <li class="menu-item">
               <a href="javascript:void(0);" class="menu-link menu-toggle">
                  <i class="menu-icon tf-icons bx bxs-user-detail"></i>
                  <div data-i18n="Rights">Rights</div>
               </a>
               
               <ul class="menu-sub">
                  <li class="menu-item">
                     <a href="rights" class="menu-link">
                        <div data-i18n="Manage Rights">Manage Rights</div>
                     </a>
                  </li>
               </ul>
            </li>
            <%}%>
          <!-- <li class="menu-item"><a href="javascript:void(0);"
			class="menu-link menu-toggle"> <i
				class="menu-icon tf-icons bx bx-layer"></i>
				<div data-i18n="HRMS">HRMS</div>
		</a>
		     <ul class="menu-sub"> -->
		 <%   if(rights_set.contains("department") 
		|| loginCredentials.getUser_type().equals("Admin")
		|| rights_set.contains("designation")
		|| rights_set.contains("leaves")){
		%>
		     	<li class="menu-item"><a href="javascript:void(0);"
			class="menu-link menu-toggle"> <i
				class="menu-icon tf-icons bx bx-layer"></i>
				<div data-i18n="Organization">Organization</div>
		</a>
			<ul class="menu-sub">
				<%if(rights_set.contains("department")  || loginCredentials.getUser_type().equals("Admin")) {%>
				<li class="menu-item"><a href="department" class="menu-link">
						<div data-i18n="Add Department">Add Department</div>
				</a></li>
				<%}if(rights_set.contains("designation")  || loginCredentials.getUser_type().equals("Admin")) {%>
				<li class="menu-item"><a href="designation" class="menu-link">
						<div data-i18n="Add Designation">Add Designation</div>
				</a></li>
				<%}if(rights_set.contains("leaves")  || loginCredentials.getUser_type().equals("Admin")) {%>
				<li class="menu-item"><a href="leaves" class="menu-link">
						<div data-i18n="Leaves">Leaves</div>
				</a></li>
				
					<%}%>
                  	<%if(rights_set.contains("assignTeam")  || loginCredentials.getUser_type().equals("Admin")) {%>
					<li class="menu-item">
                     <a href="holidays" class="menu-link">
                        <div data-i18n="Add Holidays">Add Holidays</div>
                     </a>
                  </li>
                  <%} %>

			</ul>
			
			<% } %>
		</li>
<%if(rights_set.contains("addEmployee")  || rights_set.contains("viewEmployee") || loginCredentials.getUser_type().equals("Admin")) {%> 
		 	<li class="menu-item">
               <a href="javascript:void(0);" class="menu-link menu-toggle">
                  <i class="menu-icon tf-icons bx bxs-user-detail"></i>
                  <div data-i18n="Employee">Employee</div>
               </a>
               <ul class="menu-sub">
              
              	  <%if(rights_set.contains("addEmployee")  || loginCredentials.getUser_type().equals("Admin")) {%>
						<li class="menu-item"><a href="employee" class="menu-link">
								<div data-i18n="Add Employee">Add Employee</div>
						</a></li>
						<%}if(rights_set.contains("viewEmployee")  || loginCredentials.getUser_type().equals("Admin")) {%>
						<li class="menu-item"><a href="view_employee" class="menu-link">
								<div data-i18n="Employee Details">Employee Details</div>
						</a></li>
						<%} %>
               </ul>
            </li>
         <%} %>
		 	<li class="menu-item">
               <a href="javascript:void(0);" class="menu-link menu-toggle">
                  <i class="menu-icon tf-icons bx bxs-user-detail"></i>
                  <div data-i18n="Attendance">Attendance</div>
               </a>
               <ul class="menu-sub">
              
              	  <li class="menu-item">
                     <a href="attendance" class="menu-link">
                        <div data-i18n="Add Attendance">Add Attendance</div>
                     </a>
                  </li>
                 
                    <li class="menu-item">
                     <a href="get_leaves" class="menu-link">
                        <div data-i18n="View Leaves">View Leaves</div>
                     </a>
                  </li>
                  <%if(loginCredentials.getUser_type().equalsIgnoreCase("Admin")){ %>
                    <li class="menu-item">
                     <a href="salary" class="menu-link">
                        <div data-i18n="Salary">Salary</div>
                     </a>
                  </li>
                  <%} %>
                
               </ul>
            </li>
        
					<li class="menu-item"><a href="javascript:void(0);"
					class="menu-link menu-toggle"><i class="menu-icon tf-icons fa-solid fa-file-signature fs-6"></i>
						<div data-i18n="OffBoarding">OffBoarding</div>
				</a>
					<ul class="menu-sub">
						<li class="menu-item"><a href="resignation" class="menu-link">
								<div data-i18n="Resignation">Resignation</div>
						</a></li>
						
					</ul></li>
		     </ul>
		<!-- </li> -->
         </ul>
        </aside>
          <input type="hidden" id="employee_id" name="employee_id" value="<%= loginCredentials.getEmployee_id()%>">
          <input type="hidden" id="user_type" name="user_type" value="<%= loginCredentials.getUser_type()%>"> 
          
          <%
          	if(rights_set.contains("attendance_approval")){
          %>  
          <input type="hidden" id="attendance_approval" name="attendance_approval" value="attendance_approval"> 
           <%}else{ %>
              <input type="hidden" id="attendance_approval" name="attendance_approval" value=""> 
          <%} %>
                <%
          	if(rights_set.contains("leave_approval")){
          %>  
          <input type="hidden" id="leave_approval" name="leave_approval" value="leave_approval"> 
           <%}else{ %>
              <input type="hidden" id="leave_approval" name="leave_approval" value=""> 
          <%} %>
               
     
