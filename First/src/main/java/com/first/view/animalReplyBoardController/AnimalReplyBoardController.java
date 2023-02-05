package com.first.view.animalReplyBoardController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.first.biz.animalReplyBoard.AnimalReplyBoardService;
import com.first.biz.animalReplyBoard.AnimalReplyBoardVO;

@Controller
public class AnimalReplyBoardController {
	
	@Autowired
	AnimalReplyBoardService replyService;
	
	@ResponseBody
	@RequestMapping(value="getAnimalReplyList.do")
	public String getAnimalReplyList(AnimalReplyBoardVO vo, HttpServletRequest req, HttpSession session) throws JsonProcessingException {
		System.out.println("getAnimalReplyList.do 접근");
		String ASEQ = req.getParameter("ASEQ");
		System.out.println(ASEQ);
		vo.setASEQ(ASEQ);
		List<AnimalReplyBoardVO> replyList= replyService.getReplyList(vo);
		ObjectMapper objectMapper = new ObjectMapper();
		String getList = objectMapper.writeValueAsString(replyList);
		
		return getList;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertAnimalReply.do", method=RequestMethod.POST)
	public String insertReply(AnimalReplyBoardVO vo, HttpServletRequest req, HttpSession session) throws JsonProcessingException {
		System.out.println("insertReply.do 접근");
		String id=(String) session.getAttribute("ID");
		String aseq=req.getParameter("aseq");
		String reply=req.getParameter("reply");
		System.out.println(id+","+reply+","+aseq);
		vo.setID(id);vo.setASEQ(aseq);vo.setREPLY(reply); 
		replyService.insertReply(vo);
		AnimalReplyBoardVO repleOne =  replyService.getReply(vo);
		ObjectMapper objectMapper = new ObjectMapper();
		String getReply = objectMapper.writeValueAsString(repleOne);
		return getReply;
	}
	
}
