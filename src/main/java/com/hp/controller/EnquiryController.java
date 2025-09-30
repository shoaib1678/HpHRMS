package com.hp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hp.service.EnquiryService;

@Controller
@CrossOrigin(origins = "*")
public class EnquiryController {

	@Autowired
	EnquiryService enquiryService;
	
	@RequestMapping("/send_manuscript")
	public ResponseEntity<Map<String,Object>> send_manuscript(@RequestParam(value="name") String name,@RequestParam(value="email") String email,@RequestParam(value="manuscript") MultipartFile manuscript){
		Map<String,Object> response = new HashMap<String,Object>();
		response = enquiryService.send_manuscript(name,email,manuscript);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/send_enquiry")
	public ResponseEntity<Map<String,Object>> send_enquiry(@RequestParam(value="name") String name,@RequestParam(value="email") String email,@RequestParam(value="phone") String phone,@RequestParam(value="message") String message,@RequestParam(value="file") MultipartFile file){
		Map<String,Object> response = new HashMap<String,Object>();
		response = enquiryService.send_enquiry(name,email,phone,message,file);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping("/send_contact")
	public ResponseEntity<Map<String,Object>> send_contact(@RequestParam(value="name") String name,@RequestParam(value="email") String email,@RequestParam(value="phone") String phone,@RequestParam(value="subject") String subject,@RequestParam(value="message") String message,@RequestParam(value="file") MultipartFile file){
		Map<String,Object> response = new HashMap<String,Object>();
		response = enquiryService.send_contact(name,email,phone,subject,message,file);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
