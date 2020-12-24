package com.first_sprint.swe;

public class Room {
	private int roomNumber;
	private int floor;
	private boolean occupance;
	private String roomType;
	private int hotelID;
	private float price;
	public Room() {
		
	}
	public Room(int number, int floor, String roomType, int hotelID, float price) {
		this.setFloor(floor);
		this.setRoomNumber(number);
		this.setHotelID(hotelID);
		this.setRoomType(roomType);
		this.setPrice(price);
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public boolean isOccupance() {
		return occupance;
	}
	public void setOccupance(boolean occupance) {
		this.occupance = occupance;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getHotelID() {
		return hotelID;
	}
	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
}
