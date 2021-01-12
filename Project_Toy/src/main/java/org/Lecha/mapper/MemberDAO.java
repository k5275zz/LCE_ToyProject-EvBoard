package org.Lecha.mapper;

import java.util.ArrayList;

import org.Lecha.dto.MemberDTO;

public interface MemberDAO {
	// 회원가입 insert
	public void memberInsert(MemberDTO mdto);
	// 로그인 체크
	public MemberDTO login(MemberDTO mdto);
	// 아이디 중복확인
	public ArrayList<MemberDTO> useridchk(MemberDTO mdto);
}
