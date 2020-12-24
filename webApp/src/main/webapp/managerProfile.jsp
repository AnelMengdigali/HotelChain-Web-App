<!DOCTYPE jsp>
<%@page import="java.util.ArrayList"%>
<%@page import="com.first_sprint.swe.EmployeeManager"%>
<%@page import="com.first_sprint.swe.Employee"%>
<%@page import="com.first_sprint.swe.Season"%>
<%@page import="java.sql.*"%>


<%String SELECT_SEASON_BY_HOTEL = "SELECT * FROM SEASON WHERE HotelID = ?";%>

<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0" />
    <title>ManagerProfilePage</title>
    <link rel=" stylesheet" href="./managerProfile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin=" anonymous"></script>
<style>
.linkHome {
	padding: 5px;
	text-decoration: none;
	background-color: #000;
	color: #fff;
	font-weight: 400;
	border-radius: 2px;
	position: fixed;
	bottom: 5px;
	left: 50%;
}

</style>
</head>
<html xmlns="http://www.w3.org/1999/xhtml">

<%String jdbcURL = "jdbc:mysql://localhost:3306/mydb";
		String jdbcUsername = "root";
		String jdbcPassword = "Mohikohhi12m$";
		Connection connect = null;
		Employee manager = (Employee)request.getAttribute("managerProfile");
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
		PreparedStatement preparedStatement1 = connect.prepareStatement(SELECT_SEASON_BY_HOTEL);
		preparedStatement1.setInt(1, manager.getHotelID());
		ResultSet rs = preparedStatement1.executeQuery();
		
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
			coefficient_weekend = rs.getString("week_day");
			coefficient_working = rs.getString("working_day");
			HotelID = rs.getString("HotelID");
			seasons.add(new Season(name, start_date, end_date, coefficient_weekend, coefficient_working, HotelID));
		}
%>  
             
<body>
    <div class="container">
        <div class="profile-header">
            <div class="profile-nav-info">
                <h3 class="username"><%=manager.getName()%></h3>
                <div class="address">
                    <p id="hotel" class="hotel">Hotel ID : <%=manager.getHotelID()%></p>
                </div>
            </div>
        </div>
        <div class="main-bd">
            <div class="right-side">
                <div class="nav">
                    <ul>
                        <li onclick="tabs(0)" class="manager-employeeManage">Employee Schedule</li>
                        <li onclick="tabs(1)" class="manager-seasonManage">Manage Season Rate</li>
                        <li onclick="tabs(2)" class="manager-seasonCreate">Create Season Rate</li>
                    </ul>
                </div>
                <div class="profile-body">
                	<!-- employee schedule part: -->
                	<a href="index.jsp" class="linkHome">Go back</a>
                    <div class="profile-employeeManager tab">
                    	<%EmployeeManager employeeManager = new EmployeeManager();
						ArrayList<Employee> employees = employeeManager.getAllEmployees(manager.getEmployeeID());%>
                    	<table>
	                        <tr>
	                            <th>ID</th>
	                            <th>Job Title</th>
	                            <th>Name</th>
	                            <th>Surname</th>
	                        </tr>
                            <%for(Employee employee : employees){%>
                            <tr id="<%=employee.getEmployeeID()%>" onclick="manageEmployee(<%=employee.getEmployeeID()%>)">
                                <td><%=employee.getEmployeeID()%></td>
                                <td><%=employee.getJobTitle()%></td>
                                <td><%=employee.getName()%></td>
                                <td><%=employee.getSurname()%></td>
                            </tr>
                            <%}%>
                    	</table>
	                    
	                    <script src="manager.js"></script>
                    </div>
                    
                   <!--  seasons part: -->
                    <div class="profile-seasonManager tab">                        
                        <h1>Manager Seasons Rate Management</h1>
						<table id="table" border="1">
							<tr id="header">
								<th>Name</th>
								<th>Weekend Coefficient</th>
								<th>Working days Coefficient</th>
								<th>Start-Date</th>
								<th>End-Date</th>
								<th>Delete</th>
							</tr>		
							<%for(Season sesn : seasons){%>
							<tr>
								<td><%=sesn.getName()%></td>
								<td><%=sesn.getCoefficientWeekEnd()%></td>
								<td><%=sesn.getCoefficientWorking()%></td>
								<td><%=sesn.getStartdate()%></td>
								<td><%=sesn.getEnddate()%></td>		
								<td><button class="button" onclick="removeS('<%=sesn.getHotelID()%>', '<%=sesn.getName()%>')" id="id">Remove</button></td>
							</tr>
							<%}%>
						</table> 
	   					<script src="managerSeasons.js"></script>
                    </div>
                    
                    <div class="profile-seasonCreate tab">                        
                        <form id="addSeasonForm">
							<h1>Seasons Rate Creation</h1>
							 <input type="hidden" value="<%=manager.getEmployeeID()%>" name="employeeID">
							<div>
								<label for="name">Name</label>
								<input type="text" name="name" id="name" placeholder="Name" required>
							</div>
							<div>
								 <label for="coeff1">Coefficient of working days</label>
								 <input type="number" name="coeff1" id="coeff1" min="0" step="0.01" placeholder="Coefficient" required>
							</div>
							<div>
								 <label for="coeff2">Coefficient of week days</label>
								 <input type="number" name="coeff2" id="coeff2" min="0" step="0.01" placeholder="Coefficient" required>
							</div>
							<div>
								 <label for="start-date">Start-Date</label>
								 <input type="date" id="start-date" name="start-date"  value="" required> 
								 <span class="validity"></span>
							</div>
							<div>
								 <label for="end-date">End-Date</label>
								 <input type="date" id="end-date" name="end-date" value="" required> 
								 <span class="validity"></span>
							</div>
							<div>
								<button type="reset">Reset</button>
								<button type="button" onclick="addSeason()">Submit</button>
							</div>
						</form>
                    </div> 
                                      
                </div>
            </div>           
        </div>
    </div>
<script>
const tab = document.querySelectorAll('.tab');
function tabs(panelIndex) {
    tab.forEach(function(node) {
        node.style.display = 'none';
    });
    tab[panelIndex].style.display = 'block';
}
tabs(0);
function addSeason(){
	var coeff1 = document.getElementById("coeff1").value;
	var coeff2 = document.getElementById("coeff2").value;
	var name = document.getElementById("name").value;
	var start_date = document.getElementById("start-date").value;
	var end_date = document.getElementById("end-date").value;
	$.ajax({
        url: 'addSeason?name=' + name + '&start-date=' + start_date + '&end-date=' + end_date + '&coeff1=' + coeff1 + '&coeff2=' + coeff2 + '&hotelID=' + <%=manager.getHotelID()%>,
    }).done(function(){
     	location.reload();
    })
}
</script>
</body>
</html>