<%@page import="com.hp.model.EmployeeDetails"%>
<%@page import="java.util.List"%>
<%

    EmployeeDetails emp = (EmployeeDetails) session.getAttribute("empDetails"); 
	String designation = (String) session.getAttribute("designation"); 
     %>
     <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="navbar-nav align-items-center">
              <a class="nav-link style-switcher-toggle hide-arrow" href="javascript:void(0);">
                <i class="bx bx-sm"></i>
              </a>
            </div>

            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                    <%
                    	if(emp != null){
                    %>
                      <img src="displaydocument?url=<%= emp.getProfile_picture() %>" alt class="w-px-40 h-px-40 rounded-circle" /> 
                    <%}else{ %>
                   		 <img src="assets/img/hlogo.png" alt class="w-px-40 h-px-40 rounded-circle" /> 
                    <%} %>
                    
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                                <%
                    	if(emp != null){
                    %>
                          <img src="displaydocument?url=<%=  emp.getProfile_picture() %>"  alt class="w-px-40 h-px-40 rounded-circle" />
                     <%}else{ %>
                   		 <img src="assets/img/hlogo.png" alt class="w-px-40 h-px-40 rounded-circle" /> 
                    <%} %>
                       
                            </div>
                          </div>
                          <div class="flex-grow-1">
                                      <%
                    	if(emp != null){
                    %>
                                  <span class="fw-semibold d-block"><%= emp.getFirst_name() %></span> 
                    <%}else{ %>
                    	 <span class="fw-semibold d-block">Halicon Publication</span> 
                    <%} %>
                	                        <%
                    	if(designation != null){
                    %>
                               <small class="text-muted"><%= designation %></small> 
                    <%}else{ %>
                    	<small class="text-muted">Admin</small> 
                    <%} %>
                         
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="changepassword">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">Change Password</span>
                      </a>
                    </li>
                   <!--  <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-cog me-2"></i>
                        <span class="align-middle">Settings</span>
                      </a>
                    </li> -->
                    <!-- <li>
                      <a class="dropdown-item" href="#">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                          <span class="flex-grow-1 align-middle">Billing</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                      </a>
                    </li> -->
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="logout">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>