package com.hp.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Rights {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int employee_id;
	private int employee_code;
	@Transient
	private String emp_name;
	private String designation;
	private String department;
	private String add_rights;
	private String leaves;
	private String addEmployee;
	private String viewEmployee;
	private String attendance_approval;
	private String leave_approval;
	private String attendance_srearch;
	private String status;
	private Date createdAt;
	public int getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(int employee_code) {
		this.employee_code = employee_code;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDesignation() {
		return designation;
	}
	public String getAdd_rights() {
		return add_rights;
	}
	public void setAdd_rights(String add_rights) {
		this.add_rights = add_rights;
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
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getLeaves() {
		return leaves;
	}
	public void setLeaves(String leaves) {
		this.leaves = leaves;
	}
	public String getAddEmployee() {
		return addEmployee;
	}
	public void setAddEmployee(String addEmployee) {
		this.addEmployee = addEmployee;
	}
	public String getViewEmployee() {
		return viewEmployee;
	}
	public void setViewEmployee(String viewEmployee) {
		this.viewEmployee = viewEmployee;
	}
	public String getAttendance_approval() {
		return attendance_approval;
	}
	public void setAttendance_approval(String attendance_approval) {
		this.attendance_approval = attendance_approval;
	}
	public String getLeave_approval() {
		return leave_approval;
	}
	public void setLeave_approval(String leave_approval) {
		this.leave_approval = leave_approval;
	}
	public String getAttendance_srearch() {
		return attendance_srearch;
	}
	public void setAttendance_srearch(String attendance_srearch) {
		this.attendance_srearch = attendance_srearch;
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
}
