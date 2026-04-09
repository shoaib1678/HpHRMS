<!DOCTYPE html>
<html lang="en">
<head>
    <title>Reset Password - Halicon HRMS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="assets/AppData/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/AppData/css/style.css" rel="stylesheet" type="text/css">
    <link rel="icon" type="image/x-icon" href="assets/images/hlogo.png">

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            min-height: 100vh;
            background-image: url('assets/AppData/images/topban.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: Arial, sans-serif;
            padding: 70px 16px 30px;
        }

        @keyframes fadeInFromTop {
            0%   { opacity: 0; transform: translateY(-60px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        .fade-in-top {
            animation: fadeInFromTop 0.7s ease-out forwards;
            width: 100%;
            max-width: 400px;
            padding-top: 45px;
            margin: 0 auto;
        }

        /* ✅ Card */
        .reset-card {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
            padding: 20px 24px 28px;
            width: 100%;
            position: relative;
        }

        /* ✅ Logo */
        .logo-wrap {
            position: absolute;
            top: -45px;
            left: 50%;
            transform: translateX(-50%);
            width: 85px;
            height: 85px;
            background: #fff;
            border-radius: 50%;
            box-shadow: 0 4px 16px rgba(0,0,0,0.12);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            z-index: 1;
        }
        .logo-wrap img {
            width: 72px;
            height: 72px;
            object-fit: contain;
            border-radius: 50%;
        }

        /* ✅ Headings */
        .reset-card h2 {
            text-align: center;
            font-size: 20px;
            font-weight: 700;
            color: #2c3e50;
            margin-top: 44px;
            margin-bottom: 4px;
        }
        .reset-card .sub-text {
            text-align: center;
            font-size: 13px;
            color: #888;
            margin-bottom: 20px;
        }

        /* ✅ Input wrapper - flexbox layout */
        .input-group-wrap {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: #fff;
            margin-bottom: 6px;
            transition: border-color 0.2s, box-shadow 0.2s;
            overflow: hidden;
        }
        .input-group-wrap:focus-within {
            border-color: #0dcaf0;
            box-shadow: 0 0 0 3px rgba(13,202,240,0.15);
        }
        .input-group-wrap .fa {
            padding: 0 10px 0 13px;
            color: #aaa;
            font-size: 15px;
            flex-shrink: 0;
        }
        .input-group-wrap input {
            flex: 1;
            height: 46px;
            padding: 0 8px;
            border: none;
            outline: none;
            font-size: 14px;
            background: transparent;
            min-width: 0;
            -webkit-appearance: none;
        }
        .input-group-wrap .eye-btn {
            background: none;
            border: none;
            cursor: pointer;
            color: #aaa;
            font-size: 15px;
            padding: 0 12px;
            height: 46px;
            display: flex;
            align-items: center;
            flex-shrink: 0;
            transition: color 0.2s;
        }
        .input-group-wrap .eye-btn:hover { color: #0dcaf0; }

        /* ✅ Error message */
        .error-msg {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
            display: block;
            min-height: 16px;
        }

        /* ✅ Password strength bar */
        .strength-wrap { margin-bottom: 12px; }
        .strength-bar {
            height: 4px;
            border-radius: 4px;
            background: #eee;
            overflow: hidden;
            margin-bottom: 4px;
        }
        .strength-bar-fill {
            height: 100%;
            width: 0%;
            border-radius: 4px;
            transition: width 0.3s, background 0.3s;
        }
        .strength-label { font-size: 11px; color: #aaa; }

        /* ✅ Submit button */
        .btn-reset {
            width: 100%;
            height: 48px;
            background-color: #0dcaf0;
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.2s, transform 0.1s;
            -webkit-appearance: none;
            touch-action: manipulation;
        }
        .btn-reset:hover    { background-color: #0bb8d4; transform: translateY(-1px); }
        .btn-reset:active   { transform: scale(0.98); }
        .btn-reset:disabled { opacity: 0.7; cursor: not-allowed; }

        /* ✅ Back to login */
        .back-login {
            text-align: center;
            margin-top: 14px;
            font-size: 13px;
        }
        .back-login a {
            color: #0dcaf0;
            text-decoration: none;
            font-weight: 500;
        }
        .back-login a:hover { text-decoration: underline; }

        /* ✅ Success state */
        #successWrap {
            display: none;
            text-align: center;
            padding: 20px 0 10px;
        }
        .success-icon-circle {
            width: 70px;
            height: 70px;
            background: #e8f5e9;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 14px;
        }
        .success-icon-circle i { font-size: 32px; color: #28a745; }
        #successWrap h5 {
            font-size: 17px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 8px;
        }
        #successWrap p { font-size: 13px; color: #888; line-height: 1.6; }

        /* ✅ Mobile */
        @media (max-width: 400px) {
            body { padding: 70px 12px 24px; }
            .reset-card { padding: 20px 16px 24px; }
            .reset-card h2 { font-size: 18px; }
        }
    </style>
</head>

<%String sno = (String)request.getAttribute("sno"); %>

<body>
<div class="fade-in-top">
    <div class="reset-card">

        <!-- Logo -->
        <div class="logo-wrap">
            <img src="assets/AppData/images/hlogo.png" alt="Halicon HRMS">
        </div>

        <!-- ✅ Form State -->
        <div id="formWrap">
            <h2>Reset Password</h2>
            <p class="sub-text">Enter and confirm your new password below</p>

            <form id="reset_form" name="reset_form" autocomplete="off">

                <!-- New Password -->
                <div class="input-group-wrap">
                    <i class="fa fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="New Password">
                    <button type="button" class="eye-btn" onclick="toggleEye('password','eye1')">
                        <i class="fa fa-eye-slash" id="eye1"></i>
                    </button>
                </div>
                <span class="error-msg" id="passErr"></span>

                <!-- Strength Bar -->
                <div class="strength-wrap">
                    <div class="strength-bar">
                        <div class="strength-bar-fill" id="strengthFill"></div>
                    </div>
                    <span class="strength-label" id="strengthLabel"></span>
                </div>

                <!-- Confirm Password -->
                <div class="input-group-wrap">
                    <i class="fa fa-lock"></i>
                    <input type="password" id="cpassword" name="cpassword" placeholder="Confirm Password">
                    <button type="button" class="eye-btn" onclick="toggleEye('cpassword','eye2')">
                        <i class="fa fa-eye-slash" id="eye2"></i>
                    </button>
                </div>
                <span class="error-msg" id="cpassErr"></span>

                <input type="hidden" id="sno" name="sno" value="<%=sno%>">

                <button type="submit" class="btn-reset" id="bttnn">
                    <i class="fa fa-check"></i>&nbsp; Save New Password
                </button>
            </form>

            <div class="back-login">
                <a href="./"><i class="fa fa-arrow-left"></i>&nbsp; Back to Login</a>
            </div>
        </div>

        <!-- ✅ Success State -->
        <div id="successWrap">
            <div class="success-icon-circle">
                <i class="fa fa-check"></i>
            </div>
            <h5>Password Reset!</h5>
            <p>Your password has been updated successfully.<br>Redirecting to login...</p>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

<script>
    // ✅ Eye toggle
    function toggleEye(inputId, iconId) {
        var input = document.getElementById(inputId);
        var icon  = document.getElementById(iconId);
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.replace('fa-eye-slash', 'fa-eye');
        } else {
            input.type = 'password';
            icon.classList.replace('fa-eye', 'fa-eye-slash');
        }
    }

    // ✅ Password strength checker
    document.getElementById('password').addEventListener('input', function() {
        var val      = this.value;
        var fill     = document.getElementById('strengthFill');
        var label    = document.getElementById('strengthLabel');
        var strength = 0;

        if (val.length >= 6)               strength++;
        if (val.length >= 10)              strength++;
        if (/[A-Z]/.test(val))             strength++;
        if (/[0-9]/.test(val))             strength++;
        if (/[^A-Za-z0-9]/.test(val))      strength++;

        var levels = [
            { pct: '0%',   color: '#eee',    text: '' },
            { pct: '25%',  color: '#e74c3c', text: 'Weak' },
            { pct: '50%',  color: '#f39c12', text: 'Fair' },
            { pct: '75%',  color: '#3498db', text: 'Good' },
            { pct: '90%',  color: '#2ecc71', text: 'Strong' },
            { pct: '100%', color: '#27ae60', text: 'Very Strong' }
        ];

        var lvl = val.length === 0 ? 0 : Math.min(strength, 5);
        fill.style.width      = levels[lvl].pct;
        fill.style.background = levels[lvl].color;
        label.textContent     = levels[lvl].text;
        label.style.color     = levels[lvl].color;
    });

    // ✅ Form validation & submit
    $(function() {
        $("form[name='reset_form']").validate({
            rules: {
                password:  { required: true, minlength: 6 },
                cpassword: { required: true, equalTo: "#password" }
            },
            messages: {
                password: {
                    required:  "Please enter a new password",
                    minlength: "Password must be at least 6 characters"
                },
                cpassword: {
                    required: "Please confirm your password",
                    equalTo:  "Passwords do not match"
                }
            },
            errorPlacement: function(error, element) {
                if (element.attr('id') === 'password')  $('#passErr').text(error.text());
                if (element.attr('id') === 'cpassword') $('#cpassErr').text(error.text());
            },
            success: function(label, element) {
                if ($(element).attr('id') === 'password')  $('#passErr').text('');
                if ($(element).attr('id') === 'cpassword') $('#cpassErr').text('');
            },
            submitHandler: function(form) {
                $("#bttnn").html('<i class="fa fa-spinner fa-spin"></i>&nbsp; Saving...').prop('disabled', true);

                var fd = new FormData();
                fd.append("sno",      $("#sno").val());
                fd.append("password", $("#password").val());

                $.ajax({
                    url:'reset_password',
                    type:'post',
                    data:fd,
                    contentType: false,
                    processData: false,
                    success: function(data) {
                        if (data['status'] == 'Success') {
                            // ✅ Hide form show success
                            $("#formWrap").css("display", "none");
                            $("#successWrap").css("display", "block");
                            setTimeout(function() {
                                window.location.href = './';
                            }, 2500);
                        } else {
                            $("#bttnn").html('<i class="fa fa-check"></i>&nbsp; Save New Password').prop('disabled', false);
                            $('#passErr').text('Reset failed. Please try again.');
                        }
                    },
                    error: function() {
                        $("#bttnn").html('<i class="fa fa-check"></i>&nbsp; Save New Password').prop('disabled', false);
                        $('#passErr').text('Something went wrong. Please try again.');
                    }
                });
            }
        });
    });
</script>
</body>
</html>