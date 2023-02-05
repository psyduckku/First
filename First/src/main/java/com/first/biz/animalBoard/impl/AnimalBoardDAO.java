package com.first.biz.animalBoard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.biz.animalBoard.AnimalBoardVO;

@Repository
public class AnimalBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertAnimal(AnimalBoardVO vo) {
		System.out.println("Mybatis로 insertAnimal() 처리");
		mybatis.insert("AnimalBoardDAO.insertAnimal", vo);
	}
	
	public List<AnimalBoardVO> getAnimalList(AnimalBoardVO vo) {
		System.out.println("Mybatis로 getAnimalList() 처리");
		return mybatis.selectList("AnimalBoardDAO.getAnimalList", vo);
	}
	
	public AnimalBoardVO getAnimal(AnimalBoardVO vo) {
		System.out.println("Mybatis로 getAnimal()처리");
		return mybatis.selectOne("AnimalBoardDAO.getAnimal", vo);
	}
	
	public List<AnimalBoardVO> getAsideList(AnimalBoardVO vo) {
		System.out.println("Mybatis로 getAsideList() 처리");
		return mybatis.selectList("AnimalBoardDAO.getAsideList", vo);
	}
}
