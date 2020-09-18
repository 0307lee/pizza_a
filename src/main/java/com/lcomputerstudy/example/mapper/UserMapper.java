package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;

import com.lcomputerstudy.example.domain.UserVO;

@Mapper
public interface UserMapper {

	public UserVO readUser(String username);

	public void createUser(UserVO user);

	public List<GrantedAuthority> readAuthorities(String username);

	public void createAuthority(UserVO user);
}