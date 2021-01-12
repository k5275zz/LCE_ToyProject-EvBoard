package org.Lecha.mapper;

import java.util.ArrayList;

import org.Lecha.dto.EvBoardDTO;
import org.Lecha.dto.PageConditionDTO;
import org.springframework.web.bind.annotation.RequestParam;

public interface EvBoardDAO {
	// 강의평가글 insert
	public void evInsert(EvBoardDTO edto);

	// 전체 강의평가글목록 select
	public ArrayList<EvBoardDTO> evList(PageConditionDTO pcdto);

	// 게시글 상세페이지
	public EvBoardDTO evDetail(@RequestParam("bno") int bno);

	// 게시물 총수
	public int getTotal();

	// 댓글 갯수
	public int getReplyCount();

	// 게시물 조회수
	public int getViews(@RequestParam("bno") int bno);

	// 게시물 글 수정
	public void evUpdate(EvBoardDTO edto);
	
	// 게시물 글 삭제
	public void evDelete(@RequestParam("bno") int bno);
}
