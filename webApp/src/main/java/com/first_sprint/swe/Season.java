package com.first_sprint.swe;

public class Season {
	private String name;
	private String start_date;
	private String end_date;
	private String coefficient_weekend;
	private String coefficient_working;
	private String HotelID;
	
	public Season(String name, String start_date, String end_date, String coefficient_working, String coefficient_weekend, String HotelID) {
		this.name = name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.coefficient_weekend = coefficient_weekend;
		this.coefficient_working = coefficient_working;
		this.HotelID = HotelID;
	}
	
	public String getName() {
		return this.name;
	}
	public String getStartdate() {
		return this.start_date;
	}
	public String getEnddate() {
		return this.end_date;
	}
	public String getCoefficientWeekEnd() {
		return this.coefficient_weekend;
	}
	public String getCoefficientWorking() {
		return this.coefficient_working;
	}
	public String getHotelID() {
		return this.HotelID;
	}
	
	
}
