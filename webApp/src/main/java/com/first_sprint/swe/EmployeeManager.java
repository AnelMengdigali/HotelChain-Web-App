package com.first_sprint.swe;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
//import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class EmployeeManager {
	private String jdbcURL = "jdbc:mysql://localhost:3306/mydb";
	private String jdbcUsername = "root";
	private String jdbcPassword = "Mohikohhi12m$";
	
	private static final String SELECT_ALL_BY_MANAGER = "select EmployeeID, JobTitle, name, surname from EMPLOYEE WHERE ManagerID = ?";
	private static final String SELECT_MANAGER_BY_EMPLOYEE = "SELECT * FROM EMPLOYEE WHERE EmployeeID = ?";
	private static final String SELECT_EMPLOYEE = "select * "
			+ "from EMPLOYEE E join SCHEDULE S on E.EmployeeID = S.EmployeeID"
			+ " where E.EmployeeID = ?";
	private static final String UPDATE_EMPLOYEE = "UPDATE SCHEDULE set salaryPerHour = ?, mo= ?"
			+ ", tu = ?, we = ?, th = ?, fr = ?, sa = ?, su = ?,"
			+ " from_time = ?, to_time = ? where EmployeeID = ? ";

	public EmployeeManager() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public String getManagerID(String employeeID) throws SQLException {
		String m_id = "";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MANAGER_BY_EMPLOYEE)) {
			preparedStatement.setString(1, employeeID);
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				m_id = rs.getString("ManagerID");
			}
		    
		} catch (SQLException e) {
			printSQLException(e);
		}
		return m_id;
	}
	public ArrayList<Employee> getAllEmployees(int managerID) throws SQLException {
		ArrayList<Employee> employees = new ArrayList<Employee>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BY_MANAGER)) {
			preparedStatement.setInt(1, managerID);
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("EmployeeID");
				String jobTitle = rs.getString("JobTitle");
				String name = rs.getString("name");
				String surname = rs.getString("surname");
				employees.add(new Employee(id, jobTitle, name, surname));
			}
		    
		} catch (SQLException e) {
			printSQLException(e);
		}
		return employees;
	}
	public Employee getFullInfo(int id) throws SQLException{
		Employee employee = new Employee();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE)) {
			preparedStatement.setInt(1, id);
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				employee = new Employee(rs.getInt("EmployeeID"), 
						rs.getString("JobTitle"), 
						rs.getString("name"), 
						rs.getString("surname"), 
						rs.getInt("ManagerID"), 
						rs.getInt("HotelID"), 
						rs.getBoolean("mo"),
						rs.getBoolean("tu"), 
						rs.getBoolean("we"),
						rs.getBoolean("th"), 
						rs.getBoolean("fr"), 
						rs.getBoolean("sa"), 
						rs.getBoolean("su"), 
						rs.getInt("salaryPerHour"), 
						rs.getString("from_time"),
						rs.getString("to_time"));
			}
			
		    
		} catch (SQLException e) {
			printSQLException(e);
		}
		return employee;
	
	}
	public void editEmployee(Employee employee) throws SQLException {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE)) {
			preparedStatement.setInt(1, employee.getSalaryPerHour());
			preparedStatement.setBoolean(2, employee.isMonday());
			preparedStatement.setBoolean(3, employee.isTuesday());
			preparedStatement.setBoolean(4, employee.isWednesday());
			preparedStatement.setBoolean(5, employee.isThursday());
			preparedStatement.setBoolean(6, employee.isFriday());
			preparedStatement.setBoolean(7, employee.isSaturday());
			preparedStatement.setBoolean(8, employee.isSunday());
			preparedStatement.setString(9, employee.getFromTime());
			preparedStatement.setString(10, employee.getToTime());
			preparedStatement.setInt(11, employee.getEmployeeID());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
		
	}
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
