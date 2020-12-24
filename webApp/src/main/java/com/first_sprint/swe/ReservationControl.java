package com.first_sprint.swe;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class ReservationControl {
	private UserManager userManager;
	
	private static final String GET_ROOMS = "select room_number, floor, T.price, R.room_type_name, R.HotelID \n" + 
			"from ROOM R join \n" + 
			"(select RT.name as name, RT.room_price as price \n" + 
			"from HOTEL H \n" + 
			"join ROOM_TYPE RT \n" + 
			"on RT.HotelID = H.HotelID and H.HotelID = ? and RT.capacity >= ? and RT.name = ?) T\n" + 
			"on R.HotelID = ? and R.room_type_name = T.name and room_number not in\n" + 
			"(select room_number\n" + 
			"from RESERVATION R join ROOM_has_RESERVATION RR\n" + 
			"on R.ReservationID = RR.ReservationID and HotelID = ? and \n" + 
			"((? <= checkout and ? >= checkin) or \n" + 
			"    (? >= checkin and ? <= checkout)or \n" + 
			"    (? < checkin and ? > checkout))) ;\n" + 
			"";
			
		public ReservationControl() {
		userManager = new UserManager();
	}
	
	public ArrayList<Room> getRooms(int hotelID, String inD, String type, String outD, int residents) {
		ArrayList<Room> rooms = new ArrayList<Room>();
		long days = 1;
		try {
		days = diff(outD, inD);
		} catch(Exception e) {
			e.printStackTrace();
		}
		try(Connection connection = userManager.getConnection();
			PreparedStatement preparedStatement1 = connection.prepareStatement(GET_ROOMS)){
			preparedStatement1.setInt(1, hotelID);
			preparedStatement1.setInt(2, residents);
			preparedStatement1.setString(3, type);
			preparedStatement1.setInt(4, hotelID);
			preparedStatement1.setInt(5, hotelID);
			preparedStatement1.setString(6, inD);
			preparedStatement1.setString(7, inD);
			preparedStatement1.setString(8, outD);
			preparedStatement1.setString(9, outD);
			preparedStatement1.setString(10, inD);
			preparedStatement1.setString(11, outD);
			
			ResultSet rs = preparedStatement1.executeQuery();
			while(rs.next()) {
				rooms.add(new Room(rs.getInt("room_number"),
				rs.getInt("floor"),
				rs.getString("room_type_name"),
				rs.getInt("HotelID"), days*rs.getFloat("price")));
			}
		    					
		}catch (SQLException e) {
			printSQLException(e);
		}
		return rooms;
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
	private long diff(String out, String in) throws ParseException {
				 
				    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
				    Date firstDate = sdf.parse(in);
				    Date secondDate = sdf.parse(out);
				 
				    long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
				    long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
				 
				    return diff;
				}
	
}
