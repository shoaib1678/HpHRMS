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

import com.hp.model.Designation;
import com.hp.service.DesignationService;


@Controller
public class DesignationController {

	@Autowired
	DesignationService designationService;
	
	@RequestMapping(value = "add_designation", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_designation(@RequestBody Designation designation){
		Map<String, Object> response = new HashMap<String,Object>();
		response = designationService.add_designation(designation);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	
	@RequestMapping(value="get_designation", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> get_designation(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		response = designationService.get_designation(start,length,employee_id);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping(value="/get_department_designation",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> get_designations(HttpServletRequest request ){
		String sno = request.getParameter("sno");
		Map<String, Object> response = designationService.get_designations(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
