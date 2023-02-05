package com.first.biz.adoptBoard;

import java.util.List;

public interface AdoptBoardService {
	
	void insertAdoptBoard(AdoptBoardVO vo);
	List<AdoptBoardVO> getAdoptBoardList(AdoptBoardVO vo);
	AdoptBoardVO getAdoptBoard(AdoptBoardVO vo);
	void updateBoard(AdoptBoardVO vo);
	void getHitsBoard(AdoptBoardVO vo);
	void flagSet(AdoptBoardVO vo);
	List<AdoptBoardVO> flagPostSet();
	void deleteBoard(AdoptBoardVO vo);
	
}
