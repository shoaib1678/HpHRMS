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
public class EmployeeLeaves {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int employee_id;
	private int leave_id;
	private float total_leaves;
	private float remaining_leave;
	private String status;
	@Temporal(TemporalType.DATE)
	private Date createdAt;
	private Date updatedAt;
	
	@Transient
	private String leave_name;
	
	
	
	public String getLeave_name() {
		return leave_name;
	}
	public void setLeave_name(String leave_name) {
		this.leave_name = leave_name;
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
	public int getLeave_id() {
		return leave_id;
	}
	public void setLeave_id(int leave_id) {
		this.leave_id = leave_id;
	}
	public float getTotal_leaves() {
		return total_leaves;
	}
	public void setTotal_leaves(float total_leaves) {
		this.total_leaves = total_leaves;
	}
	public float getRemaining_leave() {
		return remaining_leave;
	}
	public void setRemaining_leave(float remaining_leave) {
		this.remaining_leave = remaining_leave;
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
