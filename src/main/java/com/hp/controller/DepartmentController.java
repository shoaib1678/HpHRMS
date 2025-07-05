package com.hp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hp.model.Department;
import com.hp.service.DepartmentService;


@Controller
public class DepartmentController {

	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value="add_department", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_department(@RequestBody Department deparment){
		Map<String, Object> response = departmentService.add_department(deparment);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping(value="get_department", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> get_department(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		response = departmentService.get_department(start,length,employee_id);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
