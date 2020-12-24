<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.ArrayList"%>
    <%@ page import="com.first_sprint.swe.Employee" %>

        <html xmlns="http://www.w3.org/1999/xhtml">

        <head>
            <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0" />
            <title>Employee Management Page</title>


            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin=" anonymous"></script>
            <link  rel="stylesheet" href="./employee.css"></link>
           
        </head>

        <body>
            <%Employee employee = (Employee)request.getAttribute("employee");%>
                <div class="profile">
                
                <form action="editEmployee" method="post">
                <h1>Employee Card</h1>
                <div class="content">
                <div class="left">
                    <div class="left-content">
                    <p>ID:</p>
                    <input value="<%= employee.getEmployeeID() %>" name="id" readonly></input>
                    </div>
                    <div class="left-content">
                    <p>Name:</p>
                        <input value="<%= employee.getName() %>" name="name" readonly></input>
               </div>
                     <div class="left-content">
                    <p>Surname:  </p>
                        <input value="<%= employee.getSurname() %>" name="surname" readonly></input>
                  </div>
                     <div class="left-content">
                    <p>Job Title:</p>
                        <input value="<%= employee.getJobTitle() %>" name ="job" readonly></input>
                    </div>
                     <div class="left-content">
                    <p>Manager ID:</p>
                        <input value="<%= employee.getManagerID() %>" name="managerID" readonly></input>
                    </div>
                    </div>
                    <div class="right">
                        <div class="schedule">
                            <div class="monday">
                                 <p>M</p>
<label class="switch">
  <input type="checkbox" name="monday" value="<%= employee.isMonday()%>">
  <span class="slider round"></span>
</label>
                            </div>
                            <div class="tuesday">
                               <p>Tu</p>
                                <label class="switch">
  <input type="checkbox" name="tuesday" value="<%= employee.isTuesday()%>">
  <span class="slider round"></span>
</label>
                            </div>
                            <div class="wednesday">
                                <p>W</p>
                                <label class="switch">
  <input type="checkbox" name="wednesday" value="<%= employee.isWednesday()%>">
  <span class="slider round"></span>
</label>
                            </div>
                            <div class="thursday">
                                <p>Th</p>
                               <label class="switch">
  <input type="checkbox" name="thursday" value="<%= employee.isThursday()%>">
  <span class="slider round"></span>
</label>
                            </div>
                            <div class="friday">
                                <p>Fr</p>
                               <label class="switch">
  <input type="checkbox" name="friday" value="<%= employee.isFriday()%>">
  <span class="slider round"></span>
</label>
                            </div>
                            <div class="saturday">
                                <p>St</p>
                                <label class="switch">
  <input type="checkbox" name="saturday" value="<%= employee.isSaturday()%>">
  <span class="slider round"></span>
</label>
                            </div>
                            <div class="sunday">
                                 <p>Sn</p>
                                <label class="switch">
  <input type="checkbox" name="sunday" value="<%= employee.isSunday()%>">
  <span class="slider round"></span>
</label>
                            </div>
                        </div>
                        <p>Salary per hour:
                            <input type="number" value="<%= employee.getSalaryPerHour() %>"
                             name="salary" min="0" required>
                        </p>
                      <p>Working hours:
                      from: 
                            <input type="time" value="<%= employee.getFromTime()%>"
                             name="fromTime" required >
                            to:  <input type="time" value="<%= employee.getToTime() %>"
                             name="toTime"  required>
                        </p>
                        <div class="btns">
                        <button type="submit" id="saveBtn">Save</button>
                        <button type="reset" id="resetBtn">Reset</button>
                        </div>
                        
                        </div>
                        </div>
                    </form>
                </div>
                <script>
                let switches = document.querySelectorAll(".switch");
                for (let a of switches ) {
                	console.log(a.childNodes[1].value );
                	if (a.childNodes[1].value == "true") {
                		a.childNodes[1].checked = true;
                	}
                }
                
                	 
                	
                
                </script>
        </body>

        </html>