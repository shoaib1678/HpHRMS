package com.hp.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hp.dao.CommonDao;
import com.hp.model.Attendance;
import com.hp.model.EmployeeDetails;
import com.hp.model.EmployeeSalary;
import com.hp.model.Leave;
import com.hp.model.LeaveRequest;


@Service
public class AttendanceService {

	@Autowired
	CommonDao commonDao;
	
	
//	public Map<String, Object> add_attendance(Attendance details) {
//	    Map<String, Object> response = new HashMap<>();
//	    try {
//	        if (!"Admin".equalsIgnoreCase(details.getUser_type())) {
//	            String allowedSSID = "Airtel_dilb_5005"; // Replace with actual SSID
//	            String connectedSSID = getConnectedWifiName();
//
//	            if (connectedSSID == null || !connectedSSID.equalsIgnoreCase(allowedSSID)) {
//	                response.put("status", "Failed");
//	                response.put("message", "You are not connected to the authorized office Wi-Fi.");
//	                return response;
//	            }
//	        }
//
//	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	        String formattedDate = dateFormat.format(details.getAttendance_date());
//
//	        List<Attendance> attendances = commonDao.getAttendanceData(details.getEmployee_id(), formattedDate);
//	        if (!attendances.isEmpty()) {
//	            response.put("status", "Failed");
//	            response.put("message", "Attendance Already Marked For Today");
//	            return response;
//	        }
//
//	        List<EmployeeSalary> empService = commonDao.getLatestDate(details.getEmployee_id(), formattedDate);
//	        if (!empService.isEmpty()) {
//	        	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
//	        	sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
//	        	String currentTime = sdf.format(new Date());
//	            details.setSalary_id(empService.get(0).getSno());
//	            details.setStatus("Pending");
//	            details.setCreatedAt(new Date());
//	            details.setReason("-");
//	            details.setClock_in(currentTime);
//	            int i = commonDao.addDataToDb(details);
//	            if (i > 0) {
//	                response.put("status", "Success");
//	                response.put("message", "Attendance Marked Successfully");
//	            } else {
//	                response.put("status", "Failed");
//	                response.put("message", "Something Went Wrong");
//	            }
//	        } else {
//	            response.put("status", "Failed");
//	            response.put("message", "Salary Not yet Assigned to Employee");
//	        }
//
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        response.put("status", "Failed");
//	        response.put("message", "Something Went Wrong: " + e.getMessage());
//	    }
//	    return response;
//	}

	public Map<String, Object> add_attendance(Attendance details) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        // Allow Admin from anywhere, restrict others
	        if (!"Admin".equalsIgnoreCase(details.getUser_type())) {
	            double userLat = details.getLat();
	            double userLon = details.getLon();

	            // Set office location (update as per your actual location)
	            double officeLat = 28.4576819;  // Example: Gurgaon
	            double officeLon = 77.0449214;

	            double distance = getDistance(userLat, userLon, officeLat, officeLon);
	            System.out.println("Distance from office: " + distance + " KM");

	            if (distance > 1.5) { // 100 meters range
	                response.put("status", "Failed");
	                response.put("message", "You are not at the authorized office location.");
	                return response;
	            }
	        }

	        // Format date for check
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        String formattedDate = dateFormat.format(details.getAttendance_date());

	        // Prevent duplicate
	        List<Attendance> attendances = commonDao.getAttendanceData(details.getEmployee_id(), formattedDate);
	        if (!attendances.isEmpty()) {
	            response.put("status", "Failed");
	            response.put("message", "Attendance already marked for today.");
	            return response;
	        }

