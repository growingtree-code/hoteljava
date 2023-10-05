package com.example.demo.users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;

	@GetMapping(value = "/users/loginForm")
	public void loginForm() {

	}
	
	@RequestMapping(value = "/users/joinForm")
	public void form(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("emailCheck", false);
	}

	@RequestMapping(value = "/users/emailCheck")
	public ModelAndView emailCheck(HttpServletRequest req,
			@RequestParam(value = "email") String email) {
		System.out.println(email);
		HttpSession session = req.getSession(false);
		ModelAndView mav = new ModelAndView("users/emailCheck");
		String result = "";
		Users u = service.getUsers(email);
		
		if (u == null) {
			result = "사용가능한 이메일입니다.";
			session.setAttribute("emailCheck", true);
		} else {
			result = "사용불가능한 이메일입니다.";
			session.setAttribute("emailCheck", false);
		}
		System.out.println(session.getAttribute("emailCheck"));
		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping(value = "/users/join")
	public String join(Users u) {
		service.addUsers(u);
		return "users/loginForm";
	}

	@RequestMapping(value = "/users/login")
	public String login(HttpServletRequest req, Users u) {
		Users u2 = service.getUsers(u.getEmail());
		if (u2 == null || !u2.getPwd().equals(u.getPwd())) {
			System.out.println("로그인 실패");
			return "users/loginForm";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("email", u2.getEmail());
			session.setAttribute("name", u2.getName());
			session.setAttribute("point", u2.getPoint());
			session.setAttribute("type", u2.getType());
//			return "users/main";
			return "index.jsp";
		}
	}
   
	@RequestMapping(value = "/users/editForm")
	public ModelAndView editForm(HttpServletRequest req){
		ModelAndView mav = new ModelAndView("users/editForm");
		HttpSession session = req.getSession(false);
		String id = (String)session.getAttribute("id");
		Users m = service.getUsers(id);
		mav.addObject("m", m);
		return mav;
	}

	@RequestMapping(value = "/users/edit")
	public String edit(Users m){
		service.editUsers(m);
		return "users/main";
	}

	@RequestMapping(value = "/users/logout")
	public String logout(HttpServletRequest req){
		HttpSession session = req.getSession(false);
		session.removeAttribute("id");
		session.invalidate();
		return "users/loginForm";
	}
	
	@RequestMapping(value = "/users/out")
	public String out(HttpServletRequest req){
		HttpSession session = req.getSession(false);
		String id = (String)session.getAttribute("id");
		service.delUsers(id);
		session.removeAttribute("id");
		session.invalidate();
		return "users/loginForm";
	}

	@RequestMapping(value = "/users/prodPage")
	public String prodPage() {
		return "users/prodPage";
	}
	
	
	
	@RequestMapping(value = "/users/adminPage")
	public String adminPage() {
		
		return "users/adminPage";
	}

   

}
