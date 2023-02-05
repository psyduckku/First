package com.first.biz.adoptBoard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.biz.adoptBoard.AdoptBoardVO;

@Repository
public class AdoptBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//외부데이터 삽입
	public void insertAdoptBoard(AdoptBoardVO vo) {
		System.out.println("Mybatis로 insertAdoptBoard() 처리");
		mybatis.insert("AdoptBoardDAO.insertAdoptBoard", vo) ;
	}
	
	public List<AdoptBoardVO> getAdoptBoardList(AdoptBoardVO vo) {
		System.out.println("Mybatis로 getAdoptBoardList() 처리 ");
		return mybatis.selectList("AdoptBoardDAO.getAdoptBoardList", vo);
	}
	public AdoptBoardVO getAdoptBoard(AdoptBoardVO vo) {
		return mybatis.selectOne("AdoptBoardDAO.getAdoptBoard", vo);
	}
	
	public void updateBoard(AdoptBoardVO vo) {
		mybatis.update("AdoptBoardDAO.updateBoard", vo);
	}
	
	public void getHits(AdoptBoardVO vo) {
		mybatis.update("AdoptBoardDAO.getHitsBoard", vo);
	}
	
	public void flagSet(AdoptBoardVO vo) {
		mybatis.update("AdoptBoardDAO.flagSet", vo);
	}
	
	public List<AdoptBoardVO> flagPostSet() {
		System.out.println("Mybatis로 flagPostSet() 처리");
		return mybatis.selectList("AdoptBoardDAO.flagPostSet");
	}
	
	public void deleteBoard(AdoptBoardVO vo) {
		System.out.println("Mybatis로 deleteBoard() 처리");
		mybatis.delete("AdoptBoardDAO.deleteBoard", vo);
	}
	
}
