<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<%@page import="com.hp.model.LoginCredentials"%>
<html lang="en">
<head>
<title>HRMS Dashboard</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="apple-mobile-web-app-title" content="HRMS">
<link rel="apple-touch-icon" href="assets/img/goldenlogo1.png">
<link rel="apple-touch-icon" sizes="180x180" href="assets/img/goldenlogo1.png">
<link rel="apple-touch-icon" sizes="152x152" href="assets/img/goldenlogo1.png">
<link rel="apple-touch-icon" sizes="120x120" href="assets/img/goldenlogo1.png">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="assets/AppData/css/bootstrap.css" rel="stylesheet">
<link href="assets/AppData/css/style.css" rel="stylesheet">
<link href="assets/AppData/css/calender.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">

<%
LoginCredentials lg = (LoginCredentials)session.getAttribute("loginData");
%>

<style>
/* ═══════════════════════════════════════
   DESIGN SYSTEM
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
.topbar-logo {
  width: 34px; height: 34px;
  background: linear-gradient(135deg, var(--blue), var(--teal));
  border-radius: 10px;
  display: flex; align-items: center; justify-content: center;
}
.topbar-logo svg { width: 18px; height: 18px; fill: #fff; }
.topbar h4 {
  color: #fff;
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 0.2px;
}
.topbar-time {
  font-family: 'JetBrains Mono', monospace;
  font-size: 11px;
  color: var(--muted);
  background: rgba(255,255,255,0.05);
  border: 1px solid rgba(255,255,255,0.08);
  padding: 5px 10px;
  border-radius: 20px;
  letter-spacing: 0.5px;
}

/* ── SCROLL WRAPPER ── */
.main-div {
  padding: 18px 16px 10px;
  max-width: 500px;
  margin: 0 auto;
}

/* ── HERO CARD ── */
.hero-card {
  background: linear-gradient(145deg, var(--navy) 0%, #1a2d6d 100%);
  border-radius: var(--r-lg);
  padding: 20px;
  margin-bottom: 16px;
  position: relative;
  overflow: hidden;
  box-shadow: var(--shadow-lg);
  animation: fadeSlideDown 0.5s ease both;
}
.hero-card::before {
  content: '';
  position: absolute;
  top: -60px; right: -60px;
  width: 200px; height: 200px;
  background: radial-gradient(circle, rgba(77,124,254,0.25) 0%, transparent 65%);
  border-radius: 50%;
  pointer-events: none;
}
.hero-card::after {
  content: '';
  position: absolute;
  bottom: -30px; left: 20px;
  width: 120px; height: 120px;
  background: radial-gradient(circle, rgba(1,201,160,0.15) 0%, transparent 65%);
  border-radius: 50%;
  pointer-events: none;
}

.hero-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
  position: relative; z-index: 1;
}
.emp-row {
  display: flex;
  align-items: center;
  gap: 12px;
}
.emp-avatar {
  width: 46px; height: 46px;
  border-radius: 14px;
  background: linear-gradient(135deg, var(--blue-light), var(--teal));
  display: flex; align-items: center; justify-content: center;
  font-size: 18px; font-weight: 800; color: #fff;
  flex-shrink: 0;
  box-shadow: 0 4px 14px rgba(59,110,248,0.4);
}
.emp-name {
  color: #fff;
  font-size: 15px;
  font-weight: 700;
  line-height: 1.2;
}
.emp-badge {
  display: inline-block;
  margin-top: 4px;
  background: rgba(1,201,160,0.2);
  border: 1px solid rgba(1,201,160,0.4);
  color: var(--teal);
  font-size: 10px;
  font-weight: 600;
  padding: 2px 8px;
  border-radius: 20px;
  letter-spacing: 0.4px;
}

