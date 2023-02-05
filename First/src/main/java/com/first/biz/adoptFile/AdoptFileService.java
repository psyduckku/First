package com.first.biz.adoptFile;

import java.util.List;

import com.first.biz.adoptBoard.AdoptBoardVO;

public interface AdoptFileService {
	void insertAdoptFile(String originalFileName, String storedFileName, int fileSize);
	List<AdoptFileVO> getImageFile(AdoptBoardVO vo);
}
