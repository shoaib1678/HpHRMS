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

import com.hp.model.Rights;
import com.hp.service.RightsService;




@Controller
public class RightsController {

	@Autowired
	RightsService rightsService;
	@RequestMapping(value="/add_rights", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> add_rights(@RequestBody Rights rights){
		Map<String, Object> resposne = new HashMap<String,Object>();
		resposne = rightsService.add_rights(rights);
		return new ResponseEntity<Map<String,Object>>(resposne,HttpStatus.OK);
	}
	@RequestMapping(value="/get_rights",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> get_rights(HttpServletRequest request ){
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		Map<String, Object> response = rightsService.get_rights(start,length);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/edit_rights",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> edit_rights(HttpServletRequest request ){
	
		String sno = request.getParameter("sno");
		Map<String, Object> response = rightsService.edit_rights(sno);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
