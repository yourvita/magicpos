package com.magicpos.entity;

import lombok.Data;

@Data
public class Menu_info {
	// 메뉴번호
	private int menu_idx;
	// 매장 이메일
	private String shop_email;
	// 메뉴 명
	private String menu_name;
	// 메뉴 가격
	private int menu_price;
	// 메뉴 사진
	private String menu_img;
}
