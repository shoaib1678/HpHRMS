package com.hp.model;

import java.util.Date;

public class Leave {

	private int employeeId;
	private double total_attendance;
	private String month;
	private int year;
	private int month_no;
	private int employee_id;
	private String employee_name;
	private int total_days;
	private double total_leaves;
	private double monthly_income;
	private double perday_salary;
	private double monthly_salary;
	private double monthly_deduction;
	private String status;
	private int salary_id;
	private double expense_amount;
	private Date createdAt;
	
	
	
	
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public double getExpense_amount() {
		return expense_amount;
	}
	public void setExpense_amount(double expense_amount) {
		this.expense_amount = expense_amount;
	}
	private double salary;
	
	
	public int getSalary_id() {
		return salary_id;
	}
	public void setSalary_id(int salary_id) {
		this.salary_id = salary_id;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public double getTotal_attendance() {
		return total_attendance;
	}
	public void setTotal_attendance(double total_attendance) {
		this.total_attendance = total_attendance;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth_no() {
		return month_no;
	}
	public void setMonth_no(int month_no) {
		this.month_no = month_no;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public int getTotal_days() {
		return total_days;
	}
	public void setTotal_days(int total_days) {
		this.total_days = total_days;
	}
	public double getTotal_leaves() {
		return total_leaves;
	}
	public void setTotal_leaves(double total_leaves) {
		this.total_leaves = total_leaves;
	}
	public double getMonthly_income() {
		return monthly_income;
	}
	public void setMonthly_income(double monthly_income) {
		this.monthly_income = monthly_income;
	}
	public double getPerday_salary() {
		return perday_salary;
	}
	public void setPerday_salary(double perday_salary) {
		this.perday_salary = perday_salary;
	}
	public double getMonthly_salary() {
		return monthly_salary;
	}
	public void setMonthly_salary(double monthly_salary) {
		this.monthly_salary = monthly_salary;
	}
	public double getMonthly_deduction() {
		return monthly_deduction;
	}
	public void setMonthly_deduction(double monthly_deduction) {
		this.monthly_deduction = monthly_deduction;
	}
	
	
}
