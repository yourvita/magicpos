package com.magicpos.mapper;

import com.magicpos.entity.Restaurant_info;

public interface MemberMapper {
	public void signUp(Restaurant_info rvo);
	public Restaurant_info login(Restaurant_info rvo);
}
