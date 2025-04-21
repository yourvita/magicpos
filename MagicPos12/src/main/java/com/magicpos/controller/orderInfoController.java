package com.magicpos.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.magicpos.entity.Criteria;
import com.magicpos.entity.Order_info;
import com.magicpos.entity.Restaurant_info;
import com.magicpos.entity.pageMaker;
import com.magicpos.mapper.orderMapper;

@Controller
public class orderInfoController {

	@Autowired
	private orderMapper mapper;

	// ----------------상세 주문내역 조회 - 강효석------------------
	// 로그인한 가게 이름 정보,
	// 로그인한 가게 주문 정보
	// (셋 다 모든 컬럼 조회 SQL문 사용)
	/*
	 * @RequestMapping("/orderDetail.do") public String orderDetail(Model model,
	 * HttpSession session, HttpServletRequest request) { // ----- select * from
	 * order info where #{shop_email} and #{order_idx}--------- // 모든 주문정보 // 로그인 정보
	 * 가져오기 Restaurant_info res = (Restaurant_info) session.getAttribute("rvo");
	 * 
	 * // 가게 이름 String shop_name = res.getShop_name(); // 가게 이메일 String shop_email =
	 * res.getShop_email(); Order_info param = new Order_info();
	 * 
	 * param.setShop_email(shop_email); // 주문 번호 Integer order_idx =
	 * Integer.parseInt(request.getParameter("order_idx"));
	 * 
	 * param.setOrder_idx(order_idx);
	 * 
	 * List<Order_info> loginResOrder = mapper.loginResOrder(param);
	 * model.addAttribute("loginResOrder", loginResOrder);// 로그인한 가게 주문정보
	 * 
	 * return "orderDetail"; }
	 */

	@RequestMapping("/orderComplete.do")
	public String orderComplete(Model model, Criteria cri, HttpSession session, HttpServletRequest request) {
		// 가게 계정 정보 (로그인 이메일)
		Restaurant_info res = (Restaurant_info) session.getAttribute("rvo");

		// 이메일, 인덱스번호 얻어와서 따로만든 entity에 저장 후 파라미터 값으로 넘김
		String email;
		List<Integer> orderIdx_Y = mapper.getOrderIdx_Y(res);
		
		Criteria param = new Criteria();
		
		
		//------------페이징 처리-----------
		pageMaker pm = new pageMaker();
		email = res.getShop_email();
		param.setShop_email(email);
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(param));
		String inputPage = request.getParameter("page");
		int page = 1;
		if (inputPage == null || inputPage == "1") {
			page = 1;
		}else{
			page = Integer.parseInt(inputPage);
		}
		
		
		
		model.addAttribute("pm", pm);

		
		// 로그인한 가게 정보 리스트 전송
		List<Order_info> loginResOrder_Y = new ArrayList<>();
		int order_idx = 0;
		int i = page;
		List<Integer> orderIdx_YY = new ArrayList<Integer>();
		List<Integer> orderIdx_YYY = new ArrayList<Integer>();
		if (i == 1) {
				for (int j = 0; j < 6; j++) {
					email = res.getShop_email();
					order_idx = orderIdx_Y.get(j);
					orderIdx_YY = mapper.getOrderIdx_Y(res);
					orderIdx_YYY.add(orderIdx_YY.get(j));
					
					param.setShop_email(email);
					param.setOrder_idx(order_idx);

					loginResOrder_Y.addAll(mapper.loginResOrder_Y(param));
					// loginResOrder = mapper.loginResOrder(param);
					
				}
			}else {
				int add = (i*6)-6;
				for (int j = add; j < orderIdx_Y.size(); j++) {
					System.out.println("j : " + j);
					email = res.getShop_email();
					order_idx = orderIdx_Y.get(j);
					
					orderIdx_YY = mapper.getOrderIdx_Y(res);
					orderIdx_YYY.add(orderIdx_YY.get(j));
					
					param.setShop_email(email);
					param.setOrder_idx(order_idx);
					loginResOrder_Y.addAll(mapper.loginResOrder_Y(param));
					
				}
			}

		
		// sum(menu_tatal_amount) 결과 리스트 전송
		String resName = mapper.loginRestaurant(res);

		//-------------총계 처리코드-------------
		List<Integer> totalPrice_Y = new ArrayList<>();
			if (i == 1) {
				for (int j = 0; j < 6; j++) {
					email = res.getShop_email();
					order_idx = orderIdx_Y.get(j);

					param.setShop_email(email);
					param.setOrder_idx(order_idx);

					totalPrice_Y.addAll(mapper.getOrderPrice_Y(param));
				}
			} else {
				int add = (i*6)-6;
				for (int j = add; j < orderIdx_Y.size(); j++) {
					email = res.getShop_email();
					order_idx = orderIdx_Y.get(j);

					param.setShop_email(email);
					param.setOrder_idx(order_idx);
					totalPrice_Y.addAll(mapper.getOrderPrice_Y(param));
					
				}
			}
		
		
		
