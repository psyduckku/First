package com.first.biz.animalReplyBoard;

import java.util.List;

public interface AnimalReplyBoardService {
	
	List<AnimalReplyBoardVO> getReplyList(AnimalReplyBoardVO vo);
	void insertReply(AnimalReplyBoardVO vo);
	AnimalReplyBoardVO getReply(AnimalReplyBoardVO vo);
}
