package org.Lecha.service;

import java.util.ArrayList;

import org.Lecha.dto.ReplyDTO;
import org.Lecha.mapper.ReplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	ReplyDAO rdao;

	// 댓글 쓰기
	public int replyInsert(ReplyDTO rdto) {

		return rdao.replyInsert(rdto);
	}

	// 댓글 조회
	public ArrayList<ReplyDTO> replyList(int bno) {

		return rdao.replyList(bno);
	}

	// 댓글 수정
	public int replyUpdate(ReplyDTO rdto) {

		return rdao.replyUpdate(rdto);
	}

	// 댓글 삭제
	public int replyDelete(ReplyDTO rdto) {

		return rdao.replyDelete(rdto);
	}
}
