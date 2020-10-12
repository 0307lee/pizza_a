package com.pizza_a.example.domain;

public class TODO_StockVO {
//	vo need small letter
	
	//pizza_order_TB
		private int		orderId;
		private int		orderDeliver;
		private String	orderStatus;
		private String	orderTime;
		private String	requiredTime;
		private String	username;
		private int		orderTOTALPRICEWON;
		private int		storeId;
	//pizza_order_TB
	
	//pizza_order_items_TB
		private int		orderItemId;
		private String	orderItemsSize;
		private int		orderItemsQuantity;
		private int		orderItemsPrice;
	//pizza_order_items_TB
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
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
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
	public int getOrderDeliver() {
		return orderDeliver;
	}
	public void setOrderDeliver(int orderDeliver) {
		this.orderDeliver = orderDeliver;
	}
	public int getOrderTOTALPRICEWON() {
		return orderTOTALPRICEWON;
	}
	public void setOrderTOTALPRICEWON(int orderTOTALPRICEWON) {
		this.orderTOTALPRICEWON = orderTOTALPRICEWON;
	}
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	//
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public String getOrderItemsSize() {
		return orderItemsSize;
	}
	public void setOrderItemsSize(String orderItemsSize) {
		this.orderItemsSize = orderItemsSize;
	}
	public int getOrderItemsQuantity() {
		return orderItemsQuantity;
	}
	public void setOrderItemsQuantity(int orderItemsQuantity) {
		this.orderItemsQuantity = orderItemsQuantity;
	}
	public int getOrderItemsPrice() {
		return orderItemsPrice;
	}
	public void setOrderItemsPrice(int orderItemsPrice) {
		this.orderItemsPrice = orderItemsPrice;
	}

}
