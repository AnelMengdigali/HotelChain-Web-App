package com.first_sprint.swe;

import java.io.IOException;


import javax.servlet.http.*;
import java.util.ArrayList;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;  
import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
@WebServlet({"/register", "/checkUsername", "/edit", "/deleteBooking", "/employee",
	"/editEmployee", "/addSeason", "/deleteSeason", "/logout", "/checkManager", "/managerLog",
	"/findRooms", "/createReservation"})
public class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserManager userManager;
    private ReservationManager reservationManager;
    private EmployeeManager employeeManager;
    private ManagerControl managerControl;
    private ReservationControl reservationControl;
    private Gson gson = new Gson();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        userManager = new UserManager();
        reservationManager = new ReservationManager();
         employeeManager = new EmployeeManager();
         managerControl = new ManagerControl();
         reservationControl = new ReservationControl();
      
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String path = request.getServletPath();
    	
    	try {
    		switch (path) {
    			case "/register":
    				registerHandle(request, response);
    				break;
    			case "/deleteBooking":
    				removeReservation(request, response);
    			case "/checkUsername":
    				checkUsername(request, response);
    				break;
    			case "/edit": 
    				editUser(request, response);
    				break;
    			case "/employee":
    				getEmployeeInfo(request, response);
    				break;
    			case "/editEmployee":
    				editEmployee(request, response);
    				break;
    			case "/deleteSeason":
    				deleteSeason(request, response);
    				break;
    			case "/addSeason":
    				addSeason(request, response);
    				break;
    			case "/logout":
    				logout(request, response);
    				break;
    			case "/checkManager":
    				checkManagerLog(request, response);
    				break;
    			case "/managerLog":
    				managerLogin(request, response);
    				break;
    			case "/findRooms":
    				findRooms(request, response);
    				break;
    			case "/createReservation":
    				createReservation(request, response);
    				break;
    			default:
    				def(request, response);
    				break;
    		}
    	} catch (SQLException ex) {
			throw new ServletException(ex);
		}
        
    	
    }
    private void def(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
		
	}
    private void deleteSeason(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
    	String seasonName = request.getParameter("ses");
    	String hotelID = request.getParameter("hotel");
    	managerControl.removeSeason(seasonName, hotelID);
    }
    private void addSeason(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
    	Season season = new Season(request.getParameter("name"), request.getParameter("start-date"), 
    			request.getParameter("end-date"), request.getParameter("coeff1"), request.getParameter("coeff2"), request.getParameter("hotelID"));
    	managerControl.insertSeason(season);
    	
    }
    private void registerHandle(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
    	
    	response.setContentType("text/html");
        User user = new User(request.getParameter("usr"));
        String isLog = request.getParameter("login");
        try {
       if (isLog.equals("1")) {
    		user = userManager.getInfo(user);
       } else { 
    	   user.setPassword(request.getParameter("psw"));
    	   user.setCategory("general");
    	   user = userManager.insertUser(user);
	    }
       
       HttpSession session=request.getSession(); 
       session.setAttribute("username", user.getNickname());
       session.setAttribute("id", user.getID());
       //max interval of inactivity = 20 minutes
       session.setMaxInactiveInterval(1200000);
       RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
       request.setAttribute("profile", user);
	   rd.forward(request, response);
      
       }
	    catch (Exception e) {
	        e.printStackTrace();
	    }
        
    }
    
    private void removeReservation(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
    	String res = request.getParameter("res");
    	
    	reservationManager.remove(res);	
    }

    
    //----------------------------------------------------------------------------------------------------------------\\
    private void checkUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	Answer an = new Answer();
    	String usr = request.getParameter("usr");
    	String pass = " ";
    	
    	if (request.getParameterMap().containsKey("pass")) 
    		pass = request.getParameter("pass");
    	
    	PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
    	
		try {
			if(pass.equals(" ") && userManager.checkUsername(usr) || !pass.equals(" ") &&  userManager.checkPassword(usr, pass)) {
				an.setAnswer("true");
				} else {
					an.setAnswer("false");	
				}
			out.append(gson.toJson(an));
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	response.setContentType("text/html");
        User user = new User(request.getParameter("nickname"), 
        	
        		request.getParameter("first_name"),
        		request.getParameter("last_name"),
        		request.getParameter("idtype"),
        		request.getParameter("idnumber"),
        		request.getParameter("country"),
        		request.getParameter("city"),
        		
        		request.getParameter("street"),
        		request.getParameter("mobile"),
        		request.getParameter("home"),
        		request.getParameter("category")
        		);
        try {
        	userManager.editUser(user);
        	user = userManager.getInfo(user);
        	RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            request.setAttribute("profile", user);
     	   rd.forward(request, response);
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }
    private void getEmployeeInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	response.setContentType("text/html");
    	int id  = Integer.parseInt(request.getParameter("id"));
    	Employee employee = employeeManager.getFullInfo(id);
    	RequestDispatcher rd = request.getRequestDispatcher("employee.jsp");
    	request.setAttribute("employee", employee);
 	   rd.forward(request, response);
 	   
    }
    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	response.setContentType("text/html");
    	Employee employee = new Employee();
    	employee.setEmployeeID(Integer.parseInt(request.getParameter("id")));
    	employee.setSalaryPerHour(Integer.parseInt(request.getParameter("salary")));
    	boolean monday = true, tuesday = true, wednesday = true, thursday = true, friday = true, saturday = true, sunday = true;
    	
    	
    	if (request.getParameter("monday")== null)  {
    		monday = false;
    	} 
    	if (request.getParameter("tuesday")== null)  {
    		tuesday = false;
    	} if (request.getParameter("wednesday")== null)  {
    		wednesday = false;
    	} if (request.getParameter("thursday")== null)  {
    		thursday = false;
    	} if (request.getParameter("friday")== null)  {
    		friday = false;
    	} if (request.getParameter("saturday") == null)  {
    		saturday = false;
    	} if (request.getParameter("sunday") == null)  {
    		sunday = false;
    	} 
    	employee.setMonday(monday);
    	employee.setTuesday(tuesday);
    	employee.setWednesday(wednesday);
    	employee.setThursday(thursday);
    	employee.setThursday(thursday);
    	employee.setFriday(friday);
    	employee.setSaturday(saturday);
    	employee.setSunday(sunday);
    	employee.setFromTime(request.getParameter("fromTime"));
    	employee.setToTime(request.getParameter("toTime"));
    	employeeManager.editEmployee(employee);
    	Employee manager = managerControl.getInfo(employeeManager.getManagerID(request.getParameter("id")));
    	RequestDispatcher rd = request.getRequestDispatcher("managerProfile.jsp");
    	request.setAttribute("managerProfile", manager);
 	   	rd.forward(request, response);
    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	//finish session
    	try { 
    		HttpSession session = request.getSession();
    		session.invalidate();
            response.sendRedirect("index.jsp");
        } catch(Exception e) {
        	e.printStackTrace();
        }
    }
    private void checkManagerLog(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
    	Answer an = new Answer();
    	String usr = request.getParameter("usr");
    	String pass = request.getParameter("pass");
   
    	PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        if(managerControl.checkLog(usr, pass)) {
        	an.setAnswer("true");
        } else {
        	an.setAnswer("false");
        }
        out.append(gson.toJson(an));
    }
    
    private void managerLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
    	response.setContentType("text/html");
    	Employee manager;
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	manager = managerControl.getInfo(username, password);
    	RequestDispatcher rd = request.getRequestDispatcher("managerProfile.jsp");
        request.setAttribute("managerProfile", manager);
 	   	rd.forward(request, response);
    }
    private void findRooms(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    	//hotelID, type, inD, outD, residents
    	int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    	
    	String inD = request.getParameter("inD");
    	
    	String type = request.getParameter("type");
    	
    	String outD = request.getParameter("outD");
    	
    	int residents = Integer.parseInt(request.getParameter("residents"));
    	
    	ArrayList<Room> rooms = reservationControl.getRooms(hotelID, inD, type, outD, residents);
    	
    	PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
    	
		try {
			out.append(gson.toJson(rooms));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    private void createReservation(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
    	response.setContentType("text/html");
    	String id = request.getParameter("guestID");
    	String values = request.getParameter("choice");
    	
    	String[] parts = values.split("\\|");
    	
    	String hotel = parts[0];
    	String occupants = parts[1]; 
  
    	String checkin = parts[2];
    	String checkout = parts[3];
    	String roomtype = parts[4];
    	String roomNumber = parts[5];
    	String price = parts[6];
    	
    	Reservation reservation = new Reservation(id, hotel, occupants, checkin, checkout, roomtype, roomNumber);
    	reservation.setPrice(Float.parseFloat(price));
    	reservationManager.add(reservation);
    	RequestDispatcher rd = request.getRequestDispatcher("receipt.jsp");
        request.setAttribute("reservation", reservation);
 	   	rd.forward(request, response);
    }
    
}

class Answer{
	 String answ;
	
	public void setAnswer(String str) {
		this.answ = str;
	}
}