package com.hp.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class EnquiryService {

	@Autowired
	EmailService emailService;
	
	public Map<String, Object> send_manuscript(String name, String email, MultipartFile manuscript) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
					String eml = "haliconpublication@gmail.com";
					String subject = "New Manuscript from Website";
					String message = "Name: " + name + "\n" +
							 "Email: " +email;
			                System.out.println("message="+message);
					emailService.send_hp_message(eml, subject, message,manuscript);
					response.put("status", "Success");
					
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	public Map<String, Object> send_enquiry(String name, String email, String phone, String messag, MultipartFile file) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
					String eml = "haliconpublication@gmail.com";
					String subject = "New Enquiry from Website";
					String message = "Name: " + name + "\n" +
							"Email: " + email + "\n" +
							"Mobile Number: " + phone + "\n" +
							 "Message: " +messag;
			                System.out.println("message="+message);
					emailService.send_hp_message(eml, subject, message,file);
					response.put("status", "Success");
					
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	public Map<String, Object> send_contact(String name, String email, String phone, String sub, String messag,
			MultipartFile file) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
					String eml = "haliconpublication@gmail.com";
					String subject = sub;
					String message = "Name: " + name + "\n" +
							"Email: " + email + "\n" +
							"Mpbile Number: " + phone + "\n" +
							 "Message: " +messag;
			                System.out.println("message="+message);
					emailService.send_hp_message(eml, subject, message,file);
					response.put("status", "Success");
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
}
