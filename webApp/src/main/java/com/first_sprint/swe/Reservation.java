package com.first_sprint.swe;

public class Reservation {
	private String checkin;
	private String checkout;
	private String id;
	private String hotel;
	private String room_type;
	private String roomNumber;
	private String occupants;
	private float price;
	
	public Reservation(String checkin, String checkout, String id, String hotel, String room_type) {
		this.checkin = checkin;
		this.checkout = checkout;
		this.id = id;
		this.hotel = hotel;
		this.room_type = room_type;
	}
	public Reservation(String id, String hotel, String occupants, String checkin, String checkout,
			String roomtype, String roomNumber) {
		this.id = id;
		this.hotel = hotel;
		this.checkin = checkin;
		this.checkout = checkout;
		this.setOccupants(occupants);
		this.setRoomNumber(roomNumber);
		this.room_type = roomtype;
		
	}
	public String getCheckin() {
		return this.checkin;
	}
	
	public String getCheckout() {
		return this.checkout;
	}
	
	public String getID() {
		return this.id;
	}
	
	public String getHotel() {
		return this.hotel;
	}
	
	public String getRoomType() {
		return this.room_type;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getOccupants() {
		return occupants;
	}

	public void setOccupants(String occupants) {
		this.occupants = occupants;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}

	
}
