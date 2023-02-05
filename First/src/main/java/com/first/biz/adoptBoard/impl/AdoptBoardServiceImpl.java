package com.first.biz.adoptBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.biz.adoptBoard.AdoptBoardService;
import com.first.biz.adoptBoard.AdoptBoardVO;

@Service("AdoptBoardService")
public class AdoptBoardServiceImpl implements AdoptBoardService {
	
	@Autowired
	private AdoptBoardDAO adoptBoardDAO;

	@Override
	public void insertAdoptBoard(AdoptBoardVO vo) {
		adoptBoardDAO.insertAdoptBoard(vo);
	}

	@Override
	public List<AdoptBoardVO> getAdoptBoardList(AdoptBoardVO vo) {
		return adoptBoardDAO.getAdoptBoardList(vo); 
	}

	@Override
	public AdoptBoardVO getAdoptBoard(AdoptBoardVO vo) {
		return adoptBoardDAO.getAdoptBoard(vo);
	}

	@Override
	public void updateBoard(AdoptBoardVO vo) {
		adoptBoardDAO.updateBoard(vo);
	}

	@Override
	public void getHitsBoard(AdoptBoardVO vo) {
		adoptBoardDAO.getHits(vo);
		
	}

	@Override
	public void flagSet(AdoptBoardVO vo) {
		adoptBoardDAO.flagSet(vo);
		
	}

	@Override
	public List<AdoptBoardVO> flagPostSet() {
		return adoptBoardDAO.flagPostSet();
	}

	@Override
	public void deleteBoard(AdoptBoardVO vo) {
		adoptBoardDAO.deleteBoard(vo);
	}

	
}
