package com.hp.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Planned_Leave {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int leave_id;
	private int employee_id;
	private float earned_leave;
	@Temporal(TemporalType.DATE)
	private Date update_date;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getLeave_id() {
		return leave_id;
	}
	public void setLeave_id(int leave_id) {
		this.leave_id = leave_id;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public float getEarned_leave() {
		return earned_leave;
	}
	public void setEarned_leave(float earned_leave) {
		this.earned_leave = earned_leave;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
}