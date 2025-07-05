package com.hp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hp.service.LoginService;


@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> login(@RequestParam("email") String email, @RequestParam("password") String password){
		Map<String, Object> resposne = new HashMap<String,Object>();
		resposne = loginService.login(email,password);
		return new ResponseEntity<Map<String,Object>>(resposne,HttpStatus.OK);
	}
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		session.invalidate();		
		return new ModelAndView("redirect:./");
	}
	@RequestMapping(value="/change_password",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> change_password1(HttpServletRequest request){
		String sno = request.getParameter("sno");
		String password = request.getParameter("password");
		Map<String, Object> response = loginService.change_password(sno,password);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
	@RequestMapping(value="/validate_password",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> validate_password(HttpServletRequest request){
		String sno = request.getParameter("sno");
		String password = request.getParameter("password");
		Map<String, Object> response = loginService.validate_password(sno,password);
		return new ResponseEntity<Map<String,Object>>(response,HttpStatus.OK);
	}
}
