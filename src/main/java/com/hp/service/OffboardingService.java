package com.hp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hp.dao.CommonDao;
import com.hp.model.EmployeeDetails;
import com.hp.model.LoginCredentials;
import com.hp.model.OffBoarding;


@Service
public class OffboardingService {

	@Autowired
	CommonDao commonDao;
 	
	public Map<String, Object> add_offboarding(OffBoarding offBoarding) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("employee_id", offBoarding.getEmployee_id());
			List<OffBoarding> offBoardings = (List<OffBoarding>) commonDao.getDataByMap(map, new HashMap<String,Object>(), null, null, 0, -1);
			if(offBoardings.size() >0) {
				response.put("status", "Already_Exist");
				response.put("message", "Data Already Exist");
			}else {
				offBoarding.setStatus("Pending");
				offBoarding.setCreatedAt(new Date());
				int i = commonDao.addDataToDb(offBoarding);
				if(i >0) {
					response.put("status", "Success");
					response.put("message", "Expense Added SuccessFully");
				}else {
					response.put("status", "Failed");
					response.put("message", "Internal Server Error");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong");
		}
		return response;
	}

	public Map<String, Object> get_resignations(int start, int length, int employee_id,
			String user_type) {
			Map<String, Object> response = new HashMap<String,Object>();
			try {
				Map<String, Object> map = new HashMap<String,Object>();
				if (user_type.equals("Employee")) {
					map.put("employee_id", employee_id);
				}
				List<OffBoarding> offBoardings = (List<OffBoarding>) commonDao.getDataByMap(map, new OffBoarding(), null, null, start, length);
				int  count =  commonDao.getDataByMapSize(map, new OffBoarding(), null, null, 0, -1);
				if(offBoardings.size() >0) {
					for (OffBoarding t : offBoardings) {
						Map<String,Object> map3 = new HashMap<String,Object>();
						map3.put("sno", t.getEmployee_id());
						List<EmployeeDetails> employeeDetails = (List<EmployeeDetails>) commonDao.getDataByMap(map3, new EmployeeDetails(), null, null, 0, -1);
						t.setEmployee_name(employeeDetails.get(0).getFirst_name()+ " "+employeeDetails.get(0).getLast_name());
					}
					response.put("status", "Success");
					response.put("message", "Data Fetched Successfully");
					response.put("data", offBoardings);
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
				response.put("message", "Something Went Wrong");
			}
			return response;
	}

	public Map<String, Object> update_resignation(int sno, String status,Date date) {

		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("sno", sno);
			List<OffBoarding> offBoarding = (List<OffBoarding>) commonDao.getDataByMap(map, new OffBoarding(), null, null, 0, -1);
			if(offBoarding.size() >0) {
				if (status.equals("Approved")) {
					offBoarding.get(0).setStatus(status);
					offBoarding.get(0).setRelieving_date(date);
					Map<String, Object> map1 = new HashMap<String,Object>();
					map1.put("employee_id", offBoarding.get(0).getEmployee_id());
					commonDao.updateDataToDb(offBoarding.get(0));
					List<LoginCredentials> loginCredentials = (List<LoginCredentials>) commonDao.getDataByMap(map1, new LoginCredentials(), null, null, 0, -1);
					if (loginCredentials.size()>0) {
						loginCredentials.get(0).setRelieving_date(date);
						commonDao.updateDataToDb(loginCredentials.get(0));
						response.put("status", "Success");
						response.put("message", "Resignation Accepted");
					}
				}else {
					offBoarding.get(0).setStatus(status);
					commonDao.updateDataToDb(offBoarding.get(0));
					response.put("status", "Success");
					response.put("message", "Resignation Rejected");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}
}
