package com.hp.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Leaves {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int employee_id;
	private String leaves_name;
	private int leaves_count;
	private float inc_per_month;
	private String progressive_leave;
	private String status;
	private Date createdAt;
	private Date updatedAt;
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
	public float getInc_per_month() {
		return inc_per_month;
	}
	public void setInc_per_month(float inc_per_month) {
		this.inc_per_month = inc_per_month;
	}
	public String getLeaves_name() {
		return leaves_name;
	}
	public void setLeaves_name(String leaves_name) {
		this.leaves_name = leaves_name;
	}

	public int getLeaves_count() {
		return leaves_count;
	}
	public void setLeaves_count(int leaves_count) {
		this.leaves_count = leaves_count;
	}
	
	public String getProgressive_leave() {
		return progressive_leave;
	}
	public void setProgressive_leave(String progressive_leave) {
		this.progressive_leave = progressive_leave;
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
