package com.pizza_a.example.controller;

import java.security.Principal;
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
import com.pizza_a.example.domain.OrderVO;
import com.pizza_a.example.domain.UserVO;
import com.pizza_a.example.service.BoardService;
import com.pizza_a.example.service.OrderService;
import com.pizza_a.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	private final Logger logger =LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardservice;
	@Autowired UserService userservice;
	@Autowired OrderService orderservice;

	@RequestMapping("/")
	public String home(Model model,Principal principal) {
		if( principal !=null) {
		String username=principal.getName(); 
		model.addAttribute("username", username);
		}
		return "/Stg1_1_MAIN";
	}
	
	@RequestMapping(value= "/Stg1_MAIN_NoID")
	public String noID(Model model) {
		return "/Stg1_MAIN_NoID";
	}	
	
	@RequestMapping(value= "/Stg1_LOGIN")
	public String beforeLogin(Model model) {
		//TODO Need To Handle "login?err", when put wrong id or pw
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
		
		//TODO need to Ban [Using ~!@#$%^& for ID register] by <script>
		//Creating User
		userservice.createUser(user);
		//Creating Auth
		userservice.createAuthorities(user);
		
		return "/Stg1_MAIN_NoID";
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

/*	about Boardservice
	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/post_write")
	public String Call_writePost_JSP(Model model) {
		return "/user_post_write";
	}

	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/post_write_process")
	public String writePostProcess(BoardVO post) {
		//Writing(duplicate with Update)
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
*/
	
	@RequestMapping(value= "/Stag1_CHK_ID_AJAX")
	@ResponseBody
	public int chk_id_ajax(@RequestBody UserVO userVo_username) {
		int CHK_username_existing= userservice.chk_id_ajax(userVo_username);
		//System.out.println(CHK_username_existing);

//		int chk_VO= userservice.chk_id_ajax(userVo_username);
		
//		logger.debug("debug");
//		logger.info("info");
//		logger.error("error");
		return CHK_username_existing;
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/Stg2_1_SetPizza_basic/{username}", method = RequestMethod.GET)
	public String Stg2_1_SetPizza_basic(Model model, @PathVariable("username") String username) {

		List<OrderVO> LastOrderItemInfo =orderservice.read_LastOrderItems_byusername(username);
		model.addAttribute("list_OrderVO", LastOrderItemInfo);

		//	"order_time"-{current Time} <=10 sec//TODO Ban redirect in 10sec 
		//TODO 피자갯수 0방지
//		orderservice.makeOrder(username);
//		
//		int new_order_id= orderservice.StartOrder(username);
//		model.addAttribute("new_order_id", new_order_id);
		
		return "/Stg2_1_SetPizza_basic";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/user/process_Stg2_1_SetPizza_basic")
	public String process_Stg2_1_SetPizza_basic(OrderVO post) {

		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		
//		orderservice.Stg2_1_setPizza_basic(post);

		return "redirect:/user/Stg3_1_SetOrder";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/user/Stg3_1_SetOrder")
	public String Stg3_1_SetOrder(Model model, Principal principal) {

		List<OrderVO> LastOrderItemInfo =orderservice.read_LastOrderItems_byusername(principal.getName());
		System.out.println(LastOrderItemInfo);
		model.addAttribute("list_OrderVO", LastOrderItemInfo);


		// 
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		
		return "/Stg3_1_SetOrder";
	}
	
//	@Secured({"ROLE_USER"})
//	@RequestMapping(value= "/user/Stg3_1_1_SetAddress/{u_address_fromView}", method = RequestMethod.GET)
//	public String SetAddress(Model model, @PathVariable("u_address_fromView") String username) {
////	String username=0;
//	UserVO list =userservice.readUserinfo(username);
//	model.addAttribute("list_UserVO", list);
//	
//		logger.debug("debug");
//		logger.info("info");
//		logger.error("error");
//		
//		return "/Stg3_1_1_SetAddress";
//	}
}
