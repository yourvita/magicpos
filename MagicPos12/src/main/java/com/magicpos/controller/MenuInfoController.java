package com.magicpos.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.magicpos.entity.Menu_info;
import com.magicpos.entity.Order_info;
import com.magicpos.entity.Restaurant_info;
import com.magicpos.mapper.MenuMapper;

@Controller
public class MenuInfoController {
	
	@Autowired
	private MenuMapper mapper;
	
	// 매장별 메뉴 리스트
	@RequestMapping("/menuList.do")
	public String menuPage(Model model, HttpSession session) {
		System.out.println("메뉴 리스트 메소드");
		Restaurant_info rvo = (Restaurant_info)session.getAttribute("rvo");
		List<Menu_info> menuList = mapper.menuInfo(rvo);
		model.addAttribute("menuList", menuList);
		return "storeMenuPage";
	}
	
	// 메뉴 등록
	@RequestMapping("/menuRegister.do")
	public String menuRegister(Menu_info vo) {
		mapper.menuRegister(vo);
		return "redirect:/menuList.do";
	}
	
	// 메뉴 삭제
	@RequestMapping("/menuRemove.do")
	public String menuRemove(Menu_info vo) {
		mapper.menuRemove(vo);
		return "redirect:/menuList.do";
	}
	
	// 메뉴 수정
	@RequestMapping("/modify.do")
	public String modify(Menu_info vo) {
		mapper.menuModify(vo);
		return "redirect:/menuList.do";
	}
	
	@RequestMapping("/menumodifyPage.do")
	public String menumodifyPage(HttpSession session, int menu_idx, String menu_name, int menu_price) {
		session.setAttribute("menu_idx", menu_idx);
		session.setAttribute("menu_name", menu_name);
		session.setAttribute("menu_price", menu_price);
		
		return "menuModify";
	}
}
