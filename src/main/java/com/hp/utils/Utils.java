package com.hp.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.web.multipart.MultipartFile;


public class Utils {
	
	//public static String staticimages = "C:/temp/";
	public static String staticimages = "/var/lib/tomcat9/webapps/uploads/";
	DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");

	public String uploadImage(MultipartFile file) {
	String str = "";
	if (!file.isEmpty()) {
	str = file.getOriginalFilename();
	System.out.println(str);
	String[] str1 = str.split("\\.");
	int length=str1.length;
	str = str1[0] + dateFormat.format(new Date()) + "." + str1[length-1];
	str = str.trim();

	try {
	System.out.println(file.getBytes());
	byte[] bytes = file.getBytes();
	File serverFile = new File(Utils.staticimages + str);
	BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
	stream.write(bytes);
	stream.close();
	} catch (Exception e) {
	System.out.println(e);
	}
	}
	return str;
	}
	
	// This method is used for generating password
		public static String generateRandomPassword(int len) {
			// ASCII range � alphanumeric (0-9, a-z, A-Z)
			final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			SecureRandom random = new SecureRandom();
			StringBuilder sb = new StringBuilder();
			// each iteration of the loop randomly chooses a character from the given
			// ASCII range and appends it to the `StringBuilder` instance
			for (int i = 0; i < len; i++) {
				int randomIndex = random.nextInt(chars.length());
				sb.append(chars.charAt(randomIndex));
			}
			return sb.toString();
		}
		public static String generateUniqueId(int len) {
			// ASCII range � alphanumeric (0-9, a-z, A-Z)
			final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			SecureRandom random = new SecureRandom();
			StringBuilder sb = new StringBuilder();
			// each iteration of the loop randomly chooses a character from the given
			// ASCII range and appends it to the `StringBuilder` instance
			for (int i = 0; i < len; i++) {
				int randomIndex = random.nextInt(chars.length());
				sb.append(chars.charAt(randomIndex));
			}
			return sb.toString();
		}
		
		
		public boolean sendEmailMessage() {try { 
	        final String username = "haliconpublication@gmail.com";
	        final String password = "kmvogxpgizaxpwyp";
	        
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", "587");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

	        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(username, password);
	            }
	        });
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(username));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("haliconpublication@gmail.com"));
	        message.setSubject("hello");
	        message.setContent("testing mail", "text/html");
	        Transport.send(message);
	        System.out.println("Done");
	        return true;
	    } catch (MessagingException e) {
	        e.printStackTrace();
	        return false;
	    }}
}
