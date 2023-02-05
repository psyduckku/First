package com.first.biz.adoptReplyBoard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.biz.adoptReplyBoard.AdoptReplyBoardVO;

@Repository
public class AdoptReplyBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	List<AdoptReplyBoardVO> getAdoptReplyList(AdoptReplyBoardVO vo){
		return mybatis.selectList("AdoptReplyBoardDAO.getReplyList", vo);
	}
	void insertReply(AdoptReplyBoardVO vo) {
		mybatis.insert("AdoptReplyBoardDAO.insertReply", vo);
	}
	
	AdoptReplyBoardVO getReply(AdoptReplyBoardVO vo) {
		return mybatis.selectOne("AdoptReplyBoardDAO.getReply", vo);
	}
	
	void deleteReplyList(AdoptReplyBoardVO vo) {
		System.out.println("Mybatis로 deleteReplyList() 처리");
		mybatis.delete("AdoptReplyBoardDAO.deleteReplylist", vo);
	}
}
