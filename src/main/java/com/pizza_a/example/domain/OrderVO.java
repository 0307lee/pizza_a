package com.pizza_a.example.domain;

public class OrderVO {
//	vo need small letter
	
	private UserVO userVO; // join vo
	
	//pizza_order_TB
		private int		orderId;
		private int		orderDeliver;
		private String	orderStatus;
		private String	orderTime;
		private String	requiredTime;
		private String	username;
		private int		orderTOTALPRICEWON;
		private int		orderStoreId;
		private int		orderZipcode;
		private String	orderAddress;	
		private String	orderRequest;
	//pizza_order_items_TB
		private int		orderItemId;
		private String	orderItemSize;
		private int		orderItemQuantity;
		private int		orderItemPrice;
	//pizza_store_TB
		private int		storeId; //hmm
		private String	storeName;
		private String	storeManager;		
		private String	storePhone;
	
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
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
	public int getOrderStoreId() {
		return orderStoreId;
	}
	public void setOrderStoreId(int orderStoreId) {
		this.orderStoreId = orderStoreId;
	}
	public int getOrderZipcode() {
		return orderZipcode;
	}
	public void setOrderZipcode(int orderZipcode) {
		this.orderZipcode = orderZipcode;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderRequest() {
		return orderRequest;
	}
	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}
	
	//
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public String getOrderItemSize() {
		return orderItemSize;
	}
	public void setOrderItemSize(String orderItemSize) {
		this.orderItemSize = orderItemSize;
	}
	public int getOrderItemQuantity() {
		return orderItemQuantity;
	}
	public void setOrderItemQuantity(int orderItemQuantity) {
		this.orderItemQuantity = orderItemQuantity;
	}
	public int getOrderItemPrice() {
		return orderItemPrice;
	}
	public void setOrderItemPrice(int orderItemPrice) {
		this.orderItemPrice = orderItemPrice;
	}
	
	//
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreManager() {
		return storeManager;
	}
	public void setStoreManager(String storeManager) {
		this.storeManager = storeManager;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

}
