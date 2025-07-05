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

import net.sf.ehcache.transaction.xa.commands.Command;

@Service
public class DesignationService {

	@Autowired
	CommonDao commonDao;
	
	public  Map<String, Object> add_designation(Designation designation){
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("department_id", designation.getDepartment_id());
			map.put("designation_name", designation.getDesignation_name());
			List<Designation> designations = (List<Designation>) commonDao.getDataByMap(map, new Designation(), null, null, 0, -1);
			if(designations.size() >0) {
				response.put("status", "Already_Exist");
				response.put("message", "Designation Already Exist");
			}else {
				designation.setStatus("Active");
				designation.setEmployee_id(0);
				designation.setCreatedAt(new Date());
				int i = commonDao.addDataToDb(designation);
				if(i>0) {
					response.put("status", "Success");
					response.put("message", "Designation Added Successfully");
				}else {
					response.put("status", "Failed");
					response.put("message", "Internal Server Error");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong"+e);
		}
		return response;
	}

	public Map<String, Object> get_designation(int start, int length,
			int employee_id) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			List<Designation> designations = (List<Designation>) commonDao.getDataByMap(map, new Designation(), null, null, start, length);
			List<Department> departments = (List<Department>) commonDao.getDataByMap(map, new Department(), null, null, 0, -1);
			int count = commonDao.getDataByMapSize(map, new Designation(), null, null, 0, -1);
			if(designations.size() >0) {
				for (Designation d  : designations) {
					Department de =   departments.stream().filter(ds -> ds.getSno() == d.getDepartment_id()).findFirst().orElse(null);
					if(de != null) {
						d.setEmployee_name(de.getDepartment());
					}
				}
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", designations);
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
	
	
	public Map<String, Object> get_designations(String sno) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("department_id", Integer.parseInt(sno));
			List<Designation> designations = (List<Designation>) commonDao.getDataByMap(map, new Designation(), null, null, 0, -1);
			if(designations.size() >0) {
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", designations);
			}else {
				response.put("status", "Failed");
				response.put("message", "Data Not Found");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
}
