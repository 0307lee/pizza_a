package com.pizza_a.example.domain;

public class OrderVO {
//	vo need small letter
	
	//pizza_order_TB
		private int		orderId;
		private String	username;
		private String	orderStatus;
		private String	orderTime;
		private String	requiredTime;
	//pizza_order_TB
	
	//pizza_order_items_TB
		private int		item_id;
		private int		productId;
		private String	orderitemsSize;
		private int		orderitemsQuantity;
		private int		orderitemsDiscount;
		private int		orderitemsPrice;
	//pizza_order_items_TB
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
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
	
	//
	
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getOrderitemsSize() {
		return orderitemsSize;
	}
	public void setOrderitemsSize(String orderitemsSize) {
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
	
	public int getOrderitemsPrice() {
		return orderitemsPrice;
	}
	public void setOrderitemsPrice(int orderitemsPrice) {
		this.orderitemsPrice = orderitemsPrice;
	}
	

}
