package com.pizza_a.example.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pizza_a.example.domain.BoardVO;
import com.pizza_a.example.domain.PizzaVO;
import com.pizza_a.example.domain.UserVO;
import com.pizza_a.example.service.BoardService;
import com.pizza_a.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {

	private final Logger logger =LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardservice;
	@Autowired UserService userservice;

	@RequestMapping("/")
	public String home(Model model) {
		
		return "/Stg1_1_MAIN";
	}
	
	@RequestMapping(value= "/Stg1_MAIN_NoID")
	public String noID(Model model) {
		return "/Stg1_MAIN_NoID";
	}	
	
	@RequestMapping(value= "/Stg1_LOGIN")
	public String beforeLogin(Model model) {
		return "/Stg1_LOGIN";
	}	
	
	@RequestMapping("/Stg1_BEFORE_REGISTER_ID")
	public String beforeSignUp() {
		return "/Stg1_REGISTER_ID";
	}
	
	@RequestMapping("/Stg1_REGISTER_ID")
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
		
		return "/Stg1_MAIN_NoID";
	}

	
//	@Secured({"ROLE_USER"})
//	@RequestMapping(value="/user/info")
//	public String userinfo(Model model) {
//		return "/user_info";
//	}
	
	@RequestMapping(value= "/denied")
	public String denied(Model model) {
		return "/denied";
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

		return "redirect:/";
	}
	
	@RequestMapping(value= "/Stag1_CHK_ID_AJAX")
	@ResponseBody
	public int chk_id_ajax(@RequestBody UserVO userVo_username) {
		int CHK_username_existing= userservice.chk_id_ajax(userVo_username);
		System.out.println(CHK_username_existing);

//		int chk_VO= userservice.chk_id_ajax(userVo_username);
		
//		logger.debug("debug");
//		logger.info("info");
//		logger.error("error");
		return CHK_username_existing;
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/Stg2_1_SetPizza_basic")
	public String Stg2_1_SetPizza_basic(Model model) {

		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		
		return "/Stg2_1_SetPizza_basic";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/SetPizza")
	public String SetPizza(PizzaVO post) {

		
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		
		return "/Stg2_1_SetPizza_basic";
	}
}