package com.first.biz.adoptReplyBoard;

import java.util.List;

public interface AdoptReplyBoardService {
	List<AdoptReplyBoardVO> getReplyList(AdoptReplyBoardVO vo);
	void insertReply(AdoptReplyBoardVO vo);
	AdoptReplyBoardVO getReply(AdoptReplyBoardVO vo);
	void deleteReplyList(AdoptReplyBoardVO vo);
}
