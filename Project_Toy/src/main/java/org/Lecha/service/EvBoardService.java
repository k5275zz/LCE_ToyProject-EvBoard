package org.Lecha.service;

import java.util.ArrayList;

import org.Lecha.dto.EvBoardDTO;
import org.Lecha.dto.PageConditionDTO;
import org.springframework.web.bind.annotation.RequestParam;

public interface EvBoardService {
	// 강의평가글 insert
	public void evBoardinsert(EvBoardDTO edto);

	// 강의평가글목록 select list
	public ArrayList<EvBoardDTO> evBoardList(PageConditionDTO pcdto);


	// 게시물상세페이지 select
	public EvBoardDTO evBoardDetail(@RequestParam("bno") int bno);

	// 게시물 총수
	public int getTotal();

	// 댓글 갯수
	public int getReplyCount();

	// 조회수
	public int getViews(@RequestParam("bno") int bno);
	
	// 글 수정
	public void postUpdate(EvBoardDTO edto);
	
	// 글 삭제
	public void postDelete(@RequestParam("bno") int bno);
}
