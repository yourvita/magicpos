package com.magicpos.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.magicpos.entity.Restaurant_info;
import com.magicpos.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper mapper;
	
	// 시작 주소 http://localhost:8081/mp/magicpos.do
	@RequestMapping("/magicpos.do")
	public String login() {
		return "index";
	}
	
	// 로그인 페이지
	@RequestMapping("/loginPage.do")
	public String loginPage() {
		return "login";
	}
	
	// 로그인
	@RequestMapping("/login.do")
	public String login(Restaurant_info mvo, HttpSession session) {
		Restaurant_info rvo = mapper.login(mvo);
		System.out.println(rvo);
		if(rvo != null) { // 로그인에 성공할 시
			System.out.println("로그인완료");
			session.setAttribute("rvo", rvo);
			return "main";
		}
		System.out.println("실패");
		return "login";
	}
	
	@RequestMapping("/mainPage.do")
		public String main() {
			return "main";
		}
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/magicpos.do";
	}

	// 회원가입
	@RequestMapping("/signUp.do")
	public String signUp(Restaurant_info rvo) {
		mapper.signUp(rvo);
		return "redirect:/magicpos.do";
	}
											
}
