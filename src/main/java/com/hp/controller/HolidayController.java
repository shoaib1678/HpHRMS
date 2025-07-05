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

import com.hp.model.Holiday;
import com.hp.service.HolidayService;



@Controller
public class HolidayController {

	@Autowired
	HolidayService holidayService;
	
	@RequestMapping(value="/add_holiday",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> add_holiday(@RequestBody Holiday details ){
		Map<String, Object> response = holidayService.add_holiday(details);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/getHoliday",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> getHoliday(HttpServletRequest request ){
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		Map<String, Object> response = holidayService.getHoliday(start,length);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
