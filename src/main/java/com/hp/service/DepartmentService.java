package com.hp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hp.dao.CommonDao;
import com.hp.model.Department;
import com.hp.model.Designation;


@Service
public class DepartmentService {

	@Autowired
	CommonDao commonDao;
	
	public Map<String, Object> add_department(Department deparment){
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("department", deparment.getDepartment());
			List<Department> deparments = (List<Department>) commonDao.getDataByMap(map, new Department(), null, null, 0, -1);
			if(deparments.size() > 0) {
				response.put("status", "Already_Exist");
				response.put("message", "Deprtment Already Exist");
			}else {
				deparment.setStatus("Active");
				deparment.setCreatedAt(new Date());
				deparment.setEmployee_id(0);
				int i = commonDao.addDataToDb(deparment);
				if(i >0) {
					Designation designation = new Designation();
					designation.setEmployee_id(deparment.getEmployee_id());
					designation.setDepartment_id(i);
					designation.setStatus("Active");
					designation.setCreatedAt(new Date());
					List<Designation> desList = deparment.getDesignations();
						System.out.println(desList.size() + "ssad");
						for(int j =0; j<desList.size();j++) {
							designation.setDesignation_name(desList.get(j).getDesignation_name());
							designation.setGrade(desList.get(j).getGrade());
							commonDao.addDataToDb(designation);
						}
					 
					response.put("status", "Success");
					response.put("message", "Department Added Successfully");
				}else {
					response.put("status", "Failed");
					response.put("message", "Internal Server Error");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> get_department(int start, int length, int employee_id) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			List<Department> deparments = (List<Department>) commonDao.getDataByMap(map, new Department(), null, null, start, length);
			int count = commonDao.getDataByMapSize(map, new Department(), null, null, 0, -1);
			if(deparments.size() >0) {
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", deparments);
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);
			}else {
				response.put("status", "Failed");
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
