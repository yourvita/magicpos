package com.magicpos.controller;

import java.nio.file.FileSystemLoopException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.magicpos.entity.Order_info;
import com.magicpos.entity.Restaurant_info;
import com.magicpos.entity.Store_ManageVO;
import com.magicpos.mapper.StoreManage;

@Controller
public class StoreManageController {
	
	@Autowired
	private StoreManage mapper;
		
	@RequestMapping("/currentSales.do")
	public @ResponseBody List<Store_ManageVO> currentSales(HttpSession session) {
		Restaurant_info rinfo = (Restaurant_info)session.getAttribute("rvo");
		List<Store_ManageVO> currentSales = mapper.currentSales(rinfo);
		System.out.println("일별 매출"+currentSales);
		return currentSales;
	}
	
	@RequestMapping("/salesStatus.do")
	public @ResponseBody List<Store_ManageVO> salesStatus(HttpSession session) {
		Restaurant_info rinfo = (Restaurant_info)session.getAttribute("rvo");
		List<Store_ManageVO> list = mapper.salesStatus(rinfo);
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping("/salesMonthly.do")
	public @ResponseBody List<Store_ManageVO> salesMonthly(HttpSession session) {
		Restaurant_info rinfo = (Restaurant_info)session.getAttribute("rvo");
		
		List<Store_ManageVO> list = mapper.salesMonthly(rinfo);
		System.out.println("월별 매출" + list);
		return list;
	}
	
	@RequestMapping("salesWeekly.do")
	public @ResponseBody List<Store_ManageVO> salesWeekly(HttpSession session) {
		Restaurant_info rinfo = (Restaurant_info)session.getAttribute("rvo");
		
		List<Store_ManageVO> list = mapper.salesWeekly(rinfo);
		
		return list;
	}
}