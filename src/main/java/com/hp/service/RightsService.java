package com.hp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.dao.CommonDao;
import com.hp.model.EmployeeDetails;
import com.hp.model.Rights;


@Service
public class RightsService {

	@Autowired
	CommonDao commonDao;
	
	public Map<String, Object> add_rights(Rights rights) {
		Map<String,Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("sno", rights.getSno());
			List<Rights> list = (List<Rights>)commonDao.getDataByMap(map, new Rights(), null, null, 0, -1);
			if(list.size() > 0) {
				Map<String, Object> search = new HashMap<String, Object>();
				search.put("sno", rights.getSno());
				ObjectMapper mapObject = new ObjectMapper();
				Map<String, Object> mapObj = mapObject.convertValue(rights, Map.class);
				int id = commonDao.updateMethodForAll(mapObj, "Rights", search);
				if(id > 0) {
					response.put("status", "Success");
					response.put("message", "Rights Updated Successfully");
				}
				
			}else {
				Map<String,Object> mapdata = new HashMap<String,Object>();
				mapdata.put("employee_code", rights.getEmployee_code());
				List<Rights> data = (List<Rights>)commonDao.getDataByMap(mapdata, new Rights(), null, null, 0, -1);
				if(data.size() > 0) {
					response.put("status", "Already_Exist");
					response.put("message", "Rights Already Exist");
				}else {
					rights.setStatus("Active");
					rights.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(rights);
					if(i > 0) {
						response.put("status", "Success");
						response.put("message", "Rights Addes Successfully");
					}else {
						response.put("status", "Failed");
						response.put("message", "Something Went Wrong");
					}
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.put("status", "Failure");
			response.put("message", "Internal server Error"+e);
		}
		return response;
	}

	public Map<String, Object> get_rights(int start, int length) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			List<Rights> data = (List<Rights>) commonDao.getDataByMap(new HashMap<String, Object>(),
					new Rights(), "sno", "asc", start, length);
			int count = commonDao.getDataByMapSize(new HashMap<String, Object>(), new Rights(), null, null, 0,
					-1);
			System.out.println(data.size() + "asdasd");
			if (data.size() > 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				for(Rights r : data) {
					map.put("sno", r.getEmployee_code());
					List<EmployeeDetails> emp = (List<EmployeeDetails>)commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
					r.setEmp_name(emp.get(0).getFirst_name()+" "+emp.get(0).getLast_name());
				}
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", data);
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);

			} else {
				response.put("status", "No_Content");
				response.put("message", "Data Fetched Successfully");
				response.put("data", new ArrayList<>());
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	public Map<String, Object> edit_rights(String sno) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Rights> data = (List<Rights>) commonDao.getDataByMap(map,
					new Rights(), null, null, 0, -1);
			if (data.size() > 0) {
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", data.get(0));
			} else {
				response.put("status", "No_Content");
				response.put("message", "Data Fetched Successfully");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

}
