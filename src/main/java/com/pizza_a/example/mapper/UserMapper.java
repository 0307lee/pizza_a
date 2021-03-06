package com.pizza_a.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;

import com.pizza_a.example.domain.OrderVO;
import com.pizza_a.example.domain.UserVO;

@Mapper
public interface UserMapper {

	public UserVO readUser(String username);

	public void createUser(UserVO user);

	public List<GrantedAuthority> readAuthorities(String username);

	public void createAuthority(UserVO user);
	
	public int chk_id_ajax(UserVO userVo);

	public List<UserVO> list_address_ajax(int u_address);

	public List<UserVO> selectUserList();

	public List<UserVO> read_Address_byusername(String username);

}