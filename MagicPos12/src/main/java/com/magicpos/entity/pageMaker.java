package com.magicpos.entity;

import lombok.Data;

@Data
public class pageMaker {
	private Criteria cri;
	private int displayPageNum = 5;
	private int totalCount; // 전체 개시글의 수 : select count(*) from reply
	private int startPage; 
	private int endPage; 
	private boolean prev;
	private boolean next;
	
	//tatalCount의 값이 세팅이 되면 makePage()호출
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		makePage();
	}
	
	public void makePage() {
		//1. 선택한 페이지의 화면에 보여질 마지막 페이지 번호
		//5진법 이라 했을 때 
		//Ex) 2페이지 선택 시 페이지번호 1|2|3|4|5 처럼 보이게
		endPage=(int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		//2. 시작페이지 번호
		startPage = (endPage-displayPageNum)+1;
		
		//3. endPage의 유효성검사 : 10이나 5단위가 아닌 실제 32, 등 애매한 숫자로 끝날 경우 마지막 페이지
		int tempEndPage = (int)(Math.ceil(totalCount/(double)(cri.getPerPageNum())));
		if (tempEndPage<endPage) {
			endPage=tempEndPage;
		}
		
		//4. 1페이지면 prev 안나오게 true - 현재페이지 > 1 false - 현재페이지 == 1
		prev = (startPage != 1) ? true:false;
		
		//5. 마지막 페이지면 next버튼 안나오게 true - 끝페이지 > 현재 마지막 페이지 
		next = (endPage < tempEndPage) ? true : false;
	}
}
