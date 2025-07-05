package com.hp.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hp.dao.CommonDao;
import com.hp.model.Department;
import com.hp.model.Designation;
import com.hp.model.EmployeeDetails;
import com.hp.model.EmployeeLeaves;
import com.hp.model.EmployeeSalary;
import com.hp.model.Leaves;
import com.hp.model.LoginCredentials;
import com.hp.model.PincodeData;
import com.hp.model.Rights;
import com.hp.utils.Utils;

@Controller
public class HomeController {

	@Autowired
	CommonDao commonDao;
	

	@RequestMapping(value="/")
	public ModelAndView signin(HttpServletRequest request) throws IOException{
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("email", "admin@haliconpub.com");
		List<LoginCredentials> loginCredentials = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(), null, null, 0, -1);
		if(loginCredentials.size() ==0) {
			LoginCredentials login = new LoginCredentials();
			login.setEmail("admin@haliconpub.com");
			login.setPassword("Halicon@2025");
			login.setUser_type("Admin");
			login.setCreatedAt(new Date());
			login.setStatus("Active");
			 commonDao.addDataToDb(login);
		}
		return new  ModelAndView("hrms/login");
	}
	/*************************************HRMS Page Url Start ****************************/
	@RequestMapping(value = "/dashboard")
	public ModelAndView dashboard(HttpServletRequest request, HttpSession session) throws IOException {
	    LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
	    String email = request.getParameter("email");
	    LoginCredentials user = null;

	    if (loginData != null) {
	        user = loginData;
	    } else if (email != null && !email.isEmpty()) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("email", email);
	        List<LoginCredentials> users = (List<LoginCredentials>) commonDao.getDataByMap(map, new LoginCredentials(), null, null, 0, -1);
	        if (!users.isEmpty()) {
	            user = users.get(0);
	            session.setAttribute("email", email);
	        }
	    }

	    if (user != null) {
	        return prepareDashboard(user, session);
	    } else {
	        return new ModelAndView("redirect:../");
	    }
	}

	private ModelAndView prepareDashboard(LoginCredentials loginCredentials, HttpSession session) {
	    ModelAndView mv = new ModelAndView("hrms/dashboard");

	    Map<String, Object> map = new HashMap<>();
	    map.put("sno", loginCredentials.getEmployee_id());

	    List<EmployeeDetails> empList = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);

	    Set<String> rights_set = new HashSet<>();

	    if (!empList.isEmpty()) {
	        EmployeeDetails emp = empList.get(0);

	        Map<String, Object> map1 = new HashMap<>();
	        map1.put("employee_code", emp.getEmployee_id());
	        List<Rights> rdata = (List<Rights>) commonDao.getDataByMap(map1, new Rights(), null, null, 0, -1);

	        if (!rdata.isEmpty()) {
	            Rights rights = rdata.get(0);
	            List<String> rights_name = new ArrayList<>();

	            if (rights.getDepartment() != null && !rights.getDepartment().isEmpty()) rights_name.add(rights.getDepartment());
	            if (rights.getDesignation() != null && !rights.getDesignation().isEmpty()) rights_name.add(rights.getDesignation());
	            if (rights.getLeaves() != null && !rights.getLeaves().isEmpty()) rights_name.add(rights.getLeaves());
	            if (rights.getAddEmployee() != null && !rights.getAddEmployee().isEmpty()) rights_name.add(rights.getAddEmployee());
	            if (rights.getViewEmployee() != null && !rights.getViewEmployee().isEmpty()) rights_name.add(rights.getViewEmployee());
	            if (rights.getAttendance_approval() != null && !rights.getAttendance_approval().isEmpty()) rights_name.add(rights.getAttendance_approval());
	            if (rights.getAttendance_srearch() != null && !rights.getAttendance_srearch().isEmpty()) rights_name.add(rights.getAttendance_srearch());
	            if (rights.getLeave_approval() != null && !rights.getLeave_approval().isEmpty()) rights_name.add(rights.getLeave_approval());

	            rights_set.addAll(rights_name);
	        }

	        if ("Employee".equalsIgnoreCase(loginCredentials.getUser_type())) {
	            Map<String, Object> d = new HashMap<>();
	            d.put("sno", emp.getDesignation_id());
	            List<Designation> designations = (List<Designation>) commonDao.getDataByMap(d, new Designation(), null, null, 0, -1);
	            if (!designations.isEmpty()) {
	                session.setAttribute("designation", designations.get(0).getDesignation_name());
	            }
	            session.setAttribute("empDetails", emp);
	        }
	    }

	    session.setAttribute("rights_set", rights_set);
	    session.setAttribute("login_data", loginCredentials);

	    // Load all departments, designations, and employees
	    Map<String, Object> map1 = new HashMap<>();
	    mv.addObject("departments", commonDao.getDataByMap(map1, new Department(), null, null, 0, -1));
	    mv.addObject("designation", commonDao.getDataByMap(map1, new Designation(), null, null, 0, -1));
	    mv.addObject("employeeDetails", commonDao.getDataByMap(map1, new EmployeeDetails(), null, null, 0, -1));

	    return mv;
	}

	
	@RequestMapping(value="/department")
	public ModelAndView department(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			return new ModelAndView("hrms/department");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	@RequestMapping(value="/changepassword")
	public ModelAndView changepassword(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			ModelAndView mv = new ModelAndView("hrms/changePassword");
			mv.addObject("sno", loginData.getSno());
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	@RequestMapping(value="/view_employee")
	public ModelAndView view_employee(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			List<EmployeeDetails> data = new ArrayList<EmployeeDetails>();
			Map<String,Object> map = new HashMap<String,Object>();
			if(loginData.getEmployee_id() > 0) {
				map.put("sno", loginData.getEmployee_id());
				data = (List<EmployeeDetails>)commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
				Map<String,Object> mp = new HashMap<String,Object>();
				mp.put("sno", data.get(0).getDesignation_id());
				List<Designation> d = (List<Designation>)commonDao.getDataByMap(mp, new Designation(), null, null, 0, -1);
				data.get(0).setDesignation_name(d.get(0).getDesignation_name());
			}else {
				data = (List<EmployeeDetails>)commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
				for(EmployeeDetails e : data) {
					Map<String,Object> mp = new HashMap<String,Object>();
					mp.put("sno", e.getDesignation_id());
					List<Designation> d = (List<Designation>)commonDao.getDataByMap(mp, new Designation(), null, null, 0, -1);
					e.setDesignation_name(d.get(0).getDesignation_name());
				}
			}
			ModelAndView mv = new ModelAndView("hrms/viewEmployee");
			mv.addObject("data", data);
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	
	@RequestMapping(value="/attendance")
	public ModelAndView attendance(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			Map<String, Object> map =  new HashMap<String,Object>();
			List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
			String user_type = loginData.getUser_type();
			ModelAndView mv   = new ModelAndView("hrms/attendance");
			mv.addObject("employeeDetails",employeeDetails);
			mv.addObject("user_type",user_type);
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value="/salary")
	public ModelAndView salary(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			Map<String, Object> map =  new HashMap<String,Object>();
			List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
			ModelAndView mv   = new ModelAndView("hrms/salary");
			mv.addObject("employeeDetails",employeeDetails);
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	
	@RequestMapping(value="/get_leaves")
	public ModelAndView get_leaves(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			Map<String, Object> map =  new HashMap<String,Object>();
			List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
			List<Leaves> leaves = (List<Leaves>) commonDao.getDataByMap(map, new Leaves(), null, null, 0, -1);
			String user_type = loginData.getUser_type();
			ModelAndView mv   = new ModelAndView("hrms/leave");
			mv.addObject("employeeDetails",employeeDetails);
			mv.addObject("leaves",leaves);
			mv.addObject("user_type",user_type);
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	
	@RequestMapping(value="/designation")
	public ModelAndView designation(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			Map<String, Object> map = new HashMap<String,Object>();
			List<Department> deparments = (List<Department>) commonDao.getDataByMap(map, new Department(), null, null, 0, -1);
			ModelAndView mv  = new ModelAndView("hrms/designation");
			mv.addObject("department", deparments);
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value="/branch")
	public ModelAndView branch(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			return new ModelAndView("hrms/branch");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	@RequestMapping(value="/rights")
	public ModelAndView rights(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			ModelAndView mv = new ModelAndView("hrms/rights");
			Map<String, Object> map = new HashMap<String,Object>();
			List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
			mv.addObject("employeeDetails", employeeDetails);
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	@RequestMapping(value="/leave_requests")
	public ModelAndView leave_request(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			return new ModelAndView("hrms/leave_request");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	
	@RequestMapping(value="/holidays")
	public ModelAndView holidays(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			ModelAndView mv = new ModelAndView("hrms/holiday");
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	@RequestMapping(value = "/getdatafrompincode")
	public ResponseEntity<Map<String, Object>> getdatafrompincode(HttpServletRequest request) {	
		Map<String, Object> response = new HashMap<String, Object>();
		String pincode = request.getParameter("pincode");
		String uri = "http://www.postalpincode.in/api/pincode/" + pincode;
		RestTemplate restTemplate = new RestTemplate();
		String resultdata = restTemplate.getForObject(uri, String.class);
		System.out.println(resultdata);
		Gson gson = new Gson();
		PincodeData result = gson.fromJson(resultdata, PincodeData.class);

		if (result.getStatus().equalsIgnoreCase("success")) {
			response.put("status", "success");
			for (int i = 0; i < 1; i++) {
				response.put("country", result.getPostOffice().get(i).getCountry());
				response.put("state", result.getPostOffice().get(i).getState());
				response.put("district", result.getPostOffice().get(i).getDistrict());
				response.put("division", result.getPostOffice().get(i).getDivision());
				response.put("circle", result.getPostOffice().get(i).getCircle());
				response.put("taluk", result.getPostOffice().get(i).getTaluk());
				response.put("region", result.getPostOffice().get(i).getRegion());
			}
			
			response.put("message", "No Data Found");
		} else {
			response.put("status", "error");
			response.put("message", "No Data Found");
		}
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
	
	@RequestMapping(value="/offerLetter")
	public ModelAndView offerLetter(HttpServletRequest request) throws IOException{
		ModelAndView mv = new  ModelAndView("pdf/offerLetter");
		return mv;
	}
	
	@RequestMapping(value="/appointmentLetter")
	public ModelAndView appointmentLetter(HttpServletRequest request) throws IOException{
		ModelAndView mv = new  ModelAndView("pdf/appointmentLetter");
		return mv;
	}
	@RequestMapping(value="/leaves")
	public ModelAndView leaves(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			return new ModelAndView("hrms/leaves");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	@RequestMapping(value="/leaves_policy")
	public ModelAndView leaves_policy(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			return new ModelAndView("hrms/leave_policy");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	@RequestMapping(value="/resignation")
	public ModelAndView resignation(HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			Map<String, Object> map = new HashMap<String,Object>();
			List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
			ModelAndView mv = new ModelAndView("hrms/resignation");
			mv.addObject("loginData",loginData);
			mv.addObject("employeeDetails",employeeDetails);
			return mv;
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	
	
		@RequestMapping(value="/employee")
			public ModelAndView employee(HttpSession session) throws IOException{
				LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
				if(loginData != null) {
					ModelAndView mv = new ModelAndView("hrms/employee");
					Map<String, Object> map = new HashMap<String,Object>();
					List<Department> departments = (List<Department>) commonDao.getDataByMap(map, new Department(), null, null, 0, -1);
					mv.addObject("departments",departments);
					return mv;
				}else {
					return new ModelAndView("redirect:/");
				}
		}
	
	/*************************************HRMS Page Url end ****************************/
	
		@RequestMapping(value = "/displaydocument", method = RequestMethod.GET)
		public ResponseEntity<byte[]> getdocumentcourse(HttpServletRequest request) throws IOException {
			String url = request.getParameter("url");
			
			String path = Utils.staticimages;
			HttpHeaders headers = new HttpHeaders();
			InputStream in = null;
			try {
				in = new FileInputStream(path + url);/* ;new FileInputStream(downloadFile); */
			} catch (Exception e) {
				System.out.println(e);
			}
			byte[] media = IOUtils.toByteArray(in);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			ResponseEntity<byte[]> responseEntity = new ResponseEntity(media, headers, HttpStatus.OK);
			return responseEntity;
		}
	
	/*************************************Inventory Page Url Start ****************************/
	
	@RequestMapping(value="/forget")
	public ModelAndView forgetpassword(HttpServletRequest request) throws IOException{
		ModelAndView mv = new  ModelAndView("website/forgetPassword");
		return mv;
	}
	
	@RequestMapping(value="/profile")
	public ModelAndView profile(HttpServletRequest request,HttpSession session) throws IOException{
		LoginCredentials loginData = (LoginCredentials) session.getAttribute("login_data");
		if(loginData != null) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("employee_id", loginData.getEmployee_id());
			List<EmployeeDetails> empDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map,new EmployeeDetails(),null,null,0,-1);
			Map<String,Object> map1 = new HashMap<String,Object>();
			System.out.println(empDetails.get(0).getDesignation_id() + "dasdsa designation i d");
			map1.put("sno", empDetails.get(0).getDesignation_id());
			List<Designation> designations = (List<Designation>) commonDao.getDataByMap(map1, new Designation(), null, null, 0, -1);
			List<EmployeeSalary> employeeSalaries = (List<EmployeeSalary>) commonDao.getDataByMap(map, new EmployeeSalary(), null, null, 0, -1);
			List<EmployeeLeaves> employeeLeaves = (List<EmployeeLeaves>) commonDao.getDataByMap(map, new EmployeeLeaves(), null, null, 0, -1);
			for(EmployeeLeaves l: employeeLeaves) {
				Map<String,Object> map2 = new HashMap<String,Object>();
				map2.put("sno", l.getLeave_id());
				List<Leaves> leave = (List<Leaves>) commonDao.getDataByMap(map2, new Leaves(), null, null, 0, -1);
				l.setLeave_name(leave.get(0).getLeaves_name());
			}
		ModelAndView mv = new  ModelAndView("hrms/profile");
		mv.addObject("details",empDetails);
		mv.addObject("designations",designations);
		mv.addObject("salary",employeeSalaries);
		mv.addObject("employeeLeaves",employeeLeaves);
		return mv;
		}
		else {
			return new ModelAndView("redirect:/");
		}
	}
}

