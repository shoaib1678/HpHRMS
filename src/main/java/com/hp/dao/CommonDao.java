package com.hp.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.IntegerType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hp.model.Attendance;
import com.hp.model.EmployeeSalary;
import com.hp.model.Holiday;
import com.hp.model.Leave;

@Repository
@Transactional
public class CommonDao {

	@Autowired
	private SessionFactory sessionFactory;


	public int addDataToDb(Object objectdata) {
		Integer i = (Integer) sessionFactory.getCurrentSession().save(objectdata);
		return i;
	}

	public void updateDataToDb(Object objectdata) {
		sessionFactory.getCurrentSession().update(objectdata);
	}

	public Object getDataByMap(Map<String, Object> mapdata, Object objectdata, String orderbycolumn, String orderby,
			int start, int length) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(objectdata.getClass());
		for (Entry<String, Object> mapdataex : mapdata.entrySet()) {
			System.out.println(mapdataex.getKey() + "-" + mapdataex.getValue());
				criteria.add(Restrictions.eq(mapdataex.getKey(), mapdataex.getValue()));
		}
		if (orderby != null) {
			if (orderby.equalsIgnoreCase("asc")) {
				criteria.addOrder(Order.desc(orderbycolumn));
			} else {
				criteria.addOrder(Order.asc(orderbycolumn));
			}
		}
		criteria.setFirstResult(start);
		if (length != -1) {
			criteria.setMaxResults(length);
		}
		List<Object> list = criteria.list();
		return list;
	}
	
	public Object getDataByMapstatus(Map<String, Object> mapdata, Object objectdata, String orderbycolumn, String orderby,
			int start, int length) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(objectdata.getClass());
		for (Entry<String, Object> mapdataex : mapdata.entrySet()) {
				System.out.println(mapdataex.getKey() + "-" + mapdataex.getValue());
				criteria.add(Restrictions.eq(mapdataex.getKey(), mapdataex.getValue()));
		
		}
		 List<String> allowedStatuses = Arrays.asList("Active", "Pending");
		 criteria.add(Restrictions.in("status", allowedStatuses));
		if (orderby != null) {
			if (orderby.equalsIgnoreCase("asc")) {
				criteria.addOrder(Order.desc(orderbycolumn));
			} else {
				criteria.addOrder(Order.asc(orderbycolumn));
			}
		}
		criteria.setFirstResult(start);
		if (length != -1) {
			criteria.setMaxResults(length);
		}
		List<Object> list = criteria.list();
		return list;
	}
	public Object getDataforsearch(Map<String, Object> mapdata, Object objectdata,
			String orderbycolumn, String orderby, int start, int length) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(objectdata.getClass());
		Disjunction data = Restrictions.disjunction();
		for (Entry<String, Object> mapdataex : mapdata.entrySet()) {
			if (mapdataex.getValue() instanceof Integer) {
				data.add(Restrictions.eq(mapdataex.getKey(), mapdataex.getValue()));
			} else {
				data.add(Restrictions.ilike(mapdataex.getKey(), (String) mapdataex.getValue(), MatchMode.ANYWHERE));
			}
		}
		criteria.add(data);
		System.out.println(data);
		if (orderby != null) {
			if (!orderby.equalsIgnoreCase("asc")) {
				criteria.addOrder(Order.desc(orderbycolumn));
			} else {
				criteria.addOrder(Order.asc(orderbycolumn));
			}
		}
		criteria.setFirstResult(start);
		if (length != -1) {
			criteria.setMaxResults(length);
		}
		List<Object> list = criteria.list();
		return list;
	}
	public int getDataByMapSize(Map<String, Object> mapdata, Object objectdata, String orderbycolumn, String orderby,
			int start, int length) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(objectdata.getClass());
		for (Entry<String, Object> mapdataex : mapdata.entrySet()) {
			System.out.println(mapdataex.getKey() + "-" + mapdataex.getValue());
			criteria.add(Restrictions.eq(mapdataex.getKey(), mapdataex.getValue()));
		}
		if (orderby != null) {
			if (orderby.equalsIgnoreCase("asc")) {
				criteria.addOrder(Order.desc(orderbycolumn));
			} else {
				criteria.addOrder(Order.asc(orderbycolumn));
			}
		}
		criteria.setFirstResult(start);
		if (length != -1) {
			criteria.setMaxResults(length);
		}
		List<Object> list = criteria.list();
		return list.size();
	}

	public int updateMethodForAll(Map<String, Object> updatecolumn, String tableName, Map<String, Object> wheredata) {
		try {
			String query = "";
			String wherequery = "";
			for (Map.Entry<String, Object> entry : updatecolumn.entrySet()) {
				if(entry.getValue() instanceof Integer){
					if(Integer.parseInt(entry.getValue()+"") > 0){
						if (!query.equalsIgnoreCase("")) {
							query = query + " ," + entry.getKey().trim() + " = '" + entry.getValue() + "'";
						} else {
							query = query + " " + entry.getKey().trim() + " = '" + entry.getValue() + "'";
						}
					}					
				}
				else if(entry.getValue() instanceof List){
					
					
				}
				else{
					if (entry.getValue() != null) {
						if (!query.equalsIgnoreCase("")) {
							query = query + " ," + entry.getKey().trim() + " = '" + entry.getValue() + "'";
						} else {
							query = query + " " + entry.getKey().trim() + " = '" + entry.getValue() + "'";
						}
					}
				}				
			}
			for (Map.Entry<String, Object> entry : wheredata.entrySet()) {
				if (entry.getValue() != null) {
					if (!wherequery.equalsIgnoreCase("")) {
						wherequery = wherequery + " and " + entry.getKey().trim() + " = '" + entry.getValue() + "'";
					} else {
						wherequery = wherequery + " " + entry.getKey().trim() + " = '" + entry.getValue() + "'";
					}
				}

			}
			String query1 = "Update " + tableName + " set " + query + " where " + wherequery;
			Query sql = sessionFactory.openSession().createQuery(query1);
			int result = sql.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

public int deleteById(Map<String, Object> where) {
	Session session = sessionFactory.openSession();
	Transaction transaction = session.beginTransaction();
	Query q = session.createQuery("delete from " + where.get("tablename") + "  where " + where.get("column") + " =:"
			+ where.get("column") + "");
	q.setParameter(where.get("column").toString(), where.get("value"));
	int result = q.executeUpdate();
	transaction.commit();
	session.clear();
	session.close();
	return result;
}

public int addListToDb(List<Object> objectdata) {
	System.out.println(objectdata.toString());
	Integer i = 0;
	for (Object object : objectdata) {
		i = (Integer) sessionFactory.getCurrentSession().save(object);
	}
	return i;
}

public List<Attendance> getAttendanceData(int emp_id,String date){
	Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM Attendance  WHERE employee_id ="+emp_id+" and attendance_date = CAST('"+date+"' AS date)");
    List<Attendance> data = query.list();
    System.out.println(data.size() + "attendance size");
    return data;
}


public List<EmployeeSalary> getLatestDate(int emp_id,String date){
	Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM EmployeeSalary  WHERE employee_id =:emp_id and Date(createdAt) <= :date order by createdAt desc")
			.addEntity(EmployeeSalary.class).setParameter("emp_id", emp_id).setParameter("date", date);
    List<EmployeeSalary> data = query.list();
    System.out.println(data.size() + "attendance size");
    return data;
}

//public List<EmployeeAllowance> getAlllowances(int emp_id,String date){
//	Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM EmployeeAllowance  WHERE employee_id =:emp_id and Date(createdAt) <= :date order by createdAt desc")
//			.addEntity(EmployeeAllowance.class).setParameter("emp_id", emp_id).setParameter("date", date);
//    List<EmployeeAllowance> data = query.list();
//    System.out.println(query + "attendance size");
//    return data;
//}

//public List<Leave> getleaves(String employeeId, String userType){
//	Query query = null;
//
//	if(userType.equalsIgnoreCase("Admin")){
//	 query = sessionFactory.getCurrentSession().createSQLQuery("SELECT SUM(attendance_type) AS total_attendance, MONTHNAME(attendance_date) AS months, YEAR(attendance_date) AS years , employee_id, MONTH(attendance_date) AS month_no, status AS status,salary_id as salary_id,createdAt as createdAt  FROM Attendance GROUP BY YEAR(attendance_date)  ,MONTH(attendance_date),employee_id;");
//	}else {
//		 query = sessionFactory.getCurrentSession().createSQLQuery("SELECT SUM(attendance_type) AS total_attendance, MONTHNAME(attendance_date) AS months, YEAR(attendance_date) AS years , employee_id, MONTH(attendance_date) AS month_no, status AS status,salary_id as salary_id,createdAt as createdAt    FROM Attendance where employee_id = "+employeeId+"  GROUP BY YEAR(attendance_date)  ,MONTH(attendance_date),employeeId;");
//	}
//	List<Object[]> data = query.list();
//    List<Leave> leaves = new ArrayList<Leave>();
//    System.out.println(data.size() + "attendance size");
//    for (Object[] result : data) {
//    	Leave leave = new Leave();
//    	
//        Double attend = (double) result[0] ;
//        String month = (String) result[1];
//        Integer year = (int) result[2];
//        Integer emp_id = (int) result[3];
//        Integer month_no = (int) result[4];
//        String status = (String) result[5];
//        Integer salary_id = (int) result[6];
//        Date createdAt = (Date) result[7];
//        
//        leave.setTotal_attendance(attend);
//        leave.setEmployee_id(emp_id);
//        leave.setMonth(month);
//        leave.setYear(year);
//        leave.setMonth_no(month_no);
//        leave.setStatus(status);
//        leave.setSalary_id(salary_id);
//        leave.setCreatedAt(createdAt);
//        leaves.add(leave);
//    }
//    return leaves;
//}
public List<Leave> getleaves(String employeeId, String userType) {
    Query query;

    String sql = "SELECT " +
        "SUM(attendance_type) AS total_attendance, " +           
        "MAX(MONTHNAME(attendance_date)) AS months, " +          
        "YEAR(attendance_date) AS years, " +                     
        "employee_id, " +                                        
        "MAX(MONTH(attendance_date)) AS month_no, " +            
        "MAX(status) AS status, " +                              
        "MAX(salary_id) AS salary_id, " +                        
        "MAX(createdAt) AS createdAt " +                         
        "FROM Attendance ";

    if (userType.equalsIgnoreCase("Admin")) {
        sql += "GROUP BY YEAR(attendance_date), MONTH(attendance_date), employee_id " +
               "ORDER BY YEAR(attendance_date) DESC, MONTH(attendance_date) DESC";
        query = sessionFactory.getCurrentSession().createSQLQuery(sql);
    } else {
        sql += "WHERE employee_id = :empId " +
               "GROUP BY YEAR(attendance_date), MONTH(attendance_date), employee_id " +
               "ORDER BY YEAR(attendance_date) DESC, MONTH(attendance_date) DESC";
        query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        query.setParameter("empId", employeeId);
    }

    List<Object[]> data = query.list();
    List<Leave> leaves = new ArrayList<>();

    System.out.println(data.size() + " attendance size");

    for (Object[] result : data) {
        Leave leave = new Leave();

        Double attend = (Double) result[0];
        String month = (String) result[1];
        Integer year = ((Number) result[2]).intValue();
        Integer emp_id = ((Number) result[3]).intValue();
        Integer month_no = ((Number) result[4]).intValue();
        String status = (String) result[5];
        Integer salary_id = ((Number) result[6]).intValue();
        Date createdAt = (Date) result[7];

        leave.setTotal_attendance(attend);
        leave.setMonth(month);
        leave.setYear(year);
        leave.setEmployee_id(emp_id);
        leave.setMonth_no(month_no);
        leave.setStatus(status);
        leave.setSalary_id(salary_id);
        leave.setCreatedAt(createdAt);

        leaves.add(leave);
    }

    return leaves;
}

public List<Holiday> getDataByMapAttendance( String date,int start,int length) {
	Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Holiday.class);

	if(date != null && !date.equals("")) {
		System.out.println(date);
		
		 criteria.add(Restrictions.ge("holiday_date",java.sql.Date.valueOf(date)));
		}
criteria.setFirstResult(start); 
if (length != -1) {
		  criteria.setMaxResults(length); 
}
		 
	List<Holiday> list = criteria.list();
	return list;
}
public List<Attendance> getAttendancefilter(int id, int month, int year) {
    String hql = "FROM Attendance u " +
                 "WHERE MONTH(u.attendance_date) = :month " +
                 "AND YEAR(u.attendance_date) = :year " +
                 "AND u.employee_id = :empId " +
                 "ORDER BY u.attendance_date DESC";

    Query query = sessionFactory.getCurrentSession().createQuery(hql);
    query.setParameter("month", month);
    query.setParameter("year", year);
    query.setParameter("empId", id);

    List<Attendance> data = query.list();
    System.out.println("Attendance records found: " + data.size());
    return data;
}

public List<Attendance> pay_salary(String emp_id,String month,String year){
	 Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Attendance.class)
			 	.add(Restrictions.eq("status", "Pending")) // Only update records with status "Pending"
		        .add(Restrictions.eq("employee_id", Integer.parseInt(emp_id)))
		        .add(Restrictions.sqlRestriction("MONTH(createdAt) = ?",Integer.parseInt(month),IntegerType.INSTANCE))
		        .add(Restrictions.sqlRestriction("YEAR(createdAt)= ?",Integer.parseInt(year),IntegerType.INSTANCE));
	List<Attendance> attendances = criteria.list();
	 return attendances;
}


//public List<TravelExpense> get_expense(String emp_id,String month,String year){
//	 Criteria criteria = sessionFactory.getCurrentSession().createCriteria(TravelExpense.class)
//			 	.add(Restrictions.eq("status", "Approved")) // Only update records with status "Pending"
//		        .add(Restrictions.eq("employee_id", Integer.parseInt(emp_id)))
//		        .add(Restrictions.sqlRestriction("MONTH(updateDate) = ?",Integer.parseInt(month),IntegerType.INSTANCE))
//		        .add(Restrictions.sqlRestriction("YEAR(updateDate)= ?",Integer.parseInt(year),IntegerType.INSTANCE));
//	List<TravelExpense> travelExpenses = criteria.list();
//	 return travelExpenses;
//	 
//}





}
