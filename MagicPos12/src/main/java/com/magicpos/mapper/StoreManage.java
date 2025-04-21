package com.magicpos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.magicpos.entity.Order_info;
import com.magicpos.entity.Restaurant_info;
import com.magicpos.entity.Store_ManageVO;
@Mapper
public interface StoreManage {
	public List<Store_ManageVO> currentSales(Restaurant_info rinfo);
	public List<Store_ManageVO> salesStatus(Restaurant_info oinfo);
	public List<Store_ManageVO> salesMonthly(Restaurant_info oinfo);
	public List<Store_ManageVO> salesWeekly(Restaurant_info oinfo);
}
