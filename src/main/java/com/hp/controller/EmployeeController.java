package com.hp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.hp.model.EmployeeDetails;
import com.hp.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService; 
	
	@RequestMapping(value = "addEmployee", method= RequestMethod.POST)
	private ResponseEntity<Map<String, Object>> add_employee(@RequestParam(value="employee") String employee, @RequestParam(value="adhar_document") MultipartFile adhar_doc,@RequestParam(value = "pan_document" ) MultipartFile pan_doc,@RequestParam(value = "profile_picture" ) MultipartFile profile_picture){
		Gson gson = new Gson();
		EmployeeDetails employeeDetail = gson.fromJson(employee, EmployeeDetails.class);
		Map<String, Object> resposne = employeeService.add_employee(employeeDetail,adhar_doc,pan_doc,profile_picture);
		return new ResponseEntity<Map<String,Object>>(resposne,HttpStatus.OK);
	}
	@RequestMapping(value="/getEmployee",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> getEmployee(HttpServletRequest request ){
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String employee_id = request.getParameter("employee_id");
		String user_type = request.getParameter("user_type");
		Map<String, Object> response = employeeService.getEmployee(start,length,employee_id,user_type);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/get_employeebydepart",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> get_employeebydepart(HttpServletRequest request ){
		String sno = request.getParameter("sno");
		Map<String, Object> response = employeeService.get_employeebydepart(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/getEmployeeForTeam",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> getEmployeeForTeam(HttpServletRequest request ){
		String sno = request.getParameter("sno");
		String department_id = request.getParameter("department_id");
		Map<String, Object> response = employeeService.getEmployeeForTeam(sno,department_id);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/add_documents", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_documents(@RequestParam("file") MultipartFile[] file,
			@RequestParam("employee_id") String employee_id) {
		for (MultipartFile i : file) {
			System.out.println(i.getName());
		}
		Map<String, Object> response = employeeService.add_documents(file, employee_id);
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/get_employeedata",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> get_employeedata(@RequestBody EmployeeDetails employeeDetails){
		Map<String, Object> response = employeeService.get_employeedata(employeeDetails);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
