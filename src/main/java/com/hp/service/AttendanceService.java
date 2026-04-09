package com.hp.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hp.dao.CommonDao;
import com.hp.model.Attendance;
import com.hp.model.EmployeeDetails;
import com.hp.model.EmployeeLeaves;
import com.hp.model.EmployeeSalary;
import com.hp.model.Leave;
import com.hp.model.LeaveRequest;
import com.hp.model.LoginCredentials;


@Service
public class AttendanceService {

	@Autowired
	CommonDao commonDao;
	@Autowired
	private HttpServletRequest request;
	
	
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
//	public Map<String, Object> add_attendance(Attendance details) {
//	    Map<String, Object> response = new HashMap<>();
//	    try {
//	    	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	 	        String formattedDate = dateFormat.format(details.getAttendance_date());
//	    	  // Allow Admin from anywhere, restrict others
//	        if (!"Admin".equalsIgnoreCase(details.getUser_type())) {
//	            double userLat = details.getLat();
//	            double userLon = details.getLon();
//
//	            // Set office location (update as per your actual location)
//	            double officeLat = 28.4576819;  // Example: Gurgaon
//	            double officeLon = 77.0449214;
//
//	            double distance = getDistance(userLat, userLon, officeLat, officeLon);
//	            System.out.println("Distance from office: " + distance + " KM");
//	            Map<String, Object> map = new HashMap<String, Object>();
//	        	map.put("authentication_id", details.getAuthentication_id());
//	        	map.put("sno", details.getEmployee_id());
//	        	List<EmployeeDetails> emp = (List<EmployeeDetails>)commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
//	          System.out.println("emp-=="+emp.size());
//	        	if (distance > 1.5) { // 100 meters range
//	        		if(emp.size() == 0) {
//	        			 response.put("status", "Failed");
//	 	                response.put("message", "You are not at the authorized office location.");
//	 	                return response;
//	        		}
//	            }
//	        	
//	 	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
//	 	        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
//	 	       LocalTime currentTime1 = LocalTime.now(ZoneId.of("Asia/Kolkata"));
//	 	        String currentTime = sdf.format(new Date());
//	 	       LocalTime limitTime = LocalTime.of(10, 15);
//	 	      if (currentTime1.isAfter(limitTime) && currentTime1.isBefore(LocalTime.of(19, 00))) {
//	 	    	 details.setAttendance_type((float) 0.5);
//	 	    	}
//	        	 details.setClock_in(currentTime);
//	        }
//	       
//	        List<Attendance> attendances = commonDao.getAttendanceData(details.getEmployee_id(), formattedDate);
//	        if (!attendances.isEmpty()) {
//	            response.put("status", "Failed");
//	            response.put("message", "Already clocked-in today.");
//	            return response;
//	        }
//	        Map<String, Object> map = new HashMap<String, Object>();
//	        map.put("employee_id", details.getEmployee_id());
//	        List<EmployeeSalary> empService =(List<EmployeeSalary>)commonDao.getDataByMap(map, new EmployeeSalary(),	null,null, 0, -1);
//	        details.setSalary_id(empService.get(0).getSno());
//	        details.setStatus("Pending");
//	        details.setCreatedAt(new Date());
//	        details.setReason("-");
//
//	        int i = commonDao.addDataToDb(details);
//	        if (i > 0) {
//	            response.put("status", "Success");
//	            response.put("message", "Clock-in successful.");
//	        } else {
//	            response.put("status", "Failed");
//	            response.put("message", "Error during clock-in.");
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        response.put("status", "Failed");
//	        response.put("message", "Error: " + e.getMessage());
//	    }
//	    return response;
//	}

	public Map<String, Object> add_attendance(Attendance details) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        String formattedDate = dateFormat.format(details.getAttendance_date());

