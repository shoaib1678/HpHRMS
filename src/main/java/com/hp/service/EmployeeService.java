package com.hp.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hp.dao.CommonDao;
import com.hp.model.Designation;
import com.hp.model.EmployeeDetails;
import com.hp.model.EmployeeDocuments;
import com.hp.model.EmployeeLeaves;
import com.hp.model.EmployeeSalary;
import com.hp.model.Leaves;
import com.hp.model.LoginCredentials;
import com.hp.utils.Utils;



@Service
public class EmployeeService {
	
	@Autowired
	CommonDao commonDao;
	@Autowired
	EmailService emailService;
	
	public Map<String, Object> add_employee(EmployeeDetails employeeDetail, MultipartFile adhar_doc,
			MultipartFile pan_doc, MultipartFile profile_picture) {
			Map<String, Object> response = new HashMap<String,Object>();
			try {
				Map<String,Object> map = new HashMap<String,Object>();
				String password = Utils.generateRandomPassword(8);
				
				map.put("email", employeeDetail.getEmail());
				List<EmployeeDetails> empDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
				if(empDetails.size() >0) {
					response.put("status", "Already_Exist");
					response.put("message", "Email already Exist");
				}else {
					 Utils utils = new Utils();

		                String pandata = utils.uploadImage(pan_doc);
		                String aadhardata = utils.uploadImage(adhar_doc);
		                String profile = utils.uploadImage(profile_picture);
					
					employeeDetail.setAdhar_document(aadhardata);
					employeeDetail.setPan_document(pandata);
					employeeDetail.setProfile_picture(profile);
					employeeDetail.setPassword(password);
					employeeDetail.setStatus("Active");
					employeeDetail.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(employeeDetail);
					if(i >0 ) {
						String loginURL ="https://hrms.haliconpub.com/";
			            String subject = "Access Credentials for Your Employee Account";
						String message =
							    "<!DOCTYPE html>" +
							    "<html><head>" +
							    "<style>" +
							    "  body { font-family: Arial, sans-serif; line-height: 1.6; }" +
							    "  .container { max-width: 600px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; margin: auto; }" +
							    "  h2 { color: #2c3e50; text-align: center; }" +
							    "  .highlight { font-weight: bold; color: #333; }" +
							    "  .footer { margin-top: 20px; font-size: 14px; color: #555; text-align: center; }" +
							    "  .logo { display: block; margin: 0 auto 20px; max-height: 80px; }" +
							    "</style>" +
							    "</head><body>" +
							    "<div class='container'>" +
							    "<img src='https://haliconpub.com/assets/img/hlogo.png' alt='Company Logo' class='logo'>" +
							    "<h2>Welcome to Halicon Publication</h2>" +
							    "<p>Dear <span class='highlight'>" +employeeDetail.getFirst_name()+ " " +employeeDetail.getLast_name()+ "</span>,</p>" +
							    "<p>Your login credentials have been successfully created. Below are your details:</p>" +
							    "<table>" +
							    "  <tr><td class='highlight'>Username:</td><td>" + employeeDetail.getEmail() + "</td></tr>" +
							    "  <tr><td class='highlight'>Password:</td><td>" + password + "</td></tr>" +
							    "</table>" +
							    "<p>You can log in to the portal using the following link:</p>" +
							    "<p><a href='" + loginURL + "'>" + loginURL + "</a></p>" +
							    "<p>We recommend changing your password after your first login for security purposes.</p>" +
							    "<p>If you have any questions or issues, feel free to reach out to the IT support team.</p>" +
							    "<p>Best regards,<br/>" +
							    "HR Team<br/>" +
							    "Halicon Publication</p>" +
							    "<div class='footer'>" +
							    "This is an automated email. Please do not reply directly." +
							    "</div>" +
							    "</div></body></html>";

						emailService.sendEmailMessage(employeeDetail.getEmail(), subject, message);
						employeeDetail.setEmployee_id(i);
						commonDao.updateDataToDb(employeeDetail);
						LoginCredentials loginCredentials = new LoginCredentials();
						loginCredentials.setEmployee_id(i);
						loginCredentials.setEmail(employeeDetail.getEmail());
						loginCredentials.setPassword(password);
						loginCredentials.setUser_type("Employee");
						loginCredentials.setStatus("Active");
						loginCredentials.setCreatedAt(new Date());
						int j = commonDao.addDataToDb(loginCredentials);
						
						Map<String, Object> map3 = new HashMap<String,Object>();
						List<Leaves> employeeLeaves = (List<Leaves>) commonDao.getDataByMap(map3, new Leaves(), null, null, 0, -1);
						if(employeeLeaves.size() >0) {
							EmployeeLeaves el = new EmployeeLeaves();
							el.setEmployee_id(i);
							el.setCreatedAt(new Date());
							for (Leaves es : employeeLeaves) {
								if(es.getProgressive_leave().equalsIgnoreCase("true")){
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
									Date joiningDate = employeeDetail.getJoining_date(); // Replace with your actual method

									Calendar cal = Calendar.getInstance();
									cal.setTime(joiningDate);

									int dayOfMonth = cal.get(Calendar.DAY_OF_MONTH);

									if (dayOfMonth >= 1 && dayOfMonth <= 10) {
									    el.setTotal_leaves(1.5f);
									    el.setRemaining_leave(1.5f);
									} else {
									    el.setTotal_leaves(0f);
									    el.setRemaining_leave(0f);
									}
								}else {
									el.setTotal_leaves(es.getLeaves_count());
									el.setRemaining_leave(es.getLeaves_count());
								}
								el.setLeave_id(es.getSno());
								int f = commonDao.addDataToDb(el);
							}
							
						}
						EmployeeSalary es = employeeDetail.getEmployeeSalary().get(0);
						es.setCreatedAt(new Date());
						es.setStatus("Active");
						es.setEmployee_id(i);
						int v = commonDao.addDataToDb(es);
						response.put("status", "Success");
						response.put("message", "Employee Registered Successfully");
					}else {
						response.put("status", "Failed");
						response.put("message", "Internal Server Error");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.put("status", "Failed");
				response.put("message", "Something Went Wrong" +e);
			}
		return response;
	}


	public Map<String, Object> getEmployee(int start, int length,
			String employee_id,String user_type) {
			Map<String, Object> response = new HashMap<String,Object>(); 
			try {
				Map<String, Object> map = new HashMap<String,Object>();
				if(user_type.equals("Employee")) {
					map.put("employee_id", Integer.parseInt(employee_id));
				}
			
				List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, start, length);
				int count = commonDao.getDataByMapSize(map, new EmployeeDetails(), null, null, 0, -1);
				if(employeeDetails.size() >0) {
					response.put("status", "Success");
					response.put("message", "Data Fetched Successfully");
					response.put("data", employeeDetails);
					response.put("recordsFiltered", count);
					response.put("recordsTotal", count);
				}else {
					response.put("status", "No_Content");
					response.put("message", "No_Data_Found");
					response.put("data", new ArrayList<>());
					response.put("recordsFiltered", 0);
					response.put("recordsTotal", 0);
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.put("status", "Failed");
				response.put("message", "Something Went Wrong" +e);
			}
			return response;
	}

	public Map<String, Object> get_employeebydepart(String sno) {
			Map<String, Object> response = new HashMap<String,Object>(); 
			try {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("department_id", Integer.parseInt(sno));
				List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
				if(employeeDetails.size() >0) {
					response.put("status", "Success");
					response.put("message", "Data Fetched Successfully");
					response.put("data", employeeDetails);
				}else {
					response.put("status", "No_Content");
					response.put("message", "No_Data_Found");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.put("status", "Failed");
				response.put("message", "Something Went Wrong" +e);
			}
			return response;
	}

	public Map<String, Object> getEmployeeForTeam(String sno, String department_id) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			int id = Integer.parseInt(sno);
			Map<String, Object> map = new HashMap<>();
			map.put("department_id", Integer.parseInt(department_id));
			List<EmployeeDetails> empd = new ArrayList<EmployeeDetails>();
			List<EmployeeDetails> data = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
			if(data.size() >0) {
				for(EmployeeDetails e : data) {
					if(e.getSno() != id) {
						empd.add(e);
					}
				}
				System.out.println("empd=="+empd.size());
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", empd);
			}else {
				response.put("status", "No_Data");
				response.put("message", "No Data Found");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	public Map<String, Object> add_documents(MultipartFile[] file, String employee_id) {

		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("employee_id", Integer.parseInt(employee_id));
			EmployeeDocuments employeeDocuments2 = new EmployeeDocuments();
			employeeDocuments2.setEmployee_id(Integer.parseInt(employee_id));
			int j  =0;
			Utils utils = new Utils();
			System.out.println(file.length);
			for (int i=0;i<file.length;i++) {
				String name = utils.uploadImage(file[i]);
				System.out.println(name);
				employeeDocuments2.setDocument(name);
			j = commonDao.addDataToDb(employeeDocuments2);
	}
	if(j >0) {
		   List<LoginCredentials> loginCredentials = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(), null, null, 0, -1);
		   	if(loginCredentials.size()>0) {
		   		loginCredentials.get(0).setStatus("Active");
		   		commonDao.updateDataToDb(loginCredentials.get(0));
		   		response.put("status", "Success");
		   	}
			}else {
				response.put("status", "Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}


	public Map<String, Object> get_employeedata(EmployeeDetails employeeDetails) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("sno", employeeDetails.getSno());
				List<EmployeeDetails> empDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
				if(empDetails.size() >0) {
					Map<String,Object> map1 = new HashMap<String,Object>();
					map1.put("sno", empDetails.get(0).getDesignation_id());
					List<Designation> designations = (List<Designation>) commonDao.getDataByMap(map1, new Designation(), null, null, 0, -1);
					List<String> images = new ArrayList<String>();
				
					images.add(empDetails.get(0).getPan_document());
					images.add(empDetails.get(0).getAdhar_document());
				
					Map<String,Object> map3 = new HashMap<String,Object>();
					map3.put("sno", empDetails.get(0).getSno());
					List<EmployeeDocuments> employeeDocuments = (List<EmployeeDocuments>) commonDao.getDataByMap(map3, new EmployeeDocuments(), null, null, 0, -1);
				if(employeeDocuments.size() >0) {
					for(EmployeeDocuments e :employeeDocuments ) {
						images.add(e.getDocument());
					}
				}
				response.put("documents", images);
				response.put("data", empDetails.get(0));
				response.put("data2", designations.get(0));
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully" );
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	
}
