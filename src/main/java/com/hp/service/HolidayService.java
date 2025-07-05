package com.hp.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hp.dao.CommonDao;
import com.hp.model.Attendance;
import com.hp.model.EmployeeDetails;
import com.hp.model.EmployeeSalary;
import com.hp.model.Holiday;


@Service
public class HolidayService {

	
	@Autowired
	CommonDao commonDao;
	
	public Map<String, Object> add_holiday(Holiday details) {

		Map<String, Object> response = new HashMap<String,Object>();
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = dateFormat.format(details.getHoliday_date());

			System.out.println(formattedDate);
			List<Holiday> holiday = commonDao.getDataByMapAttendance(formattedDate,0,-1);
			if (holiday.size() >0) {
				response.put("status", "Failed");
				response.put("message", "Holiday Already Marked For Day");
			}else {
				details.setStatus("Active");
				details.setCreatedAt(new Date());
				int i = commonDao.addDataToDb(details);
				List<EmployeeDetails> emp =(List<EmployeeDetails>) commonDao.getDataByMap(new HashMap<String,Object>(), new EmployeeDetails(), null, null, 0, -1);
				for (EmployeeDetails e : emp) {
					List<EmployeeSalary> employeeSalaries = (List<EmployeeSalary>) commonDao.getLatestDate(e.getSno(), formattedDate);
					Attendance a = new Attendance();
					a.setEmployee_id(e.getSno());
					a.setSalary_id(employeeSalaries.get(0).getSno());
					a.setAttendance_date(details.getHoliday_date());
					a.setAttendance_type(1);
					a.setStatus("Active");
					a.setCreatedAt(new Date());
					a.setReason(details.getOccasion());
					commonDao.addDataToDb(a);
				}
				if(i > 0) {
					response.put("status", "Success");
					response.put("message", "Holiday Added SuccessFully");
				}else {
					response.put("status", "Failed");
					response.put("message", "Something Went Wrong");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	
	}
	
	
	
	public Map<String, Object> getHoliday(int start, int length) {

		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			List<Holiday> data =  (List<Holiday>) commonDao.getDataByMap(map, new Holiday(), null, null, 0, -1);
			int count = commonDao.getDataByMapSize(new HashMap<String,Object>(), new Holiday(), null, null, 0, -1);
			if (data.size() > 0) {
				System.out.println(data.size());
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("recordsFiltered", data.size());
				response.put("recordsTotal", count);
				response.put("data", data);

			} else {
				response.put("status", "No_Content");
				response.put("message", "No Data Found");
				response.put("data", new ArrayList<>());
				response.put("recordsFiltered", 0);
				response.put("recordsTotal", 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;

	
	
	}
	
}
