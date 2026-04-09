<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<%@page import="com.hp.model.LoginCredentials"%>
<html lang="en">
<head>
<title>Attendance</title>
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
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">

<%
LoginCredentials lg = (LoginCredentials)session.getAttribute("loginData");
%>

<style>
/* ═══════════════════════════════════════
   DESIGN SYSTEM — Same as Dashboard V1
   Dark Navy + Teal
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
.topbar-brand { display: flex; align-items: center; gap: 10px; }
.topbar-logo {
  width: 34px; height: 34px;
  background: linear-gradient(135deg, var(--blue), var(--teal));
  border-radius: 10px;
  display: flex; align-items: center; justify-content: center;
}
.topbar-logo svg { width: 18px; height: 18px; fill: #fff; }
.topbar h4 { color: #fff; font-size: 16px; font-weight: 700; letter-spacing: 0.2px; }
.topbar-time {
  font-family: 'JetBrains Mono', monospace;
  font-size: 11px; color: var(--muted);
  background: rgba(255,255,255,0.05);
  border: 1px solid rgba(255,255,255,0.08);
  padding: 5px 10px; border-radius: 20px; letter-spacing: 0.5px;
}

/* ── MAIN ── */
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
  position: absolute; top: -60px; right: -60px;
  width: 200px; height: 200px;
  background: radial-gradient(circle, rgba(77,124,254,0.25) 0%, transparent 65%);
  border-radius: 50%; pointer-events: none;
}
.hero-card::after {
  content: '';
  position: absolute; bottom: -30px; left: 20px;
  width: 120px; height: 120px;
  background: radial-gradient(circle, rgba(1,201,160,0.15) 0%, transparent 65%);
  border-radius: 50%; pointer-events: none;
}

