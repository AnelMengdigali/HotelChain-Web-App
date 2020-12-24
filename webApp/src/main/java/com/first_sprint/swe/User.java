package com.first_sprint.swe;

import java.util.ArrayList;

public class User {
	private String ID;
	private String nickname;
	private String password;
	private String country;
	private String city;
	private String street;
	private String category;
	private String idtype;
	private String idnumber;
	private String mobilePhone;
	private String homePhone;
	private String name;
	private String surname;
	private ArrayList<Reservation> resrv = new ArrayList<Reservation>();
	
	public User(String nickname) {
		this.nickname = nickname;
	}
	
	
	public User(String username, String name, String surname, String city, String country, String mobile_phone, ArrayList<Reservation> resrv) {
		this.nickname = username;
		this.name = name;
		this.surname = surname;
		this.city = city; 
		this.country = country;
		this.mobilePhone = mobile_phone;
		this.resrv = resrv;
	}
	public User(String username, String name, String surname, String idtype, String idnumber, 
			String country, String city, String street, String mobile, String home, String category) {
		this.nickname = username;
		this.category = category;
		this.name = name;
		this.surname = surname;
		this.city = city; 
		this.country = country;
		this.mobilePhone = mobile;
		this.street = street;
		this.homePhone = home;
		this.idnumber = idnumber;
		this.idtype = idtype;
		
	}
	
	public String getHomePhone() {
		return homePhone;
	}
	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getIdnumber() {
		return idnumber;
	}
	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}
	public String getIdtype() {
		return idtype;
	}
	public ArrayList<Reservation> getReservation() {
		return resrv;
	}
	public void setIdtype(String idtype) {
		this.idtype = idtype;
	}
	
	public String getStreet() {
		return this.street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return this.city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return this.country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getNickname() {
		return this.nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getID() {
		return this.ID;
	}
	public void setID(String iD) {
		this.ID = iD;
	}
	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public ArrayList<Reservation> getReservations(){
		return this.resrv;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}