/* Clock Buttons */
.clock-group { display: flex; gap: 8px; }
.btn-clock {
  padding: 10px 16px;
  border: none;
  border-radius: 12px;
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 12px;
  font-weight: 700;
  cursor: pointer;
  transition: all 0.2s cubic-bezier(.34,1.56,.64,1);
  display: flex; align-items: center; gap: 6px;
  letter-spacing: 0.2px;
}
.btn-clock:active { transform: scale(0.95); }
.btn-clock-in {
  background: linear-gradient(135deg, var(--teal), #00a882);
  color: #fff;
  box-shadow: 0 4px 16px rgba(1,201,160,0.45);
}
.btn-clock-in:hover { transform: translateY(-2px); box-shadow: 0 6px 22px rgba(1,201,160,0.55); }
.btn-clock-out {
  background: rgba(238,93,80,0.12);
  color: #ff7b6e;
  border: 1px solid rgba(238,93,80,0.25);
}
.btn-clock-out:hover { background: rgba(238,93,80,0.22); transform: translateY(-1px); }

/* Presence Stats */
.presence-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 8px;
  position: relative; z-index: 1;
}
.presence-pill {
  background: rgba(255,255,255,0.06);
  border: 1px solid rgba(255,255,255,0.08);
  border-radius: 14px;
  padding: 12px 6px 10px;
  text-align: center;
  transition: background 0.2s;
}
.presence-pill:hover { background: rgba(255,255,255,0.1); }
.pill-icon {
  width: 28px; height: 28px;
  border-radius: 8px;
  margin: 0 auto 8px;
  display: flex; align-items: center; justify-content: center;
  font-size: 13px;
}
.pill-icon.green  { background: rgba(5,205,153,0.2);  color: #05cd99; }
.pill-icon.red    { background: rgba(238,93,80,0.2);   color: #ee5d50; }
.pill-icon.gray   { background: rgba(163,174,208,0.2); color: #a3aed0; }
.pill-icon.yellow { background: rgba(255,181,71,0.2);  color: #ffb547; }
.pill-count {
  font-family: 'JetBrains Mono', monospace;
  font-size: 22px;
  font-weight: 600;
  color: #fff;
  line-height: 1;
}
.pill-label {
  font-size: 9px;
  color: rgba(255,255,255,0.4);
  margin-top: 4px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.6px;
}

/* ── SECTION HEADER ── */
.section-hd {
  display: flex;
  align-items: center;
  gap: 8px;
  margin: 20px 0 12px;
  animation: fadeSlideDown 0.5s ease 0.1s both;
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

/* ── LEAVE TABLE CARD ── */
.leave-card {
  background: var(--surface);
  border-radius: var(--r-lg);
  overflow: hidden;
  box-shadow: var(--shadow-sm);
  border: 1px solid var(--border);
  animation: fadeSlideDown 0.5s ease 0.15s both;
}
.leave-card table {
  width: 100%;
  border-collapse: collapse;
}
.leave-card thead tr {
  background: linear-gradient(90deg, var(--navy) 0%, #1a2d6d 100%);
}
.leave-card thead th {
  color: rgba(255,255,255,0.7);
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.8px;
  padding: 12px 16px;
  text-align: left;
}
.leave-card thead th:not(:first-child) { text-align: center; }
.leave-card tbody tr {
  border-bottom: 1px solid var(--border);
  transition: background 0.15s;
}
.leave-card tbody tr:last-child { border-bottom: none; }
.leave-card tbody tr:hover { background: #f7f9ff; }
.leave-card tbody td {
  padding: 13px 16px;
  font-size: 13px;
  font-weight: 500;
  color: var(--text);
}
.leave-card tbody td:not(:first-child) {
  text-align: center;
  font-family: 'JetBrains Mono', monospace;
  font-size: 13px;
}
.leave-type-dot {
  display: inline-flex; align-items: center; gap: 8px;
}
.leave-type-dot::before {
  content: '';
  width: 8px; height: 8px;
  border-radius: 50%;
  flex-shrink: 0;
}
.leave-type-dot.casual::before  { background: var(--blue); }
.leave-type-dot.sick::before    { background: var(--red); }
.leave-type-dot.earned::before  { background: var(--teal); }
.remaining-chip {
  display: inline-block;
  background: linear-gradient(135deg, var(--blue), var(--blue-light));
  color: #fff;
  font-size: 12px;
  font-weight: 700;
  padding: 3px 10px;
  border-radius: 20px;
  font-family: 'JetBrains Mono', monospace;
}

/* ── CALENDAR CARD ── */
.cal-card {
  background: var(--surface);
  border-radius: var(--r-lg);
  overflow: hidden;
  box-shadow: var(--shadow-sm);
  border: 1px solid var(--border);
  margin-top: 6px;
  animation: fadeSlideDown 0.5s ease 0.2s both;
}
.cal-header {
  background: linear-gradient(90deg, var(--navy) 0%, #1a2d6d 100%);
  padding: 14px 16px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
#monthAndYear {
  font-family: 'JetBrains Mono', monospace;
  font-size: 14px;
  font-weight: 600;
  color: #fff;
  letter-spacing: 0.5px;
}
.cal-nav-btns { display: flex; gap: 6px; }
.cal-nav-btn {
  width: 30px; height: 30px;
  background: rgba(255,255,255,0.1);
  border: 1px solid rgba(255,255,255,0.15);
  border-radius: 8px;
  color: #fff;
  font-size: 18px;
  cursor: pointer;
  display: flex; align-items: center; justify-content: center;
  transition: all 0.15s;
  line-height: 1;
}
.cal-nav-btn:hover { background: rgba(255,255,255,0.2); transform: scale(1.05); }
.cal-body-wrap { padding: 14px 12px; }

/* Override calendar.css for our design */
.table-calendar {
  width: 100% !important;
  border-collapse: separate !important;
  border-spacing: 3px !important;
}
.table-calendar thead th {
  font-size: 10px !important;
  font-weight: 700 !important;
  color: var(--muted) !important;
  text-align: center !important;
  padding: 4px 0 8px !important;
  text-transform: uppercase !important;
  letter-spacing: 0.6px !important;
  background: transparent !important;
  border: none !important;
}
.table-calendar tbody td {
  text-align: center !important;
  padding: 7px 2px !important;
  font-size: 12px !important;
  font-weight: 600 !important;
  border-radius: 8px !important;
  cursor: default !important;
  transition: all 0.15s !important;
  border: none !important;
  min-width: 34px;
}
.table-calendar tbody td[data-date] { cursor: pointer !important; }
.table-calendar tbody td[data-date]:hover { background: var(--bg) !important; }

/* Calendar Legend */
.cal-legend {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
  padding: 10px 14px 14px;
  border-top: 1px solid var(--border);
}
.legend-item {
  display: flex; align-items: center; gap: 5px;
  font-size: 10px; font-weight: 600; color: var(--muted);
  text-transform: uppercase; letter-spacing: 0.4px;
}
.legend-dot {
  width: 10px; height: 10px;
  border-radius: 3px;
}

/* ── BOTTOM NAV ── */

/* .menu_item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  font-size: 10px;
  font-weight: 600;
  color: var(--muted);
  cursor: pointer;
  padding: 8px 16px;
  border-radius: 12px;
  transition: all 0.2s;
  letter-spacing: 0.2px;
  flex: 1;
  text-transform: uppercase;
}
.menu_item:hover { color: var(--blue); background: rgba(59,110,248,0.06); }
.menu_item.active { color: var(--blue); }
.menu_item img {
  width: 22px; height: 22px;
  opacity: 0.5;
  transition: opacity 0.2s;
}
.menu_item:hover img, .menu_item.active img { opacity: 1; } */

/* ── ACCOUNT POPUP ── */
.account-overlay {
  display: none;
  position: fixed; inset: 0;
  z-index: 9998;
  background: rgba(11,20,55,0.2);
  backdrop-filter: blur(2px);
}
.account-overlay.show { display: block; }

.account-popup {
  display: none;
  position: fixed;
  bottom: 78px;
  right: 12px;
  width: 220px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 16px 16px 4px 16px;
  box-shadow: var(--shadow-md);
  z-index: 9999;
  padding: 8px;
  animation: popUp 0.2s cubic-bezier(.34,1.56,.64,1) both;
}
.account-popup.show { display: block; }

@keyframes popUp {
  from { opacity: 0; transform: translateY(12px) scale(0.95); }
  to   { opacity: 1; transform: translateY(0) scale(1); }
}
.account-popup ul { list-style: none; padding: 0; margin: 0 0 8px 0; }
.account-popup ul li a {
  display: flex; align-items: center; gap: 10px;
  padding: 11px 12px;
  text-decoration: none;
  color: var(--text);
  font-size: 13px;
  font-weight: 500;
  border-radius: 10px;
  transition: background 0.15s;
}
.account-popup ul li a:hover { background: var(--bg); }
.account-popup ul li a .fa {
  width: 28px; height: 28px;
  display: flex; align-items: center; justify-content: center;
  background: rgba(59,110,248,0.08);
  color: var(--blue);
  border-radius: 8px;
  font-size: 12px;
}
.btn-logout {
  display: flex; align-items: center; justify-content: center; gap: 8px;
  width: 100%;
  padding: 11px;
  background: linear-gradient(135deg, var(--red), #ff6b5e);
  color: #fff;
  border: none;
  border-radius: 10px;
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 13px;
  font-weight: 700;
  cursor: pointer;
  text-decoration: none;
  transition: all 0.2s;
  box-shadow: 0 4px 12px rgba(238,93,80,0.3);
}
.btn-logout:hover { transform: translateY(-1px); box-shadow: 0 6px 16px rgba(238,93,80,0.4); color: #fff; }

/* ── MODAL ── */
.modal-content {
  border-radius: var(--r-lg) !important;
  border: none !important;
  box-shadow: var(--shadow-lg) !important;
  overflow: hidden;
}
.modal-header {
  background: linear-gradient(90deg, var(--navy), #1a2d6d);
  border-bottom: none !important;
  padding: 16px 20px !important;
}
.modal-title { color: #fff !important; font-size: 15px !important; font-weight: 700 !important; }
.btn-close { filter: brightness(0) invert(1) !important; }
.modal-body {
  padding: 24px 20px !important;
  text-align: center;
}
.text-green { color: var(--green) !important; }

/* ── ANIMATIONS ── */
@keyframes fadeSlideDown {
  from { opacity: 0; transform: translateY(-12px); }
  to   { opacity: 1; transform: translateY(0); }
}

/* ── LIVE CLOCK ── */
#liveClock { min-width: 70px; text-align: right; }

.error { color: red !important; }

/* Hide default calendar container styles */
.container-calendar { background: transparent !important; padding: 0 !important; box-shadow: none !important; }
.button-container-calendar { display: none !important; }
.footer-container-calendar { display: none !important; }
#monthAndYear { transform: none !important; }
</style>
</head>

<body>

<!-- ══ TOPBAR ══ -->
<div class="topbar">
  <div class="topbar-brand">
    <div class="topbar-logo">
      <svg viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/></svg>
    </div>
    <h4>Dashboard</h4>
  </div>
  <div class="topbar-time" id="liveClock">--:--:--</div>
</div>

<section class="main-page">
<div class="main-div">

  <!-- ══ HERO CARD ══ -->
  <div class="hero-card">
    <div class="hero-top">
      <div class="emp-row">
        <div class="emp-avatar" id="avatarInitial">SJ</div>
        <div>
          <div class="emp-name"><%=lg.getEmployee_name() %></div>
          <span class="emp-badge">● Active</span>
        </div>
      </div>
      <div class="clock-group">
        <button class="btn-clock btn-clock-in" id="clockin">
          <i class="fa fa-sign-in"></i> Clock In
        </button>
        <button class="btn-clock btn-clock-out" id="clockout" style="display:none;">
          <i class="fa fa-sign-out"></i> Clock Out
        </button>
      </div>
    </div>

    <!-- Presence Stats -->
    <div class="presence-grid">
      <div class="presence-pill">
        <div class="pill-icon green"><i class="fa fa-check"></i></div>
        <div class="pill-count" id="fullDayCount">0</div>
        <div class="pill-label">Present</div>
      </div>
      <div class="presence-pill">
        <div class="pill-icon red"><i class="fa fa-times"></i></div>
        <div class="pill-count" id="absentCount">0</div>
        <div class="pill-label">Absent</div>
      </div>
      <div class="presence-pill">
        <div class="pill-icon gray"><i class="fa fa-umbrella"></i></div>
        <div class="pill-count" id="leaveCount">0</div>
        <div class="pill-label">Leave</div>
      </div>
      <div class="presence-pill">
        <div class="pill-icon yellow"><i class="fa fa-adjust"></i></div>
        <div class="pill-count" id="halfDayCount">0</div>
        <div class="pill-label">Half Day</div>
      </div>
    </div>
  </div>

  <!-- ══ LEAVE DETAILS ══ -->
  <div class="section-hd">
    <div class="section-hd-bar"></div>
    <h3>Leave Details</h3>
  </div>

  <div class="leave-card">
    <table id="leaveTable">
      <thead>
        <tr>
          <th>Leave Type</th>
          <th>Total</th>
          <th>Remaining</th>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>

  <!-- ══ ATTENDANCE CALENDAR ══ -->
  <div class="section-hd" style="margin-top:20px;">
    <div class="section-hd-bar"></div>
    <h3>Your Attendance</h3>
  </div>

  <div class="cal-card">
    <div class="cal-header">
      <h3 id="monthAndYear"></h3>
      <div class="cal-nav-btns">
        <button class="cal-nav-btn" onclick="previous()">&#8249;</button>
        <button class="cal-nav-btn" onclick="next()">&#8250;</button>
      </div>
    </div>

    <div class="cal-body-wrap">
      <div class="container-calendar">
        <table class="table-calendar" id="calendar" data-lang="en">
          <thead id="thead-month"></thead>
          <tbody id="calendar-body"></tbody>
        </table>
        <div class="footer-container-calendar">
          <select id="month" onchange="jump()" style="display:none;">
            <option value=0>Jan</option><option value=1>Feb</option>
            <option value=2>Mar</option><option value=3>Apr</option>
            <option value=4>May</option><option value=5>Jun</option>
            <option value=6>Jul</option><option value=7>Aug</option>
            <option value=8>Sep</option><option value=9>Oct</option>
            <option value=10>Nov</option><option value=11>Dec</option>
          </select>
          <select id="year" onchange="jump()" style="display:none;"></select>
        </div>
      </div>
    </div>

    <!-- Legend -->
    <div class="cal-legend">
      <div class="legend-item"><div class="legend-dot" style="background:#05cd99;"></div>Present</div>
      <div class="legend-item"><div class="legend-dot" style="background:#ee5d50;"></div>Absent</div>
      <div class="legend-item"><div class="legend-dot" style="background:#ffb547;"></div>Half Day</div>
      <div class="legend-item"><div class="legend-dot" style="background:#a3aed0;"></div>Leave</div>
    </div>
  </div>

</div><!-- /main-div -->
</section>

<!-- Hidden Fields -->
<input type="hidden" id="latitude"  name="latitude"  value="0">
<input type="hidden" id="longitude" name="longitude" value="0">
<jsp:include page="footer.jsp"></jsp:include>

<!-- Modal -->
<div class="modal fade" id="popup1" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Attendance Confirmation</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modalBodyContent"></div>
    </div>
  </div>
</div>

<!-- JS Libraries -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script src="assets/AppData/js/calender.js"></script>

<script type="text/javascript">
/* ═══════════════════════════════════════
   LIVE CLOCK
═══════════════════════════════════════ */
function updateClock() {
	  var now = new Date();

	  var h = now.getHours().toString().padStart(2,'0');
	  var m = now.getMinutes().toString().padStart(2,'0');
	  var s = now.getSeconds().toString().padStart(2,'0');

	  document.getElementById('liveClock').textContent = h + ':' + m + ':' + s;
	}

	updateClock();
	setInterval(updateClock, 1000);

/* ═══════════════════════════════════════
   AVATAR INITIAL FROM NAME
═══════════════════════════════════════ */
(function(){
  var name = "<%=lg.getEmployee_name()%>";
  if(name) {
    var parts = name.trim().split(' ');
    var initials = parts.length > 1
      ? parts[0][0] + parts[parts.length-1][0]
      : parts[0].substring(0,2);
    document.getElementById('avatarInitial').textContent = initials.toUpperCase();
  }
})();

/* ═══════════════════════════════════════
   LEAVE TABLE — styled rows
═══════════════════════════════════════ */
var leaveTypeClasses = { 0: 'casual', 1: 'sick', 2: 'earned' };

/* Override getRemainingLeave to inject styled rows */
function getRemainingLeave(){
  var formData = new FormData();
  formData.append("employee_id", employee_id);
  $.ajax({
    url: "get_remaining",
    type: "POST",
    data: formData,
    processData: false,
    contentType: false,
    success: function(data) {
      if(data['status'] === "Success") {
        var tbody = $("#leaveTable tbody");
        tbody.empty();
        var idx = 0;
        $.each(data.data, function(index, item) {
          if(item.leave_name != "Short Leave") {
            var cls = leaveTypeClasses[idx] || 'casual';
            var row = "<tr>" +
              "<td><span class='leave-type-dot " + cls + "'>" + item.leave_name + "</span></td>" +
              "<td><span style='font-family:JetBrains Mono,monospace;font-weight:600;'>" + item.total_leaves + "</span></td>" +
              "<td><span class='remaining-chip'>" + item.remaining_leave + "</span></td>" +
              "</tr>";
            tbody.append(row);
            idx++;
          }
        });
      }
    },
    error: function(err) { console.error("Error:", err); }
  });
}

/* ═══════════════════════════════════════
   SAME JS LOGIC — UNCHANGED
═══════════════════════════════════════ */
let authentication_id = $("#authentication_id").val();
let user_type         = $("#user_type").val();
let employee_id       = $("#employee_id").val();
let locationFetched   = false;

function getLocation(callback) {
  if (!navigator.geolocation) { alert("Geolocation is not supported by this browser."); return; }
  navigator.geolocation.getCurrentPosition(
    function(position) {
      const lat = position.coords.latitude;
      const lon = position.coords.longitude;
      document.getElementById("latitude").value  = lat;
      document.getElementById("longitude").value = lon;
      console.log("Latitude=" + lat);
      console.log("Longitude=" + lon);
      locationFetched = true;
      if (callback) callback(lat, lon);
    },
    function(error) { alert("Location access denied or failed."); console.error(error); },
    { enableHighAccuracy: true, timeout: 10000, maximumAge: 0 }
  );
}

getLocation();

$("#clockin").click(function() {
  const latitude  = $("#latitude").val();
  const longitude = $("#longitude").val();
  if (!latitude || !longitude || latitude == "" || longitude == "") {
    alert("Fetching your location, please wait...");
    getLocation(function(lat, lon) { sendAttendance(lat, lon); });
    return;
  }
  sendAttendance(latitude, longitude);
});

function sendAttendance(lat, lon) {
  if (!lat || !lon || lat == 0.0 || lon == 0.0) {
    alert("Unable to fetch location. Please enable GPS and try again.");
    return;
  }
  var obj = {};
  obj.employee_id       = employee_id;
  obj.attendance_date   = new Date();
  obj.user_type         = user_type;
  obj.lat               = parseFloat(lat);
  obj.lon               = parseFloat(lon);
  obj.authentication_id = authentication_id;
  obj.attendance_type   = 1;
  $.ajax({
    url: 'add_attendance', type: 'post', dataType: 'JSON',
    data: JSON.stringify(obj), contentType: "application/json",
    success: function(data) {
      var modalBody = $("#modalBodyContent");
      if (data['status'] == 'Success') {
        modalBody.html('<h5 class="text-green text-center">' + data['message'] + '</h5>');
        $('#popup1').modal('show');
        setTimeout(function() { location.reload(); }, 2000);
      } else {
        modalBody.html('<h5 style="color:#ee5d50;text-align:center;">' + data['message'] + '</h5>');
        $('#popup1').modal('show');
      }
    }
  });
}

var today        = new Date();
var currentMonth = today.getMonth();
var currentYear  = today.getFullYear();
var mm           = currentMonth + 1;

getcalanderdata(mm, currentYear);
getRemainingLeave();
earnLeave();

function next() {
  currentYear  = (currentMonth === 11) ? currentYear + 1 : currentYear;
  currentMonth = (currentMonth + 1) % 12;
  var mm = parseInt(currentMonth) + 1;
  getcalanderdata(mm, currentYear);
  showCalendar(currentMonth, currentYear);
}

function previous() {
  currentYear  = (currentMonth === 0) ? currentYear - 1 : currentYear;
  currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
  var mm = parseInt(currentMonth) + 1;
  getcalanderdata(mm, currentYear);
  showCalendar(currentMonth, currentYear);
}

function earnLeave() {
  const today      = new Date();
  const currentDay = today.getDate();
  if (currentDay >= 1 && currentDay <= 10) {
    var formData = new FormData();
    formData.append("employee_id", employee_id);
    $.ajax({
      url: "earn_leave", type: "POST", data: formData,
      processData: false, contentType: false,
      success: function(response) { console.log('Success:', response); },
      error:   function(xhr, status, error) { console.error('Error:', error); }
    });
  } else {
    console.log("API not called – today is after the 10th");
  }
}

function getcalanderdata(month, year) {
  var fd = new FormData();
  fd.append("emp_id", employee_id);
  fd.append("month",  month);
  fd.append("year",   year);
  $.ajax({
    url: 'getEmployeeAttendance', type: 'post', data: fd,
    contentType: false, processData: false,
    success: function(data) {
      $('[data-date]').css({ 'background': '', 'color': '', 'border-radius': '' });

      let fullDayCount = 0, halfDayCount = 0, absentCount = 0, leaveCount = 0;
      const today      = new Date();
      const todayDay   = today.getDate();
      const todayMonth = today.getMonth() + 1;
      const todayYear  = today.getFullYear();
      let isTodayFullDay = false, isTodayHalfDay = false;

      if (data.status === 'Success') {
        if (data.data && data.data.length) {
          for (var i = 0; i < data.data.length; i++) {
            var d = data.data[i].attendance_date.split("-");
            d[2] = d[2].startsWith("0") ? d[2][1] : d[2];
            d[1] = d[1].startsWith("0") ? d[1][1] : d[1];
            var selector      = '[data-date="'+d[2]+'"][data-month="'+d[1]+'"][data-year="'+d[0]+'"]';
            const targetElement = $(selector);
            if (targetElement.length) {
              const type   = data.data[i].attendance_type;
              const reason = data.data[i].reason;
              if (type == "1" && reason == "-") {
                targetElement.css({ 'background': '#05cd99', 'color': 'white', 'border-radius': '8px' });
                fullDayCount++;
                if (parseInt(d[2]) == todayDay && parseInt(d[1]) == todayMonth && parseInt(d[0]) == todayYear) isTodayFullDay = true;
              } else if (type == "0.5") {
                targetElement.css({ 'background': '#ffb547', 'color': 'white', 'border-radius': '8px' });
                halfDayCount++;
                if (parseInt(d[2]) == todayDay && parseInt(d[1]) == todayMonth && parseInt(d[0]) == todayYear) isTodayHalfDay = true;
              } else if (type == "0") {
                targetElement.css({ 'background': '#ee5d50', 'color': 'white', 'border-radius': '8px' });
                absentCount++;
              } else {
                targetElement.css({ 'background': '#a3aed0', 'color': 'white', 'border-radius': '8px' });
                leaveCount++;
              }
            }
          }
          $("#fullDayCount").text(fullDayCount);
          $("#halfDayCount").text(halfDayCount);
          $("#absentCount").text(absentCount);
          $("#leaveCount").text(leaveCount);

          if (isTodayFullDay || isTodayHalfDay) {
            $("#clockin").hide(); $("#clockout").show();
          } else {
            $("#clockin").show(); $("#clockout").hide();
          }
        }
      }
    },
    error: function(xhr, status, error) { console.error('AJAX error:', error); }
  });
}

$("#clockout").click(function() {
  var latitude  = $("#latitude").val();
  var longitude = $("#longitude").val();
  var fd = new FormData();
  fd.append("employee_id",       employee_id);
  fd.append("user_type",         user_type);
  fd.append("userLat",           latitude);
  fd.append("userLon",           longitude);
  fd.append("authentication_id", authentication_id);
  $.ajax({
    url: 'clock_Out', type: 'post', data: fd,
    contentType: false, processData: false,
    success: function(data) {
      var modalBody = $("#modalBodyContent");
      if (data['status'] == 'Success') {
        modalBody.html('<h5 class="text-green text-center">' + data['message'] + '</h5>');
        $('#popup1').modal('show');
        setTimeout(function() { location.reload(); }, 2000);
      } else {
        modalBody.html('<h5 style="color:#ee5d50;text-align:center;">' + data['message'] + '</h5>');
        $('#popup1').modal('show');
      }
    }
  });
});

/* ═══════════════════════════════════════
   ACCOUNT POPUP
═══════════════════════════════════════ */
function toggleAccountPopup() {
  var popup   = document.getElementById('accountPopup');
  var overlay = document.getElementById('accountOverlay');
  var btn     = document.getElementById('accountBtn');
  var isOpen  = popup.classList.contains('show');
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

</body>
</html>