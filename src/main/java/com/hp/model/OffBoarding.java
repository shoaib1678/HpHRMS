package com.hp.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
public class OffBoarding {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int employee_id;
	private String reason;
	@Temporal(TemporalType.DATE)
	private Date requested_date;
	@Temporal(TemporalType.DATE)
	private Date relieving_date;
	private String status;
	private Date createdAt;
	private Date updatedAt;
	
	@Transient
	private String employee_name;
	
	
	
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public Date getRelieving_date() {
		return relieving_date;
	}
	public void setRelieving_date(Date relieving_date) {
		this.relieving_date = relieving_date;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getRequested_date() {
		return requested_date;
	}
	public void setRequested_date(Date requested_date) {
		this.requested_date = requested_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
}
