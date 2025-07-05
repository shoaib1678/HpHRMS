package com.hp.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hp.dao.CommonDao;
import com.hp.model.Attendance;
import com.hp.model.EmployeeDetails;
import com.hp.model.EmployeeLeaves;
import com.hp.model.EmployeeSalary;
import com.hp.model.LeaveRequest;
import com.hp.model.Leaves;
import com.hp.model.Planned_Leave;
import com.hp.model.RemainLeave;

@Service
public class LeaveService {

	@Autowired
	CommonDao commonDao;

	public Map<String, Object> add_leaves(Leaves leave) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("leaves_name", leave.getLeaves_name());
			List<Leaves> leaves = (List<Leaves>) commonDao.getDataByMap(map, new Leaves(), null, null, 0, -1);
			if (leaves.size() > 0) {
				response.put("status", "Already_Exist");
				response.put("message", "Leave Already Exist");
			} else {
				if(leave.getProgressive_leave().equalsIgnoreCase("true")) {
					float ipm = (float)leave.getLeaves_count()/12;
					leave.setInc_per_month(ipm);
				}
				leave.setStatus("Active");
				leave.setCreatedAt(new Date());
				leave.setEmployee_id(0);
				int i = commonDao.addDataToDb(leave);
				if (i > 0) {
					response.put("status", "Success");
					response.put("message", "Leave Added Successfully");
				} else {
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

	public Map<String, Object> get_leaves(int start, int length, int employee_id) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Leaves> leaves = (List<Leaves>) commonDao.getDataByMap(map, new Leaves(), null, null, start, length);
			int count = commonDao.getDataByMapSize(map, new Leaves(), null, null, 0, -1);
			if (leaves.size() > 0) {
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", leaves);
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);
			} else {
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

	public Map<String, Object> leave_request(LeaveRequest leave) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("employee_id", leave.getEmployee_id());
			map.put("leave_id", leave.getLeave_id());
			List<EmployeeLeaves> leaves = (List<EmployeeLeaves>) commonDao.getDataByMap(map, new EmployeeLeaves(), null,
					null, 0, -1);
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("employee_id", leave.getEmployee_id());
			map1.put("leave_id", leave.getLeave_id());
			map1.put("status", "Pending");

			List<LeaveRequest> leaveRequests = (List<LeaveRequest>) commonDao.getDataByMap(map1, new LeaveRequest(),
					null, null, 0, -1);

			int r_leave = 0;
			int sum = leaveRequests.stream().mapToInt(LeaveRequest::getLeave_days) // Extract the price value
					.sum();
			r_leave += leaves.get(0).getRemaining_leave();
			r_leave -= sum;
			if (leaves.size() > 0) {
				long diff = leave.getToDate().getTime() - leave.getFromDate().getTime();
				long days = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
				if (days >= (long) r_leave) {
					response.put("status", "Failed");
					response.put("message", "Leave Limit Exceeds");
				} else {
					leave.setLeave_days((int) days + 1);
					leave.setStatus("Pending");
					leave.setCreatedAt(new Date());
					int i = commonDao.addDataToDb(leave);
					if (i > 0) {
						response.put("status", "Success");
						response.put("message", "Leave Sent for approval");
					} else {
						response.put("status", "Failed");
						response.put("message", "Internal Server Error");
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> get_leave_request(int start, int length, int employee_id, String user_type) {

		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			if (user_type.equals("Employee")) {
				map.put("employee_id", employee_id);
			}
			List<LeaveRequest> leaves = (List<LeaveRequest>) commonDao.getDataByMap(map, new LeaveRequest(), null, null,
					start, length);
			int count = commonDao.getDataByMapSize(map, new LeaveRequest(), null, null, 0, -1);
			if (leaves.size() > 0) {
				for (LeaveRequest l : leaves) {
					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("sno", l.getEmployee_id());
					List<EmployeeDetails> emp = (List<EmployeeDetails>) commonDao.getDataByMap(map2,
							new EmployeeDetails(), null, null, 0, -1);
					l.setEmployee_name(emp.get(0).getFirst_name() + " " + emp.get(0).getLast_name());
					Map<String, Object> map3 = new HashMap<String, Object>();
					map3.put("sno", l.getLeave_id());
					List<Leaves> leave = (List<Leaves>) commonDao.getDataByMap(map3, new Leaves(), null, null, 0, -1);
					l.setLeave_name(leave.get(0).getLeaves_name());
					Map<String, Object> map4 = new HashMap<String, Object>();
					map4.put("employee_id", l.getEmployee_id());
					map4.put("leave_id", l.getLeave_id());
					List<EmployeeLeaves> empl = (List<EmployeeLeaves>) commonDao.getDataByMap(map4,new EmployeeLeaves(), null, null, 0, -1);
					l.setRemaining_leave(empl.get(0).getRemaining_leave());
				}
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", leaves);
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);
			} else {
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

	public Map<String, Object> leave_approval(String status, String sno, String remarks) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sno", Integer.parseInt(sno));
			List<LeaveRequest> leave = (List<LeaveRequest>) commonDao.getDataByMap(map, new LeaveRequest(), null, null,
					0, -1);

			Map<String, Object> maps = new HashMap<String, Object>();
			maps.put("employee_id", leave.get(0).getEmployee_id());
			maps.put("leave_id", leave.get(0).getLeave_id());
			List<EmployeeLeaves> empl = (List<EmployeeLeaves>) commonDao.getDataByMap(maps, new EmployeeLeaves(), null,
					null, 0, -1);
			empl.get(0).setRemaining_leave(empl.get(0).getRemaining_leave() - leave.get(0).getLeave_days());
			commonDao.updateDataToDb(empl.get(0));
			if (leave.size() > 0) {

				Calendar calendar = Calendar.getInstance();
				calendar.setTime(leave.get(0).getFromDate());
				Map<String, Object> map3 = new HashMap<String, Object>();
				map3.put("sno", leave.get(0).getLeave_id());
				List<Leaves> leaves = (List<Leaves>) commonDao.getDataByMap(map3, new Leaves(), null, null, 0, -1);
				while (!calendar.getTime().after(leave.get(0).getToDate())) {
					List<EmployeeSalary> empService = commonDao.getLatestDate(leave.get(0).getEmployee_id(),
							new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()));
					Attendance a = new Attendance();
					if (status.equals("yes")) {

						a.setAttendance_date(calendar.getTime());
						a.setAttendance_type(1);
						a.setEmployee_id(leave.get(0).getEmployee_id());
						a.setStatus("Pending");
						a.setReason(leaves.get(0).getLeaves_name());
						a.setCreatedAt(new Date());
						a.setSalary_id(empService.get(0).getSno());
						commonDao.addDataToDb(a);
						leave.get(0).setRemarks(remarks);
						leave.get(0).setDate(new Date());
						leave.get(0).setStatus("Approved");
						commonDao.updateDataToDb(leave.get(0));
						response.put("status", "Success");
						response.put("message", "Leave approved successfully");
					} else {
						leave.get(0).setDate(new Date());
						leave.get(0).setStatus("Rejected");
						commonDao.updateDataToDb(leave.get(0));
						response.put("status", "Success");
						response.put("message", "Leave rejected successfully");
					}
					calendar.add(Calendar.DATE, 1);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> get_remaining(int employee_id) {
		Map<String, Object> response = new HashMap<>();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("employee_id", employee_id);
			List<EmployeeLeaves> leaves = (List<EmployeeLeaves>) commonDao.getDataByMap(map, new EmployeeLeaves(), null, null, 0, -1);
			if(leaves.size() > 0) {
				for(EmployeeLeaves e : leaves) {
					Map<String, Object> map1 = new HashMap<>();
					map1.put("sno", e.getLeave_id());
					List<Leaves> l = (List<Leaves>) commonDao.getDataByMap(map1, new Leaves(), null, null, 0, -1);
					e.setLeave_name(l.get(0).getLeaves_name());
				}
			}
			response.put("status", "Success");
			response.put("message", "Data Fetched Successfully");
			response.put("data", leaves);

		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong: " + e.getMessage());
		}
		return response;
	}

	public Map<String, Object> get_leave_approval(String employee_id, String status) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("employee_id", Integer.parseInt(employee_id));
			map.put("status", status);
			List<LeaveRequest> leaves = (List<LeaveRequest>) commonDao.getDataByMap(map, new LeaveRequest(), null, null,
					0, -1);
			int count = commonDao.getDataByMapSize(map, new LeaveRequest(), null, null, 0, -1);
			if (leaves.size() > 0) {
				for (LeaveRequest l : leaves) {
					Map<String, Object> map3 = new HashMap<String, Object>();
					map3.put("sno", l.getLeave_id());
					List<Leaves> leave = (List<Leaves>) commonDao.getDataByMap(map3, new Leaves(), null, null, 0, -1);
					l.setLeave_name(leave.get(0).getLeaves_name());
				}
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", leaves);
				response.put("recordsFiltered", count);
				response.put("recordsTotal", count);
			} else {
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

	public Map<String, Object> earn_leave(String employee_id) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        Map<String, Object> empMap = new HashMap<>();
	        empMap.put("employee_id", Integer.parseInt(employee_id));

	        List<EmployeeLeaves> employeeLeave = (List<EmployeeLeaves>) commonDao.getDataByMap(empMap, new EmployeeLeaves(), null, null, 0, -1);

	        Map<String, Object> leavesMap = new HashMap<>();
	        List<Leaves> leaveTypes = (List<Leaves>) commonDao.getDataByMap(leavesMap, new Leaves(), null, null, 0, -1);

	        boolean anyUpdated = false;

	        if (!employeeLeave.isEmpty()) {
	            for (Leaves leave : leaveTypes) {
	                boolean found = false;
	                for (EmployeeLeaves el : employeeLeave) {
	                    if (el.getLeave_id() == leave.getSno()) {
	                        found = true;
	                        if (leave.getInc_per_month() > 0) {
	                            Date lastUpdated = el.getCreatedAt();
	                            boolean alreadyUpdatedThisMonth = false;

	                            if (lastUpdated != null) {
	                                Calendar lastUpdateCal = Calendar.getInstance();
	                                lastUpdateCal.setTime(lastUpdated);
	                                Calendar now = Calendar.getInstance();

	                                if (now.get(Calendar.MONTH) == lastUpdateCal.get(Calendar.MONTH) &&
	                                    now.get(Calendar.YEAR) == lastUpdateCal.get(Calendar.YEAR)) {
	                                    alreadyUpdatedThisMonth = true;
	                                }
	                            }

	                            if (!alreadyUpdatedThisMonth) {
	                                float updatedLeave = el.getTotal_leaves() + leave.getInc_per_month();
	                                float remdLeave = el.getRemaining_leave() + leave.getInc_per_month();
	                                el.setTotal_leaves(updatedLeave);
	                                el.setRemaining_leave(remdLeave);
	                                el.setCreatedAt(new Date());
	                                commonDao.updateDataToDb(el);
	                                anyUpdated = true;
	                            }
	                        }
	                        break;
	                    }
	                }

	                if (!found) {
	                    EmployeeLeaves newEl = new EmployeeLeaves();
	                    newEl.setEmployee_id(Integer.parseInt(employee_id));
	                    newEl.setLeave_id(leave.getSno());

	                    if (leave.getProgressive_leave().equalsIgnoreCase("True")) {
	                        newEl.setTotal_leaves(1.25f);
	                        newEl.setRemaining_leave(1.25f);
	                    } else {
	                        newEl.setTotal_leaves(leave.getLeaves_count());
	                        newEl.setRemaining_leave(leave.getLeaves_count());
	                    }
	                    newEl.setCreatedAt(new Date());
	                    commonDao.addDataToDb(newEl);
	                    anyUpdated = true;
	                }
	            }
	        } else {
	            for (Leaves leave : leaveTypes) {
	                EmployeeLeaves newEl = new EmployeeLeaves();
	                newEl.setEmployee_id(Integer.parseInt(employee_id));
	                newEl.setLeave_id(leave.getSno());

	                if (leave.getInc_per_month() > 0) {
	                    newEl.setTotal_leaves(leave.getInc_per_month());
	                    newEl.setRemaining_leave(leave.getInc_per_month());
	                } else {
	                    newEl.setTotal_leaves(leave.getLeaves_count());
	                    newEl.setRemaining_leave(leave.getLeaves_count());
	                }
	                newEl.setCreatedAt(new Date());
	                commonDao.addDataToDb(newEl);
	                anyUpdated = true;
	            }
	        }

	        if (anyUpdated) {
	            response.put("status", "Success");
	            response.put("message", "Leave updated successfully");
	        } else {
	            response.put("status", "Skipped");
	            response.put("message", "Leaves already up-to-date");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Failed");
	        response.put("message", "Something went wrong: " + e.getMessage());
	    }

	    return response;
	}





}