		// ----------distinct table_no, order_date 결과 리스트 전송-------------
		List<Order_info> no_Date_YN_Y = new ArrayList<>();
			if (i == 1) {
				for (int j = 0; j < 6; j++) {
					email = res.getShop_email();
					order_idx = orderIdx_Y.get(j);

					param.setShop_email(email);
					param.setOrder_idx(order_idx);

					no_Date_YN_Y.addAll(mapper.no_Date_YN_Y(param));
				}
			} else {
				int add = (i*6)-6;
				for (int j = add; j < orderIdx_Y.size(); j++) {
					email = res.getShop_email();
					order_idx = orderIdx_Y.get(j);

					param.setShop_email(email);
					param.setOrder_idx(order_idx);

					no_Date_YN_Y.addAll(mapper.no_Date_YN_Y(param));
					
				}
			}
		model.addAttribute("loginResOrder_Y", loginResOrder_Y);// 로그인한 가게 주문정보

		model.addAttribute("orderIdx_Y", orderIdx_YYY);// 고유 주문번호

		model.addAttribute("resName", resName);// 로그인한 가게 이름 정보

		model.addAttribute("totalPrice_Y", totalPrice_Y);// 총 가격

		model.addAttribute("no_Date_YN_Y", no_Date_YN_Y);// distinct table_no, order_date 결과 리스트 전송

		return "completeList";
	}

	// 주문 목록 - 효석
	@RequestMapping("/orderList.do")
	public String orderList(Model model, Criteria cri, HttpSession session) {
		// 가게 계정 정보 (로그인 이메일)
		Restaurant_info res = (Restaurant_info) session.getAttribute("rvo");

		// 이메일, 인덱스번호 얻어와서 따로만든 entity에 저장 후 파라미터 값으로 넘김
		String email;
		List<Integer> orderIdx_N = mapper.getOrderIdx_N(res);

		Criteria param = new Criteria();

		// 로그인한 가게 정보 리스트 전송
		List<Order_info> loginResOrder_N = new ArrayList<>();
		int order_idx = 0;
		for (int i = 0; i < orderIdx_N.size(); i++) {
			email = res.getShop_email();
			order_idx = orderIdx_N.get(i);

			param.setShop_email(email);
			param.setOrder_idx(order_idx);

			loginResOrder_N.addAll(mapper.loginResOrder_N(param));
			// loginResOrder = mapper.loginResOrder(param);

			System.out.println("------------------------------------");
			System.out.println("로그인한 가게 주문 정보 : " + loginResOrder_N);
		}
		model.addAttribute("loginResOrder_N", loginResOrder_N);// 로그인한 가게 주문정보

		// sum(menu_tatal_amount) 결과 리스트 전송
		String resName = mapper.loginRestaurant(res);

		List<Integer> totalPrice_N = new ArrayList<>();

		for (int i = 0; i < orderIdx_N.size(); i++) {
			email = res.getShop_email();
			order_idx = orderIdx_N.get(i);

			param.setShop_email(email);
			param.setOrder_idx(order_idx);

			totalPrice_N.addAll(mapper.getOrderPrice_N(param));
		}

		// distinct table_no, order_date 결과 리스트 전송
		List<Order_info> no_Date_YN_N = new ArrayList<>();
		for (int i = 0; i < orderIdx_N.size(); i++) {
			email = res.getShop_email();
			order_idx = orderIdx_N.get(i);

			param.setShop_email(email);
			param.setOrder_idx(order_idx);

			no_Date_YN_N.addAll(mapper.no_Date_YN_N(param));
		}
		System.out.println("no_Date_YN_N : " + no_Date_YN_N);
		System.out.println("orderIdx_N : " + orderIdx_N);

		/*
		 * pageMaker pm = new pageMaker(); pm.setCri(cri);
		 * pm.setTotalCount(mapper.totalCount(cri)); model.addAttribute("pm", pm);
		 */

		model.addAttribute("orderIdx_N", orderIdx_N);// 고유 주문번호

		model.addAttribute("resName", resName);// 로그인한 가게 이름 정보

		model.addAttribute("totalPrice_N", totalPrice_N);// 총 가격

		model.addAttribute("no_Date_YN_N", no_Date_YN_N);// distinct table_no, order_date 결과 리스트 전송

		return "orderList";

	}
}
