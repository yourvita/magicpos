package com.magicpos.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Order_info implements Serializable{
	private int order_idx;
	private String shop_email;
	private int table_no;
	private int menu_idx;
	private String menu_name;
	private int menu_price;
	private int menu_cnt;
	private int menu_total_amount;
	private int order_total_amount;
	private Date order_date;
	private String pay_method;
	private String payYN;
}
