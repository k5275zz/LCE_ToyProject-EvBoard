package org.Lecha.service;

import org.Lecha.dto.LikeDTO;
import org.Lecha.mapper.LikeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class LikeServiceImpl implements LikeService{
	@Autowired
	LikeDAO ldao;
	// 좋아요 insert
	public int likeInsert(LikeDTO ldto) {
		
		return ldao.likeInsert(ldto);
	}
	// 좋아요 여부체크
	public LikeDTO likeCheck(LikeDTO ldto) {
		
		return ldao.likeCheck(ldto);
	}
	// 좋아요 취소
	public int likeDelete(LikeDTO ldto) {
		
		return ldao.likeDelete(ldto);
	}

}
