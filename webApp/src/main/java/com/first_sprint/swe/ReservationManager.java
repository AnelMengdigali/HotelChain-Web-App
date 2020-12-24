package com.first_sprint.swe;

import java.sql.Connection;

//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.sql.ResultSet;

public class ReservationManager {
	private UserManager userManager;
	
	private static final String DELETE_FROM_RESERVATION = "DELETE FROM RESERVATION WHERE ReservationID = ?";
	private static final String DELETE_FROM_ROOM_HISTORY = "DELETE FROM ROOM_has_RESERVATION WHERE ReservationID = ?";
	private static final String ADD_TO_RESERVATION = "insert into RESERVATION "
			+ "(numOfOccupants, checkin, checkout, GuestID, final_price)"
			+ " values ( ?, ?, ?, ?, ?)";
	private static final String ADD_TO_ROOM_HISTORY = "insert into ROOM_has_RESERVATION "
			+ " values ( ?, ?, ?, (select max(ReservationID) from RESERVATION), ?, ?)";
	public ReservationManager() {
		userManager = new UserManager();
	}
	
	public void remove(String id) {
		try(Connection connection = userManager.getConnection();
				PreparedStatement preparedStatement1 = connection.prepareStatement(DELETE_FROM_ROOM_HISTORY);
				PreparedStatement preparedStatement2 = connection.prepareStatement(DELETE_FROM_RESERVATION)){
			preparedStatement1.setString(1, id);
			preparedStatement2.setString(1, id);
			
			preparedStatement1.executeUpdate();
			preparedStatement2.executeUpdate();
			
		}catch (SQLException e) {
			printSQLException(e);
		}
		
	}
	public void add(Reservation reservation) {
		try(Connection connection = userManager.getConnection();
				PreparedStatement preparedStatement1 = connection.prepareStatement(ADD_TO_RESERVATION);
				PreparedStatement preparedStatement2 = connection.prepareStatement(ADD_TO_ROOM_HISTORY)){
			preparedStatement1.setString(1, reservation.getOccupants());
			preparedStatement1.setString(2, reservation.getCheckin());
			preparedStatement1.setString(3, reservation.getCheckout());
			preparedStatement1.setString(4, reservation.getID());
			preparedStatement1.setFloat(5, reservation.getPrice());
			
			
			preparedStatement2.setString(1, reservation.getRoomNumber());
			preparedStatement2.setString(2, reservation.getRoomType());
			preparedStatement2.setString(3, reservation.getHotel());
			preparedStatement2.setString(4, reservation.getID());
			preparedStatement2.setString(5, reservation.getOccupants());
			
			preparedStatement1.executeUpdate();
			preparedStatement2.executeUpdate();
			
		}catch (SQLException e) {
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
