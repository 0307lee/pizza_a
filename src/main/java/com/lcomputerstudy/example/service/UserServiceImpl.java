package com.lcomputerstudy.example.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.UserVO;
import com.lcomputerstudy.example.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
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

}
