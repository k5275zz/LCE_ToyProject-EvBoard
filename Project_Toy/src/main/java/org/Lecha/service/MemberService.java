package org.Lecha.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.Lecha.dto.MemberDTO;
import org.springframework.web.bind.annotation.RequestBody;

public interface MemberService {
	// 회원가입 insert
	public void memberJoin(MemberDTO mdto);
	// 로그인 체크
	public boolean login(MemberDTO mdto,HttpSession session);
	// 아이디 중복확인
	public boolean useridcheck(@RequestBody MemberDTO mdto);
}
