<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.ArrayList"%>
    <%@ page import="com.first_sprint.swe.Reservation" %>
        <%@ page import="com.first_sprint.swe.User" %>
            <html xmlns="http://www.w3.org/1999/xhtml">

            <head>
                <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0" />
                <title>Profile Page</title>
                <link rel=" stylesheet" href="./profile.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
                <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin=" anonymous"></script>
            </head>

            <body>
                <%User user = (User)request.getAttribute("profile");%>
                    <div class="container">

                        <div class="profile-header">
                            <div class="profile-img">
                                <img src="./avatar.png" width="200px" alt="avatar">
                            </div>
                            <div class="profile-nav-info">
                                <h3 class="user-name">
                                    <%= user.getNickname()  %>
                                </h3>
                                <div class="address">
                                    <p id="state" class="state">
                                        <% if (user.getCity() != null) {
                out.print(user.getCity() + ", ");}%>
                                    </p>
                                    <span id="country" class="country"> <% if (user.getCountry() != null) {
            out.print(user.getCountry());}%>
        </span>
                                </div>
                                <div class="adv">
                                    <button class="browse" onclick="window.location.href='index.jsp'">Browse</button>
                                    <button class="advisories" onclick="window.location.href='advertisement.jsp'">Special Offers!</button>
                                </div>


                            </div>
                        </div>
                        <div class="main-bd">
                            <div class="left-side">
                                <div class="profile-side">

                                    <p id="name" class="user-mail">
                                        <% if (user.getName() != null) {
            out.print(user.getName());}%>
                                            <% if (user.getSurname() != null) {
            out.print(user.getSurname());}%>
                                    </p>
                                    <p id="mobile" class="mobile-no">
                                        <% if (user.getMobilePhone() != null) {
            out.print("<i class='fa fa-phone'></i> " + user.getMobilePhone());}%>
                                    </p>
                                    <div class="profile-btn">
                                        <button class="createbtn" onclick='tabs(1)'>Edit</button>
                                        <button class="createbtn" onclick="window.location.href= 'logout'">Log Out</button>


                                    </div>
                                </div>
                            </div>
                            <div class="right-side">
                                <div class="nav">
                                    <ul>
                                        <li onclick="tabs(0)" class="user-booking">Bookings</li>
                                        <li onclick="tabs(1)" class="user-settings">Settings</li>
                                    </ul>
                                </div>
                                <div class="profile-body">
                                    <div class="profile-booking tab">
                                        <h1>Your Bookings</h1>
                                        <%ArrayList<Reservation> reservations =  (ArrayList<Reservation>)user.getReservations();
            if (reservations != null) {
                for(Reservation rsrv : reservations){%>
                                            <div id="<%=rsrv.getID() %>" class="booking">
                                                <h3>
                                                    <%=rsrv.getHotel()%>
                                                </h3>
                                                <p>
                                                    <%=rsrv.getRoomType()%>
                                                </p>
                                                <p>
                                                    <%=rsrv.getCheckin()%> <br>
                                                        <%=rsrv.getCheckout()%>
                                                </p>
                                                <button id="<%=rsrv.getID() %>" onclick="removeB(id)">Delete Booking</button>
                                            </div>
                                            <%}}%>
                                    </div>
                                    <div class="profile-settings tab">
                                        <h1>Edit Profile</h1>
                                        <div class="regform">
                                            <div class="mane">
                                                <form id="form" action="edit" method="post">
                                                    <div id="name">
                                                        <h2 class="name">Name</h2>
                                                        <input class="firstname" type="text" name="nickname" value="<%=user.getNickname()%>" style="display:none;">
                                                        <input class="firstname" type="text" name="first_name" placeholder="First Name" id="nameInput" pattern="[a-zA-Z0-9]{1,}" title="Only alphanumeric characters" required>
                                                        <input type="text" class="lastname" name="last_name" placeholder="Last Name" id="lastnameInput" pattern="[a-zA-Z0-9]{1,}" title="Only alphanumeric characters" required>
                                                    </div>
                                                    <div class="id">
                                                        <h2 class="name">Identification</h2><br>
                                                        <select class="option" id="idtype" name="idtype">
                            <option value="passport">Passport</option>
                            <option value="id">ID</option>
                        </select>
                                                        <input type="text" name="idnumber" class="idnumber" placeholder="Enter Number" id="idInput" pattern="[0-9]{8,9}" title="Eight or nine numeric only characters" required>
                                                    </div>
                                                    <div class="category">
                                                        <h2 class="name">Choose category</h2><br>
                                                        <select class="option" id="category" name="category">
                            <option value="general">General</option>
                            <option value="VIP">VIP</option>
                            <option value="government">government</option>
                            <option value="military">military</option>
                        </select>
                                                    </div>
                                                    <div class="address">
                                                        <h2 class="name">Address</h2>
                                                        <input type="text" name="country" id="country" placeholder="Country" pattern="[a-zA-Z]{2}" title="Only 2 alphabet characters" required>
                                                        <input type="text" name="city" id="city" placeholder="City" pattern="[a-zA-Z]{1,}" title="Only alphabet characters" required>
                                                        <input type="text" name="street" id="street" placeholder="Street" pattern="[a-zA-Z0-9 ]+" title="Only alphanumeric characters and space" required>
                                                    </div>
                                                    <div class="phone">
                                                        <h2 class="name">Phone Number</h2>
                                                        <input type="tel" name="home" id="home" placeholder="Home Phone: 87081112233" pattern="[0-9]{11}" title="Only 11 numbers" required>
                                                        <input type="tel" name="mobile" id="mobile" placeholder="Mobile Phone: 87081112233" pattern="[0-9]{11}" title="Only 11 numbers" required>
                                                    </div>
                                                    <button>Save</button>
                                                    <button class="clear">Clear</button>
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </body>
            <script src="./profile.js"></script>

            </html>