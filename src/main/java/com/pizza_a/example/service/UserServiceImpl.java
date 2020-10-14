package com.pizza_a.example.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.pizza_a.example.domain.OrderVO;
import com.pizza_a.example.domain.UserVO;
import com.pizza_a.example.mapper.UserMapper;
import com.pizza_a.example.mapper.OrderMapper;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	OrderMapper orderMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO user = userMapper.readUser(username);
		user.setAuthorities(getAuthorities(username));
		
		return user;
	}
	
	@Override
	public Collection<GrantedAuthority>getAuthorities(String username){
		List<GrantedAuthority>authorities =userMapper.readAuthorities(username);
		return authorities;
	}
	
	@Override
	public void createUser(UserVO user) {
		// TODO Auto-generated method stub
		userMapper.createUser(user);
	}

	@Override
	public void createAuthorities(UserVO user) {
		// TODO Auto-generated method stub
		userMapper.createAuthority(user);
	}

	@Override
	public UserVO readUser(String username) {
		// TODO Auto-generated method stub
		return userMapper.readUser(username);
	}

	@Override
	public int chk_id_ajax(UserVO userVo) {
		return userMapper.chk_id_ajax(userVo);
	};
	

	@Override
	public List<UserVO> list_Address(int u_address){
		return userMapper.list_address_ajax(u_address);
	};
	
	@Override
	public List<UserVO> selectUserList(){
		return userMapper.selectUserList();
}	
	@Override
	public List<OrderVO> read_LastOrderInfo_byusername(String name){
		return orderMapper.read_LastOrderInfo_byusername();
	};

}
