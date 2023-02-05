package com.first.view.adoptReplyBoardController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.first.biz.adoptBoard.AdoptBoardService;
import com.first.biz.adoptReplyBoard.AdoptReplyBoardService;
import com.first.biz.adoptReplyBoard.AdoptReplyBoardVO;

@RestController
public class AdoptReplyBoardController {
	
@Autowired
AdoptBoardService boardService;
@Autowired
AdoptReplyBoardService replyService;

	
	@ResponseBody
	@RequestMapping(value="/insertAdoptReply.do", method=RequestMethod.POST)
	public String insertReply(AdoptReplyBoardVO vo, HttpServletRequest req, HttpSession session) throws JsonProcessingException {
		System.out.println("insertAdoptReply.do 접근");
		String id=(String) session.getAttribute("ID");
		String reply=req.getParameter("reply");
		String seq=req.getParameter("seq");
		System.out.println(id+","+reply+","+seq);
		vo.setID(id);vo.setREPLY(reply); vo.setSEQ(seq);
		replyService.insertReply(vo);
		AdoptReplyBoardVO repleOne =  replyService.getReply(vo);
		ObjectMapper objectMapper = new ObjectMapper();
		String getReply = objectMapper.writeValueAsString(repleOne);
		
		return getReply;
	}
	
	
	
}
