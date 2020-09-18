package com.lcomputerstudy.example.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lcomputerstudy.example.domain.BoardVO;
import com.lcomputerstudy.example.domain.UserVO;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {

	private final Logger logger =LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardservice;
	@Autowired UserService userservice;

	@RequestMapping("/")
	public String home(Model model) {
		List<BoardVO> list =boardservice.selectBoardList();
		model.addAttribute("list_BoardVO", list);
		
		int b_cnt_id=boardservice.getBoardListCount();
		model.addAttribute("b_cnt_id", b_cnt_id);
		

		return "/index";
	}
	
	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	public String signup(UserVO user) {
		//encoding PW
		String encodedPassword =new BCryptPasswordEncoder().encode(user.getPassword());
		
		//Setting UserData
		user.setPassword(encodedPassword);
		user.setAccoutNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		
		//Creating User
		userservice.createUser(user);
		//Creating Auth
		userservice.createAuthorities(user);
		
		return "/login";
	}
	
	@RequestMapping(value= "/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/user/info")
	public String userinfo(Model model) {
		return "/user_info";
	}
	
	@RequestMapping(value= "/denied")
	public String denied(Model model) {
		return "/denied";
	}

	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/chart")
	public String chart(Model model) {
		return "/chart";
	}

	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/post_write")
	public String Call_writePost_JSP(Model model) {
		return "/user_post_write";
	}

	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/post_write_process")
	public String writePostProcess(BoardVO post) {
		//Writing(duplicate Update)
		boardservice.writePostProcess(post);
		return "redirect:/";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/post/{bId}", method = RequestMethod.GET)
	public String readingpost(Model model, @PathVariable("bId") int bId) {
//		int bId=0;
		List<BoardVO> list =boardservice.selectPost(bId);
		
		model.addAttribute("list_BoardVO", list);

		
		return "/user_post";
	}

	//Access Only Same U_id
	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/post/update/{bId}")
	public String Call_updatePost_JSP(Model model, @PathVariable("bId") int bId) {
		List<BoardVO> list =boardservice.selectPost(bId);
		model.addAttribute("list_BoardVO", list);
		return "/user_post_update";
	}
		
	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/post_delete")
	public String deletePostProcess(BoardVO post) {
		boardservice.deletePostProcess(post);

		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		
		return "redirect:/";
	}
}