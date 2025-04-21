package com.magicpos.entity;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//페이징 처리에서 기준클래스
public class Criteria {
	//order_info 컬럼들
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
	
	//원래 criteria 컬럼
	private int page;
	private int perPageNum;
	
	
	public Criteria() {
		this.page=1;
		this.perPageNum=5;
		
	}
	//3. 선택한 페이지에 해당하는 게시글의 시작번호 구하기 offset
	
	public int getPageStart() {
		
		
		
		return (page-1)*perPageNum;
	}
}
