<!DOCTYPE>
<%@page import="java.util.ArrayList"%>
<%@page import="com.first_sprint.swe.EmployeeManager"%>
<%@page import="com.first_sprint.swe.Employee"%>
<%@page import="com.first_sprint.swe.Season"%>
<%@page import="java.sql.*"%>

<%String SELECT_SEASON_BY_HOTEL = "SELECT * FROM SEASON"; %>

<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SpecialOffersAdvertisement</title>
</head>

<style>
   * {
		margin: 0;
 		padding: 0;
 		box-sizing: border-box;
 		font-family: sans-serif; 
   }
   h1{
   		text-align: center; 
   		color: #E54848; 
   		background-color: transparent;
   		font-weight: 600; 
   		padding: 10px 0px;
   		height: 50px;
   }  
   table {
   		position: absolute;
   		border-collapse: collapse;
 		border-spacing: 0;
 		border: 1px solid #bdc3c7;
		width: 100%;
		margin: 5px;
		font-family: sans-serif;
		background: transparent;
		padding: 10px 0;
		color: #555;
		font-size: 13px;
		box-shadow: 0 1px 4px 0 rgba(0, 0, 50, 0.3);
   }    
   table td{
		padding: 12px;
 		text-align: left;
 		border-bottom: 1px solid #ddd;
   }
   table th{
		padding: 12px;
 		text-align: left;
 		border-bottom: 1px solid #ddd;
	}
	#header {
   		background-color: #E54848;
 		color: #fff;	
   }
   .home {
   position: fixed;
   top: 20px;
   left: 10px;
   background: #0000ff;
   color: #fff;
   border: none;
   outline: none;
   padding: 4px;
   border-radius: 3px;
   cursor: pointer;
   font-weight: 600;}
</style>

<body>
<% String jdbcURL = "jdbc:mysql://localhost:3306/mydb";
		String jdbcUsername = "root";
		String jdbcPassword = "Mohikohhi12m$";
		Connection connect = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connect = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Season> seasons = new ArrayList<Season>();

		Statement st = connect.createStatement();
		ResultSet rs = st.executeQuery(SELECT_SEASON_BY_HOTEL);
		
		String name = "";
		String start_date = "";
		String end_date = "";
		String coefficient_weekend = "";
		String coefficient_working = "";
		String HotelID = "";
		while(rs.next()) {
			name = rs.getString("name");
			start_date = rs.getString("start_date");
			end_date = rs.getString("end_date");
			java.sql.Date time = rs.getDate("end_date");
			java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
    		if (date.after(time)) {
				
				continue;
			}
			coefficient_weekend = rs.getString("week_day");
			if (Float.parseFloat(coefficient_weekend) - 1 <= 0) {continue;}
			coefficient_working = rs.getString("working_day");
			HotelID = rs.getString("HotelID");
			
			seasons.add(new Season(name, start_date, end_date, coefficient_weekend, coefficient_working, HotelID));
		}
%> 
	<div>
		<button class="home" onclick="window.location.href = 'index.jsp'">BACK</button>
		<h1>SPECIAL OFFERS</h1>
		<table id="table">
			<tr id="header">
				<th>Location</th>
				<th>Season Name</th>
				<th>Discount</th>
				<th>Start-Date</th>
				<th>End-Date</th>				
			</tr>
			<% for (Season season: seasons) { %>
			<tr>
				<td><% String id = season.getHotelID();
					
					if (id.equals("1")) {out.print("Bali Resort");}
					else if (id.equals("2")) {out.print("Almaty Resort");}
					else {out.print("Dubai Resort");} %></td>
				<td><%= season.getName() %></td>
				<td><% String coef = season.getCoefficientWorking();
						
						out.print(Math.round((Float.parseFloat(coef) - 1)*100) + "%");
				 %></td>
				<td><%= season.getStartdate() %></td>
				<td><%= season.getEnddate() %></td>
			</tr>
			<% } %>
		</table>					
	</div>
</body>
</html>