	        if (!"Admin".equalsIgnoreCase(details.getUser_type())) {
	            double userLat = details.getLat();
	            double userLon = details.getLon();

	            // Updated office location
	            double officeLat = 28.44873828269953;
	            double officeLon = 77.04108809320483;

	            double distance = getDistance(userLat, userLon, officeLat, officeLon);
	            System.out.println("Distance from office: " + distance + " KM");

	            // ✅ CONDITION 1: Lat & Lon both are 0.0 (not sent / GPS off)
	            if (userLat == 0.0 && userLon == 0.0) {
	                response.put("status", "Failed");
	                response.put("message", "Location not available. Please enable GPS and try again.");
	                return response;
	            }

	            // ✅ CONDITION 2: Lat or Lon is invalid / out of range
	            if (userLat < -90 || userLat > 90 || userLon < -180 || userLon > 180) {
	                response.put("status", "Failed");
	                response.put("message", "Invalid location coordinates.");
	                return response;
	            }

	            // ✅ CONDITION 4: Distance exceeds 100m — not at office
	            if (distance > 0.1) {
	                response.put("status", "Failed");
	                response.put("message", "You are not at the authorized office location. "
	                    + "Distance from office: " + String.format("%.2f", distance) + " KM.");
	                return response;
	            }

	            // ✅ CONDITION 5: Late attendance — mark as half day (after 10:15 AM)
	            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	            sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	            LocalTime currentTime1 = LocalTime.now(ZoneId.of("Asia/Kolkata"));
	            String currentTime = sdf.format(new Date());
	            LocalTime limitTime = LocalTime.of(10, 15);

	            if (currentTime1.isAfter(limitTime) && currentTime1.isBefore(LocalTime.of(19, 0))) {
	                details.setAttendance_type((float) 0.5);
	            }

	            // ✅ CONDITION 6: Outside working hours — before office open or after close
	            if (currentTime1.isBefore(LocalTime.of(8, 0)) || currentTime1.isAfter(LocalTime.of(19, 0))) {
	                response.put("status", "Failed");
	                response.put("message", "Attendance can only be marked between 8:00 AM and 7:00 PM.");
	                return response;
	            }

	            details.setClock_in(currentTime);
	        }

	        // ✅ CONDITION 7: Already clocked in today
	        List<Attendance> attendances = commonDao.getAttendanceData(details.getEmployee_id(), formattedDate);
	        if (!attendances.isEmpty()) {
	            response.put("status", "Failed");
	            response.put("message", "Already clocked-in today.");
	            return response;
	        }

	        // ✅ CONDITION 8: Salary record not found
	        Map<String, Object> map = new HashMap<>();
	        map.put("employee_id", details.getEmployee_id());
	        List<EmployeeSalary> empService = (List<EmployeeSalary>) commonDao.getDataByMap(
	            map, new EmployeeSalary(), null, null, 0, -1);

	        if (empService == null || empService.isEmpty()) {
	            response.put("status", "Failed");
	            response.put("message", "Salary record not found for this employee.");
	            return response;
	        }

	        details.setSalary_id(empService.get(0).getSno());
	        details.setStatus("Pending");
	        details.setCreatedAt(new Date());
	        details.setReason("-");

