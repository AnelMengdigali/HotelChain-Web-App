package com.first_sprint.swe;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
//import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class UserManager {
	private String jdbcURL = "jdbc:mysql://localhost:3306/mydb";
	private String jdbcUsername = "root";
	private String jdbcPassword = "Mohikohhi12m$";
	
	private static final String INSERT_USERS_SQL = "INSERT INTO GUEST (username, password, category) VALUES (?, ?, ?);";
	private static final String SELECT_DATA_BY_USR = "select GuestID, username, mobile_phone, country, name, surname, city from GUEST where username = ?";
	private static final String SELECT_RESERVATION_BY_USR = "SELECT * FROM RESERVATION WHERE GuestID = ?";
	private static final String SELECT_RESERVATION2_BY_USR = "SELECT * FROM ROOM_has_RESERVATION WHERE GuestID = ?";
	private static final String SELECT_HOTELNAME_BY_HOTELID = "SELECT name FROM HOTEL WHERE HotelID = ?";
	private static final String FIND_USERNAME = "select count(*) from GUEST where username = ?";
	private static final String CHECK_PASSWORD = "select count(*) from GUEST where username = ? and password = ?";
	private static final String EDIT_USER = "update GUEST "
			+ "set name = ?, surname = ?, IDType = ?, IDNumber = ?,  country = ?, city = ?, street = ?, home_phone = ?, mobile_phone = ?,  category = ? "
			+ "where username = ?;";
	private static final String FIND_ID = "select max(GuestID) as id from GUEST";
	public UserManager() {
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
	
	public User insertUser(User user) throws SQLException {
		
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getNickname());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getCategory());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(FIND_ID)) {
			
			
			ResultSet rs = preparedStatement.executeQuery();
			rs.next();
			user.setID(rs.getString("id"));
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}
	
	
	public User getInfo(User user) throws SQLException {
		User retUser = null;
		
		// try-with-resource statement will auto close the connection.
		String username = "";
		String mobile_phone = "";
		String country = "";
		String city = "";
		String name = "";
		String surname = "";
		String guestID = "";
		ArrayList<Reservation> reservation = new ArrayList<Reservation>();
		
		String checkin = "";
		String checkout = "";
		String id = "";
		String hotel = "";
		String room_type = "";
		
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DATA_BY_USR);
						PreparedStatement preparedStatement2 = connection.prepareStatement(SELECT_RESERVATION_BY_USR);
								PreparedStatement preparedStatement3 = connection.prepareStatement(SELECT_RESERVATION2_BY_USR);
									PreparedStatement preparedStatement4 = connection.prepareStatement(SELECT_HOTELNAME_BY_HOTELID)) {
			preparedStatement.setString(1, user.getNickname());
			
			
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				username = rs.getString("username");
				mobile_phone = rs.getString("mobile_phone");
				country = rs.getString("country");
				city = rs.getString("city");
				name = rs.getString("name");
				surname = rs.getString("surname");
				guestID = rs.getString("GuestID");
			}
			
			preparedStatement2.setString(1, guestID);
			ResultSet rs2 = preparedStatement2.executeQuery();
			preparedStatement3.setString(1, guestID);
			ResultSet rs3 = preparedStatement3.executeQuery();
			while(rs2.next()) {
				rs3.next();
				checkin = rs2.getString("checkin");
				checkout = rs2.getString("checkout");
				id = rs2.getString("ReservationID");
				preparedStatement4.setString(1, rs3.getString("HotelID"));
				ResultSet rs4 = preparedStatement4.executeQuery();
				rs4.next();
				hotel = rs4.getString("name");
				room_type = rs3.getString("room_type_name");
				reservation.add(new Reservation(checkin, checkout, id, hotel, room_type));
			}
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		retUser = new User(username, name, surname, city, country, mobile_phone, reservation);
		retUser.setID(guestID);
		return retUser;
	}
	
	public boolean checkUsername(String usr) throws SQLException {
		
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(FIND_USERNAME)) {
			preparedStatement.setString(1, usr);
			
			ResultSet rs = preparedStatement.executeQuery();
			rs.next();
		    int rowCount = rs.getInt(1);
		    if (rowCount >= 1) {
		    	return true;
		    }
		} catch (SQLException e) {
			printSQLException(e);
		}
		return false;
	}
	public boolean checkPassword(String usr, String pass) throws SQLException {
		
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(CHECK_PASSWORD)) {
			preparedStatement.setString(1, usr);
			preparedStatement.setString(2, pass);
			
			ResultSet rs = preparedStatement.executeQuery();
			rs.next();
		    int rowCount = rs.getInt(1);
		    if (rowCount >= 1) {
		    	return true;
		    }
		} catch (SQLException e) {
			printSQLException(e);
		}
		return false;
	}
	
	public void editUser(User user) throws SQLException {
		
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(EDIT_USER)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getSurname());
			preparedStatement.setString(3, user.getIdtype());
			preparedStatement.setString(4, user.getIdnumber());
			preparedStatement.setString(5, user.getCountry());
			preparedStatement.setString(6, user.getCity());
			preparedStatement.setString(7, user.getStreet());
			preparedStatement.setString(8, user.getHomePhone());
			preparedStatement.setString(9, user.getMobilePhone());
			preparedStatement.setString(10, user.getCategory());
			preparedStatement.setString(11, user.getNickname());
			
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
