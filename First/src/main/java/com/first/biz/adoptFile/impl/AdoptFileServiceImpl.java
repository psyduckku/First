package com.first.biz.adoptFile.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.biz.adoptBoard.AdoptBoardVO;
import com.first.biz.adoptFile.AdoptFileService;
import com.first.biz.adoptFile.AdoptFileVO;

@Service("AdoptFileService")
public class AdoptFileServiceImpl implements AdoptFileService{
	
	@Autowired
	private AdoptFileDAO dao;

	@Override
	public void insertAdoptFile(String originalFileName, String storedFileName, int fileSize) {
		System.out.println("insertAdoptFile Service접근");
		dao.insertAdoptFile(originalFileName, storedFileName, fileSize);
	}

	@Override
	public List<AdoptFileVO> getImageFile(AdoptBoardVO vo) {
		System.out.println("imageFileList Service접근");
		return dao.getImageFile(vo);
	}
	
	

//	@Override
//	public String getAdoptFile(AdoptFileVO vo) {
//		return null;
//	}

}
