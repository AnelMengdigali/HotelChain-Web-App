<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.first_sprint.swe.Reservation" %>
<%@ page import="java.sql.*" %>

<%String SELECT_RESERVATION_BY_USR = "SELECT * FROM RESERVATION WHERE GuestID = ?"; %>
<%String SELECT_RESERVATION2_BY_USR = "SELECT * FROM ROOM_has_RESERVATION WHERE GuestID = ?"; %>
<%String SELECT_HOTELNAME_BY_HOTELID = "SELECT name FROM HOTEL WHERE HotelID = ?";%>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Desk Clerk Management</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin=" anonymous"></script>
<style>
		.booking {
    width: 100%;
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0px -3px 0px rgba(147, 147, 170, 0.9) inset;
    display: flex;
    min-height: 40px;
    padding: 10px;
    align-items: center;
    margin: 15px;
    color: white;
}

.booking h3,
.booking p {
    padding: 15px;
    font-weight: 700;
}

.booking h3 {
    width: 30%;
}

.booking p {
    width: 20%;
}

.booking button{
    width: 30%;
    background-color: rgba(101, 101, 228, 0.9);
    color: white;
    border: 2px solid transparent;
    font-family: "poppins", sans-serif;
    font-weight: 600;
    cursor: pointer;
    margin: 10px;
    min-height: 50px;
    font-size: 1.2rem;
    transition: all .3s ease-in-out;
}

.booking button:hover {
    background-color: #fff;
    color: rgba(101, 101, 228, 0.9);
    border-color: rgba(101, 101, 228, 0.9);
}
#guestID {
text-align: center;
}
.nav {
	display: flex;
	justify-content: flex-end;
	width: 100%;
	
}
.nav .logo {
	flex: 6;
}
.nav ul {
background-color: rgba(101, 101, 228, 0.4);
border-radius: 2px;
flex: 1;
}



</style>
</head>

<body>

	<section class="rooms" id="services">
        <div class="container">
        <nav class="nav">
                   <a href="index.jsp" class="logo">
                       
                    </a> 
                    <ul class="nav-list">
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-link">Home</a>
                        </li>
                        <li class="nav-item">
                        	<a href="advertisement.jsp" class="nav-link">Offers</a>
                    	</li>
                    </ul>
                </nav>
            <h5 class="section-head">
                <span class="heading">Desk Clerk Management</span>
            </h5>
        </div>
    </section>
	<section class="booking" id="reser">
		<div class="container">
			<form action="" class="book-form">
				<div class="input-group">
					<label for="destination" class="input-label">Guest ID</label>
					<input type="text" class="input" name = "guest" id="guestId">
				</div>
				<input type="submit" class="btn form-btn btn-purple" value="Search">
					<span class="dots"><i class="fas fa-ellipsis-h"></i></span>
				
				<button type="button" onclick="window.location.href='reserveRoom.html'" class="btn form-btn btn-purple">Create Booking
					<span class="dots"><i class="fas fa-ellipsis-h"></i></span>
				</button>
			</form>
		</div>

	</section>
	<%	String jdbcURL = "jdbc:mysql://localhost:3306/mydb";
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
		ArrayList<Reservation> reservation = new ArrayList<Reservation>();
		PreparedStatement preparedStatement1 = connect.prepareStatement(SELECT_RESERVATION_BY_USR);
		PreparedStatement preparedStatement2 = connect.prepareStatement(SELECT_RESERVATION2_BY_USR);
		PreparedStatement preparedStatement3 = connect.prepareStatement(SELECT_HOTELNAME_BY_HOTELID);
		preparedStatement1.setString(1, request.getParameter("guest"));
		preparedStatement2.setString(1, request.getParameter("guest"));

		ResultSet rs1 = preparedStatement1.executeQuery();
		ResultSet rs2 = preparedStatement2.executeQuery();

		String checkin = "";
		String checkout = "";
		String id = "";
		String hotel = "";
		String room_type = "";

		while(rs1.next()) {
			rs2.next();
			checkin = rs1.getString("checkin");
			checkout = rs1.getString("checkout");
			id = rs1.getString("ReservationID");
			preparedStatement3.setString(1, rs2.getString("HotelID"));
			ResultSet rs3 = preparedStatement3.executeQuery();
			rs3.next();
			hotel = rs3.getString("name");
			room_type = rs2.getString("room_type_name");
			reservation.add(new Reservation(checkin, checkout, id, hotel, room_type));
		}
	%>
	<div class="profile-booking tab" id = "BookingsDiv">
		<h1 id="guestID"><% if (request.getParameter("guest") != null) {out.print("ID: " + request.getParameter("guest"));}  %></h1>
		<%for(Reservation rsrv : reservation){%>
		<div id="<%=rsrv.getID()%>" class="booking">
			<h3><%=rsrv.getHotel()%> </h3>
			<p><%=rsrv.getRoomType()%></p>
			<p><%=rsrv.getCheckin()%> <br><%=rsrv.getCheckout()%></p>
			<button id="<%=rsrv.getID() %>" onclick="removeB(id)">Delete Booking</button>
		</div>
		<%}%>
	</div>
    <script src="deskclerk.js"></script>
    
<ul id="my-list"></ul>
</body>
</html>