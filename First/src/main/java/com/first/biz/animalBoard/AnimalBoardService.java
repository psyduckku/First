package com.first.biz.animalBoard;

import java.util.List;

public interface AnimalBoardService {
	
	void insertAnimal(AnimalBoardVO vo);
	List<AnimalBoardVO> getAnimalList(AnimalBoardVO vo);
	AnimalBoardVO getAnimal(AnimalBoardVO vo);
	List<AnimalBoardVO> getAsideList(AnimalBoardVO vo);
}
