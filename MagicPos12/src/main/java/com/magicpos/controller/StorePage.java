package com.magicpos.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.magicpos.entity.Menu_info;
import com.magicpos.entity.Order_info;
import com.magicpos.entity.Order_infoList;
import com.magicpos.entity.Restaurant_info;
import com.magicpos.mapper.MenuMapper;

@Controller
public class StorePage {
	
	@Autowired
	private MenuMapper menuMapper;
	
	@RequestMapping("/hallTable.do")
	public String storePage(Model model, HttpSession session) {
		Restaurant_info rvo = (Restaurant_info)session.getAttribute("rvo");
		List<Order_info> orderList = menuMapper.orderInfo(rvo);
		model.addAttribute("order_List", orderList);
		
		return "hallTable";
	}
	
	@RequestMapping("/order.do")
	public String tablePage(HttpSession session, Model model, @RequestParam(value = "table_num", required = false) int table_no) {
		Restaurant_info rvo = (Restaurant_info)session.getAttribute("rvo");
		String shop_email = rvo.getShop_email();
		List<Menu_info> menuList = menuMapper.menuInfo(rvo);
		System.out.println("테이블 번호" + table_no);
		Order_info ovo = new Order_info();
		ovo.setTable_no(table_no);
		ovo.setShop_email(shop_email);
		List<Order_info> orderList = menuMapper.getOrderList(ovo);
		model.addAttribute("menuList", menuList);
		model.addAttribute("menu_cnt", menuList.size());
		model.addAttribute("table_num", table_no);
		model.addAttribute("orderList", orderList);
		return "order2";
	}
	
	@RequestMapping(value = "/insertOrder.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String insertOrder(Model model, @ModelAttribute(value="Order_infoList") Order_infoList list,Order_info ovo, HttpSession session, RedirectAttributes rttr) {
		Restaurant_info rvo = (Restaurant_info)session.getAttribute("rvo");
		int orderIdx = menuMapper.getOrderIdx();
		if(orderIdx == 0) {
			orderIdx++;
		}
		System.out.println("주문번호" + orderIdx);
		System.out.println("주문목록"+list);
		System.out.println("반복횟수" + list.getOrder_list().size());
		for(int i=0;i<list.getOrder_list().size();i++) {
			if(list.getOrder_list().get(i).getMenu_cnt() != 0) {
				list.getOrder_list().get(i).setOrder_idx(orderIdx);
				list.getOrder_list().get(i).setShop_email(rvo.getShop_email());
				list.getOrder_list().get(i).setOrder_total_amount(ovo.getOrder_total_amount());
				menuMapper.orderRegister(list.getOrder_list().get(i));
			}
		}
		System.out.println(ovo.getTable_no());
		rttr.addAttribute("table_num", ovo.getTable_no());
		return "redirect:/hallTable.do";
	}
	
	@RequestMapping("/payNY.do")
	public String payNY(int table_num, HttpSession session) {
		Restaurant_info rvo = (Restaurant_info)session.getAttribute("rvo");
		
		Order_info ovo = new Order_info();
		ovo.setTable_no(table_num);
		ovo.setShop_email(rvo.getShop_email());
		menuMapper.payNY(ovo);
		return "redirect:/hallTable.do";
	}
}
