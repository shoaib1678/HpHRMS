<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>HRMS Login</title>
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
<link rel="icon" type="image/x-icon" href="assets/images/hlogo.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="assets/AppData/css/bootstrap.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">

<style>
/* ═══════════════════════════════════════
   DESIGN SYSTEM — Dark Navy + Teal
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
  --red:        #ee5d50;
  --shadow-lg:  0 8px 40px rgba(59,110,248,0.18);
  --shadow-xl:  0 20px 60px rgba(11,20,55,0.25);
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
  font-family: 'Plus Jakarta Sans', sans-serif;
  min-height: 100vh;
  background: var(--navy);
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  position: relative;
  -webkit-font-smoothing: antialiased;
}

/* ── ANIMATED BACKGROUND ── */
.bg-blobs {
  position: fixed; inset: 0; pointer-events: none; z-index: 0; overflow: hidden;
}
.blob {
  position: absolute; border-radius: 50%;
  filter: blur(80px); opacity: 0.25; animation: blobMove 12s ease-in-out infinite alternate;
}
.blob-1 { width: 400px; height: 400px; background: var(--blue); top: -100px; right: -80px; animation-delay: 0s; }
.blob-2 { width: 300px; height: 300px; background: var(--teal); bottom: -80px; left: -60px; animation-delay: 3s; }
.blob-3 { width: 200px; height: 200px; background: var(--blue-light); top: 50%; left: 50%; animation-delay: 6s; }

@keyframes blobMove {
  from { transform: translate(0,0) scale(1); }
  to   { transform: translate(30px, 20px) scale(1.1); }
}

/* Grid pattern overlay */
.bg-grid {
  position: fixed; inset: 0; pointer-events: none; z-index: 0;
  background-image:
    linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
  background-size: 40px 40px;
}

/* ── LOGIN CARD ── */
.login-wrapper {
  position: relative; z-index: 10;
  width: 100%; max-width: 420px;
  padding: 20px 16px;
  animation: riseUp 0.6s cubic-bezier(.34,1.2,.64,1) both;
}

@keyframes riseUp {
  from { opacity:0; transform: translateY(30px) scale(0.97); }
  to   { opacity:1; transform: translateY(0) scale(1); }
}

/* ── LOGO SECTION ── */
.logo-section {
  text-align: center;
  margin-bottom: 28px;
}
.logo-ring {
  width: 90px; height: 90px;
  background: rgba(255,255,255,0.05);
  border: 1px solid rgba(255,255,255,0.12);
  border-radius: 28px;
  display: flex; align-items: center; justify-content: center;
  margin: 0 auto 14px;
  box-shadow: 0 8px 32px rgba(0,0,0,0.3), inset 0 1px 0 rgba(255,255,255,0.1);
  backdrop-filter: blur(10px);
  position: relative; overflow: hidden;
}
.logo-ring::before {
  content: '';
  position: absolute; inset: 0;
  background: linear-gradient(135deg, rgba(59,110,248,0.2), rgba(1,201,160,0.1));
  border-radius: inherit;
}
.logo-ring img {
  width: 56px; height: 56px;
  object-fit: contain; position: relative; z-index: 1;
  filter: drop-shadow(0 2px 8px rgba(0,0,0,0.3));
}
.logo-title {
  font-size: 20px; font-weight: 800;
  color: #fff; letter-spacing: -0.4px;
  line-height: 1.2;
}
.logo-sub {
  font-size: 12px; color: var(--muted); margin-top: 3px;
  font-weight: 500; letter-spacing: 0.3px;
}

/* ── CARD ── */
.login-card {
  background: rgba(255,255,255,0.04);
  border: 1px solid rgba(255,255,255,0.09);
  border-radius: 24px;
  padding: 28px 24px;
  backdrop-filter: blur(20px);
  box-shadow: var(--shadow-xl);
}
.card-title {
  font-size: 18px; font-weight: 700; color: #fff;
  text-align: center; margin-bottom: 4px;
}
.card-sub {
  font-size: 12px; color: var(--muted); text-align: center;
  margin-bottom: 24px; font-weight: 500;
}