	        // Salary check
	        List<EmployeeSalary> empService = commonDao.getLatestDate(details.getEmployee_id(), formattedDate);
	        if (!empService.isEmpty()) {
	            // Current IST time
	            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	            sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	            String currentTime = sdf.format(new Date());

	            details.setSalary_id(empService.get(0).getSno());
	            details.setStatus("Pending");
	            details.setCreatedAt(new Date());
	            details.setReason("-");
	            details.setClock_in(currentTime);

	            int i = commonDao.addDataToDb(details);
	            if (i > 0) {
	                response.put("status", "Success");
	                response.put("message", "Attendance marked successfully.");
	            } else {
	                response.put("status", "Failed");
	                response.put("message", "Something went wrong.");
	            }
	        } else {
	            response.put("status", "Failed");
	            response.put("message", "Salary not assigned to employee.");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Failed");
	        response.put("message", "Something went wrong: " + e.getMessage());
	    }
	    return response;
	}
	public static double getDistance(double lat1, double lon1, double lat2, double lon2) {
	    final int R = 6371; // Earth radius in KM
	    double latDistance = Math.toRadians(lat2 - lat1);
	    double lonDistance = Math.toRadians(lon2 - lon1);
	    double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
	             + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
	             * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	    return R * c;
	}



	
	public Map<String, Object> getAttendance(int start, int length,
			String employee_id,String user_type) {
			Map<String, Object> response = new HashMap<String,Object>(); 
			try {
				Map<String, Object> map = new HashMap<String,Object>();
				if(user_type.equals("Employee")) {
					map.put("employee_id", Integer.parseInt(employee_id));
				}
				List<Leave> attendances2 = commonDao.getleaves(employee_id, user_type);
				List<Leave> attendances= attendances2.stream().filter(p -> p.getCreatedAt().compareTo(new Date()) <=0).collect(Collectors.toList());
				int count = commonDao.getDataByMapSize(map, new Attendance(), null, null, 0, -1);
				if(attendances.size() >0) {
					for (Leave a  : attendances) {
						Map<String, Object> map3 = new HashMap<String,Object>();
						map3.put("sno", a.getSalary_id());
						List<EmployeeSalary> employeeSalaries = (List<EmployeeSalary>) commonDao.getDataByMap(map3, new EmployeeSalary(), null, null, 0, -1);
						int month = a.getMonth_no();
						Calendar calendar = Calendar.getInstance();
						calendar.set(Calendar.MONTH, month - 1);
						
						int totalDaysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
						Map<String, Object> maps = new HashMap<String,Object>();
						maps.put("status", "approved");
						if(user_type.equals("Employee")) {
							maps.put("employee_id", Integer.parseInt(employee_id));
						}
						List<LeaveRequest> leaveRequests = (List<LeaveRequest>) commonDao.getDataByMap(maps, new LeaveRequest(), null, null, 0, -1);
						int total_leave = 0;
						for(LeaveRequest l: leaveRequests ) {
							total_leave +=  l.getLeave_days();
						}
						Map<String, Object> map1 = new HashMap<String,Object>();
						map1.put("sno", a.getEmployee_id());
						List<EmployeeDetails> emp = (List<EmployeeDetails>) commonDao.getDataByMap(map1, new EmployeeDetails(), null, null, 0, -1);
						a.setEmployee_name(emp.get(0).getFirst_name()+" "+emp.get(0).getLast_name());
						a.setTotal_days(totalDaysInMonth);
						a.setTotal_leaves(total_leave);
						double total_salary = employeeSalaries.get(0).getTotal_salary()/12;
						double perday_salary = total_salary/totalDaysInMonth;
						double this_month_salary = perday_salary*a.getTotal_attendance();
					
						a.setSalary(this_month_salary);
						
					}
					response.put("status", "Success");
					response.put("message", "Data Fetched Successfully");
					response.put("data", attendances);
					response.put("recordsFiltered", count);
					response.put("recordsTotal", count);
				}else {
					response.put("status", "No_Content");
					response.put("message", "No_Data_Found");
					response.put("data", new ArrayList<>());
					response.put("recordsFiltered", 0);
					response.put("recordsTotal", 0);
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.put("status", "Failed");
				response.put("message", "Something Went Wrong" +e);
			}
			return response;
	}
	
	public Map<String, Object> getAttendancefilter(int start, int length, int id, int month, int year) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			List<Attendance> data =   commonDao.getAttendancefilter(id, month, year);
			if (data.size() > 0) {
				for(Attendance a :data) {
					Map<String, Object> map = new HashMap<String,Object>();
					map.put("sno", a.getEmployee_id());
					List<EmployeeDetails> emp = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
					a.setEmployee_name(emp.get(0).getFirst_name()+" "+emp.get(0).getLast_name());
				}
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("recordsFiltered", data.size());
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


	public Map<String, Object> pay_salary(String emp_id, String month, String year) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			List<Attendance> attendances = commonDao.pay_salary(emp_id, month, year);
			if(attendances.size() >0) {
				for(Attendance a : attendances) {
					a.setStatus("Paid");
					commonDao.updateDataToDb(a);
				}
				response.put("status", "Success");
				response.put("message", "Data Saved Successfully");
			}else {
				response.put("status", "Failed");
				response.put("message", "Something Went Wrong");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}


	public Map<String, Object> getEmployeeAttendance(int id, int month, int year) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			List<Attendance> data =   commonDao.getAttendancefilter(id, month, year);
			if (data.size() > 0) {
				for(Attendance a :data) {
					Map<String, Object> map = new HashMap<String,Object>();
					map.put("sno", a.getEmployee_id());
					List<EmployeeDetails> emp = (List<EmployeeDetails>) commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
					a.setEmployee_name(emp.get(0).getFirst_name()+" "+emp.get(0).getLast_name());
				}
				response.put("status", "Success");
				response.put("message", "Data Fetched Successfully");
				response.put("data", data);
			} else {
				response.put("status", "No_Content");
				response.put("message", "No Data Found");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}

	public Map<String, Object> clock_Out(String employee_id, String user_type, double userLat, double userLon) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        if (!"Admin".equalsIgnoreCase(user_type)) {
	            double officeLat = 28.4576819;
	            double officeLon = 77.0449214;
	            double distance = getDistance(userLat, userLon, officeLat, officeLon);

	            if (distance > 1.5) { 
	                response.put("status", "Failed");
	                response.put("message", "You are not at the authorized office location.");
	                return response;
	            }
	        }

	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));

	        SimpleDateFormat sdff = new SimpleDateFormat("yyyy-MM-dd");
	        Date parsedDate = sdff.parse(sdff.format(new Date()));

	        Map<String, Object> map = new HashMap<>();
	        map.put("employee_id", Integer.parseInt(employee_id));
	        map.put("attendance_date", parsedDate);

	        List<Attendance> data = (List<Attendance>) commonDao.getDataByMap(map, new Attendance(), null, null, 0, -1);

	        if (!data.isEmpty()) {
	            String clock_out = sdf.format(new Date());
	            String clock_in = data.get(0).getClock_in();

	            Date inTime = sdf.parse(clock_in);
	            Date outTime = sdf.parse(clock_out);

	            long diffInMillis = outTime.getTime() - inTime.getTime();
	            long hours = TimeUnit.MILLISECONDS.toHours(diffInMillis);
	            long minutes = TimeUnit.MILLISECONDS.toMinutes(diffInMillis) % 60;

	            data.get(0).setClock_out(clock_out);
	            data.get(0).setTotal_hours(hours + " hours " + minutes + " minutes");

	            commonDao.updateDataToDb(data.get(0));

	            response.put("status", "Success");
	            response.put("message", "Clock out Successfully");
	        } else {
	            response.put("status", "No_Content");
	            response.put("message", "No Data Found");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Failed");
	        response.put("message", "Something Went Wrong: " + e.getMessage());
	    }

	    return response;
	}


	public Map<String, Object> update_attendance(String sno, String a_type) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("sno", Integer.parseInt(sno));
			List<Attendance> data =   (List<Attendance>)commonDao.getDataByMap(map, new Attendance(), null, null, 0, -1);
			if (data.size() > 0) {
				data.get(0).setAttendance_type(Float.parseFloat(a_type));
				commonDao.updateDataToDb(data.get(0));
				response.put("status", "Success");
				response.put("message", "Attendance updated Successfully");
				response.put("data", data);
			} else {
				response.put("status", "No_Content");
				response.put("message", "No Data Found");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}
	public Map<String, Object> clock_out_attendance(Attendance details) {
		Map<String, Object> response = new HashMap<String,Object>();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("employee_id", details.getEmployee_id());
			map.put("attendance_date", details.getAttendance_date());
			List<Attendance> data =   (List<Attendance>)commonDao.getDataByMap(map, new Attendance(), null, null, 0, -1);
			if (data.size() > 0) {
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
				String clock_out = details.getClock_out();
	            String clock_in = data.get(0).getClock_in();
	            Date inTime = sdf.parse(clock_in);
	            Date outTime = sdf.parse(clock_out);

	            long diffInMillis = outTime.getTime() - inTime.getTime();
	            long hours = TimeUnit.MILLISECONDS.toHours(diffInMillis);
	            long minutes = TimeUnit.MILLISECONDS.toMinutes(diffInMillis) % 60;
	            data.get(0).setTotal_hours(hours + " hours " + minutes + " minutes");
				data.get(0).setClock_out(details.getClock_out());
				commonDao.updateDataToDb(data.get(0));
				response.put("status", "Success");
				response.put("message", "Clock out Successfully");
				response.put("data", data);
			} else {
				response.put("status", "Failed");
				response.put("message", "No Data Found");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Failed");
			response.put("message", "Something Went Wrong" + e);
		}
		return response;
	}
}
