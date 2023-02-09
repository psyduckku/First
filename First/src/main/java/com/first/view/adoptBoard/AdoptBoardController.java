package com.first.view.adoptBoard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.first.biz.adoptBoard.AdoptBoardService;
import com.first.biz.adoptBoard.AdoptBoardVO;
import com.first.biz.adoptFile.AdoptFileService;
import com.first.biz.adoptFile.AdoptFileVO;
import com.first.biz.adoptReplyBoard.AdoptReplyBoardService;
import com.first.biz.adoptReplyBoard.AdoptReplyBoardVO;
import com.first.biz.animalBoard.AnimalBoardService;

@Controller
public class AdoptBoardController {
	
@Autowired
AdoptBoardService boardService;
@Autowired
AdoptReplyBoardService replyService;
@Autowired
AdoptFileService fileService;

String rootPath = System.getProperty("user.dir");
private String CURR_IMAGE_REPO_PATH= rootPath+"\\First\\image\\";

	@Autowired
	AnimalBoardService animalBoardService;
	
	@RequestMapping(value="/setFlagPost.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String setFlagPost() throws JsonProcessingException{
		System.out.println("setFlagPost.do 접근");
		
		List<AdoptBoardVO> list = boardService.flagPostSet();
		//자바단에서 받을 때 AdoptFileVO 도 받아야하는데...
		for(AdoptBoardVO adopbd : list) {
			System.out.println(adopbd.getTITLE());
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
		String stringList = objectMapper.writeValueAsString(list);
		
		return stringList;
	}

	@ResponseBody
	@RequestMapping(value="/setAFlag.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String flagOn(AdoptBoardVO vo, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("setAFlag.do 접근"); 
		String message = "";
		String seq=req.getParameter("seq"); vo.setSEQ(seq);
		System.out.println("ajax seq:"+seq);
		AdoptBoardVO board = boardService.getAdoptBoard(vo);
		int flag = board.getFLAG_POST();
		System.out.println(flag);
		if(flag==0) {
			System.out.println("현재 flag번호 : "+flag);
			vo.setFLAG_POST(1);
			boardService.flagSet(vo);
			System.out.println("바뀐 flag번호 : "+vo.getFLAG_POST());
			message+="Post게시물 설정완료";
		}else {
			System.out.println("현재 flag번호 : "+flag);
			vo.setFLAG_POST(0);
			boardService.flagSet(vo);
			System.out.println("바뀐 flag번호 : "+vo.getFLAG_POST());
			message+="Post게시물 설정해제";
		}
		System.out.println(message);
		return message;
	}
	
	
	@RequestMapping(value="/insertAdoptBoard.do",method=RequestMethod.POST)
	public ModelAndView insertBoard(AdoptBoardVO vo, AdoptFileVO fvo, HttpSession session, HttpServletRequest req,
			MultipartHttpServletRequest multipartRequest) throws IOException {
		
		System.out.println("insertAdoptBoard.do 접근");
		
		multipartRequest.setCharacterEncoding("utf-8");

// 여기부터 파일 업로드관련
		Map map=new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		//getParameterNames(); 이름집합을 Enumeration 객체로 변환시켜준다. 
		while(enu.hasMoreElements()) { //객체가 있는지 확인(boolean)
			String name=(String) enu.nextElement(); //객체를 리턴하고 커서위치를 다음칸으로 이동
			String value=multipartRequest.getParameter(name); //객체의 value를 가져옴. 실질 데이터
			map.put(name, value); //map에 담음 ex)id, admin 
			System.out.println("while로 꺼낸 name:"+name+"//value:"+value);
			
		}
		String id=(String) map.get("ID");
		String title=(String) map.get("TITLE");
		String content=(String) map.get("CONTENT");
		System.out.println("세션id:"+id+"/"+title+"/"+content);
		vo.setID(id); vo.setTITLE(title); vo.setCONTENT(content);
		
		System.out.println("insert시작");
		boardService.insertAdoptBoard(vo);
		
		List fileList= fileProcess(multipartRequest); //해당 name을 담음
//여기서 파일 꺼내기
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("adoptBoard",map);
		mav.setViewName("getAdoptBoard.jsp");
	
		
		return mav;
		}
	
	private List fileProcess(MultipartHttpServletRequest multipartRequest) throws IOException {
		List<String> fileList=new ArrayList<String>(); //파일목록을 담을 배열을 만든다
		Iterator<String> fileNames=multipartRequest.getFileNames(); //반복문으로 파일목록에 있는 파일명을 저장한다
		while(fileNames.hasNext()) {   //boolean으로 값이 있는지 여부확인
			String fileName=fileNames.next(); //해당 type의 값을 가져옴. 여기선 String이니까 String타입 데이터를 가져온다
			System.out.println("fileProcess파일명: "+fileName);
			MultipartFile mFile=multipartRequest.getFile(fileName); //multipartRequest는 파일 자체만 다루는 클래스로 해당 파일에 접근함
			int fileSize = (int) mFile.getSize();
			System.out.println("파일크기 : " + fileSize);
			
			//MultipartFile은 파일을 업로드하기 위한 인터페이스이다. 큰 파일을 정크단위로 쪼개서 효율적으로 파일을 업로드할 수 있게 해준다.
			String originalFileName=mFile.getOriginalFilename(); //해당 파일 이름을 가져옴
			System.out.println("originalFileName:"+originalFileName);
			//여기다가 파일 name을 수정시킨다. 무조건 파일명이 수정되게끔하여 db중복을 방지한다.
			String genId=UUID.randomUUID().toString();
			String storedFileName = genId+"_"+originalFileName;
			System.out.println(storedFileName);
			
			fileService.insertAdoptFile(originalFileName, storedFileName, fileSize);
			
			fileList.add(storedFileName);
			
			File file=new File(CURR_IMAGE_REPO_PATH+"\\"+storedFileName);
			if(mFile.getSize()!=0) {
				if(! file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				//여기까지 파일 경로를 만들어준다.
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+storedFileName));
				//해당 경로로 파일을 저장한다. 
			}
		}
		return fileList;
	}
	