	        // ✅ CONDITION 9: DB insert failed
	        int i = commonDao.addDataToDb(details);
	        if (i > 0) {
	            response.put("status", "Success");
	            response.put("message", "Clock-in successful.");
	        } else {
	            response.put("status", "Failed");
	            response.put("message", "Error during clock-in. Please try again.");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Failed");
	        response.put("message", "Error: " + e.getMessage());
	    }
	    return response;
	}

	public Map<String, Object> clock_out_attendance(Attendance details) {
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
	            Map<String, Object> map = new HashMap<String, Object>();
	        	map.put("authentication_id", details.getAuthentication_id());
	        	map.put("sno", details.getEmployee_id());
	        	List<EmployeeDetails> emp = (List<EmployeeDetails>)commonDao.getDataByMap(map, new EmployeeDetails(), null, null, 0, -1);
	          System.out.println("emp-=="+emp.size());
	        	if (distance > 1.5) { // 100 meters range
	        		if(emp.size() == 0) {
	        			 response.put("status", "Failed");
	 	                response.put("message", "You are not at the authorized office location.");
	 	                return response;
	        		}
	            }
	        }


	        Map<String, Object> map = new HashMap<>();
	        map.put("employee_id", details.getEmployee_id());
	        map.put("attendance_date", details.getAttendance_date());

	        List<Attendance> data = (List<Attendance>) commonDao.getDataByMap(map, new Attendance(), null, null, 0, -1);
	        if (data.isEmpty()) {
	            response.put("status", "Failed");
	            response.put("message", "Clock-in not found.");
	            return response;
	        }

	        Attendance attendance = data.get(0);
	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));

	        Date inTime = sdf.parse(attendance.getClock_in());
	        Date outTime = sdf.parse(details.getClock_out());

	        long diffMillis = outTime.getTime() - inTime.getTime();
	        long totalMinutes = TimeUnit.MILLISECONDS.toMinutes(diffMillis);
	        long hours = totalMinutes / 60;
	        long minutes = totalMinutes % 60;

	        attendance.setClock_out(details.getClock_out());
	        attendance.setTotal_hours(hours + " hours " + minutes + " minutes");

	        // Attendance type logic
	        if (totalMinutes < 240) {
	            attendance.setAttendance_type(0); // Absent
	        } else if (totalMinutes >= 240 && totalMinutes < 450) {
	            attendance.setAttendance_type(0.5f); // Half day
	        }else {
	            attendance.setAttendance_type(1); // Full day
	        }

	        // Salary ID check
	        if (attendance.getSalary_id() == 0) {
	            String formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(details.getAttendance_date());
	            List<EmployeeSalary> empService = commonDao.getLatestDate(details.getEmployee_id(), formattedDate);
	            if (!empService.isEmpty()) {
	                attendance.setSalary_id(empService.get(0).getSno());
	            }
	        }

	        commonDao.updateDataToDb(attendance);
	        response.put("status", "Success");
	        response.put("message", "Clock-out successful.");
	        response.put("data", attendance);

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Failed");
	        response.put("message", "Error during clock-out: " + e.getMessage());
	    }
	    return response;
	}

	private String getClientIp(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");
	    if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    } else {
	        ip = ip.split(",")[0];
	    }
	    return ip;
	}

	public Map<String, Object> getAttendance(int start, int length,
	        String employee_id, String user_type) {

	    Map<String, Object> response = new HashMap<>();

	    try {
	        // ✅ Pagination ke saath data fetch karo
	        List<Leave> attendances2 = commonDao.getleaves(employee_id, user_type, start, length);

	        // ✅ Total count alag lo
	        int count = commonDao.getLeavesCount(employee_id, user_type);

	        // ✅ Date filter
	        Date today = new Date();
	        List<Leave> attendances = attendances2.stream()
	            .filter(p -> p.getCreatedAt() != null && !p.getCreatedAt().after(today))
	            .collect(Collectors.toList());

	        if (!attendances.isEmpty()) {

	            // ✅ Bulk fetch ke liye IDs collect karo
	            List<Integer> salaryIds = attendances.stream()
	                .map(Leave::getSalary_id)
	                .distinct()
	                .collect(Collectors.toList());

	            List<Integer> employeeIds = attendances.stream()
	                .map(Leave::getEmployee_id)
	                .distinct()
	                .collect(Collectors.toList());

	            // ✅ Loop se bahar bulk fetch
	            Map<Integer, EmployeeSalary> salaryMap = getSalaryMap(salaryIds);
	            Map<Integer, EmployeeDetails> empMap = getEmployeeMap(employeeIds);
	            Map<Integer, Double> leaveMap = getLeaveCountMap(employeeIds, user_type, employee_id);

	            for (Leave a : attendances) {
	                try {
	                    int month = a.getMonth_no();
	                    Calendar calendar = Calendar.getInstance();
	                    calendar.set(Calendar.MONTH, month - 1);
	                    int totalDaysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

	                    // ✅ Null safe employee name
	                    EmployeeDetails empDetails = empMap.get(a.getEmployee_id());
	                    if (empDetails != null) {
	                        a.setEmployee_name(
	                            empDetails.getFirst_name() + " " + empDetails.getLast_name()
	                        );
	                    } else {
	                        a.setEmployee_name("Unknown");
	                    }

	                    // ✅ Null safe salary calculation
	                    EmployeeSalary salary = salaryMap.get(a.getSalary_id());
	                    if (salary != null) {
	                        double total_salary = salary.getTotal_salary() / 12.0;
	                        double perday_salary = total_salary / totalDaysInMonth;
	                        double this_month_salary = perday_salary * a.getTotal_attendance();
	                        a.setSalary(this_month_salary);
	                    } else {
	                        a.setSalary(0.0);
	                    }

	                    // ✅ Leave count set karo
	                    double total_leave = leaveMap.getOrDefault(a.getEmployee_id(), 0.0);
	                    a.setTotal_days(totalDaysInMonth);
	                    a.setTotal_leaves(total_leave);

	                } catch (Exception e) {
	                    System.err.println("Error processing leave record: " + e.getMessage());
	                }
	            }

	            response.put("status", "Success");
	            response.put("message", "Data Fetched Successfully");
	            response.put("data", attendances);
	            response.put("recordsFiltered", count);
	            response.put("recordsTotal", count);

	        } else {
	            response.put("status", "No_Content");
	            response.put("message", "No_Data_Found");
	            response.put("data", new ArrayList<>());
	            response.put("recordsFiltered", 0);
	            response.put("recordsTotal", 0);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Failed");
	        response.put("message", "Something Went Wrong: " + e.getMessage());
	    }

	    return response;
	}
	// ✅ Salary bulk fetch
	private Map<Integer, EmployeeSalary> getSalaryMap(List<Integer> salaryIds) {
	    Map<Integer, EmployeeSalary> result = new HashMap<>();
	    for (int id : salaryIds) {
	        try {
	            Map<String, Object> m = new HashMap<>();
	            m.put("sno", id);
	            List<EmployeeSalary> list = (List<EmployeeSalary>)
	                commonDao.getDataByMap(m, new EmployeeSalary(), null, null, 0, -1);
	            if (list != null && !list.isEmpty()) {
	                result.put(id, list.get(0));
	            }
	        } catch (Exception e) {
	            System.err.println("Error fetching salary for id: " + id + " - " + e.getMessage());
	        }
	    }
	    return result;
	}

	// ✅ Employee bulk fetch
	private Map<Integer, EmployeeDetails> getEmployeeMap(List<Integer> employeeIds) {
	    Map<Integer, EmployeeDetails> result = new HashMap<>();
	    for (int id : employeeIds) {
	        try {
	            Map<String, Object> m = new HashMap<>();
	            m.put("sno", id);
	            List<EmployeeDetails> list = (List<EmployeeDetails>)
	                commonDao.getDataByMap(m, new EmployeeDetails(), null, null, 0, -1);
	            if (list != null && !list.isEmpty()) {
	                result.put(id, list.get(0));
	            }
	        } catch (Exception e) {
	            System.err.println("Error fetching employee for id: " + id + " - " + e.getMessage());
	        }
	    }
	    return result;
	}

	// ✅ Leave count — Double use karo (half-day support)
	private Map<Integer, Double> getLeaveCountMap(List<Integer> employeeIds,
	                                               String user_type, String employee_id) {
	    Map<Integer, Double> result = new HashMap<>();
	    try {
	        Map<String, Object> maps = new HashMap<>();
	        maps.put("status", "approved");
	        if (user_type.equals("Employee")) {
	            maps.put("employee_id", Integer.parseInt(employee_id));
	        }

	        List<LeaveRequest> leaveRequests = (List<LeaveRequest>)
	            commonDao.getDataByMap(maps, new LeaveRequest(), null, null, 0, -1);

	        for (LeaveRequest l : leaveRequests) {
	            result.merge(l.getEmployee_id(), (double) l.getLeave_days(), Double::sum);  // ✅
	        }
	    } catch (Exception e) {
	        System.err.println("Error fetching leave count: " + e.getMessage());
	    }
	    return result;
	}
	
//	public Map<String, Object> getAttendance(int start, int length,
//			String employee_id,String user_type) {
//			Map<String, Object> response = new HashMap<String,Object>(); 
//			try {
//				Map<String, Object> map = new HashMap<String,Object>();
//				if(user_type.equals("Employee")) {
//					map.put("employee_id", Integer.parseInt(employee_id));
//				}
//				List<Leave> attendances2 = commonDao.getleaves(employee_id, user_type);
//				List<Leave> attendances= attendances2.stream().filter(p -> p.getCreatedAt().compareTo(new Date()) <=0).collect(Collectors.toList());
//				int count = commonDao.getDataByMapSize(map, new Attendance(), null, null, 0, -1);
//				if(attendances.size() >0) {
//					for (Leave a  : attendances) {
//						
//						Map<String, Object> map3 = new HashMap<String,Object>();
//						map3.put("sno", a.getSalary_id());
//						List<EmployeeSalary> employeeSalaries = (List<EmployeeSalary>) commonDao.getDataByMap(map3, new EmployeeSalary(), null, null, 0, -1);
//						System.out.println("employeeSalaries=="+a.getSalary_id());
//						int month = a.getMonth_no();
//						Calendar calendar = Calendar.getInstance();
//						calendar.set(Calendar.MONTH, month - 1);
//						
//						int totalDaysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
//						Map<String, Object> maps = new HashMap<String,Object>();
//						maps.put("status", "approved");
//						if(user_type.equals("Employee")) {
//							maps.put("employee_id", Integer.parseInt(employee_id));
//						}
//						List<LeaveRequest> leaveRequests = (List<LeaveRequest>) commonDao.getDataByMap(maps, new LeaveRequest(), null, null, 0, -1);
//						int total_leave = 0;
//						for(LeaveRequest l: leaveRequests ) {
//							total_leave +=  l.getLeave_days();
//						}
//						Map<String, Object> map1 = new HashMap<String,Object>();
//						map1.put("sno", a.getEmployee_id());
//						List<EmployeeDetails> emp = (List<EmployeeDetails>) commonDao.getDataByMap(map1, new EmployeeDetails(), null, null, 0, -1);
//						a.setEmployee_name(emp.get(0).getFirst_name()+" "+emp.get(0).getLast_name());
//						a.setTotal_days(totalDaysInMonth);
//						a.setTotal_leaves(total_leave);
//						double total_salary = employeeSalaries.get(0).getTotal_salary()/12;
//						double perday_salary = total_salary/totalDaysInMonth;
//						double this_month_salary = perday_salary*a.getTotal_attendance();
//					
//						a.setSalary(this_month_salary);
//						
//					}
//					response.put("status", "Success");
//					response.put("message", "Data Fetched Successfully");
//					response.put("data", attendances);
//					response.put("recordsFiltered", count);
//					response.put("recordsTotal", count);
//				}else {
//					response.put("status", "No_Content");
//					response.put("message", "No_Data_Found");
//					response.put("data", new ArrayList<>());
//					response.put("recordsFiltered", 0);
//					response.put("recordsTotal", 0);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//				response.put("status", "Failed");
//				response.put("message", "Something Went Wrong" +e);
//			}
//			return response;
//	}
	
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

	public Map<String, Object> clock_Out(String employee_id, String user_type, double d, double f, String authentication_id) {
	    Map<String, Object> response = new HashMap<>();
	    try {

	        if (!"Admin".equalsIgnoreCase(user_type)) {
	            double userLat = d;
	            double userLon = f;

	            // ✅ CONDITION 1: GPS off / location not sent
	            if (userLat == 0.0 && userLon == 0.0) {
	                response.put("status", "Failed");
	                response.put("message", "Location not available. Please enable GPS and try again.");
	                return response;
	            }

	            // ✅ CONDITION 2: Invalid coordinates
	            if (userLat < -90 || userLat > 90 || userLon < -180 || userLon > 180) {
	                response.put("status", "Failed");
	                response.put("message", "Invalid location coordinates.");
	                return response;
	            }

	            // Updated office location
	            double officeLat = 28.44873828269953;
	            double officeLon = 77.04108809320483;

	            double distance = getDistance(userLat, userLon, officeLat, officeLon);
	            System.out.println("Distance from office: " + distance + " KM");

	            // ✅ CONDITION 4: Distance > 100 meters — not at office
	            if (distance > 0.1) {
	                response.put("status", "Failed");
	                response.put("message", "You are not at the authorized office location. "
	                    + "Distance from office: " + String.format("%.0f", distance * 1000) + " meters.");
	                return response;
	            }
	        }

	        // ✅ Date/time formatters
	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	        SimpleDateFormat sdff = new SimpleDateFormat("yyyy-MM-dd");
	        Date parsedDate = sdff.parse(sdff.format(new Date()));

	        // ✅ CONDITION 5: No attendance found for today
	        Map<String, Object> map = new HashMap<>();
	        map.put("employee_id", Integer.parseInt(employee_id));
	        map.put("attendance_date", parsedDate);
	        List<Attendance> data = (List<Attendance>) commonDao.getDataByMap(
	            map, new Attendance(), null, null, 0, -1);

	        if (data == null || data.isEmpty()) {
	            response.put("status", "No_Content");
	            response.put("message", "No clock-in found for today. Please clock-in first.");
	            return response;
	        }

	        Attendance attendance = data.get(0);

	        // ✅ CONDITION 6: Already clocked out
	        if (attendance.getClock_out() != null && !attendance.getClock_out().isEmpty()) {
	            response.put("status", "Failed");
	            response.put("message", "You have already clocked out today.");
	            return response;
	        }

	        // ✅ CONDITION 7: Clock-in time missing
	        String clock_in = attendance.getClock_in();
	        if (clock_in == null || clock_in.isEmpty()) {
	            response.put("status", "Failed");
	            response.put("message", "Clock-in time not found. Cannot process clock-out.");
	            return response;
	        }

	        String clock_out = sdf.format(new Date());
	        Date inTime  = sdf.parse(clock_in);
	        Date outTime = sdf.parse(clock_out);

	        long diffInMillis  = outTime.getTime() - inTime.getTime();
	        long totalMinutes  = TimeUnit.MILLISECONDS.toMinutes(diffInMillis);

	        // ✅ CONDITION 8: Clock-out before clock-in (time mismatch)
	        if (totalMinutes <= 0) {
	            response.put("status", "Failed");
	            response.put("message", "Clock-out time is invalid. Please try again.");
	            return response;
	        }

	        long hours   = totalMinutes / 60;
	        long minutes = totalMinutes % 60;

	        attendance.setClock_out(clock_out);
	        attendance.setTotal_hours(hours + " h " + minutes + " m");

	        // ✅ CONDITION 9: Attendance type based on total hours
	        if (totalMinutes < 240) {
	            attendance.setAttendance_type(0);      // Less than 4 hrs → Absent
	        } else if (totalMinutes < 450) {
	            attendance.setAttendance_type(0.5f);   // 4–7.5 hrs → Half Day
	        } else {
	            attendance.setAttendance_type(1);      // 7.5+ hrs → Full Day
	        }

	        // ✅ CONDITION 10: DB update failed
	        commonDao.updateDataToDb(attendance);
	            response.put("status", "Success");
	            response.put("message", "Clock-out successful. Total hours: "
	                + hours + " hours " + minutes + " minutes.");
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
	
}
