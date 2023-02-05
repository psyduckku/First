package com.first.biz.animalReplyBoard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.biz.animalReplyBoard.AnimalReplyBoardVO;

@Repository
public class AnimalReplyBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AnimalReplyBoardVO> getReplyList(AnimalReplyBoardVO vo) {
		return mybatis.selectList("AnimalReplyDAO.getReplyList", vo);
	}
	public void insertReply(AnimalReplyBoardVO vo) {
		
		mybatis.insert("AnimalReplyDAO.insertReply", vo);
	}
	public AnimalReplyBoardVO getReply(AnimalReplyBoardVO vo) {
		return mybatis.selectOne("AnimalReplyDAO.getReply", vo);
	}
	
	
}
