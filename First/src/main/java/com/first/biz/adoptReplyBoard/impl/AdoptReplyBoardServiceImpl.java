package com.first.biz.adoptReplyBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.biz.adoptBoard.AdoptBoardVO;
import com.first.biz.adoptReplyBoard.AdoptReplyBoardService;
import com.first.biz.adoptReplyBoard.AdoptReplyBoardVO;

@Service("AdoptReplyBoardService")
public class AdoptReplyBoardServiceImpl implements AdoptReplyBoardService {
	
	@Autowired
	private AdoptReplyBoardDAO AdoptReplyDAO;

	@Override
	public List<AdoptReplyBoardVO> getReplyList(AdoptReplyBoardVO vo) {
		return AdoptReplyDAO.getAdoptReplyList(vo);
	}

	@Override
	public void insertReply(AdoptReplyBoardVO vo) {
		AdoptReplyDAO.insertReply(vo);
	}

	@Override
	public AdoptReplyBoardVO getReply(AdoptReplyBoardVO vo) {
		return AdoptReplyDAO.getReply(vo);
	}

	@Override
	public void deleteReplyList(AdoptReplyBoardVO vo) {
		AdoptReplyDAO.deleteReplyList(vo);
		
	}

	
}