/* ── FORM FIELDS ── */
.field-group { margin-bottom: 14px; }
.field-label {
  font-size: 11px; font-weight: 700; color: var(--muted);
  text-transform: uppercase; letter-spacing: 0.8px; margin-bottom: 7px;
  display: block;
}
.field-wrap {
  position: relative;
}
.field-icon {
  position: absolute; left: 14px; top: 50%; transform: translateY(-50%);
  color: var(--muted); font-size: 14px; pointer-events: none;
  transition: color 0.15s;
}
.field-wrap:focus-within .field-icon { color: var(--teal); }

.form-control {
  width: 100%;
  background: rgba(255,255,255,0.06) !important;
  border: 1.5px solid rgba(255,255,255,0.1) !important;
  border-radius: 14px !important;
  height: 50px !important;
  padding: 0 44px !important;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  font-size: 14px !important; font-weight: 500 !important;
  color: #fff !important;
  transition: all 0.2s !important;
  outline: none !important;
}
.form-control::placeholder { color: rgba(255,255,255,0.25) !important; }
.form-control:focus {
  border-color: var(--teal) !important;
  background: rgba(1,201,160,0.06) !important;
  box-shadow: 0 0 0 3px rgba(1,201,160,0.12) !important;
}
.form-control.error-field {
  border-color: var(--red) !important;
  background: rgba(238,93,80,0.05) !important;
}

