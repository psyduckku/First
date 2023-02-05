package com.first.biz.animalReplyBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.biz.animalReplyBoard.AnimalReplyBoardService;
import com.first.biz.animalReplyBoard.AnimalReplyBoardVO;

@Service("AnimalReplyBoardService")
public class AnimalReplyBoardServiceImpl implements AnimalReplyBoardService{
	
	@Autowired
	private AnimalReplyBoardDAO replyDAO;

	@Override
	public List<AnimalReplyBoardVO> getReplyList(AnimalReplyBoardVO vo) {
		return replyDAO.getReplyList(vo);
	}

	@Override
	public void insertReply(AnimalReplyBoardVO vo) {
		System.out.println("insertReplyService진행");
		replyDAO.insertReply(vo);
	}

	@Override
	public AnimalReplyBoardVO getReply(AnimalReplyBoardVO vo) {
		return replyDAO.getReply(vo);
	}
	
}
