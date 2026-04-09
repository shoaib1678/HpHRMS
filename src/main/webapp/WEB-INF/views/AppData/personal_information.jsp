<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.hp.model.EmployeeDetails"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Personal Information – HRMS</title>
<meta charset="utf-8">
<jsp:include page="css.jsp"></jsp:include>
<style>
/* ═══════════════════════════════════════
   DESIGN SYSTEM — mirrors dashboard
═══════════════════════════════════════ */
:root {
  --navy:       #0b1437;
  --navy2:      #111c44;
  --blue:       #3b6ef8;
  --blue-light: #4d7cfe;
  --teal:       #01c9a0;
  --surface:    #ffffff;
  --bg:         #f0f3fb;
  --border:     #e4e9f5;
  --text:       #0b1437;
  --muted:      #8f9bba;
  --green:      #05cd99;
  --red:        #ee5d50;
  --yellow:     #ffb547;
  --gray:       #a3aed0;

  --r-lg: 20px;
  --r-md: 14px;
  --r-sm: 10px;

  --shadow-sm: 0 2px 12px rgba(11,20,55,0.06);
  --shadow-md: 0 4px 24px rgba(11,20,55,0.10);
  --shadow-lg: 0 8px 40px rgba(59,110,248,0.18);
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
  font-family: 'Plus Jakarta Sans', sans-serif;
  background: var(--bg);
  color: var(--text);
  min-height: 100vh;
  padding-bottom: 90px;
  -webkit-font-smoothing: antialiased;
}

/* ── TOPBAR ── */
.topbar {
  background: var(--navy);
  padding: 0 20px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: sticky;
  top: 0;
  z-index: 200;
  box-shadow: 0 2px 20px rgba(0,0,0,0.25);
}
.topbar-brand {
  display: flex;
  align-items: center;
  gap: 10px;
}
.topbar-back {
  width: 34px; height: 34px;
  background: rgba(255,255,255,0.08);
  border: 1px solid rgba(255,255,255,0.12);
  border-radius: 10px;
  display: flex; align-items: center; justify-content: center;
  cursor: pointer;
  transition: background 0.2s;
  color: #fff;
  font-size: 16px;
  text-decoration: none;
}
.topbar-back:hover { background: rgba(255,255,255,0.15); }
.topbar h4 {
  color: #fff;
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 0.2px;
}


/* ── MAIN ── */
.main-div {
  padding: 18px 16px 10px;
  max-width: 500px;
  margin: 0 auto;
}

