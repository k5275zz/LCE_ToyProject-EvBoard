package org.Lecha.mapper;

import org.Lecha.dto.LikeDTO;

public interface LikeDAO {
	// 좋아요 추가
	public int likeInsert(LikeDTO ldto);
	// 좋아요 여부체크
	public LikeDTO likeCheck(LikeDTO ldto);
	// 좋아요 취소
	public int likeDelete(LikeDTO ldto);
}
