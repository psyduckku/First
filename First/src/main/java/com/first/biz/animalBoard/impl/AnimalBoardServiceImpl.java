package com.first.biz.animalBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.biz.animalBoard.AnimalBoardService;
import com.first.biz.animalBoard.AnimalBoardVO;

@Service("AnimalBoardService")
public class AnimalBoardServiceImpl implements AnimalBoardService {
	
	@Autowired
	AnimalBoardDAO animalBoardDAO;
	
	
	@Override
	public void insertAnimal(AnimalBoardVO vo) {
		animalBoardDAO.insertAnimal(vo);
	}

	@Override
	public List<AnimalBoardVO> getAnimalList(AnimalBoardVO vo) {
		return animalBoardDAO.getAnimalList(vo);
	}

	@Override
	public AnimalBoardVO getAnimal(AnimalBoardVO vo) {
		return animalBoardDAO.getAnimal(vo);
	}

	@Override
	public List<AnimalBoardVO> getAsideList(AnimalBoardVO vo) {
		return animalBoardDAO.getAsideList(vo);
	}
}
