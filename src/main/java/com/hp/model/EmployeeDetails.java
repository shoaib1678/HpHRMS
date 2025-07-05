package com.hp.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
public class EmployeeDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int employee_id;
	private String first_name;
	private String last_name;
	private String email;
	private String grade;
	private String password;
	private String father_name;
	private String address;
	private String contact_number;
	@Transient
	private String designation_name;
	private String gender;
	private int rights_id;
	private int department_id;
	private int designation_id;
	@Temporal(TemporalType.DATE)
	private Date joining_date;
	private double salary_package;
	private String adhar_number;
	private String pan_number;
	private String pan_document;
	private String adhar_document;
	private String profile_picture;
	private String bank_name;
	private String account_number;
	private String ifsc_code;
	private String epf_no;
	private String status;
	private Date createdAt;
	private Date updatedAt;
	
	
	public String getDesignation_name() {
		return designation_name;
	}
	public void setDesignation_name(String designation_name) {
		this.designation_name = designation_name;
	}
	
	public int getRights_id() {
		return rights_id;
	}
	public void setRights_id(int rights_id) {
		this.rights_id = rights_id;
	}
	
	@Transient
	List<EmployeeSalary> employeeSalary;
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public List<EmployeeSalary> getEmployeeSalary() {
		return employeeSalary;
	}
	public void setEmployeeSalary(List<EmployeeSalary> employeeSalary) {
		this.employeeSalary = employeeSalary;
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
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFather_name() {
		return father_name;
	}
	public void setFather_name(String father_name) {
		this.father_name = father_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact_number() {
		return contact_number;
	}
	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public int getDesignation_id() {
		return designation_id;
	}
	public void setDesignation_id(int designation_id) {
		this.designation_id = designation_id;
	}
	public Date getJoining_date() {
		return joining_date;
	}
	public void setJoining_date(Date joining_date) {
		this.joining_date = joining_date;
	}
	public double getSalary_package() {
		return salary_package;
	}
	public void setSalary_package(double salary_package) {
		this.salary_package = salary_package;
	}
	public String getAdhar_number() {
		return adhar_number;
	}
	public void setAdhar_number(String adhar_number) {
		this.adhar_number = adhar_number;
	}
	public String getPan_number() {
		return pan_number;
	}
	public void setPan_number(String pan_number) {
		this.pan_number = pan_number;
	}
	public String getPan_document() {
		return pan_document;
	}
	public void setPan_document(String pan_document) {
		this.pan_document = pan_document;
	}
	public String getAdhar_document() {
		return adhar_document;
	}
	public void setAdhar_document(String adhar_document) {
		this.adhar_document = adhar_document;
	}
	public String getProfile_picture() {
		return profile_picture;
	}
	public void setProfile_picture(String profile_picture) {
		this.profile_picture = profile_picture;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAccount_number() {
		return account_number;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public String getIfsc_code() {
		return ifsc_code;
	}
	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
	}
	public String getEpf_no() {
		return epf_no;
	}
	public void setEpf_no(String epf_no) {
		this.epf_no = epf_no;
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
