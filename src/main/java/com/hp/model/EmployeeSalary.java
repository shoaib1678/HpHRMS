package com.hp.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class EmployeeSalary {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	private int employee_id;
	private double basic_annual_package;
	private double monthly_salary;
	private double total_salary;
	private double income_tax;
	private String status;
	@Temporal(TemporalType.DATE)
	private Date createdAt;
	private Date updatedAt;
	
	
	public double getBasic_annual_package() {
		return basic_annual_package;
	}
	public void setBasic_annual_package(double basic_annual_package) {
		this.basic_annual_package = basic_annual_package;
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
	public double getMonthly_salary() {
		return monthly_salary;
	}
	public void setMonthly_salary(double monthly_salary) {
		this.monthly_salary = monthly_salary;
	}
	public double getTotal_salary() {
		return total_salary;
	}
	public void setTotal_salary(double total_salary) {
		this.total_salary = total_salary;
	}
	public double getIncome_tax() {
		return income_tax;
	}
	public void setIncome_tax(double income_tax) {
		this.income_tax = income_tax;
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
