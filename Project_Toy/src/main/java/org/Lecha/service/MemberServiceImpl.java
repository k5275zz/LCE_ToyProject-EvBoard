package org.Lecha.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.Lecha.dto.MemberDTO;
import org.Lecha.mapper.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO mdao;
	// 회원가입 insert
	public void memberJoin(MemberDTO mdto) {
		mdao.toString();
		mdao.memberInsert(mdto);
		
	}
	// 로그인체크
	public boolean login(MemberDTO mdto, HttpSession session) {
		MemberDTO login = mdao.login(mdto);
		boolean result=false;
		
		if(login!=null) {
			System.out.println("세션 값");
			session.setAttribute("login", login);
			System.out.println("세션 값 = "+session.getAttribute("login"));
			result=true;
		}
		return result;
	}
	// 아이디 중복확인
	public boolean useridcheck(MemberDTO mdto) {
		ArrayList<MemberDTO> idchk =mdao.useridchk(mdto);
		System.out.println("222");
		boolean idtf = false;
		String userid = mdto.getId();
		
		for(MemberDTO mtr:idchk) {
			System.out.println("1. "+mtr.getId());
			System.out.println("=="+mdto.getId());
			if(mtr.getId().equals(userid)) {
				idtf = true;
				System.out.println("1");
			}
		}
		System.out.println("결과="+idtf);
		return idtf;
	}

}
