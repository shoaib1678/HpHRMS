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

import com.hp.model.Attendance;
import com.hp.service.AttendanceService;



@Controller
public class AttendanceController {

	@Autowired
	AttendanceService attendanceService;
	
	@RequestMapping(value="/add_attendance",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> add_attendance(@RequestBody Attendance details ){
		Map<String, Object> response = attendanceService.add_attendance(details);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/clock_out_attendance",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> clock_out_attendance(@RequestBody Attendance details ){
		Map<String, Object> response = attendanceService.clock_out_attendance(details);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping(value="/update_attendance",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> update_attendance(HttpServletRequest request){
		String sno = request.getParameter("sno");
		String a_type = request.getParameter("a_type");
		Map<String, Object> response = attendanceService.update_attendance(sno,a_type);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/pay_salary",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> pay_salary(HttpServletRequest request){
		String emp_id = request.getParameter("emp_id");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		Map<String, Object> response = attendanceService.pay_salary(emp_id,month,year);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/getAttendance",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> getAttendance(HttpServletRequest request ){
		int start =  Integer.parseInt(request.getParameter("start")) ;
		int length = Integer.parseInt(request.getParameter("length"));
		String employee_id = request.getParameter("employee_id");
		String user_type = request.getParameter("user_type");
		Map<String, Object> response = attendanceService.getAttendance(start,length,employee_id,user_type);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping(value="/getAttendancefilter",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> getAttendancefilter(HttpServletRequest request ){
		int start =  Integer.parseInt(request.getParameter("start")) ;
		int length = Integer.parseInt(request.getParameter("length"));
		int id = Integer.parseInt( request.getParameter("emp_id"));
		int month =  Integer.parseInt( request.getParameter("month"));
		int year =Integer.parseInt( request.getParameter("year"));
		Map<String, Object> response = attendanceService.getAttendancefilter(start,length,id,month,year);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/getEmployeeAttendance",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> getEmployeeAttendance(HttpServletRequest request ){
		int id = Integer.parseInt( request.getParameter("emp_id"));
		int month =  Integer.parseInt( request.getParameter("month"));
		int year =Integer.parseInt( request.getParameter("year"));
		Map<String, Object> response = attendanceService.getEmployeeAttendance(id,month,year);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/clock_Out",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> clock_Out(HttpServletRequest request ){
		String employee_id = request.getParameter("employee_id");
		String user_type = request.getParameter("user_type");
		String userLat = request.getParameter("userLat");
		String userLon = request.getParameter("userLon");
		Map<String, Object> response = attendanceService.clock_Out(employee_id,user_type,Double.parseDouble(userLat),Double.parseDouble(userLon));
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
