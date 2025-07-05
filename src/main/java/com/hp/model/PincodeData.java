package com.hp.model;

import java.util.List;

public class PincodeData {
	
	private String Message;
	private String Status;
	private List<PostOffice> PostOffice = null;
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public List<PostOffice> getPostOffice() {
		return PostOffice;
	}
	public void setPostOffice(List<PostOffice> postOffice) {
		PostOffice = postOffice;
	}
	
	

}