	@RequestMapping(value="/getAdoptBoardList.do")
	public String getFreeBoardList(AdoptBoardVO vo, HttpSession session, Model model, HttpServletRequest req){
		System.out.println("getAdoptBoardList.do 접근");
		String searchCondition = req.getParameter("searchCondition");
		String searchKeyword = req.getParameter("searchKeyword");
		System.out.println("검색조건 : "+searchCondition+"//검색키워드: "+searchKeyword);
		vo.setSearchCondition(searchCondition);
		vo.setSearchKeyword(searchKeyword);
		List<AdoptBoardVO> list = boardService.getAdoptBoardList(vo);
		if(list==null) {
			System.out.println("아무런 게시글이 없습니다.");
		}else {
			System.out.println(list.size());
		} model.addAttribute("list", list);
		return "adoptBoardList.jsp";
	}
	@RequestMapping(value="/getAdoptBoard.do")
	public String getAdoptBoard(AdoptBoardVO vo, AdoptReplyBoardVO rVo, Model model, HttpServletRequest req, AdoptFileVO fvo) {
		System.out.println("getAdoptBoard.do 접근");
		String seq=req.getParameter("SEQ");
		vo.setSEQ(seq);
		
		List<AdoptFileVO> imageList = new ArrayList<>();
		imageList= fileService.getImageFile(vo);
		if(imageList.size()>0) {
			for(int i=0; i<imageList.size();i++){
				System.out.println(imageList.get(i).getSTORED_FILE_NAME());
			}
		}
		//파일을 여기서 받는게 아니라, download.do로 p.617를 참고하여 받는다.
		// 프론트단에서 파일리스트를 보내고 forEach를 통해서 파일목록을 받는다
		
		
		if(seq==null) {
			System.out.println("seq값을 받아오지 못했습니다. seq : " + seq);
		}else {
			System.out.println("seq값을 받아왔습니다 seq : " + seq);
		}
		
		 boardService.getHitsBoard(vo);
		  
		model.addAttribute("imageList", imageList);
		model.addAttribute("adoptBoard", boardService.getAdoptBoard(vo));
		model.addAttribute("list", replyService.getReplyList(rVo));
		
		//파일을 꺼내와야한다. p에 담나? 어디에 담나? 
	   //서버에 있는 파일을 찾아서 해당 파일을 가져와야함. 
		return "getAdoptBoard.jsp";
	}
	
	
	@RequestMapping(value="/updateAdoptBoard.do")
	public String updateAdoptBoard(AdoptBoardVO vo, AdoptReplyBoardVO rVo, HttpServletRequest req, Model model) {
		System.out.println("updateAdoptBoard.do 접근");
		String title=req.getParameter("TITLE");
		String content=req.getParameter("CONTENT");
		String nick=req.getParameter("ID");
		String seq=req.getParameter("SEQ");
		System.out.println("입력된값 : title:"+title+"//con:"+content+"//nick:"+nick+"//seq:"+seq);
		vo.setTITLE(title);vo.setCONTENT(content);vo.setSEQ(seq);
		boardService.updateBoard(vo);
//		model.addAttribute("adoptBoard", boardService.getAdoptBoard(vo));
//		model.addAttribute("list", replyService.getReplyList(rVo));
		return "getAdoptBoard.do";
	}
	
	@RequestMapping(value="/deleteAdoptBoard.do")
	public String deleteAdoptBoard(AdoptBoardVO vo, AdoptReplyBoardVO rVo, HttpServletRequest req, Model model) {
		System.out.println("deleteAdoptBoard.do 접근");
		String seq=req.getParameter("SEQ");System.out.println(seq);
		vo.setSEQ(seq);
		rVo.setSEQ(seq);
		replyService.deleteReplyList(rVo);
		boardService.deleteBoard(vo);
		
		return "getAdoptBoardList.do";
		
	}
	
}
