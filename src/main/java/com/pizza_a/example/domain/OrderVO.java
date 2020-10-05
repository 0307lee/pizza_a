package com.pizza_a.example.domain;

public class OrderVO {
//	vo need small letter
	private int		orderId;
	private String	uId;
	private String	orderStatus;
	private String	orderTime;
	private String	requiredTime;
	
//	private int		item_id;
	private int		productId;
	private int		orderitemsSize;
	private int		orderitemsQuantity;
	private int		orderitemsDiscount;
	private int		orderitemsListprice;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getOrderitemsSize() {
		return orderitemsSize;
	}
	public void setOrderitemsSize(int orderitemsSize) {
		this.orderitemsSize = orderitemsSize;
	}
	public int getOrderitemsQuantity() {
		return orderitemsQuantity;
	}
	public void setOrderitemsQuantity(int orderitemsQuantity) {
		this.orderitemsQuantity = orderitemsQuantity;
	}
	public int getOrderitemsDiscount() {
		return orderitemsDiscount;
	}
	public void setOrderitemsDiscount(int orderitemsDiscount) {
		this.orderitemsDiscount = orderitemsDiscount;
	}
	public int getOrderitemsListprice() {
		return orderitemsListprice;
	}
	public void setOrderitemsListprice(int orderitemsListprice) {
		this.orderitemsListprice = orderitemsListprice;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getRequiredTime() {
		return requiredTime;
	}
	public void setRequiredTime(String requiredTime) {
		this.requiredTime = requiredTime;
	}
}
