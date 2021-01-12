package org.Lecha.service;

import java.util.ArrayList;

import org.Lecha.dto.EvBoardDTO;
import org.Lecha.dto.PageConditionDTO;
import org.Lecha.mapper.EvBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class EvBoardServiceImpl implements EvBoardService {
	@Autowired
	EvBoardDAO edao;

	// 평가글 등록
	public void evBoardinsert(EvBoardDTO edto) {
		edao.evInsert(edto);
	}

	// 전체 평가글목록
	public ArrayList<EvBoardDTO> evBoardList(PageConditionDTO pcdto) {
		return edao.evList(pcdto);
	}

	// 게시글 상세페이지
	public EvBoardDTO evBoardDetail(@RequestParam("bno") int bno) {

		return edao.evDetail(bno);
	}

	// 게시물 총수
	public int getTotal() {
		return edao.getTotal();
	}

	// 댓글 개수
	public int getReplyCount() {
		
		return edao.getReplyCount();
	}

	// 조회수
	public int getViews(@RequestParam("bno") int bno) {
		
		return edao.getViews(bno);
	}

	// 글 수정
	public void postUpdate(EvBoardDTO edto) {
		
		edao.evUpdate(edto);
	}
	// 글 삭제
	public void postDelete(@RequestParam("bno") int bno) {
		
		edao.evDelete(bno);
	}
	

}
