package com.magicpos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.magicpos.entity.Menu_info;
import com.magicpos.entity.Order_info;
import com.magicpos.entity.Restaurant_info;

@Mapper
public interface MenuMapper {
	// 전체 메뉴 리스트
	public List<Menu_info> menuInfo(Restaurant_info mvo);
	
	// 메뉴 등록
	public void menuRegister(Menu_info vo);
	
	
	public Menu_info menuGet(int menu_idx);
	
	// 메뉴 삭제
	public void menuRemove(Menu_info vo);
	
	// 메뉴 수정
	public void menuModify(Menu_info vo);
	
	// 메뉴 순번 가져오기
	public int getOrderIdx();
	
	// 주문 등록
	public void orderRegister(Order_info ovo);
	
	// 테이블에 메뉴 출력
	public List<Order_info> orderInfo(Restaurant_info rvo);
	
	// 각 테이블에 들어가있는 주문정보 가져오기
	public List<Order_info> getOrderList(Order_info ovo);
	
	// 결제 완료
	public void payNY(Order_info ovo);
	
}
