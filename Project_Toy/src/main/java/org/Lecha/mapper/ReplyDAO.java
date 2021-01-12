package org.Lecha.mapper;

import java.util.ArrayList;

import org.Lecha.dto.ReplyDTO;

public interface ReplyDAO {
	// 댓글 쓰기
	public int replyInsert(ReplyDTO rdto);

	// 댓글 조회
	public ArrayList<ReplyDTO> replyList(int bno);

	// 댓글 수정
	public int replyUpdate(ReplyDTO rdto);

	// 댓글 삭제
	public int replyDelete(ReplyDTO rdto);
}
