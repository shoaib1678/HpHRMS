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

import com.hp.model.LeaveRequest;
import com.hp.model.Leaves;
import com.hp.model.Planned_Leave;
import com.hp.service.LeaveService;


@Controller
public class LeaveController {

	@Autowired
	LeaveService leaveService;
	
	@RequestMapping(value = "/add_leaves",method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_leaves(@RequestBody Leaves leave){
		Map<String, Object> response = new HashMap<String,Object>();
		response = leaveService.add_leaves(leave);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping(value="get_leaves", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> get_leaves(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		response = leaveService.get_leaves(start,length,employee_id);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/get_leave_request",method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> get_leave_request(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		String user_type =request.getParameter("user_type");
		response = leaveService.get_leave_request(start,length,employee_id,user_type);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value = "/get_remaining",method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> get_remaining(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		response = leaveService.get_remaining(employee_id);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/leave_request",method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> leave_request(@RequestBody LeaveRequest leave){
		Map<String, Object> response = new HashMap<String,Object>();
		response = leaveService.leave_request(leave);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
//	@RequestMapping(value = "/earn_leave",method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> earn_leave(@RequestBody Planned_Leave leave){
//		Map<String, Object> response = new HashMap<String,Object>();
//		response = leaveService.earn_leave(leave);
//		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
//	}
	
	@RequestMapping(value = "/earn_leave",method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> earn_leave(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		String employee_id = request.getParameter("employee_id");
		response = leaveService.earn_leave(employee_id);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value = "/leave_approval",method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> leave_approval(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		String status = request.getParameter("status");
		String sno = request.getParameter("sno");
		String remarks = request.getParameter("remarks");
		response = leaveService.leave_approval(status,sno,remarks);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value = "/get_leave_approval",method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> get_leave_approval(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String,Object>();
		String status = request.getParameter("status");
		String employee_id = request.getParameter("employee_id");
		response = leaveService.get_leave_approval(employee_id,status);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	
}
