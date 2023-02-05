package com.first.biz.adoptFile.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.biz.adoptBoard.AdoptBoardVO;

@Repository
public class AdoptFileDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	void insertAdoptFile(String originalFileName, String storedFileName, int fileSize) {
		HashMap<String, Object> map=new HashMap<>();  
		map.put("ORIGINAL_FILE_NAME", originalFileName);
		map.put("STORED_FILE_NAME", storedFileName);
		map.put("FILE_SIZE", fileSize);
		System.out.println("AdoptFileDAO로 -----map.put----");
		mybatis.insert("AdoptFileDAO.insertAdoptFile", map);
		System.out.println("AdoptFileDAO로 map까지 완료");
	}
	List getImageFile(AdoptBoardVO vo) {
		return mybatis.selectList("AdoptFileDAO.getImageFile", vo);
	}
	
	
}