/* ── PROFILE HERO ── */
.profile-hero {
  background: linear-gradient(145deg, var(--navy) 0%, #1a2d6d 100%);
  border-radius: var(--r-lg);
  padding: 28px 20px 24px;
  margin-bottom: 16px;
  position: relative;
  overflow: hidden;
  box-shadow: var(--shadow-lg);
  text-align: center;
  animation: fadeSlideDown 0.4s ease both;
}
.profile-hero::before {
  content: '';
  position: absolute;
  top: -60px; right: -60px;
  width: 220px; height: 220px;
  background: radial-gradient(circle, rgba(77,124,254,0.22) 0%, transparent 65%);
  border-radius: 50%;
  pointer-events: none;
}
.profile-hero::after {
  content: '';
  position: absolute;
  bottom: -40px; left: -20px;
  width: 160px; height: 160px;
  background: radial-gradient(circle, rgba(1,201,160,0.15) 0%, transparent 65%);
  border-radius: 50%;
  pointer-events: none;
}
.avatar-wrap {
  position: relative;
  display: inline-block;
  margin-bottom: 14px;
  z-index: 1;
}
.avatar-ring {
  width: 88px; height: 88px;
  border-radius: 26px;
  background: linear-gradient(135deg, var(--blue-light), var(--teal));
  display: flex; align-items: center; justify-content: center;
  font-size: 34px; font-weight: 800; color: #fff;
  box-shadow: 0 6px 24px rgba(59,110,248,0.45);
  margin: 0 auto;
}
.avatar-status {
  position: absolute;
  bottom: -4px; right: -4px;
  width: 20px; height: 20px;
  background: var(--teal);
  border: 3px solid var(--navy);
  border-radius: 50%;
}
.profile-name {
  color: #fff;
  font-size: 18px;
  font-weight: 800;
  letter-spacing: 0.2px;
  position: relative; z-index: 1;
}
.profile-role {
  color: rgba(255,255,255,0.55);
  font-size: 12px;
  font-weight: 500;
  margin-top: 4px;
  position: relative; z-index: 1;
  letter-spacing: 0.3px;
}
.profile-badges {
  display: flex;
  justify-content: center;
  gap: 8px;
  margin-top: 14px;
  position: relative; z-index: 1;
}
.badge-pill {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  padding: 5px 12px;
  border-radius: 20px;
  font-size: 10px;
  font-weight: 700;
  letter-spacing: 0.4px;
  text-transform: uppercase;
}
.badge-active {
  background: rgba(1,201,160,0.18);
  border: 1px solid rgba(1,201,160,0.38);
  color: var(--teal);
}
.badge-id {
  background: rgba(59,110,248,0.18);
  border: 1px solid rgba(59,110,248,0.35);
  color: var(--blue-light);
  font-family: 'JetBrains Mono', monospace;
}

/* ── SECTION HEADER ── */
.section-hd {
  display: flex;
  align-items: center;
  gap: 8px;
  margin: 20px 0 12px;
  animation: fadeSlideDown 0.4s ease 0.1s both;
}
.section-hd-bar {
  width: 4px; height: 18px;
  border-radius: 4px;
  background: linear-gradient(to bottom, var(--blue), var(--teal));
}
.section-hd h3 {
  font-size: 14px;
  font-weight: 700;
  color: var(--text);
  letter-spacing: 0.1px;
}

/* ── INFO CARD ── */
.info-card {
  background: var(--surface);
  border-radius: var(--r-lg);
  overflow: hidden;
  box-shadow: var(--shadow-sm);
  border: 1px solid var(--border);
  animation: fadeSlideDown 0.4s ease 0.15s both;
}

.info-row {
  display: flex;
  align-items: center;
  padding: 15px 16px;
  border-bottom: 1px solid var(--border);
  gap: 14px;
  transition: background 0.15s;
}
.info-row:last-child { border-bottom: none; }
.info-row:hover { background: #f7f9ff; }

.info-icon {
  width: 36px; height: 36px;
  border-radius: 10px;
  display: flex; align-items: center; justify-content: center;
  font-size: 14px;
  flex-shrink: 0;
}
.info-icon.blue   { background: rgba(59,110,248,0.10);  color: var(--blue); }
.info-icon.teal   { background: rgba(1,201,160,0.10);   color: var(--teal); }
.info-icon.yellow { background: rgba(255,181,71,0.12);  color: var(--yellow); }
.info-icon.red    { background: rgba(238,93,80,0.10);   color: var(--red); }
.info-icon.purple { background: rgba(130,100,240,0.10); color: #8264f0; }
.info-icon.green  { background: rgba(5,205,153,0.10);   color: var(--green); }

.info-content { flex: 1; min-width: 0; }
.info-label {
  font-size: 10px;
  font-weight: 700;
  color: var(--muted);
  text-transform: uppercase;
  letter-spacing: 0.7px;
  margin-bottom: 3px;
}
.info-value {
  font-size: 13px;
  font-weight: 600;
  color: var(--text);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.info-value.mono {
  font-family: 'JetBrains Mono', monospace;
  font-size: 12px;
}
.info-value.link {
  color: var(--blue);
}

.info-action {
  width: 28px; height: 28px;
  background: var(--bg);
  border: 1px solid var(--border);
  border-radius: 8px;
  display: flex; align-items: center; justify-content: center;
  cursor: pointer;
  transition: all 0.15s;
  color: var(--muted);
  font-size: 11px;
  flex-shrink: 0;
}
.info-action:hover { background: var(--border); color: var(--blue); }

/* ── STATS STRIP ── */
.stats-strip {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  margin-bottom: 6px;
  animation: fadeSlideDown 0.4s ease 0.08s both;
}
.stat-box {
  background: var(--surface);
  border-radius: var(--r-md);
  padding: 14px 10px;
  text-align: center;
  border: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
  transition: transform 0.2s;
}
.stat-box:hover { transform: translateY(-2px); box-shadow: var(--shadow-md); }
.stat-num {
  font-family: 'JetBrains Mono', monospace;
  font-size: 20px;
  font-weight: 700;
  color: var(--blue);
  line-height: 1;
}
.stat-lbl {
  font-size: 9px;
  font-weight: 700;
  color: var(--muted);
  text-transform: uppercase;
  letter-spacing: 0.6px;
  margin-top: 5px;
}

/* ── DOCUMENT ROW ── */
.doc-card {
  background: var(--surface);
  border-radius: var(--r-lg);
  overflow: hidden;
  box-shadow: var(--shadow-sm);
  border: 1px solid var(--border);
  animation: fadeSlideDown 0.4s ease 0.2s both;
}
.doc-row {
  display: flex;
  align-items: center;
  padding: 14px 16px;
  border-bottom: 1px solid var(--border);
  gap: 12px;
}
.doc-row:last-child { border-bottom: none; }
.doc-icon {
  width: 38px; height: 38px;
  border-radius: 10px;
  background: linear-gradient(135deg, var(--blue), var(--blue-light));
  display: flex; align-items: center; justify-content: center;
  color: #fff;
  font-size: 14px;
  flex-shrink: 0;
}
.doc-icon.teal-grad { background: linear-gradient(135deg, var(--teal), #00b894); }
.doc-icon.red-grad  { background: linear-gradient(135deg, var(--red), #ff6b5e); }
.doc-name {
  font-size: 13px;
  font-weight: 600;
  color: var(--text);
}
.doc-sub {
  font-size: 10px;
  font-weight: 500;
  color: var(--muted);
  margin-top: 2px;
}
.doc-badge {
  margin-left: auto;
  font-size: 10px;
  font-weight: 700;
  padding: 3px 10px;
  border-radius: 20px;
  letter-spacing: 0.3px;
}
.doc-badge.verified {
  background: rgba(5,205,153,0.12);
  color: var(--green);
  border: 1px solid rgba(5,205,153,0.25);
}
.doc-badge.pending {
  background: rgba(255,181,71,0.12);
  color: var(--yellow);
  border: 1px solid rgba(255,181,71,0.25);
}

/* ── BOTTOM NAV ── */

/* ── ANIMATIONS ── */
@keyframes fadeSlideDown {
  from { opacity: 0; transform: translateY(-10px); }
  to   { opacity: 1; transform: translateY(0); }
}

/* ── EDIT MODAL ── */
.modal-overlay {
  display: none;
  position: fixed; inset: 0;
  background: rgba(11,20,55,0.45);
  backdrop-filter: blur(4px);
  z-index: 500;
  align-items: flex-end;
  justify-content: center;
}
.modal-overlay.show { display: flex; }
.modal-sheet {
  background: var(--surface);
  border-radius: 24px 24px 0 0;
  width: 100%; max-width: 500px;
  padding: 0 0 32px;
  box-shadow: 0 -8px 40px rgba(11,20,55,0.2);
  animation: slideUp 0.3s cubic-bezier(.34,1.56,.64,1) both;
}
@keyframes slideUp {
  from { transform: translateY(100%); }
  to   { transform: translateY(0); }
}
.sheet-handle {
  width: 40px; height: 4px;
  background: var(--border);
  border-radius: 4px;
  margin: 14px auto 20px;
}
.sheet-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px 16px;
  border-bottom: 1px solid var(--border);
}
.sheet-title { font-size: 15px; font-weight: 700; color: var(--text); }
.sheet-close {
  width: 32px; height: 32px;
  background: var(--bg);
  border: 1px solid var(--border);
  border-radius: 10px;
  display: flex; align-items: center; justify-content: center;
  cursor: pointer;
  font-size: 14px;
  color: var(--muted);
  transition: all 0.15s;
}
.sheet-close:hover { background: var(--border); color: var(--text); }
.sheet-body { padding: 20px; }

.form-group { margin-bottom: 16px; }
.form-label {
  font-size: 11px;
  font-weight: 700;
  color: var(--muted);
  text-transform: uppercase;
  letter-spacing: 0.6px;
  margin-bottom: 7px;
  display: block;
}
.form-control {
  width: 100%;
  padding: 12px 14px;
  background: var(--bg);
  border: 1.5px solid var(--border);
  border-radius: var(--r-sm);
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 13px;
  font-weight: 500;
  color: var(--text);
  outline: none;
  transition: border-color 0.2s, box-shadow 0.2s;
}
.form-control:focus {
  border-color: var(--blue);
  box-shadow: 0 0 0 3px rgba(59,110,248,0.12);
}
.btn-save {
  width: 100%;
  padding: 14px;
  background: linear-gradient(135deg, var(--blue), var(--blue-light));
  color: #fff;
  border: none;
  border-radius: var(--r-md);
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 14px;
  font-weight: 700;
  cursor: pointer;
  box-shadow: 0 4px 16px rgba(59,110,248,0.35);
  transition: all 0.2s;
  margin-top: 4px;
}
.btn-save:hover { transform: translateY(-2px); box-shadow: 0 6px 22px rgba(59,110,248,0.45); }
.btn-save:active { transform: scale(0.98); }

/* Toast */
.toast-msg {
  position: fixed;
  top: 74px;
  left: 50%; transform: translateX(-50%) translateY(-20px);
  background: var(--navy);
  color: #fff;
  font-size: 13px;
  font-weight: 600;
  padding: 10px 22px;
  border-radius: 20px;
  z-index: 1000;
  opacity: 0;
  transition: all 0.3s;
  white-space: nowrap;
  box-shadow: var(--shadow-md);
}
.toast-msg.show {
  opacity: 1;
  transform: translateX(-50%) translateY(0);
}
</style>
</head>
<%
List<EmployeeDetails> emp =(List<EmployeeDetails>)request.getAttribute("data");
int id = 1000+emp.get(0).getSno();
Date joining = emp.get(0).getJoining_date();
Date dob = emp.get(0).getDob();

Calendar joinCal = Calendar.getInstance();
joinCal.setTime(joining);

Calendar today = Calendar.getInstance();

int years = today.get(Calendar.YEAR) - joinCal.get(Calendar.YEAR);
int months = today.get(Calendar.MONTH) - joinCal.get(Calendar.MONTH);

if (months < 0) {
    years--;
    months += 12;
}
double experience = years + (months / 12.0);

//Round to 1 decimal (optional)
experience = Math.round(experience * 10.0) / 10.0;
SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
String formattedDate = sdf.format(joining);
String formatteddob = sdf.format(dob);

double lc = (double)request.getAttribute("lc");
%>
<body>

<!-- TOPBAR -->
<div class="topbar">
  <div class="topbar-brand">
    <a class="topbar-back" href="emp_dashboard" title="Back">
      <i class="fa fa-arrow-left"></i>
    </a>
    <h4>Personal Information</h4>
  </div>
</div>

<div class="main-div">

  <!-- PROFILE HERO -->
  <div class="profile-hero" style="animation-delay:0s;">
    <div class="avatar-wrap">
      <div class="avatar-ring" id="avatarInitial"><img alt="" src="displaydocument?url=<%=emp.get(0).getProfile_picture()%>" style="height: 88px; width: 88px; object-fit: cover; border-radius: 30px;"></div>
      <div class="avatar-status"></div>
    </div>
    <div class="profile-name" id="displayName"><%=emp.get(0).getFirst_name()+" "+emp.get(0).getLast_name() %></div>
    
    <div class="profile-role" id="displayDesignation"><%=emp.get(0).getDepartment_name() %>- <%=emp.get(0).getDesignation_name() %></div>
    <div class="profile-badges">
      <span class="badge-pill badge-active"><i class="fa fa-circle" style="font-size:7px;"></i> Active</span>
      <span class="badge-pill badge-id" id="displayEmpId">HP-<%=id %></span>
    </div>
  </div>

  <!-- QUICK STATS -->
  <div class="stats-strip">
    <div class="stat-box">
      <div class="stat-num" id="statTenure"><%=experience %></div>
      <div class="stat-lbl">Years</div>
    </div>
    <div class="stat-box">
      <div class="stat-num" id="statLeave"><%=lc%></div>
      <div class="stat-lbl">Leaves Left</div>
    </div>
    <div class="stat-box">
      <div class="stat-num" id="statPresent">94%</div>
      <div class="stat-lbl">Attendance</div>
    </div>
  </div>

  <!-- PERSONAL DETAILS -->
  <div class="section-hd">
    <div class="section-hd-bar"></div>
    <h3>Personal Details</h3>
  </div>

  <div class="info-card">
    <div class="info-row" onclick="openEdit('fullname')">
      <div class="info-icon blue"><i class="fa fa-user"></i></div>
      <div class="info-content">
        <div class="info-label">Full Name</div>
        <div class="info-value" id="val-fullname"><%=emp.get(0).getFirst_name()+" "+emp.get(0).getLast_name() %></div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div>
    <div class="info-row" onclick="openEdit('dob')">
      <div class="info-icon yellow"><i class="fa fa-birthday-cake"></i></div>
      <div class="info-content">
        <div class="info-label">Date of Birth</div>
        <div class="info-value mono" id="val-dob"><%=formatteddob %></div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div>
    <div class="info-row" onclick="openEdit('gender')">
      <div class="info-icon purple"><i class="fa fa-venus-mars"></i></div>
      <div class="info-content">
        <div class="info-label">Gender</div>
        <div class="info-value" id="val-gender"><%=emp.get(0).getGender() %></div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div>
    <div class="info-row" onclick="openEdit('marital')">
      <div class="info-icon red"><i class="fa fa-heart"></i></div>
      <div class="info-content">
        <div class="info-label">Marital Status</div>
        <div class="info-value" id="val-marital">Single</div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div>
    <!-- <div class="info-row" onclick="openEdit('blood')">
      <div class="info-icon red"><i class="fa fa-tint"></i></div>
      <div class="info-content">
        <div class="info-label">Blood Group</div>
        <div class="info-value mono" id="val-blood">O+</div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div> -->
  </div>

  <!-- CONTACT DETAILS -->
  <div class="section-hd" style="animation-delay:0.12s;">
    <div class="section-hd-bar"></div>
    <h3>Contact Details</h3>
  </div>

  <div class="info-card" style="animation-delay:0.18s;">
    <div class="info-row" onclick="openEdit('phone')">
      <div class="info-icon teal"><i class="fa fa-phone"></i></div>
      <div class="info-content">
        <div class="info-label">Phone Number</div>
        <div class="info-value mono" id="val-phone"><%=emp.get(0).getContact_number() %></div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div>
    <div class="info-row" onclick="openEdit('email')">
      <div class="info-icon blue"><i class="fa fa-envelope"></i></div>
      <div class="info-content">
        <div class="info-label">Email Address</div>
        <div class="info-value link" id="val-email"><%=emp.get(0).getEmail() %></div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div>
    <div class="info-row" onclick="openEdit('address')">
      <div class="info-icon green"><i class="fa fa-map-marker"></i></div>
      <div class="info-content">
        <div class="info-label">Address</div>
        <div class="info-value" id="val-address"><%=emp.get(0).getAddress() %></div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div>
    <!-- <div class="info-row" onclick="openEdit('emergency')">
      <div class="info-icon red"><i class="fa fa-phone-square"></i></div>
      <div class="info-content">
        <div class="info-label">Emergency Contact</div>
        <div class="info-value mono" id="val-emergency">+91 91234 56789</div>
      </div>
      <div class="info-action"><i class="fa fa-pencil"></i></div>
    </div> -->
  </div>

  <!-- EMPLOYMENT DETAILS -->
  <div class="section-hd" style="animation-delay:0.14s;">
    <div class="section-hd-bar"></div>
    <h3>Employment Details</h3>
  </div>

  <div class="info-card" style="animation-delay:0.22s;">
    <div class="info-row">
      <div class="info-icon blue"><i class="fa fa-id-badge"></i></div>
      <div class="info-content">
        <div class="info-label">Employee ID</div>
        <div class="info-value mono" id="val-empid">EMP-<%=id %></div>
      </div>
    </div>
    <div class="info-row">
      <div class="info-icon teal"><i class="fa fa-briefcase"></i></div>
      <div class="info-content">
        <div class="info-label">Designation</div>
        <div class="info-value" id="val-designation"><%=emp.get(0).getDesignation_name() %></div>
      </div>
    </div>
    <div class="info-row">
      <div class="info-icon purple"><i class="fa fa-building"></i></div>
      <div class="info-content">
        <div class="info-label">Department</div>
        <div class="info-value" id="val-department"><%=emp.get(0).getDepartment_name()%></div>
      </div>
    </div>
    <div class="info-row">
      <div class="info-icon yellow"><i class="fa fa-calendar"></i></div>
      <div class="info-content">
        <div class="info-label">Date of Joining</div>
        <div class="info-value mono" id="val-doj"><%=formattedDate %></div>
      </div>
    </div>
    <!-- <div class="info-row">
      <div class="info-icon green"><i class="fa fa-users"></i></div>
      <div class="info-content">
        <div class="info-label">Reporting Manager</div>
        <div class="info-value" id="val-manager">Rahul Sharma</div>
      </div>
    </div> -->
    <div class="info-row">
      <div class="info-icon blue"><i class="fa fa-clock-o"></i></div>
      <div class="info-content">
        <div class="info-label">Shift</div>
        <div class="info-value mono" id="val-shift">10:00 – 19:00</div>
      </div>
    </div>
  </div>

  <!-- DOCUMENTS -->
  <!-- <div class="section-hd" style="animation-delay:0.16s;">
    <div class="section-hd-bar"></div>
    <h3>Documents</h3>
  </div>

  <div class="doc-card" style="animation-delay:0.26s; margin-bottom:10px;">
    <div class="doc-row">
      <div class="doc-icon"><i class="fa fa-id-card"></i></div>
      <div>
        <div class="doc-name">Aadhaar Card</div>
        <div class="doc-sub">xxxx xxxx 4321</div>
      </div>
      <span class="doc-badge verified">Verified</span>
    </div>
    <div class="doc-row">
      <div class="doc-icon teal-grad"><i class="fa fa-credit-card"></i></div>
      <div>
        <div class="doc-name">PAN Card</div>
        <div class="doc-sub">ABCDE1234F</div>
      </div>
      <span class="doc-badge verified">Verified</span>
    </div>
    <div class="doc-row">
      <div class="doc-icon red-grad"><i class="fa fa-university"></i></div>
      <div>
        <div class="doc-name">Bank Account</div>
        <div class="doc-sub">xxxx xxxx 7890 · HDFC</div>
      </div>
      <span class="doc-badge pending">Pending</span>
    </div>
  </div> -->

</div><!-- /main-div -->

<!-- BOTTOM NAV -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- EDIT BOTTOM SHEET -->
<div class="modal-overlay" id="editModal" onclick="closeModal(event)">
  <div class="modal-sheet" onclick="event.stopPropagation()">
    <div class="sheet-handle"></div>
    <div class="sheet-header">
      <span class="sheet-title" id="sheetTitle">Edit Field</span>
      <div class="sheet-close" onclick="closeSheet()"><i class="fa fa-times"></i></div>
    </div>
    <div class="sheet-body">
      <div class="form-group">
        <label class="form-label" id="sheetLabel">Value</label>
        <input class="form-control" id="sheetInput" type="text" placeholder="Enter value...">
      </div>
      <button class="btn-save" onclick="saveField()">
        <i class="fa fa-check" style="margin-right:6px;"></i>Save Changes
      </button>
    </div>
  </div>
</div>

<!-- TOAST -->
<div class="toast-msg" id="toastMsg">✓ Updated successfully</div>

<script>
/* LIVE CLOCK */
function updateClock() {
  var now = new Date();
  var h = now.getHours().toString().padStart(2,'0');
  var m = now.getMinutes().toString().padStart(2,'0');
  var s = now.getSeconds().toString().padStart(2,'0');
  document.getElementById('liveClock').textContent = h+':'+m+':'+s;
}
updateClock();
setInterval(updateClock, 1000);

/* AVATAR INITIALS */
/* (function(){
  var name = document.getElementById('displayName').textContent;
  var parts = name.trim().split(' ');
  var initials = parts.length > 1 ? parts[0][0]+parts[parts.length-1][0] : parts[0].substring(0,2);
  document.getElementById('avatarInitial').textContent = initials.toUpperCase();
})(); */

/* EDIT SHEET */
var currentField = null;
var fieldMeta = {
  fullname:  { label: 'Full Name',          type: 'text',  valId: 'val-fullname' },
  dob:       { label: 'Date of Birth',       type: 'date',  valId: 'val-dob' },
  gender:    { label: 'Gender',              type: 'text',  valId: 'val-gender' },
  marital:   { label: 'Marital Status',      type: 'text',  valId: 'val-marital' },
  blood:     { label: 'Blood Group',         type: 'text',  valId: 'val-blood' },
  phone:     { label: 'Phone Number',        type: 'tel',   valId: 'val-phone' },
  email:     { label: 'Email Address',       type: 'email', valId: 'val-email' },
  address:   { label: 'Address',             type: 'text',  valId: 'val-address' },
  emergency: { label: 'Emergency Contact',   type: 'tel',   valId: 'val-emergency' },
};

function openEdit(field) {
  currentField = field;
  var meta = fieldMeta[field];
  document.getElementById('sheetTitle').textContent = 'Edit ' + meta.label;
  document.getElementById('sheetLabel').textContent = meta.label;
  var inp = document.getElementById('sheetInput');
  inp.type = meta.type;
  inp.value = document.getElementById(meta.valId).textContent;
  document.getElementById('editModal').classList.add('show');
  setTimeout(function(){ inp.focus(); }, 300);
}

function closeSheet() {
  document.getElementById('editModal').classList.remove('show');
  currentField = null;
}

function closeModal(e) {
  if (e.target === document.getElementById('editModal')) closeSheet();
}

function saveField() {
  if (!currentField) return;
  var meta = fieldMeta[currentField];
  var val  = document.getElementById('sheetInput').value.trim();
  if (!val) return;
  document.getElementById(meta.valId).textContent = val;

  // Update hero name / emp id if relevant
  if (currentField === 'fullname') {
    document.getElementById('displayName').textContent = val;
    var parts = val.trim().split(' ');
    var initials = parts.length > 1 ? parts[0][0]+parts[parts.length-1][0] : parts[0].substring(0,2);
    document.getElementById('avatarInitial').textContent = initials.toUpperCase();
  }

  closeSheet();
  showToast('✓ ' + meta.label + ' updated');
}

function showToast(msg) {
  var t = document.getElementById('toastMsg');
  t.textContent = msg;
  t.classList.add('show');
  setTimeout(function(){ t.classList.remove('show'); }, 2200);
}
</script>
</body>
</html>