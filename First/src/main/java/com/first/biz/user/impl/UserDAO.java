package com.first.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.biz.user.UserVO;

@Repository
public class UserDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회원가입
	public void insertUser(UserVO vo) {
		System.out.println("Mybatis로 insertUsers()기능 처리");
		mybatis.insert("UserBoardDAO.insertUser", vo); //mapping.xml에 namespace명.메서드명
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("Mybatis로 getUser()기능 처리");
		return mybatis.selectOne("UserBoardDAO.getUser", vo);
	}
	public UserVO getMyInfo(UserVO vo) {
		return mybatis.selectOne("UserBoardDAO.getMyInfo", vo);
	}
	public void updateUser(UserVO vo) {
		mybatis.update("UserBoardDAO.updateUser", vo);
	}
	
}
