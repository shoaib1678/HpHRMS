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
public class Attendance {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int employeeId;
	private int employee_id;
	@Temporal(TemporalType.DATE)
	private Date attendance_date;
	private float attendance_type;
	@Transient
	private double lat;
	@Transient
	private double lon;
	private String reason;
	private String clock_in;
	private String clock_out;
	private String total_hours;
	private Date createdAt;
	private String status;
	@Transient
	private String user_type;
	private int salary_id;
	
	@Transient
	private String employee_name;
	
	
	
	public int getSalary_id() {
		return salary_id;
	}
	public void setSalary_id(int salary_id) {
		this.salary_id = salary_id;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getReason() {
		return reason;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getClock_in() {
		return clock_in;
	}
	public void setClock_in(String clock_in) {
		this.clock_in = clock_in;
	}
	public String getClock_out() {
		return clock_out;
	}
	public void setClock_out(String clock_out) {
		this.clock_out = clock_out;
	}
	public String getTotal_hours() {
		return total_hours;
	}
	public void setTotal_hours(String total_hours) {
		this.total_hours = total_hours;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public Date getAttendance_date() {
		return attendance_date;
	}
	public void setAttendance_date(Date attendance_date) {
		this.attendance_date = attendance_date;
	}
	public float getAttendance_type() {
		return attendance_type;
	}
	public void setAttendance_type(float attendance_type) {
		this.attendance_type = attendance_type;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
}
