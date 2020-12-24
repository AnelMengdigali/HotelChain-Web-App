<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.first_sprint.swe.Reservation" %>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Receipt</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin=" anonymous"></script>
<style>
body {
margin: 0;
background-color: #ccc;
}
nav {
display: flex;
background: #000;
color: #fff;
width: 100%;
padding: 10px;
justify-content: space-around;

}
nav a {
	color: #fff;
	text-decoration: none;
}
main {
display: flex;
align-items: center;
min-height: 80vh;
width: 40%;
margin: 10px auto;
justify-content: center;
background-color: #fff;
border-radius: 10px;
box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);

}
.entry {
	display: flex;
	width: 100%;
	align-items: center;
	
}
.entry p {
	font-weight: 600;
	flex: 1;
}
.entry span {
	flex: 1
	
}
.buttons {
	display: flex;
	width: 100%;
}

.buttons button {
	background: #000;
	color: #fff;
	border-radius: 6px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
	padding: 3px;
	margin: 3px;
	flex: 1;
}
h1 {
text-align: center;
font-weight: 400;
}

</style>
</head>

<body>
<% Reservation reservation = (Reservation)request.getAttribute("reservation");%>
	<nav>
                            <a href="index.jsp" class="nav-link">Home</a>
                        	<a href="advertisement.jsp" class="nav-link">Offers</a>
 </nav>
 <main>

<div class="receipt">
<h1>Receipt</h1>
<div class="entry">

			<p>Guest: </p><span><% if (session.getAttribute("username") == null) {out.print(reservation.getID());} else {out.print(session.getAttribute("username"));} %></span></div>
	<div class="entry">	<p>Room Type: </p><span><%=reservation.getRoomType()%></span></div>
		<div class="entry">	<p>Dates: </p><span><%=reservation.getCheckin()%>   <%=reservation.getCheckout()%></span></div>
		<div class="entry"><p>Hotel: </p><span><%=reservation.getHotel() %></span></div>
		<div class="entry"><p>Occupants: </p><span><%=reservation.getOccupants() %></span></div>
	<div class="entry"><p>Price: </p><span>$<%=reservation.getPrice() %></span></div>
	<div class="buttons">
	<button onclick="window.location.href='index.jsp'">OK</button>
	<button onclick = "window.print()">Print</button>
	</div>
</div>
</main>
</body>
</html>