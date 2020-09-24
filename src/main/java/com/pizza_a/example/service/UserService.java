package com.pizza_a.example.service;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.pizza_a.example.domain.UserVO;

public interface UserService extends UserDetailsService {

	public UserVO readUser(String username);
	

	public void createUser(UserVO user);
	

	public void createAuthorities(UserVO user);
	

	Collection<GrantedAuthority> getAuthorities(String username);

	public int chk_id_ajax(UserVO userVo);


	public List<UserVO> list_Address(int u_address);


	public List<UserVO> selectUserList();


}
