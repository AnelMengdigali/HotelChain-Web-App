package com.first_sprint.swe;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class ManagerControl {
	private UserManager userManager;
	
	private static final String ADD_SEASON = "INSERT INTO SEASON VALUES(?, ?, ?, ?, ?, ?)";
	private static final String REMOVE_SEASON = "DELETE FROM SEASON WHERE name = ? and HotelID = ?";
	private static final String FIND_MANAGER = "SELECT * FROM EMPLOYEE WHERE ManagerID IS NULL AND username = ? and password = ?";
	private static final String FIND_MANAGER_BY_ID = "SELECT * FROM EMPLOYEE WHERE ManagerID IS NULL AND EmployeeID = ?";
	
	public ManagerControl() {
		userManager = new UserManager();
	}
	
	public void insertSeason(Season ses) {
		try(Connection connection = userManager.getConnection();
				PreparedStatement preparedStatement1 = connection.prepareStatement(ADD_SEASON)){
			preparedStatement1.setString(1, ses.getName());
			preparedStatement1.setString(2, ses.getStartdate());
			preparedStatement1.setString(3, ses.getEnddate());
			preparedStatement1.setString(4, ses.getCoefficientWorking());
			preparedStatement1.setString(5, ses.getCoefficientWeekEnd());
			preparedStatement1.setString(6, ses.getHotelID());
			
			preparedStatement1.execute();			
		}catch (SQLException e) {
			printSQLException(e);
		}
	}
	public void removeSeason(String name, String hotelID) {
		try(Connection connection = userManager.getConnection();
				PreparedStatement preparedStatement1 = connection.prepareStatement(REMOVE_SEASON)){
			preparedStatement1.setString(1, name);
			preparedStatement1.setString(2, hotelID);
			preparedStatement1.execute();			
		}catch (SQLException e) {
			printSQLException(e);
		}
	}
	public boolean checkLog(String username, String password) throws SQLException{
		try(Connection connection = userManager.getConnection();
				PreparedStatement preparedStatement1 = connection.prepareStatement(FIND_MANAGER)){
			preparedStatement1.setString(1, username);
			preparedStatement1.setString(2, password);
			ResultSet rs = preparedStatement1.executeQuery();
			int rowCount = 0;
			while(rs.next()) {
				rowCount++;
			}
		    System.out.println(rowCount);
		    if (rowCount >= 1) {
		    	return true;
		    }		
		}catch (SQLException e) {
			printSQLException(e);
		}
		return false;
	}
	public Employee getInfo(String username, String password) {
		Employee manager = new Employee();
		try(Connection connection = userManager.getConnection();
				PreparedStatement preparedStatement1 = connection.prepareStatement(FIND_MANAGER)){
			preparedStatement1.setString(1, username);
			preparedStatement1.setString(2, password);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
		    manager = new Employee(rs.getInt("EmployeeID"), 
					rs.getString("JobTitle"), 
					rs.getString("name"), 
					rs.getString("surname"), 
					rs.getInt("HotelID"));	
		}catch (SQLException e) {
			printSQLException(e);
		}
		return manager;
	}
	public Employee getInfo(String employeeID) {
		Employee manager = new Employee();
		try(Connection connection = userManager.getConnection();
				PreparedStatement preparedStatement1 = connection.prepareStatement(FIND_MANAGER_BY_ID)){
			preparedStatement1.setString(1, employeeID);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
		    manager = new Employee(rs.getInt("EmployeeID"), 
					rs.getString("JobTitle"), 
					rs.getString("name"), 
					rs.getString("surname"), 
					rs.getInt("HotelID"));	
		}catch (SQLException e) {
			printSQLException(e);
		}
		return manager;
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
