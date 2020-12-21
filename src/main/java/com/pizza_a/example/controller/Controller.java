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
import com.pizza_a.example.service.OrderService;
import com.pizza_a.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	private final Logger logger =LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired OrderService orderservice;

	public void show_info_debug_err() {
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
	}

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

		//int chk_VO= userservice.chk_id_ajax(userVo_username);

		return CHK_username_existing;
	}

	@Secured({"ROLE_USER"})
	@RequestMapping(value= "/user/Stg2_1_SetPizza_basic/{username}", method = RequestMethod.GET)
	public String Stg2_1_SetPizza_basic(Model model, @PathVariable("username") String username) {

		//if 'aaa' show up, erasePreparingOrder
		String superviser_id="aaa";
		if(username .equals(superviser_id)) {
			orderservice.erasePreparingOrder(username);
		}
		//	"order_time"-{current Time} <=10 sec//TODO Ban redirect in 10sec 

		//make Order
		orderservice.makeOrder(username);

		//and Give NewOrderID
		int new_order_id= orderservice.StartOrder(username);
		model.addAttribute("new_order_id", new_order_id);

		//Get LastOrder  LastOrderID = (order_ID)-1
		List<OrderVO> LastOrderItemInfo =orderservice.read_LastOrderItems_byusername(username);
		model.addAttribute("list_OrderVO", LastOrderItemInfo);

		//TODO  Ban no.Pizza<1 in .JSP

		return "/Stg2_1_SetPizza_basic";
	}

	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/user/process_Stg2_1_SetPizza_basic")
	public String process_Stg2_1_SetPizza_basic(OrderVO post, Principal principal) {

		orderservice.Stg2_1_setPizza_basic(post);

		return "redirect:/user/Stg3_1_SetOrder";
	}

	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/user/Stg3_1_SetOrder")
	public String Stg3_1_SetOrder(Model model, Principal principal) {
		
		List<OrderVO> BasicOrderItemInfo =orderservice.read_BasicOrderItems_byusername(principal.getName());
		boolean flag_orderchk = BasicOrderItemInfo.size() > 0 ? true : false;
		model.addAttribute("list_OrderVO", BasicOrderItemInfo);
		model.addAttribute("flag_orderchk", flag_orderchk);

		return "/Stg3_1_SetOrder";
	}

	
	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/user/Stg3_1_1_SetAddress_deliver1/{username}")
	public String Stg3_1_1_SetAddress_deliver1(Model model, Principal principal) {

		//if deliver1(@pizza_order) is not Null,id="stg3_1_SetPizza_basic"을 보여줘라  그냥) (bcz 이미 진행되고있는 주문이므로)
		List<OrderVO> BasicOrderItemInfo =orderservice.read_BasicOrderItems_byusername(principal.getName());
		model.addAttribute("list_OrderVO_B", BasicOrderItemInfo);

		List<OrderVO> PresentOrderItemInfo =orderservice.read_PresentOrderItems_byusername(principal.getName());
		model.addAttribute("list_OrderVO_P", PresentOrderItemInfo);
		
		List<UserVO> AddressList=userservice.read_Address_byusername(principal.getName());
		model.addAttribute("list_AddressList", AddressList);

		return "/Stg3_1_1_SetAddress_deliver1";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/user/Process_Stg3_1_1_SetBasicAddress_deliver1_LastAddress")
	public String Process_Stg3_1_1_SetBasicAddress_deliver1_LastAddress(OrderVO post, Principal principal) {

		logger.debug(""+post+"it works too");
		orderservice.Stg3_1_1_SetBasicAddress_deliver1_LastAddress(post);

		return "redirect:/user/Stg3_1_SetOrder";
	}
	

	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/user/Process_Stg3_1_1_SetBasicAddress_deliver1_AnotherAddress")
	public String Process_Stg3_1_1_SetBasicAddress_deliver1_AnotherAddress(OrderVO post, Principal principal) {

		logger.debug(""+post+"it works");
		orderservice.Stg3_1_1_SetBasicAddress_deliver1_AnotherAddress(post);

		return "redirect:/user/Stg3_1_SetOrder";
	}
	
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/user/Stg3_1_2_SetAddress_deliver0/{username}")
	public String Stg3_1_1_SetAddress_deliver0(Model model, Principal principal) {

		List<OrderVO> BasicOrderItemInfo =orderservice.read_BasicOrderItems_byusername(principal.getName());
		//		System.out.println(BasicOrderItemInfo);
		model.addAttribute("list_OrderVO", BasicOrderItemInfo);

		return "/Stg3_1_2_SetAddress_deliver0";
	}


}
