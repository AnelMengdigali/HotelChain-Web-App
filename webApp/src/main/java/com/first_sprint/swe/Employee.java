package com.first_sprint.swe;

public class Employee {
	private int EmployeeID;
	private String jobTitle;
	private int HotelID;
	private int ManagerID;
	private String name;
	private String surname;
	private boolean monday;
	private boolean tuesday;
	private boolean wednesday;
	private boolean thursday;
	private boolean friday;
	private boolean saturday;
	private boolean sunday;
	private int salaryPerHour;
	private String fromTime;
	private String toTime;
	public Employee() {};
	public Employee(int id, String jobTitle, String name, String surname, int managerID, int hotelID, 
			boolean monday, boolean tuesday, boolean wednesday, boolean thursday, boolean friday, boolean saturday, boolean sunday,
			int salaryPerHour, String fromTime, String toTime) {
		this.setEmployeeID(id);
		this.setJobTitle(jobTitle);
		this.setName(name);
		this.setSurname(surname);
		this.setManagerID(managerID);
		this.setHotelID(hotelID);
		this.setMonday(monday);
		this.setThursday(thursday);
		this.setFriday(friday);
		this.setSaturday(saturday);
		this.setSunday(sunday);
		this.setTuesday(tuesday);
		this.setWednesday(wednesday);
		this.setSalaryPerHour(salaryPerHour);
		this.setFromTime(fromTime);
		this.setToTime(toTime);
		
	}
	public Employee(int id, String jobTitle, String name, String surname) {
		this.setEmployeeID(id);
		this.setJobTitle(jobTitle);
		this.setName(name);
		this.setSurname(surname);
	}
	public Employee(int id, String jobTitle, String name, String surname, int hotelID) {
		this.setEmployeeID(id);
		this.setJobTitle(jobTitle);
		this.setName(name);
		this.setSurname(surname);
		this.setHotelID(hotelID);
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public int getEmployeeID() {
		return EmployeeID;
	}
	public void setEmployeeID(int employeeID) {
		EmployeeID = employeeID;
	}
	public int getHotelID() {
		return HotelID;
	}
	public void setHotelID(int hotelID) {
		HotelID = hotelID;
	}
	public int getManagerID() {
		return ManagerID;
	}
	public void setManagerID(int managerID) {
		ManagerID = managerID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public int getSalaryPerHour() {
		return salaryPerHour;
	}
	public void setSalaryPerHour(int salaryPerHour) {
		this.salaryPerHour = salaryPerHour;
	}
	public String getFromTime() {
		return fromTime;
	}
	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}
	public String getToTime() {
		return toTime;
	}
	public void setToTime(String toTime) {
		this.toTime = toTime;
	}
	public boolean isSunday() {
		return sunday;
	}
	public void setSunday(boolean sunday) {
		this.sunday = sunday;
	}
	public boolean isSaturday() {
		return saturday;
	}
	public void setSaturday(boolean saturday) {
		this.saturday = saturday;
	}
	public boolean isFriday() {
		return friday;
	}
	public void setFriday(boolean friday) {
		this.friday = friday;
	}
	public boolean isThursday() {
		return thursday;
	}
	public void setThursday(boolean thursday) {
		this.thursday = thursday;
	}
	public boolean isWednesday() {
		return wednesday;
	}
	public void setWednesday(boolean wednesday) {
		this.wednesday = wednesday;
	}
	public boolean isTuesday() {
		return tuesday;
	}
	public void setTuesday(boolean tuesday) {
		this.tuesday = tuesday;
	}
	public boolean isMonday() {
		return monday;
	}
	public void setMonday(boolean monday) {
		this.monday = monday;
	}
}

