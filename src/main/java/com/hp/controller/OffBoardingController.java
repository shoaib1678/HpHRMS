package com.hp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.hp.model.OffBoarding;
import com.hp.service.OffboardingService;


@Controller
public class OffBoardingController {

	@Autowired
	OffboardingService offboardingService;
	
	@RequestMapping(value = "/add_offboarding",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> add_offboarding(@RequestBody OffBoarding offBoarding){
		Map<String, Object> response = offboardingService.add_offboarding(offBoarding);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	
	@RequestMapping(value="get_resignations", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> get_resignations(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		String user_type =request.getParameter("user_type");
		response = offboardingService.get_resignations(start,length,employee_id,user_type);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/update_resignation",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> update_resignation(HttpServletRequest request){
		int sno = Integer.parseInt(request.getParameter("sno"));
		String status = request.getParameter("status");
	     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Map<String, Object> response =new HashMap<String,Object>(); 
		   try {
		 		Date date = dateFormat.parse(request.getParameter("date")) ;
		 	   offboardingService.update_resignation(sno,status,date);
			} catch (Exception e) {
				response.put("status", "Failed");
				response.put("message", "Date Format Exception");
			}
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
