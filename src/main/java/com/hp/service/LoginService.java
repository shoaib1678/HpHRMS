package com.hp.service;

import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.dao.CommonDao;
import com.hp.model.EmployeeDetails;
import com.hp.model.LoginCredentials;
import com.hp.utils.EncriptionData;
import com.hp.utils.Utils;


@Service
public class LoginService {

	@Autowired
	CommonDao commonDao;
	@Autowired
	EmailService emailService;
	
	public Map<String, Object> login(String email, String password) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("email", email);
			map.put("password", password);
			map.put("status", "Active");
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			System.out.println("size="+data.size());
			if (data.size() > 0) {
				response.put("status", "Success");
			} else {
				response.put("status", "Failed");
				response.put("message", "Something Went Wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
		
	}
	public Map<String, Object> change_password(String sno, String password) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sno", Integer.parseInt(sno));
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			if (data.size() > 0) {
				Map<String, Object> search = new HashMap<String, Object>();
				search.put("sno", data.get(0).getSno());
				ObjectMapper mapObject = new ObjectMapper();
				Map<String, Object> mapObj = mapObject.convertValue(new LoginCredentials(), Map.class);
				mapObj.put("password", password);
				int id = commonDao.updateMethodForAll(mapObj, "LoginCredentials", search);
				if (id > 0) {
					response.put("status", "Success");
					response.put("message", "Password Changed Successfully");
					return response;
				}
			} else {
				System.out.println("Failure");
				response.put("status", "Failure");
				response.put("message", "Something went wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> validate_password(String sno, String password) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sno", Integer.parseInt(sno));
			map.put("password", password);
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			if (data.size() > 0) {
					response.put("status", "Success");
					response.put("message", "Password validate Successfully");
			
			} else {
				response.put("status", "Failed");
				response.put("message", "Invalid Current Password");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}
	public Map<String, Object> forgot_password(String email) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("email", email);
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			if (data.size() > 0) {
				Map<String, Object> map1 = new HashMap<String, Object>();
				map1.put("sno", data.get(0).getEmployee_id());
				List<EmployeeDetails> emp = (List<EmployeeDetails>) commonDao.getDataByMap(map1, new EmployeeDetails(),null, null, 0, -1);
				String name="";
				if(emp.size() > 0) {
					name=emp.get(0).getFirst_name()+" "+emp.get(0).getLast_name();
				}
				String id = EncriptionData.encrypt(String.valueOf(data.get(0).getSno()));
				String encodedId = URLEncoder.encode(id, "UTF-8");
				String resetURL = "https://hrms.haliconpub.com/reset?id=" + encodedId;
				//String resetURL = "http://localhost:8080/HpHRMS/reset?id="+encodedId;
				String subject = "Your Halicon Publication HRMS Password Reset Request";
				String message =
				    "<!DOCTYPE html>" +
				    "<html><head>" +
				    "<meta charset='UTF-8'>" +
				    "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
				    "<style>" +
				    "  body { font-family: Arial, sans-serif; line-height: 1.6; background-color: #f4f4f4; margin: 0; padding: 20px; }" +
				    "  .wrapper { max-width: 600px; margin: auto; }" +
				    "  .header { background-color: #0dcaf0; padding: 20px; text-align: center; border-radius: 8px 8px 0 0; }" +
				    "  .header img { max-height: 70px; }" +
				    "  .container { background-color: #ffffff; padding: 30px; border: 1px solid #ddd; border-top: none; border-radius: 0 0 8px 8px; }" +
				    "  h2 { color: #2c3e50; text-align: center; margin-bottom: 20px; }" +
				    "  p { color: #444; font-size: 15px; }" +
				    "  .highlight { font-weight: bold; color: #2c3e50; }" +
				    "  .btn-wrap { text-align: center; margin: 30px 0; }" +
				    "  .btn { display: inline-block; padding: 12px 30px; background-color: #0dcaf0; color: #fff !important;" +
				    "         text-decoration: none; border-radius: 6px; font-size: 15px; font-weight: bold; }" +
				    "  .btn:hover { background-color: #0bb8d4; }" +
				    "  .divider { border: none; border-top: 1px solid #eee; margin: 20px 0; }" +
				    "  .warning { background-color: #fff8e1; border-left: 4px solid #ffc107; padding: 10px 15px;" +
				    "             font-size: 13px; color: #666; border-radius: 4px; margin: 20px 0; }" +
				    "  .footer { text-align: center; margin-top: 20px; font-size: 12px; color: #999; }" +
				    "  .footer a { color: #0dcaf0; text-decoration: none; }" +
				    "</style>" +
				    "</head><body>" +
				    "<div class='wrapper'>" +

				    // ✅ Header with logo on colored background
				    "<div class='header'>" +
				    "  <img src='https://haliconpub.com/assets/img/hlogo.png' alt='Halicon Publication'>" +
				    "</div>" +

				    "<div class='container'>" +
				    "  <h2>Password Reset Request</h2>" +
				    "  <p>Dear <span class='highlight'>" + name + "</span>,</p>" +
				    "  <p>We received a request to reset the password for your HRMS account. " +
				    "     Click the button below to set a new password:</p>" +

				    // ✅ CTA Button
				    "  <div class='btn-wrap'>" +
				    "    <a href='" + resetURL + "' class='btn'>Reset My Password</a>" +
				    "  </div>" +

				    // ✅ Expiry warning
				    "  <div class='warning'>" +
				    "    &#9888; This link is valid for <strong>30 minutes</strong> only. " +
				    "    Please reset your password before it expires." +
				    "  </div>" +

				    "  <hr class='divider'>" +

				    // ✅ Security note
				    "  <p style='font-size:13px; color:#888;'>" +
				    "    If you did not request a password reset, please ignore this email. " +
				    "    Your password will remain unchanged. If you believe your account is at risk, " +
				    "    contact IT Support immediately." +
				    "  </p>" +

				    "  <p>Best regards,<br/>" +
				    "     <strong>IT Support Team</strong><br/>" +
				    "     Halicon Publication</p>" +

				    "</div>" +

				    // ✅ Footer
				    "<div class='footer'>" +
				    "  <p>This is an automated email. Please do not reply directly.</p>" +
				    "  <p>&copy; 2025 Halicon Publication. All rights reserved.</p>" +
				    "  <p><a href='https://haliconpub.com'>haliconpub.com</a></p>" +
				    "</div>" +

				    "</div>" +
				    "</body></html>";
					emailService.sendEmailMessage(email, subject, message);
				response.put("status", "Success");
				response.put("message", "Password Changed Successfully");
				return response;		
			} else {
				System.out.println("Failed");
				response.put("status", "Failure");
				response.put("message", "Something went wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}
	public Map<String, Object> reset_password(String sno, String password) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			System.out.println("sn="+sno);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sno", Integer.parseInt(sno));
			List<LoginCredentials> data = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(),null, null, 0, -1);
			if (data.size() > 0) {
				data.get(0).setPassword(password);
				commonDao.updateDataToDb(data.get(0));
					response.put("status", "Success");
					response.put("message", "Password Reset Successfully");
			} else {
				response.put("status", "Failed");
				response.put("message", "Invalid Current Password");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}
}