.hero-top {
  display: flex; align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
  position: relative; z-index: 1;
}
.emp-row { display: flex; align-items: center; gap: 12px; }
.emp-avatar {
  width: 46px; height: 46px; border-radius: 14px;
  background: linear-gradient(135deg, var(--blue-light), var(--teal));
  display: flex; align-items: center; justify-content: center;
  font-size: 18px; font-weight: 800; color: #fff; flex-shrink: 0;
  box-shadow: 0 4px 14px rgba(59,110,248,0.4);
}
.emp-name { color: #fff; font-size: 15px; font-weight: 700; line-height: 1.2; }
.emp-badge {
  display: inline-block; margin-top: 4px;
  background: rgba(1,201,160,0.2);
  border: 1px solid rgba(1,201,160,0.4);
  color: var(--teal); font-size: 10px; font-weight: 600;
  padding: 2px 8px; border-radius: 20px; letter-spacing: 0.4px;
}

/* Clock Buttons */
.clock-group { display: flex; gap: 8px; }
.btn-clock {
  padding: 10px 16px; border: none; border-radius: 12px;
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 12px; font-weight: 700; cursor: pointer;
  transition: all 0.2s cubic-bezier(.34,1.56,.64,1);
  display: flex; align-items: center; gap: 6px; letter-spacing: 0.2px;
}
.btn-clock:active { transform: scale(0.95); }
.btn-clock-in {
  background: linear-gradient(135deg, var(--teal), #00a882);
  color: #fff; box-shadow: 0 4px 16px rgba(1,201,160,0.45);
}
.btn-clock-in:hover { transform: translateY(-2px); box-shadow: 0 6px 22px rgba(1,201,160,0.55); }
.btn-clock-out {
  background: rgba(238,93,80,0.12); color: #ff7b6e;
  border: 1px solid rgba(238,93,80,0.25);
}
.btn-clock-out:hover { background: rgba(238,93,80,0.22); transform: translateY(-1px); }

/* Presence Pills */
.presence-grid {
  display: grid; grid-template-columns: repeat(4,1fr);
  gap: 8px; position: relative; z-index: 1;
}
.presence-pill {
  background: rgba(255,255,255,0.06);
  border: 1px solid rgba(255,255,255,0.08);
  border-radius: 14px; padding: 12px 6px 10px; text-align: center;
  transition: background 0.2s;
}
.presence-pill:hover { background: rgba(255,255,255,0.1); }
.pill-icon {
  width: 28px; height: 28px; border-radius: 8px;
  margin: 0 auto 8px;
  display: flex; align-items: center; justify-content: center; font-size: 13px;
}
.pill-icon.green  { background: rgba(5,205,153,0.2);  color: #05cd99; }
.pill-icon.red    { background: rgba(238,93,80,0.2);   color: #ee5d50; }
.pill-icon.gray   { background: rgba(163,174,208,0.2); color: #a3aed0; }
.pill-icon.yellow { background: rgba(255,181,71,0.2);  color: #ffb547; }
.pill-count {
  font-family: 'JetBrains Mono', monospace;
  font-size: 22px; font-weight: 600; color: #fff; line-height: 1;
}
.pill-label {
  font-size: 9px; color: rgba(255,255,255,0.4); margin-top: 4px;
  font-weight: 600; text-transform: uppercase; letter-spacing: 0.6px;
}

/* ── SECTION HEADER ── */
.section-hd {
  display: flex; align-items: center; gap: 8px;
  margin: 20px 0 12px;
  animation: fadeSlideDown 0.5s ease 0.1s both;
}
.section-hd-bar {
  width: 4px; height: 18px; border-radius: 4px;
  background: linear-gradient(to bottom, var(--blue), var(--teal));
}
.section-hd h3 { font-size: 14px; font-weight: 700; color: var(--text); letter-spacing: 0.1px; }

/* ── CALENDAR CARD ── */
.cal-card {
  background: var(--surface);
  border-radius: var(--r-lg);
  overflow: hidden;
  border: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
  animation: fadeSlideDown 0.5s ease 0.15s both;
}
.cal-header {
  background: linear-gradient(90deg, var(--navy) 0%, #1a2d6d 100%);
  padding: 14px 16px;
  display: flex; align-items: center; justify-content: space-between;
}
#monthAndYear {
  font-family: 'JetBrains Mono', monospace;
  font-size: 14px; font-weight: 600; color: #fff; letter-spacing: 0.5px;
}
.cal-nav-btns { display: flex; gap: 6px; }
.cal-nav-btn {
  width: 30px; height: 30px;
  background: rgba(255,255,255,0.1);
  border: 1px solid rgba(255,255,255,0.15);
  border-radius: 8px; color: #fff; font-size: 18px; cursor: pointer;
  display: flex; align-items: center; justify-content: center;
  transition: all 0.15s; line-height: 1;
}
.cal-nav-btn:hover { background: rgba(255,255,255,0.2); transform: scale(1.05); }
.cal-body-wrap { padding: 14px 12px; }

/* Calendar CSS overrides */
.table-calendar { width: 100% !important; border-collapse: separate !important; border-spacing: 3px !important; }
.table-calendar thead th {
  font-size: 10px !important; font-weight: 700 !important;
  color: var(--muted) !important; text-align: center !important;
  padding: 4px 0 8px !important; text-transform: uppercase !important;
  letter-spacing: 0.6px !important; background: transparent !important; border: none !important;
}
.table-calendar tbody td {
  text-align: center !important; padding: 7px 2px !important;
  font-size: 12px !important; font-weight: 600 !important;
  border-radius: 8px !important; border: none !important;
  transition: all 0.15s !important; color: var(--text);
}
.table-calendar tbody td[data-date]:hover { background: var(--bg) !important; }

/* Calendar Legend */
.cal-legend {
  display: flex; flex-wrap: wrap; gap: 10px 16px;
  padding: 10px 14px 14px; border-top: 1px solid var(--border);
}
.legend-item { display: flex; align-items: center; gap: 5px; font-size: 10px; font-weight: 600; color: var(--muted); text-transform: uppercase; letter-spacing: 0.4px; }
.legend-dot { width: 10px; height: 10px; border-radius: 3px; }

/* ── WORKING HOURS CARD ── */
.wh-card {
  background: var(--surface);
  border-radius: var(--r-lg);
  overflow: hidden;
  border: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
  animation: fadeSlideDown 0.5s ease 0.2s both;
}
.wh-card-header {
  background: linear-gradient(90deg, var(--navy) 0%, #1a2d6d 100%);
  padding: 14px 16px;
  display: flex; align-items: center; gap: 10px;
}
.wh-card-header .wh-icon {
  width: 30px; height: 30px;
  background: rgba(1,201,160,0.2);
  border: 1px solid rgba(1,201,160,0.3);
  border-radius: 8px;
  display: flex; align-items: center; justify-content: center;
  color: var(--teal); font-size: 13px;
}
.wh-card-header h3 { color: #fff; font-size: 14px; font-weight: 700; letter-spacing: 0.2px; }

/* Table inside card */
.wh-table-wrap { overflow-x: auto; }
.wh-table {
  width: 100%; border-collapse: collapse;
}
.wh-table thead tr {
  background: rgba(240,243,251,0.8);
  border-bottom: 2px solid var(--border);
}
.wh-table thead th {
  font-size: 11px; font-weight: 700;
  text-transform: uppercase; letter-spacing: 0.6px;
  color: var(--muted); padding: 11px 14px; text-align: left;
}
.wh-table tbody tr {
  border-bottom: 1px solid var(--border);
  transition: background 0.15s;
}
.wh-table tbody tr:last-child { border-bottom: none; }
.wh-table tbody tr:hover { background: #f7f9ff; }
.wh-table tbody td {
  padding: 12px 14px; font-size: 12px;
  font-weight: 500; color: var(--text);
}
.wh-table tbody td:first-child {
  font-family: 'JetBrains Mono', monospace;
  font-size: 11px; color: var(--muted); font-weight: 600;
}

/* Time chip */
.time-chip {
  display: inline-flex; align-items: center; gap: 5px;
  background: var(--bg); border: 1px solid var(--border);
  border-radius: 8px; padding: 4px 9px;
  font-family: 'JetBrains Mono', monospace;
  font-size: 11px; font-weight: 600; color: var(--text);
}
.time-chip.in-chip  { border-color: rgba(5,205,153,0.3); color: var(--green); background: rgba(5,205,153,0.06); }
.time-chip.out-chip { border-color: rgba(238,93,80,0.3);  color: var(--red);   background: rgba(238,93,80,0.06); }
.time-chip.hrs-chip { border-color: rgba(59,110,248,0.3); color: var(--blue);  background: rgba(59,110,248,0.06); }
.time-chip.dash     { color: var(--muted); }

/* Empty state */
.wh-empty {
  text-align: center; padding: 32px 16px; color: var(--muted);
}
.wh-empty i { font-size: 32px; margin-bottom: 10px; display: block; opacity: 0.4; }
.wh-empty p { font-size: 13px; font-weight: 500; }

/* ── BOTTOM NAV ── */

/* ── ACCOUNT POPUP ── */
.account-overlay {
  display: none; position: fixed; inset: 0; z-index: 9998;
  background: rgba(11,20,55,0.2); backdrop-filter: blur(2px);
}
.account-overlay.show { display: block; }
.account-popup {
  display: none; position: fixed; bottom: 78px; right: 12px;
  width: 215px; background: var(--surface); border: 1px solid var(--border);
  border-radius: 16px 16px 4px 16px; box-shadow: var(--shadow-md);
  z-index: 9999; padding: 8px;
  animation: popUp 0.2s cubic-bezier(.34,1.56,.64,1) both;
}
.account-popup.show { display: block; }
@keyframes popUp {
  from { opacity:0; transform: scale(0.9) translateY(10px); }
  to   { opacity:1; transform: scale(1) translateY(0); }
}
.account-popup ul { list-style: none; margin: 0 0 8px 0; }
.account-popup ul li a {
  display: flex; align-items: center; gap: 10px;
  padding: 11px 12px; text-decoration: none;
  color: var(--text); font-size: 13px; font-weight: 500;
  border-radius: 10px; transition: background 0.15s;
}
.account-popup ul li a:hover { background: var(--bg); }
.account-popup ul li a .icon-wrap {
  width: 28px; height: 28px;
  background: rgba(59,110,248,0.08); color: var(--blue);
  border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 12px;
}
.btn-logout {
  display: flex; align-items: center; justify-content: center; gap: 8px;
  width: 100%; padding: 11px;
  background: linear-gradient(135deg, var(--red), #ff6b5e);
  color: #fff; border: none; border-radius: 10px;
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 13px; font-weight: 700; cursor: pointer; text-decoration: none;
  transition: all 0.2s; box-shadow: 0 4px 12px rgba(238,93,80,0.3);
}
.btn-logout:hover { transform: translateY(-1px); color: #fff; }

/* ── MODAL ── */
.modal-content {
  border-radius: 20px !important; border: none !important;
  box-shadow: var(--shadow-lg) !important; overflow: hidden;
}
.modal-header {
  background: linear-gradient(90deg, var(--navy), #1a2d6d);
  border-bottom: none !important; padding: 16px 20px !important;
}
.modal-title { color: #fff !important; font-weight: 700 !important; font-size: 15px !important; }
.btn-close { filter: brightness(0) invert(1) !important; }
.modal-body { padding: 24px 20px !important; text-align: center; }
.text-green { color: var(--green) !important; }

/* ── ANIMATIONS ── */
@keyframes fadeSlideDown {
  from { opacity:0; transform: translateY(-12px); }
  to   { opacity:1; transform: translateY(0); }
}

/* Calendar overrides */
.container-calendar { background: transparent !important; padding: 0 !important; box-shadow: none !important; }
.button-container-calendar { display: none !important; }
.footer-container-calendar { display: none !important; }
#monthAndYear { transform: none !important; }
.error { color: red !important; }
</style>
</head>

<body>

<!-- ══ TOPBAR ══ -->
<div class="topbar">
  <div class="topbar-brand">
    <div class="topbar-logo">
      <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"/>
      </svg>
    </div>
    <h4>Attendance</h4>
  </div>
  <div class="topbar-time" id="liveClock">--:--:--</div>
</div>

<section class="main-page">
<div class="main-div">

  <!-- ══ HERO CARD ══ -->
  <div class="hero-card">
    <div class="hero-top">
      <div class="emp-row">
        <div class="emp-avatar" id="avatarEl">SJ</div>
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

  <!-- ══ CALENDAR ══ -->
  <div class="section-hd">
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
    <div class="cal-legend">
      <div class="legend-item"><div class="legend-dot" style="background:#05cd99;"></div>Present</div>
      <div class="legend-item"><div class="legend-dot" style="background:#ee5d50;"></div>Absent</div>
      <div class="legend-item"><div class="legend-dot" style="background:#ffb547;"></div>Half Day</div>
      <div class="legend-item"><div class="legend-dot" style="background:#a3aed0;"></div>Leave</div>
    </div>
  </div>

  <!-- ══ WORKING HOURS ══ -->
  <div class="section-hd" style="margin-top:20px;">
    <div class="section-hd-bar"></div>
    <h3>Working Hours</h3>
  </div>

  <div class="wh-card">
    <div class="wh-card-header">
      <div class="wh-icon"><i class="fa fa-clock-o"></i></div>
      <h3>Time Log</h3>
    </div>
    <div class="wh-table-wrap">
      <table class="wh-table" id="atttable">
        <thead>
          <tr>
            <th>Date</th>
            <th>In Time</th>
            <th>Out Time</th>
            <th>Hours</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td colspan="4">
              <div class="wh-empty">
                <i class="fa fa-clock-o"></i>
                <p>No records found</p>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

</div>
</section>

<!-- Hidden fields -->
<input type="hidden" id="latitude"  value="0">
<input type="hidden" id="longitude" value="0">

<!-- Bottom Nav -->
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

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script src="assets/AppData/js/calender.js"></script>

<script type="text/javascript">

/* ── LIVE CLOCK ── */
function updateClock() {
	  var now = new Date();

	  var h = now.getHours().toString().padStart(2,'0');
	  var m = now.getMinutes().toString().padStart(2,'0');
	  var s = now.getSeconds().toString().padStart(2,'0');

	  document.getElementById('liveClock').textContent = h + ':' + m + ':' + s;
	}

	updateClock();
	setInterval(updateClock, 1000);

/* ── AVATAR INITIALS ── */
(function(){
  var name = "<%=lg.getEmployee_name()%>";
  if(name){
    var parts = name.trim().split(' ');
    var init  = parts.length > 1 ? parts[0][0]+parts[parts.length-1][0] : parts[0].substring(0,2);
    document.getElementById('avatarEl').textContent = init.toUpperCase();
  }
})();

/* ══════════════════════════════════════
   SAME JS LOGIC — UNCHANGED
══════════════════════════════════════ */
let authentication_id = $("#authentication_id").val();
let user_type         = $("#user_type").val();
let employee_id       = $("#employee_id").val();

function getLocation() {
  if (!navigator.geolocation) { alert("Geolocation is not supported by this browser."); return; }
  navigator.geolocation.getCurrentPosition(
    function(position) {
      const lat = position.coords.latitude;
      const lon = position.coords.longitude;
      document.getElementById("latitude").value  = lat;
      document.getElementById("longitude").value = lon;
      console.log("Latitude=" + lat, "Longitude=" + lon);
    },
    function(error) { alert("Location access denied or failed."); console.error(error); },
    { enableHighAccuracy: true, timeout: 10000 }
  );
}
getLocation();

var today        = new Date();
var currentMonth = today.getMonth();
var currentYear  = today.getFullYear();
var mm           = currentMonth + 1;

getcalanderdata(mm, currentYear);
viewWorkingH(mm, currentYear);

function next() {
  currentYear  = (currentMonth === 11) ? currentYear + 1 : currentYear;
  currentMonth = (currentMonth + 1) % 12;
  var mm = parseInt(currentMonth) + 1;
  getcalanderdata(mm, currentYear);
  viewWorkingH(mm, currentYear);
  showCalendar(currentMonth, currentYear);
}

function previous() {
  currentYear  = (currentMonth === 0) ? currentYear - 1 : currentYear;
  currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
  var mm = parseInt(currentMonth) + 1;
  getcalanderdata(mm, currentYear);
  viewWorkingH(mm, currentYear);
  showCalendar(currentMonth, currentYear);
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
      let fullDayCount=0, halfDayCount=0, absentCount=0, leaveCount=0;
      const td=new Date(), tdDay=td.getDate(), tdMon=td.getMonth()+1, tdYr=td.getFullYear();
      let isTodayFullDay=false;

      if(data.status==='Success' && data.data && data.data.length){
        for(var i=0; i<data.data.length; i++){
          var d = data.data[i].attendance_date.split("-");
          d[2] = d[2].startsWith("0") ? d[2][1] : d[2];
          d[1] = d[1].startsWith("0") ? d[1][1] : d[1];
          var sel = '[data-date="'+d[2]+'"][data-month="'+d[1]+'"][data-year="'+d[0]+'"]';
          var el  = $(sel);
          if(el.length){
            var type=data.data[i].attendance_type, reason=data.data[i].reason;
            if(type=="1" && reason=="-"){
              el.css({'background':'#05cd99','color':'#fff','border-radius':'8px'});
              fullDayCount++;
              if(parseInt(d[2])==tdDay && parseInt(d[1])==tdMon && parseInt(d[0])==tdYr) isTodayFullDay=true;
            } else if(type=="0.5"){
              el.css({'background':'#ffb547','color':'#fff','border-radius':'8px'});
              halfDayCount++;
            } else if(type=="0"){
              el.css({'background':'#ee5d50','color':'#fff','border-radius':'8px'});
              absentCount++;
            } else {
              el.css({'background':'#a3aed0','color':'#fff','border-radius':'8px'});
              leaveCount++;
            }
          }
        }
        $("#fullDayCount").text(fullDayCount);
        $("#halfDayCount").text(halfDayCount);
        $("#absentCount").text(absentCount);
        $("#leaveCount").text(leaveCount);

        if(isTodayFullDay || halfDayCount){
          $("#clockin").hide(); $("#clockout").show();
        } else {
          $("#clockin").show(); $("#clockout").hide();
        }
      }
    },
    error: function(xhr,status,error){ console.error('AJAX error:',error); }
  });
}

$("#clockin").click(function() {
  var latitude  = $("#latitude").val();
  var longitude = $("#longitude").val();
  var obj = {};
  obj.employee_id       = employee_id;
  obj.attendance_date   = new Date();
  obj.user_type         = user_type;
  obj.lat               = latitude;
  obj.lon               = longitude;
  obj.authentication_id = authentication_id;
  obj.attendance_type   = 1;
  $.ajax({
    url:'add_attendance', type:'post', dataType:'JSON',
    data: JSON.stringify(obj), contentType:"application/json",
    success: function(data) {
      var mb = $("#modalBodyContent");
      if(data['status']=='Success'){
        mb.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
        $('#popup1').modal('show');
        setTimeout(function(){ location.reload(); }, 2000);
      } else {
        mb.html('<h5 style="color:#ee5d50;text-align:center;">'+data['message']+'</h5>');
        $('#popup1').modal('show');
      }
    }
  });
});

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
    url:'clock_Out', type:'post', data:fd, contentType:false, processData:false,
    success: function(data) {
      var mb = $("#modalBodyContent");
      if(data['status']=='Success'){
        mb.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
        $('#popup1').modal('show');
        setTimeout(function(){ location.reload(); }, 2000);
      } else {
        mb.html('<h5 style="color:#ee5d50;text-align:center;">'+data['message']+'</h5>');
        $('#popup1').modal('show');
      }
    }
  });
});

/* ── WORKING HOURS TABLE — styled ── */
function viewWorkingH(month, year) {
  $.ajax({
    url: "getAttendancefilter", type: "POST",
    data: { start:0, length:-1, emp_id:employee_id, month:month, year:year },
    success: function(data) {
      var tbody = $("#atttable tbody");
      tbody.empty();
      if(data['status']=='Success' && data['data'].length > 0){
        for(var i=0; i<data['data'].length; i++){
          var d    = data['data'][i];
          var cin  = d.clock_in  ?? null;
          var cout = d.clock_out ?? null;
          var hrs  = d.total_hours ?? null;

          var cinHtml  = cin  ? '<span class="time-chip in-chip"><i class="fa fa-circle" style="font-size:6px;"></i>'+cin+'</span>'  : '<span class="time-chip dash">—</span>';
          var coutHtml = cout ? '<span class="time-chip out-chip"><i class="fa fa-circle" style="font-size:6px;"></i>'+cout+'</span>' : '<span class="time-chip dash">—</span>';
          var hrsHtml  = hrs  ? '<span class="time-chip hrs-chip" style="width: max-content;"><i class="fa fa-clock-o" style="font-size:10px;"></i>'+hrs+'</span>'  : '<span class="time-chip dash">—</span>';

          var row = "<tr>" +
            "<td>" + d.attendance_date + "</td>" +
            "<td>" + cinHtml  + "</td>" +
            "<td>" + coutHtml + "</td>" +
            "<td>" + hrsHtml  + "</td>" +
            "</tr>";
          tbody.append(row);
        }
      } else {
        tbody.html('<tr><td colspan="4"><div class="wh-empty"><i class="fa fa-clock-o"></i><p>No records for this month</p></div></td></tr>');
      }
    },
    error: function(){ alert("Error fetching attendance data!"); }
  });
}

/* ── ACCOUNT POPUP ── */
function toggleAccountPopup(){
  var p=document.getElementById('accountPopup'),
      o=document.getElementById('accountOverlay'),
      b=document.getElementById('accountBtn');
  var open=p.classList.contains('show');
  p.classList.toggle('show',!open);
  o.classList.toggle('show',!open);
  b.classList.toggle('active',!open);
}
function closeAccountPopup(){
  document.getElementById('accountPopup').classList.remove('show');
  document.getElementById('accountOverlay').classList.remove('show');
  document.getElementById('accountBtn').classList.remove('active');
}
</script>

</body>
</html>