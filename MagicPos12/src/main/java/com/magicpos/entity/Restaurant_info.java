package com.magicpos.entity;

import lombok.Data;

@Data
public class Restaurant_info {
    // 식당 이메일 
    private String shop_email;
    // 비밀번호 
    private String shop_pw;
    // 매장이름 
    private String shop_name;
    // 테이블 수
    private int shop_table; 
    // 대표자명 
    private String shop_owner;
}
