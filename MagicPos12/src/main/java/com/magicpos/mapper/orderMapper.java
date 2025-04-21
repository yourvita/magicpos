package com.magicpos.mapper;

import java.util.List;

import com.magicpos.entity.Criteria;
import com.magicpos.entity.Order_info;
import com.magicpos.entity.Restaurant_info;

public interface orderMapper {
//---------------------------payYN = 'Y'(결제 완료/orderComplete)----------------------------
	// 주문정보 모든컬럼 가져오기 
	public List<Order_info> loginResOrder_Y(Criteria param);
	
	// distinct된 인덱스번호 가져오기
	public List<Integer> getOrderIdx_Y(Restaurant_info param);
	
	
	// 메뉴별 가격 더해서 가져오기(sum(menu_total_ptice))
	public List<Integer> getOrderPrice_Y(Criteria param);

	// 테이블 넘버, 날짜, 결제 여부 가져오기
	public List<Order_info> no_Date_YN_Y(Criteria param);

//---------------------------payYN = 'Y'(결제 완료/orderComplete)----------------------------

	
//---------------------------payYN = 'N'(결제 전/orderList)----------------------------
	// 주문정보 모든컬럼 가져오기 
	
	public List<Order_info> loginResOrder_N(Criteria param);
	
	// distinct된 인덱스번호 가져오기
	public List<Integer> getOrderIdx_N(Restaurant_info param);
	
	
	// 메뉴별 가격 더해서 가져오기(sum(menu_total_ptice))
	public List<Integer> getOrderPrice_N(Criteria param);
	
	// 테이블 넘버, 날짜, 결제 여부 가져오기
	public List<Order_info> no_Date_YN_N(Criteria param);
	
//---------------------------payYN = 'N'(결제 전/orderList)----------------------------
	
	// 컨텐츠 수(페이지 계산)
	public int totalCount(Criteria param);
	// 가게 이름만 가져오기
	public String loginRestaurant(Restaurant_info param);
}
