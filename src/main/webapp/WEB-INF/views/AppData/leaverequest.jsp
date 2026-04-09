<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<%@page import="com.hp.model.LoginCredentials"%>
<html lang="en">
<head>
<title>Leave Request</title>
<meta charset="utf-8">
<jsp:include page="css.jsp"></jsp:include>
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
  display: flex; align-items: center; justify-content: space-between;
  position: sticky; top: 0; z-index: 200;
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
  max-width: 500px; margin: 0 auto;
}

/* ── HERO CARD ── */
.hero-card {
  background: linear-gradient(145deg, var(--navy) 0%, #1a2d6d 100%);
  border-radius: var(--r-lg);
  padding: 20px; margin-bottom: 16px;
  position: relative; overflow: hidden;
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
  display: flex; align-items: center; justify-content: space-between;
  margin-bottom: 20px; position: relative; z-index: 1;
}
.emp-row { display: flex; align-items: center; gap: 12px; }
.emp-avatar {
  width: 46px; height: 46px; border-radius: 14px;
  background: linear-gradient(135deg, var(--blue-light), var(--teal));
  display: flex; align-items: center; justify-content: center;
  font-size: 18px; font-weight: 800; color: #fff; flex-shrink: 0;
  box-shadow: 0 4px 14px rgba(59,110,248,0.4);
}
.emp-name  { color: #fff; font-size: 15px; font-weight: 700; line-height: 1.2; }
.emp-badge {
  display: inline-block; margin-top: 4px;
  background: rgba(1,201,160,0.2); border: 1px solid rgba(1,201,160,0.4);
  color: var(--teal); font-size: 10px; font-weight: 600;
  padding: 2px 8px; border-radius: 20px; letter-spacing: 0.4px;
}

/* Apply Leave Button */
.btn-apply {
  padding: 10px 16px; border: none; border-radius: 12px;
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 12px; font-weight: 700; cursor: pointer;
  background: linear-gradient(135deg, var(--teal), #00a882);
  color: #fff; box-shadow: 0 4px 16px rgba(1,201,160,0.45);
  display: flex; align-items: center; gap: 6px;
  transition: all 0.2s cubic-bezier(.34,1.56,.64,1);
}
.btn-apply:hover { transform: translateY(-2px); box-shadow: 0 6px 22px rgba(1,201,160,0.55); }
.btn-apply:active { transform: scale(0.95); }

/* Leave Stats Pills */
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
.pill-icon.yellow { background: rgba(255,181,71,0.2);  color: #ffb547; }
.pill-icon.gray   { background: rgba(163,174,208,0.2); color: #a3aed0; }
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

/* ── LEAVE BALANCE CARD ── */
.leave-balance-card {
  background: var(--surface);
  border-radius: var(--r-lg);
  overflow: hidden;
  border: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
  margin-bottom: 6px;
  animation: fadeSlideDown 0.5s ease 0.12s both;
}
.leave-balance-card table { width: 100%; border-collapse: collapse; }
.leave-balance-card thead tr {
  background: linear-gradient(90deg, var(--navy) 0%, #1a2d6d 100%);
}
.leave-balance-card thead th {
  color: rgba(255,255,255,0.7); font-size: 11px; font-weight: 600;
  text-transform: uppercase; letter-spacing: 0.8px;
  padding: 12px 16px; text-align: left;
}
.leave-balance-card thead th:not(:first-child) { text-align: center; }
.leave-balance-card tbody tr {
  border-bottom: 1px solid var(--border); transition: background 0.15s;
}
.leave-balance-card tbody tr:last-child { border-bottom: none; }
.leave-balance-card tbody tr:hover { background: #f7f9ff; }
.leave-balance-card tbody td {
  padding: 13px 16px; font-size: 13px; font-weight: 500; color: var(--text);
}
.leave-balance-card tbody td:not(:first-child) {
  text-align: center;
  font-family: 'JetBrains Mono', monospace; font-size: 13px;
}
.leave-type-dot { display: inline-flex; align-items: center; gap: 8px; }
.leave-type-dot::before {
  content: ''; width: 8px; height: 8px; border-radius: 50%; flex-shrink: 0;
}
.leave-type-dot.casual::before { background: var(--blue); }
.leave-type-dot.sick::before   { background: var(--red); }
.leave-type-dot.earned::before { background: var(--teal); }
.remaining-chip {
  display: inline-block;
  background: linear-gradient(135deg, var(--blue), var(--blue-light));
  color: #fff; font-size: 12px; font-weight: 700;
  padding: 3px 10px; border-radius: 20px;
  font-family: 'JetBrains Mono', monospace;
}

/* ── APPLIED LEAVE CARD ── */
.applied-card {
  background: var(--surface);
  border-radius: var(--r-lg);
  overflow: hidden;
  border: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
  animation: fadeSlideDown 0.5s ease 0.18s both;
}
.applied-card-header {
  background: linear-gradient(90deg, var(--navy) 0%, #1a2d6d 100%);
  padding: 14px 16px;
  display: flex; align-items: center; gap: 10px;
}
.applied-card-header .hd-icon {
  width: 30px; height: 30px;
  background: rgba(1,201,160,0.2); border: 1px solid rgba(1,201,160,0.3);
  border-radius: 8px; display: flex; align-items: center; justify-content: center;
  color: var(--teal); font-size: 13px;
}
.applied-card-header h3 { color: #fff; font-size: 14px; font-weight: 700; }

.applied-table-wrap { overflow-x: auto; }
.applied-table { width: 100%; border-collapse: collapse; }
.applied-table thead tr {
  background: rgba(240,243,251,0.8);
  border-bottom: 2px solid var(--border);
}
.applied-table thead th {
  font-size: 11px; font-weight: 700; text-transform: uppercase;
  letter-spacing: 0.6px; color: var(--muted); padding: 11px 14px; text-align: left;
}
.applied-table tbody tr {
  border-bottom: 1px solid var(--border); transition: background 0.15s;
}
.applied-table tbody tr:last-child { border-bottom: none; }
.applied-table tbody tr:hover { background: #f7f9ff; }
.applied-table tbody td {
  padding: 12px 14px; font-size: 12px; font-weight: 500; color: var(--text);
}
.applied-table tbody td:first-child, .applied-table tbody td:nth-child(2) {
  font-family: 'JetBrains Mono', monospace; font-size: 11px; color: var(--muted); font-weight: 600;
}

/* Status Badges */
.status-badge {
  display: inline-flex; align-items: center; gap: 5px;
  padding: 4px 10px; border-radius: 20px;
  font-size: 11px; font-weight: 700; letter-spacing: 0.3px;
}
.status-badge.approved {
  background: rgba(5,205,153,0.12); color: var(--green);
  border: 1px solid rgba(5,205,153,0.25);
}
.status-badge.pending {
  background: rgba(255,181,71,0.12); color: #d4900a;
  border: 1px solid rgba(255,181,71,0.3);
}
.status-badge.rejected {
  background: rgba(238,93,80,0.12); color: var(--red);
  border: 1px solid rgba(238,93,80,0.25);
}
.status-badge::before {
  content: ''; width: 6px; height: 6px; border-radius: 50%;
  background: currentColor;
}

/* Leave type chip in table */
.leave-type-chip {
  display: inline-block;
  background: rgba(59,110,248,0.08); color: var(--blue);
  border: 1px solid rgba(59,110,248,0.2);
  padding: 3px 9px; border-radius: 8px;
  font-size: 11px; font-weight: 600;
}

/* Empty state */
.empty-state {
  text-align: center; padding: 32px 16px; color: var(--muted);
}
.empty-state i { font-size: 32px; margin-bottom: 10px; display: block; opacity: 0.4; }
.empty-state p { font-size: 13px; font-weight: 500; }

/* ── APPLY LEAVE MODAL ── */
.modal-content {
  border-radius: 20px !important; border: none !important;
  box-shadow: var(--shadow-lg) !important; overflow: hidden;
}
.modal-header {
  background: linear-gradient(90deg, var(--navy), #1a2d6d) !important;
  border-bottom: none !important; padding: 18px 20px !important;
}
.modal-title { color: #fff !important; font-weight: 700 !important; font-size: 15px !important; }
.btn-close { filter: brightness(0) invert(1) !important; }
.modal-body { padding: 20px !important; background: var(--bg); }
.modal-footer { background: var(--surface); border-top: 1px solid var(--border) !important; padding: 14px 20px !important; }

/* Form Styling */
.form-label {
  font-size: 12px; font-weight: 700; color: var(--muted);
  text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 6px;
}
.form-control, .form-select {
  border-radius: var(--r-sm) !important;
  border: 1.5px solid var(--border) !important;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  font-size: 13px !important; font-weight: 500 !important;
  color: var(--text) !important;
  padding: 10px 14px !important;
  background: var(--surface) !important;
  transition: border-color 0.15s, box-shadow 0.15s !important;
}
.form-control:focus, .form-select:focus {
  border-color: var(--blue) !important;
  box-shadow: 0 0 0 3px rgba(59,110,248,0.1) !important;
  outline: none !important;
}
.form-group-card {
  background: var(--surface);
  border-radius: var(--r-md);
  padding: 16px;
  border: 1px solid var(--border);
  margin-bottom: 10px;
}
.btn-submit {
  background: linear-gradient(135deg, var(--blue), var(--blue-light)) !important;
  color: #fff !important; border: none !important;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  font-weight: 700 !important; font-size: 13px !important;
  padding: 10px 24px !important; border-radius: 12px !important;
  box-shadow: 0 4px 14px rgba(59,110,248,0.35) !important;
  transition: all 0.2s !important;
}
.btn-submit:hover { transform: translateY(-1px) !important; box-shadow: 0 6px 18px rgba(59,110,248,0.45) !important; }
.btn-cancel {
  background: var(--bg) !important; color: var(--text2) !important;
  border: 1px solid var(--border) !important;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  font-weight: 600 !important; font-size: 13px !important;
  padding: 10px 20px !important; border-radius: 12px !important;
}
.error { color: var(--red) !important; font-size: 11px !important; font-weight: 600 !important; margin-top: 4px !important; }

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
.text-green { color: var(--green) !important; }

/* ── ANIMATIONS ── */
@keyframes fadeSlideDown {
  from { opacity:0; transform: translateY(-12px); }
  to   { opacity:1; transform: translateY(0); }
}
</style>
</head>

<body>

<!-- ══ TOPBAR ══ -->
<div class="topbar">
  <div class="topbar-brand">
    <div class="topbar-logo">
      <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path d="M14 6l-1-2H5v17h2v-7h5l1 2h7V6h-6zm4 8h-4l-1-2H7V6h5l1 2h5v6z"/>
      </svg>
    </div>
    <h4>Leave Request</h4>
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
      <button class="btn-apply" data-bs-toggle="modal" data-bs-target="#leave_modal">
        <i class="fa fa-plus"></i> Apply Leave
      </button>
    </div>

    <!-- Leave Stats -->
    <div class="presence-grid">
      <div class="presence-pill">
        <div class="pill-icon gray"><i class="fa fa-list"></i></div>
        <div class="pill-count" id="allCount">0</div>
        <div class="pill-label">Applied</div>
      </div>
      <div class="presence-pill">
        <div class="pill-icon yellow"><i class="fa fa-clock-o"></i></div>
        <div class="pill-count" id="pendingCount">0</div>
        <div class="pill-label">Pending</div>
      </div>
      <div class="presence-pill">
        <div class="pill-icon green"><i class="fa fa-check"></i></div>
        <div class="pill-count" id="approvedCount">0</div>
        <div class="pill-label">Approved</div>
      </div>
      <div class="presence-pill">
        <div class="pill-icon red"><i class="fa fa-times"></i></div>
        <div class="pill-count" id="rejectedCount">0</div>
        <div class="pill-label">Rejected</div>
      </div>
    </div>
  </div>

  <!-- ══ LEAVE BALANCE ══ -->
  <div class="section-hd">
    <div class="section-hd-bar"></div>
    <h3>Leave Balance</h3>
  </div>

  <div class="leave-balance-card">
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

  <!-- ══ APPLIED LEAVE ══ -->
  <div class="section-hd" style="margin-top:20px;">
    <div class="section-hd-bar"></div>
    <h3>Applied Leave</h3>
  </div>

  <div class="applied-card">
    <div class="applied-card-header">
      <div class="hd-icon"><i class="fa fa-paper-plane"></i></div>
      <h3>Leave History</h3>
    </div>
    <div class="applied-table-wrap">
      <table class="applied-table" id="atttable">
        <thead>
          <tr>
            <th>From</th>
            <th>To</th>
            <th>Type</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td colspan="4">
              <div class="empty-state">
                <i class="fa fa-inbox"></i>
                <p>No leave requests found</p>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

</div>
</section>

<!-- Hidden Inputs -->
<input type="hidden" id="employee_id"       value="<%=lg.getEmployee_id()%>">
<input type="hidden" id="user_type"         value="<%=lg.getUser_type()%>">
<input type="hidden" id="authentication_id" value="<%=lg.getAuthentication_id()%>">

<!-- ══ APPLY LEAVE MODAL ══ -->
<div class="modal fade" id="leave_modal" data-bs-backdrop="static" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">
          <i class="fa fa-plus-circle me-2" style="color:var(--teal);"></i>
          Apply for Leave
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form name="attendance" id="attendance">
        <div class="modal-body">

          <div class="form-group-card mb-2">
            <label for="leave_id" class="form-label">Leave Type</label>
            <select id="leave_id" name="leave_id" class="form-select">
              <option value="">-- Select Leave Type --</option>
              <option value="1">Casual Leave</option>
              <option value="2">Sick Leave</option>
              <option value="3">Earned Leave</option>
              <option value="4">Short Leave</option>
              <option value="1001">Other</option>
            </select>
            <span class="error" id="err_leave"></span>
          </div>

          <div class="form-group-card mb-2">
            <div class="row g-3">
              <div class="col-6">
                <label for="from_date" class="form-label">From Date</label>
                <input type="date" id="from_date" name="from_date" class="form-control">
                <span class="error" id="err_from"></span>
              </div>
              <div class="col-6">
                <label for="to_date" class="form-label">To Date</label>
                <input type="date" id="to_date" name="to_date" class="form-control">
                <span class="error" id="err_to"></span>
              </div>
            </div>
          </div>

          <div class="form-group-card">
            <label for="reason" class="form-label">Reason</label>
            <input type="text" id="reason" name="reason" class="form-control" placeholder="Brief reason for leave...">
            <span class="error" id="err_reason"></span>
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn-cancel" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn-submit" id="sbtm">
            <i class="fa fa-paper-plane me-1"></i> Submit
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Confirmation Modal -->
<div class="modal fade" id="popup" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Leave Request</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modalBodyContent1"></div>
    </div>
  </div>
</div>

<!-- Account Overlay & Popup -->

<!-- Bottom Nav -->
<jsp:include page="footer.jsp"></jsp:include>

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
let user_type   = $("#user_type").val();
let employee_id = $("#employee_id").val();

var leaveTypeDotClass = ['casual','sick','earned'];

/* ── FORM VALIDATION & SUBMIT ── */
$(function() {
  $("form[name='attendance']").validate({
    rules: {
      leave_id:  { required: true },
      from_date: { required: true },
      to_date:   { required: true },
      reason:    { required: true }
    },
    submitHandler: function(form) {
      $("#sbtm").html('<i class="fa fa-spinner fa-spin me-1"></i> Sending...');
      $("#sbtm").prop("disabled", true);

      var obj = {
        "leave_id"    : parseInt($("#leave_id").val()),
        "fromDate"    : $("#from_date").val(),
        "toDate"      : $("#to_date").val(),
        "reason"      : $("#reason").val(),
        "employee_id" : parseInt(employee_id)
      };

      $.ajax({
        url: 'send_leave_request', type: 'post', dataType: 'JSON',
        data: JSON.stringify(obj), contentType: "application/json",
        success: function(data) {
          $("#sbtm").html('<i class="fa fa-paper-plane me-1"></i> Submit');
          $("#sbtm").prop("disabled", false);
          var mb = $("#modalBodyContent1");
          if(data['status']=='Success'){
            mb.html('<h5 class="text-green text-center">'+data['message']+'</h5>');
            $('#popup').modal('show');
            setTimeout(function(){ location.reload(); }, 2000);
          } else {
            mb.html('<h5 style="color:#ee5d50;text-align:center;">'+data['message']+'</h5>');
            $('#popup').modal('show');
          }
        }
      });
    }
  });
});

/* ── LEAVE BALANCE ── */
getRemainingLeave();
function getRemainingLeave() {
  var fd = new FormData();
  fd.append("employee_id", employee_id);
  $.ajax({
    url: "get_remaining", type: "POST", data: fd,
    processData: false, contentType: false,
    success: function(data) {
      if(data['status']==="Success"){
        var tbody = $("#leaveTable tbody");
        tbody.empty();
        var idx = 0;
        $.each(data.data, function(i, item){
          if(item.leave_name != "Short Leave"){
            var cls = leaveTypeDotClass[idx] || 'casual';
            var row = "<tr>" +
              "<td><span class='leave-type-dot "+cls+"'>"+item.leave_name+"</span></td>" +
              "<td>"+item.total_leaves+"</td>" +
              "<td><span class='remaining-chip'>"+item.remaining_leave+"</span></td>" +
              "</tr>";
            tbody.append(row);
            idx++;
          }
        });
        if(tbody.is(':empty')){
          tbody.html('<tr><td colspan="3" style="text-align:center;color:var(--muted);padding:20px;font-size:13px;">No data found</td></tr>');
        }
      }
    },
    error: function(err){ console.error("Error:", err); }
  });
}

/* ── APPLIED LEAVE ── */
getleaverequest();
function getleaverequest() {
  $.ajax({
    url: "get_leave_request", type: "POST",
    data: { start:0, length:-1, employee_id:employee_id, user_type:user_type },
    success: function(data) {
      if(data['status']=='Success'){
        var tbody = $("#atttable tbody");
        tbody.empty();

        var pendingCount=0, approvedCount=0, rejectedCount=0;

        if(data['data'].length === 0){
          tbody.html('<tr><td colspan="4"><div class="empty-state"><i class="fa fa-inbox"></i><p>No leave requests found</p></div></td></tr>');
        } else {
          for(var i=0; i<data['data'].length; i++){
            var status   = data['data'][i].status ?? "-";
            var statusLc = status.toLowerCase();

            if(statusLc==="pending")  pendingCount++;
            else if(statusLc==="approved") approvedCount++;
            else if(statusLc==="rejected") rejectedCount++;

            // Status badge
            var badgeCls = statusLc==="approved" ? "approved" : statusLc==="rejected" ? "rejected" : "pending";
            var statusHtml = "<span class='status-badge "+badgeCls+"'>" + status + "</span>";

            // Leave type chip
            var lname = data['data'][i].leave_name ?? "-";
            var typeHtml = "<span class='leave-type-chip'>" + lname + "</span>";

            var row = "<tr>" +
              "<td>" + (data['data'][i].fromDate ?? "-") + "</td>" +
              "<td>" + (data['data'][i].toDate   ?? "-") + "</td>" +
              "<td>" + typeHtml  + "</td>" +
              "<td>" + statusHtml + "</td>" +
              "</tr>";
            tbody.append(row);
          }
        }

        var allCount = data['data'].length;
        $("#allCount").text(allCount);
        $("#pendingCount").text(pendingCount);
        $("#approvedCount").text(approvedCount);
        $("#rejectedCount").text(rejectedCount);
      }
    },
    error: function(){ alert("Error fetching leave request data!"); }
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