/* Eye toggle */
.eye-icon {
  position: absolute; right: 14px; top: 50%; transform: translateY(-50%);
  color: var(--muted); font-size: 15px; cursor: pointer;
  transition: color 0.15s;
}
.eye-icon:hover { color: #fff; }

/* Error text */
.error {
  color: var(--red) !important;
  font-size: 11px !important; font-weight: 600 !important;
  margin-top: 5px !important; display: block;
}

/* Forgot password link */
.forgot-wrap {
  text-align: right; margin-bottom: 20px; margin-top: -4px;
}
.forgot-wrap a {
  font-size: 12px; font-weight: 600; color: var(--teal);
  text-decoration: none; transition: opacity 0.15s;
}
.forgot-wrap a:hover { opacity: 0.8; text-decoration: underline; }

/* Submit Button */
.btn-login {
  width: 100%; height: 52px;
  background: linear-gradient(135deg, var(--teal) 0%, #00a882 100%);
  color: #fff; border: none; border-radius: 14px;
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 15px; font-weight: 700; cursor: pointer;
  letter-spacing: 0.3px;
  box-shadow: 0 6px 24px rgba(1,201,160,0.4);
  transition: all 0.25s cubic-bezier(.34,1.56,.64,1);
  display: flex; align-items: center; justify-content: center; gap: 8px;
}
.btn-login:hover { transform: translateY(-2px); box-shadow: 0 10px 30px rgba(1,201,160,0.5); }
.btn-login:active { transform: scale(0.97); }
.btn-login:disabled { opacity: 0.7; transform: none; cursor: not-allowed; }

/* Divider */
.login-divider {
  text-align: center; margin: 20px 0 0;
  font-size: 11px; color: rgba(255,255,255,0.2);
  font-family: 'JetBrains Mono', monospace; letter-spacing: 1px;
}

/* ── MODALS ── */
.modal-content {
  background: var(--surface) !important;
  border-radius: 22px !important; border: none !important;
  box-shadow: var(--shadow-xl) !important; overflow: hidden;
}
.modal-header {
  background: linear-gradient(90deg, var(--navy), #1a2d6d) !important;
  border-bottom: none !important; padding: 18px 20px !important;
}
.modal-title { color: #fff !important; font-weight: 700 !important; font-size: 15px !important; }
.btn-close { filter: brightness(0) invert(1) !important; }
.modal-body { padding: 24px 22px !important; }
.modal-footer { border-top: 1px solid var(--border) !important; padding: 14px 22px !important; }

/* Forgot Modal Specific */
.forgot-icon-wrap {
  width: 64px; height: 64px;
  background: linear-gradient(135deg, rgba(59,110,248,0.1), rgba(1,201,160,0.1));
  border: 1px solid rgba(59,110,248,0.2);
  border-radius: 20px;
  display: flex; align-items: center; justify-content: center;
  margin: 0 auto 16px;
}
.forgot-icon-wrap i { font-size: 26px; color: var(--blue); }
.forgot-desc {
  font-size: 13px; color: var(--muted); text-align: center;
  margin-bottom: 20px; line-height: 1.7;
}

/* Forgot form inputs */
.modal-body .input-icon-wrap { position: relative; }
.modal-body .input-icon-wrap i {
  position: absolute; left: 13px; top: 50%; transform: translateY(-50%);
  color: var(--muted); font-size: 14px;
}
.modal-body .form-control {
  background: var(--bg) !important; border: 1.5px solid var(--border) !important;
  border-radius: 12px !important; height: 48px !important;
  padding: 0 14px 0 40px !important;
  color: var(--text) !important; font-size: 13px !important;
}
.modal-body .form-control::placeholder { color: var(--muted) !important; }
.modal-body .form-control:focus {
  border-color: var(--blue) !important;
  box-shadow: 0 0 0 3px rgba(59,110,248,0.1) !important;
  background: #fff !important;
}

#sendLinkBtn {
  background: linear-gradient(135deg, var(--blue), var(--blue-light)) !important;
  color: #fff !important; border: none !important;
  border-radius: 12px !important; height: 48px !important;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  font-size: 14px !important; font-weight: 700 !important;
  width: 100%; cursor: pointer;
  box-shadow: 0 4px 14px rgba(59,110,248,0.35);
  transition: all 0.2s;
}
#sendLinkBtn:hover { transform: translateY(-1px); box-shadow: 0 6px 18px rgba(59,110,248,0.45); }
#sendLinkBtn:disabled { opacity: 0.7; transform: none; }

.back-to-login {
  text-align: center; margin-top: 14px;
  font-size: 12px; color: var(--muted);
}
.back-to-login a { color: var(--blue); font-weight: 600; text-decoration: none; }
.back-to-login a:hover { text-decoration: underline; }

/* Success State */
.success-wrap { display: none; text-align: center; padding: 10px 0; }
.success-icon {
  width: 64px; height: 64px;
  background: rgba(5,205,153,0.1); border: 1px solid rgba(5,205,153,0.25);
  border-radius: 20px;
  display: flex; align-items: center; justify-content: center;
  margin: 0 auto 16px;
}
.success-icon i { font-size: 28px; color: #05cd99; }
.success-wrap h6 { font-size: 16px; font-weight: 700; margin-bottom: 8px; color: var(--text); }
.success-wrap p  { font-size: 13px; color: var(--muted); line-height: 1.7; }
.btn-back-login {
  background: linear-gradient(135deg, var(--teal), #00a882) !important;
  color: #fff !important; border: none !important;
  border-radius: 12px !important; height: 48px !important; width: 100%;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  font-size: 14px !important; font-weight: 700 !important;
  cursor: pointer; margin-top: 14px;
  box-shadow: 0 4px 14px rgba(1,201,160,0.35);
  transition: all 0.2s;
}
.btn-back-login:hover { transform: translateY(-1px); }
</style>
</head>

<body>

<!-- ── BACKGROUND ── -->
<div class="bg-blobs">
  <div class="blob blob-1"></div>
  <div class="blob blob-2"></div>
  <div class="blob blob-3"></div>
</div>
<div class="bg-grid"></div>

<!-- ══ LOGIN WRAPPER ══ -->
<div class="login-wrapper">

  <!-- Logo -->
  <div class="logo-section">
    <div class="logo-ring">
      <img src="assets/AppData/images/hlogo.png" alt="Halicon Logo">
    </div>
    <div class="logo-title">Halicon Publication</div>
    <div class="logo-sub">Human Resource Management System</div>
  </div>

  <!-- Card -->
  <div class="login-card">
    <div class="card-title">Welcome Back 👋</div>
    <div class="card-sub">Sign in to your account to continue</div>

    <form id="login" name="login" action="emp_dashboard" autocomplete="off" method="post">

      <!-- Email -->
      <div class="field-group">
        <label class="field-label">Email Address</label>
        <div class="field-wrap">
          <i class="fa fa-envelope field-icon"></i>
          <input type="text" placeholder="Enter your email" class="form-control" id="email" name="email">
        </div>
      </div>

      <!-- Password -->
      <div class="field-group">
        <label class="field-label">Password</label>
        <div class="field-wrap">
          <i class="fa fa-lock field-icon"></i>
          <input type="password" placeholder="Enter your password" class="form-control" id="password" name="password">
          <i class="fa fa-eye-slash eye-icon" id="eyeToggle"></i>
        </div>
      </div>

      <!-- Forgot Password -->
      <div class="forgot-wrap">
        <a href="#" data-bs-toggle="modal" data-bs-target="#forgotModal">Forgot Password?</a>
      </div>

      <!-- Submit -->
      <button type="submit" class="btn-login" id="bttnn">
        <i class="fa fa-sign-in"></i> Log In
      </button>

    </form>

    <div class="login-divider">── HRMS v2.0 ──</div>
  </div>

</div>

<!-- ══ LOGIN RESPONSE MODAL ══ -->
<div class="modal fade" id="popup1" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Welcome To Your Panel</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modalBodyContent"></div>
    </div>
  </div>
</div>

<!-- ══ FORGOT PASSWORD MODAL ══ -->
<div class="modal fade" id="forgotModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" style="max-width: 380px;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">
          <i class="fa fa-key me-2" style="color:var(--teal);"></i>
          Forgot Password
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
          aria-label="Close" onclick="resetForgotModal()"></button>
      </div>
      <div class="modal-body">

        <!-- Form State -->
        <div id="forgotFormWrap">
          <div class="forgot-icon-wrap">
            <i class="fa fa-lock"></i>
          </div>
          <p class="forgot-desc">
            Enter your registered email address.<br>
            We'll send you a link to reset your password.
          </p>

          <div class="input-icon-wrap mb-2">
            <i class="fa fa-envelope"></i>
            <input type="email" class="form-control" id="forgotEmail"
              placeholder="Enter your email address">
          </div>
          <small class="text-danger d-block mb-3" id="forgotEmailErr" style="font-size:12px;font-weight:600;"></small>

          <button id="sendLinkBtn" onclick="sendResetLink()">
            <i class="fa fa-paper-plane me-2"></i> Send Reset Link
          </button>

          <div class="back-to-login">
            <a href="#" data-bs-dismiss="modal" onclick="resetForgotModal()">
              <i class="fa fa-arrow-left me-1"></i> Back to Login
            </a>
          </div>
        </div>

        <!-- Success State -->
        <div class="success-wrap" id="forgotSuccessWrap">
          <div class="success-icon">
            <i class="fa fa-check"></i>
          </div>
          <h6>Email Sent Successfully!</h6>
          <p>A password reset link has been sent to<br>
            <strong id="sentToEmail" style="color:var(--text);"></strong><br>
            Please check your inbox.
          </p>
          <button class="btn-back-login" data-bs-dismiss="modal" onclick="resetForgotModal()">
            <i class="fa fa-sign-in me-2"></i> Back to Login
          </button>
        </div>

      </div>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

<script type="text/javascript">

/* ── LOGIN VALIDATION — SAME LOGIC ── */
$(function() {
  $("form[name='login']").validate({
    rules: {
      email:    { required: true },
      password: { required: true }
    },
    messages: {
      email:    "Please enter valid email id",
      password: "Please enter password"
    },
    submitHandler: function(form) {
      $("#bttnn").html('<i class="fa fa-spinner fa-spin me-2"></i> Please Wait...');
      $("#bttnn").prop("disabled", true);

      var fd = new FormData();
      fd.append("email",    $("#email").val());
      fd.append("password", $("#password").val());

      $.ajax({
        url: 'checklogin', type: 'post', data: fd,
        contentType: false, processData: false,
        success: function(data) {
          if(data['status'] == 'Success'){
            $("#bttnn").html('<i class="fa fa-check me-2"></i> Success!');
            form.submit();
          } else {
            $("#bttnn").html('<i class="fa fa-times me-2"></i> Invalid Credentials');
            $("#bttnn").prop("disabled", false);
            setTimeout(function(){
              $("#bttnn").html('<i class="fa fa-sign-in me-1"></i> Log In');
              $("#bttnn").prop("disabled", false);
            }, 3000);
          }
        }
      });
    }
  });
});

/* ── EYE TOGGLE — SAME LOGIC ── */
$("#eyeToggle").click(function() {
  var inp = $("#password");
  if(inp.attr('type') === 'password'){
    inp.attr('type', 'text');
    $(this).removeClass('fa-eye-slash').addClass('fa-eye');
  } else {
    inp.attr('type', 'password');
    $(this).removeClass('fa-eye').addClass('fa-eye-slash');
  }
});

/* ── SEND RESET LINK — SAME LOGIC ── */
function sendResetLink() {
  var email = $("#forgotEmail").val().trim();
  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if(email === ""){
    $("#forgotEmailErr").text("Please enter your email address."); return;
  }
  if(!emailRegex.test(email)){
    $("#forgotEmailErr").text("Please enter a valid email address."); return;
  }
  $("#forgotEmailErr").text("");

  $("#sendLinkBtn").html('<i class="fa fa-spinner fa-spin me-2"></i> Sending...').prop("disabled", true);

  var fd = new FormData();
  fd.append("email", email);

  $.ajax({
    url: 'forgot_password', type: 'post', data: fd,
    contentType: false, processData: false,
    success: function(data) {
      if(data['status'] == 'Success'){
        $("#sentToEmail").text(email);
        $("#forgotFormWrap").hide();
        $("#forgotSuccessWrap").show();
        $("#sendLinkBtn").html('<i class="fa fa-paper-plane me-2"></i> Send Reset Link').prop("disabled", false);
      } else if(data['status'] == 'Not_Found'){
        $("#forgotEmailErr").text("No account found with this email address.");
        $("#sendLinkBtn").html('<i class="fa fa-paper-plane me-2"></i> Send Reset Link').prop("disabled", false);
      } else {
        $("#forgotEmailErr").text("Something went wrong. Please try again.");
        $("#sendLinkBtn").html('<i class="fa fa-paper-plane me-2"></i> Send Reset Link').prop("disabled", false);
      }
    },
    error: function(){
      $("#forgotEmailErr").text("Server error. Please try again later.");
      $("#sendLinkBtn").html('<i class="fa fa-paper-plane me-2"></i> Send Reset Link').prop("disabled", false);
    }
  });
}

/* ── RESET FORGOT MODAL — SAME LOGIC ── */
function resetForgotModal() {
  $("#forgotEmail").val("");
  $("#forgotEmailErr").text("");
  $("#forgotFormWrap").show();
  $("#forgotSuccessWrap").hide();
  $("#sendLinkBtn").html('<i class="fa fa-paper-plane me-2"></i> Send Reset Link').prop("disabled", false);
}

$('#forgotModal').on('hidden.bs.modal', function() {
  resetForgotModal();
});

</script>
</body>
</html>