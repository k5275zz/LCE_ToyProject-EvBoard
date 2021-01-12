package org.Lecha.service;

import org.Lecha.dto.LikeDTO;
import org.springframework.web.bind.annotation.RequestBody;

public interface LikeService {
	// 좋아요 추가
	public int likeInsert(LikeDTO ldto);
	// 좋아요 체크
	public LikeDTO likeCheck(LikeDTO ldto);
	// 좋아요 취소
	public int likeDelete(LikeDTO ldto);
}
