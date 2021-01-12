package org.Lecha.controller;

import javax.servlet.http.HttpSession;

import org.Lecha.dto.MemberDTO;
import org.Lecha.service.MemberServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberServiceImpl mservice;
	// 회원가입
	@GetMapping("/join")
	public void getJoin() {
		
	}
	// 회원가입 insert액션
	@PostMapping("/join")
	public String postJoin(MemberDTO mdto) {	
		mservice.memberJoin(mdto);
		return "redirect:/member/login";
	}
	// 로그인
	@GetMapping("/login")
	public void getLogin() {
		
	}
	// 로그인 체크 액션
	@PostMapping("/login")
	public String postLogin(MemberDTO mdto,HttpSession session,RedirectAttributes rttr) {
		System.out.println("loginaction===");
		boolean result = mservice.login(mdto, session);
		System.out.println("result= "+result);
		if(result) {// 로그인성공
			System.out.println("로그인 성공!");
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/index";
		}else {
			System.out.println("로그인 실패!");
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/member/login";
		}
	}
	@GetMapping("/logout")
	public String getLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
}
